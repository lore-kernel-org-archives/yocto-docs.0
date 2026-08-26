Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D9BC61DBE
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:35:32 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3408.1787708123777822801
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C2jNgQKf;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-936623c6dd3so90021785a.0
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708123; x=1788312923; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W8BZ53eKaABDX+Ef6lZ+BvHSUyl0J8a+UgRDw8IZAUc=;
        b=C2jNgQKfOHkcAYk/YSTUk6UjnBjWvPuwJIfNRA/lSLKdoMJgo11KAqci8mopgPL78G
         oRd78bCq/vlrb+tZSDGgL7ksyHzOfgEwXJqeJz4f+gUSEcFPJEEF8UN/sUSovHWWViGr
         5ipNWStW7rL3oYyev/QXQd5x/24jg2KPSQBJ//nSuYKPE3s/gKE/0oMi52fi5xFmKcqA
         42G2zCAYzpczVGEwXwEO7Ia+KTq0kfT1j8QT6niV6omDt+dbX5/k+xJirl4BAlWoQwDf
         1kfU0+R/WncBJb1ap9JynyJ/JOfshKo2OTZm9Gg7HA4mc6fI+1nXya4EFkVsd1dhVHd6
         qoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708123; x=1788312923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W8BZ53eKaABDX+Ef6lZ+BvHSUyl0J8a+UgRDw8IZAUc=;
        b=noPQwu93C0ZgSFh0ZD4x1MQOigEac6Insn6Uq/qnRDlHapsIAEe+3Lvt5q+KTqPOpE
         aUZ0hAcv7NumWMoZzisXzNJpWSFu7/IRCOIgYlFKzNIyFyd/cTWAawf+ZGKSvw9teOdV
         hM1C3HPLzhZbuNFImL828zprux97TmHakHq0OTjTarjpxrqiTChDiHaj5IvxU3LLoH9E
         JhrCUY8QCgMOjRfPtN22bUYeH0KZxFCEJZRQLA99l8kgi9ouTw+YHBALCB2VKPmiRE2D
         oH5MU4ul/zcpDUfaJjO04MubVjTcOyXMcNMOEYcNudIr7xkfD2jvt7aa4pSUB1f8HNXm
         3zmg==
X-Gm-Message-State: AFuF++mbHWWvGWgaNhhFdII1tdduJQbC8tdqC/izqd1119hEKEQ01+5k
	uSgq0LmDw1pjbEkTJPAzXjRjM84Iy8IOBXTSXODTvjsIB8LHg1BNHn4D/pr/Z/SM
X-Gm-Gg: AR+sD13Kd6EMjj5mB07mxBMk/jXgxk/LeiJslicpbFkTmLgqG0sRZLfMNwF3Q6F5n9t
	fwjvSfhFp2G3I6IrTFfaG40YBSeO+lulJZBDdUXYAVVz2tG6B8qHMT3CSDtxMKGHY7anZYLcSyW
	MHlbRorD5SFKXI+hjW6WRQJ1ykuKo/gu1+wryLaUpSk+sYCLpUGAWBzeZwEy7UAK6uuvJfxYjnT
	7r491pgQ6yDSA97D9uz9m6HgRE2+1OpSY9tkUCoiihyetEYPmG61xRqI2RtpSK3gS5O0e3saET4
	U5wu9rskgMBVIG4lMyu1q51SBZkgGe6jrRQtJ7yJKR6N+FnvCE50/id0mGd8ryCghgkSTLw/4ro
	YLMaawlOhwVItEMqRpY7jt+aNYTGfVbYI18Axl9QRxLCGfQqtcdNxHnR+yyJIPF0CBmT+tgmuMw
	K4Y4UWmDRtBKc2Y95dUf5kZ+iwecS9OjfU6ZAnRbCXtTeFPzVVeEvxfrrPeV4svAOoyA/kY/Azs
	v/eDRFy3ZsG5kaD0liQ0j9WJ5kcMjk=
X-Received: by 2002:a05:620a:f0f:b0:936:cf9c:a994 with SMTP id af79cd13be357-9377e9e7274mr385470985a.19.1787708122551;
        Tue, 25 Aug 2026 18:35:22 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e68053dsm104323785a.39.2026.08.25.18.35.20
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:35:20 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 08/10] security-manual: use the bitbake code-block language
Date: Tue, 25 Aug 2026 21:34:53 -0400
Message-ID: <20260826013502.2674000-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:35:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10352

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 16 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

Blocks that only look like BitBake are left alone, as are blocks
already tagged "none" where the content is deliberately unhighlighted.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../security-manual/read-only-rootfs.rst      |  8 +++--
 .../security-manual/securing-images.rst       |  8 +++--
 .../security-manual/sstate-signing.rst        | 16 +++++++---
 .../security-manual/vulnerabilities.rst       | 32 ++++++++++++++-----
 4 files changed, 48 insertions(+), 16 deletions(-)

diff --git a/documentation/security-manual/read-only-rootfs.rst b/documentation/security-manual/read-only-rootfs.rst
index 251178ed5458..55eb853dc239 100644
--- a/documentation/security-manual/read-only-rootfs.rst
+++ b/documentation/security-manual/read-only-rootfs.rst
@@ -23,13 +23,17 @@ Creating the Root Filesystem
 To create the read-only root filesystem, simply add the
 "read-only-rootfs" feature to your image, normally in one of two ways.
 The first way is to add the "read-only-rootfs" image feature in the
-image's recipe file via the :term:`IMAGE_FEATURES` variable::
+image's recipe file via the :term:`IMAGE_FEATURES` variable:
+
+.. code-block:: bitbake
 
    IMAGE_FEATURES += "read-only-rootfs"
 
 As an alternative, you can add the same feature
 from within your :term:`Build Directory`'s ``local.conf`` file with the
-associated :term:`EXTRA_IMAGE_FEATURES` variable, as in::
+associated :term:`EXTRA_IMAGE_FEATURES` variable, as in:
+
+.. code-block:: bitbake
 
    EXTRA_IMAGE_FEATURES = "read-only-rootfs"
 
diff --git a/documentation/security-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
index 13ab63ddd8be..3c01c1f643bd 100644
--- a/documentation/security-manual/securing-images.rst
+++ b/documentation/security-manual/securing-images.rst
@@ -82,7 +82,9 @@ your build output more secure. The security flags are in the
 
 Use the following line in your ``local.conf`` file or in your custom
 distribution configuration file to enable the security compiler and
-linker flags for your build::
+linker flags for your build:
+
+.. code-block:: bitbake
 
    require conf/distro/include/security_flags.inc
 
@@ -96,7 +98,9 @@ system to make your images more secure:
    and allow the use of empty passwords or root logins. This is typically
    done by adding the values "allow-empty-password", "allow-root-login", and
    "empty-root-password" to your build's image features, commonly with the
-   addition of the line::
+   addition of the line:
+
+   .. code-block:: bitbake
 
       EXTRA_IMAGE_FEATURES = "allow-empty-password empty-root-password allow-root-login"
 
diff --git a/documentation/security-manual/sstate-signing.rst b/documentation/security-manual/sstate-signing.rst
index 74a5d6bf07da..565f51e843ab 100644
--- a/documentation/security-manual/sstate-signing.rst
+++ b/documentation/security-manual/sstate-signing.rst
@@ -86,7 +86,9 @@ they are generated. The generation of new artifacts is done once a task has
 finished being executed.
 
 For the following sections let's assume that the build system has the shared
-state directory location (:term:`SSTATE_DIR`) defined as follows::
+state directory location (:term:`SSTATE_DIR`) defined as follows:
+
+.. code-block:: bitbake
 
    SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
@@ -120,7 +122,9 @@ Enabling Shared State Signing
 -----------------------------
 
 Create a new :term:`configuration file` on your host **in a safe location** and
-add the two following statements::
+add the two following statements:
+
+.. code-block:: bitbake
 
    SSTATE_VERIFY_SIG = "1"
    SSTATE_SIG_KEY = "4049A47E3AAA99D0250966DC5B97632FA7F4E942"
@@ -196,7 +200,9 @@ you can verify them with the public key counterpart of the private key.
    shared between multiple hosts.
 
 From a :term:`configuration file` such as the :ref:`site configuration file
-<structure-build-conf-site.conf>`, include the following statements::
+<structure-build-conf-site.conf>`, include the following statements:
+
+.. code-block:: bitbake
 
    SSTATE_VERIFY_SIG = "1"
    SSTATE_VALID_SIGS = "5B97632FA7F4E942"
@@ -255,7 +261,9 @@ Let's verify that signature verification works:
 .. note::
 
    To make sure shared state verification is working, you can set a "fake"
-   public key identifier in :term:`SSTATE_VALID_SIGS`::
+   public key identifier in :term:`SSTATE_VALID_SIGS`:
+
+   .. code-block:: bitbake
 
       SSTATE_VALID_SIGS = "CAFECAFECAFECAFE"
 
diff --git a/documentation/security-manual/vulnerabilities.rst b/documentation/security-manual/vulnerabilities.rst
index 38fbd2c7e358..e3fc6fe768b8 100644
--- a/documentation/security-manual/vulnerabilities.rst
+++ b/documentation/security-manual/vulnerabilities.rst
@@ -35,7 +35,9 @@ Directory`:
 
    $ bitbake-config-build enable-fragment core/yocto/sbom-cve-check
 
-Or add the following statement to a :term:`configuration file`::
+Or add the following statement to a :term:`configuration file`:
+
+.. code-block:: bitbake
 
    OE_FRAGMENTS += "core/yocto/sbom-cve-check"
 
@@ -44,7 +46,9 @@ recommended settings to use it.
 
 The CVE database contains some old incomplete entries which have been deemed not
 to impact :term:`OpenEmbedded-Core (OE-Core)`. These CVE entries can be excluded
-from the check by adding the following statement::
+from the check by adding the following statement:
+
+.. code-block:: bitbake
 
    include conf/distro/include/cve-extra-exclusions.inc
 
@@ -165,7 +169,9 @@ in the recipe name to CVE product mapping. These mapping issues can be fixed by
 the :term:`CVE_PRODUCT` variable inside the recipe. This defines the name of the software component in the
 upstream `NIST CVE database <https://nvd.nist.gov/>`__.
 
-The variable supports using vendor and product names like this::
+The variable supports using vendor and product names like this:
+
+.. code-block:: bitbake
 
    CVE_PRODUCT = "flex_project:flex westes:flex"
 
@@ -200,7 +206,9 @@ version does or likely might introduce incompatibilities, extracting and
 backporting patches is preferred.
 
 Here is an example of fixing CVE security issues with patch files,
-an example from the :oe_layerindex:`ffmpeg recipe for dunfell </layerindex/recipe/122174>`::
+an example from the :oe_layerindex:`ffmpeg recipe for dunfell </layerindex/recipe/122174>`:
+
+.. code-block:: bitbake
 
    SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
               file://mips64_cpu_detection.patch \
@@ -283,7 +291,9 @@ status to ``Patched`` in the generated reports.
 If analysis shows that the CVE issue does not impact the recipe due to configuration, platform,
 version or other reasons, the CVE can be marked as ``Ignored`` by using
 the :term:`CVE_STATUS` variable flag with appropriate reason which is mapped to ``Ignored``.
-The entry should have the format like::
+The entry should have the format like:
+
+.. code-block:: bitbake
 
    CVE_STATUS[CVE-2016-10642] = "cpe-incorrect: This is specific to the npm package that installs cmake, so isn't relevant to OpenEmbedded"
 
@@ -364,7 +374,9 @@ Example:
    $ cd openembedded-core/meta/recipes-kernel/linux/
    $ ./generate-cve-exclusions.py ~/cvelistV5 6.12.27 > ~/meta-custom/recipes-kernel/linux/cve-exclusion_6.12.inc
 
-Don't forget to update your kernel recipe with::
+Don't forget to update your kernel recipe with:
+
+.. code-block:: bitbake
 
    include cve-exclusion_6.12.inc
 
@@ -396,7 +408,9 @@ build a binary. Therefore, it needs to be configured in the kernel to extract
 the kernel compiled files.
 
 If you are using the ``linux-yocto`` recipe, enable it by adding the following
-in a :term:`configuration file` or in a ``.bbappend``::
+in a :term:`configuration file` or in a ``.bbappend``:
+
+.. code-block:: bitbake
 
    KERNEL_EXTRA_FEATURES:append = " features/debug/debug-kernel.scc"
 
@@ -413,7 +427,9 @@ The sources for the kernel are stored under
 ``tmp/pkgdata/<MACHINE>/debugsources/linux-yocto-debugsources.json.zstd``. In
 order to include the information into the :term:`SPDX` file to filter out
 source files that are not used to compile the kernel, add the following in a
-:term:`configuration file`::
+:term:`configuration file`:
+
+.. code-block:: bitbake
 
    SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto = "1"
 

