Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDEDC61DCD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:35:22 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3402.1787708116673648446
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jLOL1oZL;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-936dfd009d1so119020485a.1
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708116; x=1788312916; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AMmg9I+C1d87MPNVgolSbRYtndc6AnUktjxEbceTVbk=;
        b=jLOL1oZLH/PkaHQwLN5ANC/IiYw9Jo7V3iY6GWYnTQxRHks66r22USA0VCfTTDbPgc
         PQSr6YCZGnSg0fkpFrj1QDNiG6HVCct88lgYEN67E1W75LGLsHPdj0tSp0Ld2cglIGmd
         wX59sq8T4puU2vkhHKg5nO10N4SEhd3icK3ZDAdwyF5nZArTjABv+vByNPoyALYDpJPv
         7CWcrqHpslXC9IDhtQbNSQ+dtpFGMlpxYqWUa22aITuetcCKBMj+oMvg8D8/3GcRNKRY
         TO3qVb05ctKHjDJ0EBBbf7nk9am4qz0rwaFMRDzP75MUgPINn6ZFJ4VpQ4uZ0FuJpPrL
         kEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708116; x=1788312916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AMmg9I+C1d87MPNVgolSbRYtndc6AnUktjxEbceTVbk=;
        b=sVLY/3fdN21WoKkvzkWvQo8tnJfP0lh43SeNco/Ae42oIuQWonFIjI1nbNVOQwPjb8
         569Xj/gMgzRJT4aMrQjNcnTmjGDU98qmxFq26UfCFs4K2dPdWWtvH6FrzH4yAFeMGAbe
         Rzajw0xUGQNeNTlvrbGzbg7Q62/6ERcjuEIFrwHJvw/5zWvI74dXtvNPCBChsqCIHy7T
         95sZwdLkRmIt8VOKGSG8v1GHnRR8Ps/fQeCAxG2vBQidiQ6oMshWnLU7TXg7dwDOHGub
         ITCOoNhgfT1ksTsGiAVQNe0h+rqD97U9Vv0pFE4Z+v/DEWNbiI5Wamdme1RHXbCK+e/L
         ziUQ==
X-Gm-Message-State: AFuF++njfiT5mitoY4x2okqOg8eFfHg5Vhs9NChH1OV18Ym5jdF08Xs5
	dRibHT5mGz/z5pOQNQXxMDy3EVNOxG4i0FVqyYOoVC9WV1mSLLhf9vUqu2zaS7sF
X-Gm-Gg: AR+sD13bpxPf0/vMiZIFX756tUNZk1ivE26egYIVLtLGbfeVQ0HsCtHb2pzobD7J6pQ
	c2WCt5FF8OMUPC7Ci+k83N7DlwxUjeHKn+ihidSNXvU1s18jQG4IdPS+ia1nkmV7iEKXavROvKU
	mLxLagx67ffREkFiqxgWI2/XK8S7ulYXj3p4lG8XXaWt3bRlE7gyL8WAhd8yXCPg98u5BjlXfN9
	MtYzVE6MWK6XBu9N/V88AWsxmtcJOOQEJI5RJ/Kf1c6WQQ4wmSa7GmVhWIB2SnWUon9iPvONaub
	OcT8iv5SG0weuBQOkJLwDYeEEaarzaCQ7itO/LQbpO8NNmv/LTtaslj9NyydNPTYbHOOk8uS8fw
	LBfAS9+kc6/n8DeJXZ1SR5APkLScJwbhKmn0sTvWYmB5VD4HVnC0tjCc/DyDoRTNqlURWMCAQW/
	3tImBqLCIB3gshS4ljvFbdw8LOKKfV4fI1pBZHgcaxswKVNJEAjL6j4ret8TTsMjCgM5Lv1TK9P
	Ph5bXORMwW/mU5aTEYAPhWWKOfqYbA=
X-Received: by 2002:a05:620a:2587:b0:92e:e467:7f93 with SMTP id af79cd13be357-9377e990c46mr300481685a.14.1787708114627;
        Tue, 25 Aug 2026 18:35:14 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e68053dsm104323785a.39.2026.08.25.18.35.12
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:35:12 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 04/10] migration-guides: use the bitbake code-block language
Date: Tue, 25 Aug 2026 21:34:49 -0400
Message-ID: <20260826013502.2674000-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:35:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10349

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 79 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

Blocks that only look like BitBake are left alone, as are blocks
already tagged "none" where the content is deliberately unhighlighted.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../migration-guides/migration-1.3.rst        |  8 +++-
 .../migration-guides/migration-1.6.rst        | 12 +++--
 .../migration-guides/migration-1.7.rst        |  4 +-
 .../migration-guides/migration-1.8.rst        | 12 +++--
 .../migration-guides/migration-2.0.rst        |  8 +++-
 .../migration-guides/migration-2.1.rst        |  4 +-
 .../migration-guides/migration-2.2.rst        | 11 +++--
 .../migration-guides/migration-2.3.rst        | 12 +++--
 .../migration-guides/migration-2.5.rst        |  4 +-
 .../migration-guides/migration-2.6.rst        | 12 +++--
 .../migration-guides/migration-3.0.rst        |  4 +-
 .../migration-guides/migration-3.1.rst        | 12 +++--
 .../migration-guides/migration-3.2.rst        |  8 +++-
 .../migration-guides/migration-3.3.rst        |  8 +++-
 .../migration-guides/migration-3.4.rst        | 16 +++++--
 .../migration-guides/migration-4.0.rst        | 12 +++--
 .../migration-guides/migration-4.1.rst        |  8 +++-
 .../migration-guides/migration-4.2.rst        | 12 +++--
 .../migration-guides/migration-5.1.rst        | 12 +++--
 .../migration-guides/migration-5.2.rst        | 24 +++++++---
 .../migration-guides/migration-5.3.rst        | 36 +++++++++++----
 .../migration-guides/migration-6.0.rst        | 44 ++++++++++++++-----
 .../migration-guides/migration-6.1.rst        | 12 +++--
 .../migration-guides/release-notes-4.0.rst    |  4 +-
 .../migration-guides/release-notes-4.3.rst    |  4 +-
 .../migration-guides/release-notes-5.0.rst    |  4 +-
 .../migration-guides/release-notes-5.3.rst    |  8 +++-
 27 files changed, 236 insertions(+), 79 deletions(-)

diff --git a/documentation/migration-guides/migration-1.3.rst b/documentation/migration-guides/migration-1.3.rst
index 594320d5e1c3..23f54dca96e7 100644
--- a/documentation/migration-guides/migration-1.3.rst
+++ b/documentation/migration-guides/migration-1.3.rst
@@ -29,7 +29,9 @@ location (either local or remote) and then point to it in
 :term:`SSTATE_MIRRORS`, you need to append "PATH"
 to the end of the mirror URL so that the path used by BitBake before the
 mirror substitution is appended to the path used to access the mirror.
-Here is an example::
+Here is an example:
+
+.. code-block:: bitbake
 
    SSTATE_MIRRORS = "file://.* http://someserver.tld/share/sstate/PATH"
 
@@ -178,7 +180,9 @@ Linux Kernel Naming
 -------------------
 
 The naming scheme for kernel output binaries has been changed to now
-include :term:`PE` as part of the filename::
+include :term:`PE` as part of the filename:
+
+.. code-block:: bitbake
 
    KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 
diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index b052a43a3125..aef0b5bce284 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -54,7 +54,9 @@ Matching Branch Requirement for Git Fetching
 When fetching source from a Git repository using
 :term:`SRC_URI`, BitBake will now validate the
 :term:`SRCREV` value against the branch. You can specify
-the branch using the following form::
+the branch using the following form:
+
+.. code-block:: bitbake
 
       SRC_URI = "git://server.name/repository;branch=branchname"
 
@@ -207,7 +209,9 @@ functions to call and not arbitrary shell commands:
 
 For
 migration purposes, you can simply wrap shell commands in a shell
-function and then call the function. Here is an example::
+function and then call the function. Here is an example:
+
+.. code-block:: bitbake
 
    my_postprocess_function() {
       echo "hello" > ${IMAGE_ROOTFS}/hello.txt
@@ -247,7 +251,9 @@ the :ref:`ref-classes-autotools` or ``autotools_stage`` classes.
 
 ``qemu-native`` now builds without SDL-based graphical output support by
 default. The following additional lines are needed in your
-``local.conf`` to enable it::
+``local.conf`` to enable it:
+
+.. code-block:: bitbake
 
    PACKAGECONFIG_pn-qemu-native = "sdl"
    ASSUME_PROVIDED += "libsdl-native"
diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index 1a5704fd4da6..c686f6dab10b 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -17,7 +17,9 @@ optional features. The method used to set defaults for these options
 means that existing ``local.conf`` files will need to be modified to
 append to :term:`PACKAGECONFIG` for ``qemu-native`` and ``nativesdk-qemu``
 instead of setting it. In other words, to enable graphical output for
-QEMU, you should now have these lines in ``local.conf``::
+QEMU, you should now have these lines in ``local.conf``:
+
+.. code-block:: bitbake
 
    PACKAGECONFIG_append_pn-qemu-native = " sdl"
    PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
diff --git a/documentation/migration-guides/migration-1.8.rst b/documentation/migration-guides/migration-1.8.rst
index 5cc5f8a047d8..e7e43fd64e55 100644
--- a/documentation/migration-guides/migration-1.8.rst
+++ b/documentation/migration-guides/migration-1.8.rst
@@ -58,7 +58,9 @@ you can now remove them.
 Additionally, a ``bluetooth`` class has been added to make selection of
 the appropriate bluetooth support within a recipe a little easier. If
 you wish to make use of this class in a recipe, add something such as
-the following::
+the following:
+
+.. code-block:: bitbake
 
    inherit bluetooth
    PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
@@ -85,7 +87,9 @@ where the ``linux.inc`` file in ``meta-oe`` was updated.
 
 Recipes that rely on the kernel source code and do not inherit the
 :ref:`module <ref-classes-module>` classes might need to add explicit
-dependencies on the :ref:`ref-tasks-shared_workdir` kernel task, for example::
+dependencies on the :ref:`ref-tasks-shared_workdir` kernel task, for example:
+
+.. code-block:: bitbake
 
    do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
@@ -131,7 +135,9 @@ One of the improvements is to attempt to run "make clean" during the
 :ref:`ref-tasks-configure` task if a ``Makefile`` exists. Some software packages
 do not provide a working clean target within their make files. If you
 have such recipes, you need to set
-:term:`CLEANBROKEN` to "1" within the recipe, for example::
+:term:`CLEANBROKEN` to "1" within the recipe, for example:
+
+.. code-block:: bitbake
 
    CLEANBROKEN = "1"
 
diff --git a/documentation/migration-guides/migration-2.0.rst b/documentation/migration-guides/migration-2.0.rst
index 13be9846dfb3..f8d14e44c136 100644
--- a/documentation/migration-guides/migration-2.0.rst
+++ b/documentation/migration-guides/migration-2.0.rst
@@ -27,7 +27,9 @@ and the porting guide at
 https://gcc.gnu.org/gcc-5/porting_to.html.
 
 Alternatively, you can switch back to GCC 4.9 or 4.8 by setting
-:term:`GCCVERSION` in your configuration, as follows::
+:term:`GCCVERSION` in your configuration, as follows:
+
+.. code-block:: bitbake
 
    GCCVERSION = "4.9%"
 
@@ -200,7 +202,9 @@ changes.
 
 Additionally, work directories for old versions of recipes are now
 pruned. If you wish to disable pruning old work directories, you can set
-the following variable in your configuration::
+the following variable in your configuration:
+
+.. code-block:: bitbake
 
    SSTATE_PRUNE_OBSOLETEWORKDIR = "0"
 
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index 4d7aa15af565..bdbc7e4d289f 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -284,7 +284,9 @@ The following changes have been made for the Poky distribution:
    Any recipe that needs to opt-out of having the ``--disable-static``
    option specified on the configure command line either because it is
    not a supported option for the configure script or because static
-   libraries are needed should set the following variable::
+   libraries are needed should set the following variable:
+
+   .. code-block:: bitbake
 
       DISABLE_STATIC = ""
 
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 9d50dc62022b..20fe4ad3bfb2 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -224,7 +224,8 @@ follows and run ``runqemu``:
 
    For command-line syntax, use ``runqemu help``.
 
-::
+
+.. code-block:: bitbake
 
    IMAGE_CLASSES += "qemuboot"
 
@@ -241,7 +242,9 @@ recipes. You need to fix these recipes so that they use the expected
 :term:`LDFLAGS`. Depending on how the software is built, the build system
 used by the software (e.g. a Makefile) might need to be patched.
 However, sometimes making this fix is as simple as adding the following
-to the recipe::
+to the recipe:
+
+.. code-block:: bitbake
 
    TARGET_CC_ARCH += "${LDFLAGS}"
 
@@ -254,7 +257,9 @@ The ``KERNEL_IMAGE_BASE_NAME`` variable no longer uses the
 :term:`KERNEL_IMAGETYPE` variable to create the
 image's base name. Because the OpenEmbedded build system can now build
 multiple kernel image types, this part of the kernel image base name as
-been removed leaving only the following::
+been removed leaving only the following:
+
+.. code-block:: bitbake
 
    KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 
diff --git a/documentation/migration-guides/migration-2.3.rst b/documentation/migration-guides/migration-2.3.rst
index 60340b9592f1..641be4deb328 100644
--- a/documentation/migration-guides/migration-2.3.rst
+++ b/documentation/migration-guides/migration-2.3.rst
@@ -452,11 +452,15 @@ The following miscellaneous changes have occurred:
    tools.
 
 -  The ``USE_LDCONFIG`` variable has been replaced with the "ldconfig"
-   :term:`DISTRO_FEATURES` feature. Distributions that previously set::
+   :term:`DISTRO_FEATURES` feature. Distributions that previously set:
+
+   .. code-block:: bitbake
 
       USE_LDCONFIG = "0"
 
-   should now instead use the following::
+   should now instead use the following:
+
+   .. code-block:: bitbake
 
       DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " ldconfig"
 
@@ -474,7 +478,9 @@ The following miscellaneous changes have occurred:
    order to allow module packages from multiple kernel versions to
    co-exist on a target system. If you wish to return to the previous
    naming scheme that does not include the version suffix, use the
-   following::
+   following:
+
+   .. code-block:: bitbake
 
       KERNEL_MODULE_PACKAGE_SUFFIX = ""
 
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index 8e182cd2bc4a..165f15708fc0 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -165,7 +165,9 @@ one of the packages provided by the Python recipe. You can no longer run
 ``bitbake python-foo`` or have a
 :term:`DEPENDS` on ``python-foo``,
 but doing either of the following causes the package to work as
-expected::
+expected:
+
+.. code-block:: bitbake
 
    IMAGE_INSTALL_append = " python-foo"
 
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index ecb559dd4c32..ac899b0a02b3 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -162,7 +162,9 @@ The following changes have been made:
    allows easier and more direct changes.
 
    The :term:`IMAGE_VERSION_SUFFIX` variable is set in the ``bitbake.conf``
-   configuration file as follows::
+   configuration file as follows:
+
+   .. code-block:: bitbake
 
       IMAGE_VERSION_SUFFIX = "-${DATETIME}"
 
@@ -385,7 +387,9 @@ If you wish to disable Python profile-guided optimization regardless of
 the value of :term:`MACHINE_FEATURES`, then ensure that
 :term:`PACKAGECONFIG` for the ``python3`` recipe
 does not contain "pgo". You could accomplish the latter using the
-following at the configuration level::
+following at the configuration level:
+
+.. code-block:: bitbake
 
    PACKAGECONFIG_remove_pn-python3 = "pgo"
 
@@ -402,7 +406,9 @@ The following miscellaneous changes occurred:
 -  Default to using the Thumb-2 instruction set for armv7a and above. If
    you have any custom recipes that build software that needs to be
    built with the ARM instruction set, change the recipe to set the
-   instruction set as follows::
+   instruction set as follows:
+
+   .. code-block:: bitbake
 
       ARM_INSTRUCTION_SET = "arm"
 
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index f5201dcac24c..5a991dd84367 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -261,7 +261,9 @@ The following miscellaneous changes have occurred.
 
 -  The ``gnome`` class has been removed because it now does very little.
    You should update recipes that previously inherited this class to do
-   the following::
+   the following:
+
+   .. code-block:: bitbake
 
       inherit gnomebase gtk-icon-cache gconf mime
 
diff --git a/documentation/migration-guides/migration-3.1.rst b/documentation/migration-guides/migration-3.1.rst
index fdb959c4affa..ddb994c3ad2f 100644
--- a/documentation/migration-guides/migration-3.1.rst
+++ b/documentation/migration-guides/migration-3.1.rst
@@ -73,7 +73,9 @@ when building a simple image such as core-image-minimal. If you do not
 need runtime tests enabled for core components, then it is recommended
 that you remove "ptest" from
 :term:`DISTRO_FEATURES` to save a significant
-amount of build time e.g. by adding the following in your configuration::
+amount of build time e.g. by adding the following in your configuration:
+
+.. code-block:: bitbake
 
    DISTRO_FEATURES_remove = "ptest"
 
@@ -180,12 +182,16 @@ parameter instead of the earlier ``name`` which overlapped with the
 generic ``name`` parameter. All recipes using the npm fetcher will need
 to be changed as a result.
 
-An example of the new scheme::
+An example of the new scheme:
+
+.. code-block:: bitbake
 
    SRC_URI = "npm://registry.npmjs.org;package=array-flatten;version=1.1.1 \
               npmsw://${THISDIR}/npm-shrinkwrap.json"
 
-Another example where the sources are fetched from git rather than an npm repository::
+Another example where the sources are fetched from git rather than an npm repository:
+
+.. code-block:: bitbake
 
    SRC_URI = "git://github.com/foo/bar.git;protocol=https \
               npmsw://${THISDIR}/npm-shrinkwrap.json"
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index 5cb958e75047..5313c4ebdda2 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -97,7 +97,9 @@ is prefixed on the package names in the dependencies, for example
     RRECOMMENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
 
 This also applies when conditionally adding packages to :term:`PACKAGES` where
-those packages have dependencies, for example (from the ``alsa-plugins`` recipe)::
+those packages have dependencies, for example (from the ``alsa-plugins`` recipe):
+
+.. code-block:: bitbake
 
     PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
     ...
@@ -256,7 +258,9 @@ needs ``/etc/ld.so.conf`` to be present at image build time:
 
 When some recipe installs libraries to a non-standard location, and
 therefore installs in a file in ``/etc/ld.so.conf.d/foo.conf``, we
-need ``/etc/ld.so.conf`` containing::
+need ``/etc/ld.so.conf`` containing:
+
+.. code-block:: bitbake
 
   include /etc/ld.so.conf.d/*.conf
 
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index d1e589d7b486..9c4d449eabb7 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -87,14 +87,18 @@ source tree. Previously this was handled in recipes by setting :term:`S` to
 point to the subdirectory within the source where ``setup.py`` is located.
 However with the recent :ref:`pseudo <overview-manual/concepts:fakeroot and pseudo>`
 changes, some Python modules make changes to files beneath ``${S}``, for
-example::
+example:
+
+.. code-block:: bitbake
 
    S = "${WORKDIR}/git/python/pythonmodule"
 
 then in ``setup.py`` it works with source code in a relative fashion, such
 as ``../../src``. This causes pseudo to fail as it isn't able to track
 the paths properly. This release introduces a new ``DISTUTILS_SETUP_PATH``
-variable so that recipes can specify it explicitly, for example::
+variable so that recipes can specify it explicitly, for example:
+
+.. code-block:: bitbake
 
    S = "${WORKDIR}/git"
    DISTUTILS_SETUP_PATH = "${S}/python/pythonmodule"
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index e9cb3a109ea9..4f970b9d4663 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -11,16 +11,22 @@ Override syntax changes
 
 In this release, the ``:`` character replaces the use of ``_`` to
 refer to an override, most commonly when making a conditional assignment
-of a variable. This means that an entry like::
+of a variable. This means that an entry like:
+
+.. code-block:: bitbake
 
    SRC_URI_qemux86 = "file://somefile"
 
-now becomes::
+now becomes:
+
+.. code-block:: bitbake
 
    SRC_URI:qemux86 = "file://somefile"
 
 since ``qemux86`` is an override. This applies to any use of override
-syntax, so the following::
+syntax, so the following:
+
+.. code-block:: bitbake
 
    SRC_URI_append = " file://somefile"
    SRC_URI_append_qemux86 = " file://somefile2"
@@ -32,7 +38,9 @@ syntax, so the following::
    SRCREV_pn-bash = "abc"
    BB_TASK_NICE_LEVEL_task-testimage = '0'
 
-would now become::
+would now become:
+
+.. code-block:: bitbake
 
    SRC_URI:append = " file://somefile"
    SRC_URI:append:qemux86 = " file://somefile2"
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index c8c2b856d91c..89bc24e7669b 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -74,7 +74,9 @@ Fetching changes
 
 - Because of the uncertainty in future default branch names in git repositories,
   it is now required to add a branch name to all URLs described
-  by ``git://`` and ``gitsm://`` :term:`SRC_URI` entries. For example::
+  by ``git://`` and ``gitsm://`` :term:`SRC_URI` entries. For example:
+
+  .. code-block:: bitbake
 
      SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
@@ -91,7 +93,9 @@ Fetching changes
 - Network access from tasks is now disabled by default on kernels which support
   this feature (on most recent distros such as CentOS 8 and Debian 11 onwards).
   This means that tasks accessing the network need to be marked as such with the ``network``
-  flag. For example::
+  flag. For example:
+
+  .. code-block:: bitbake
 
      do_mytask[network] = "1"
 
@@ -216,7 +220,9 @@ Miscellaneous changes
 - ``blacklist.bbclass`` is removed and the functionality moved to the
   :ref:`ref-classes-base` class with a more descriptive
   ``varflag`` variable named :term:`SKIP_RECIPE` which will use the `bb.parse.SkipRecipe()`
-  function. The usage remains the same, for example::
+  function. The usage remains the same, for example:
+
+  .. code-block:: bitbake
 
      SKIP_RECIPE[my-recipe] = "Reason for skipping recipe"
 
diff --git a/documentation/migration-guides/migration-4.1.rst b/documentation/migration-guides/migration-4.1.rst
index 86721b9873d0..635c08821238 100644
--- a/documentation/migration-guides/migration-4.1.rst
+++ b/documentation/migration-guides/migration-4.1.rst
@@ -88,12 +88,16 @@ Other than knowing where to look when manually browsing the class files, this is
 not likely to require any changes to your configuration. However, if in your
 configuration you were using some classes in the incorrect context, you will now
 receive an error during parsing. For example, the following in ``local.conf`` will
-now cause an error::
+now cause an error:
+
+.. code-block:: bitbake
 
    INHERIT += "testimage"
 
 Since :ref:`ref-classes-testimage` is a class intended solely to
-affect image recipes, this would be correctly specified as::
+affect image recipes, this would be correctly specified as:
+
+.. code-block:: bitbake
 
    IMAGE_CLASSES += "testimage"
 
diff --git a/documentation/migration-guides/migration-4.2.rst b/documentation/migration-guides/migration-4.2.rst
index f5f12c88710a..6a4de4d8f01c 100644
--- a/documentation/migration-guides/migration-4.2.rst
+++ b/documentation/migration-guides/migration-4.2.rst
@@ -184,7 +184,9 @@ release we limit qemu port forwarding to localhost (127.0.0.1).
 
 However, if you need the qemu machine to be reachable from the
 network, then it can be enabled via ``conf/local.conf`` or machine
-config variable ``QB_SLIRP_OPT``::
+config variable ``QB_SLIRP_OPT``:
+
+.. code-block:: bitbake
 
    QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp::2222-:22"
 
@@ -233,7 +235,9 @@ Miscellaneous changes
 -  The :term:`IMAGE_NAME` variable is now set based on :term:`IMAGE_LINK_NAME`. This
    means that if you are setting :term:`IMAGE_LINK_NAME` to "" to disable unversioned
    image symlink creation, you also now need to set :term:`IMAGE_NAME` to still have
-   a reasonable value e.g.::
+   a reasonable value e.g.:
+
+   .. code-block:: bitbake
 
       IMAGE_LINK_NAME = ""
       IMAGE_NAME = "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_SUFFIX}"
@@ -271,6 +275,8 @@ Miscellaneous changes
    scons in order to fix an issue with scons and command line lengths when ccache is
    enabled. However, some recipes may be using older scons versions which don't support
    this argument. If that is the case you can set the following in the recipe in order
-   to disable this::
+   to disable this:
+
+   .. code-block:: bitbake
 
       SCONS_MAXLINELENGTH = ""
diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index 70e034bc846f..9ea68d8d5aca 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -18,7 +18,9 @@ S = ${WORKDIR} no longer supported
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 If a recipe has :term:`S` set to be :term:`WORKDIR`, this is no longer
-supported, and an error will be issued. The recipe should be changed to::
+supported, and an error will be issued. The recipe should be changed to:
+
+.. code-block:: bitbake
 
     S = "${UNPACKDIR}"
 
@@ -59,7 +61,9 @@ longer the case. This means the check in ``do_unpack_qa`` triggers where
 :term:`S` is not created by a recipe while it didn't happen before. This can
 require to add an :term:`S` definition to a recipe that only uses
 ``file://`` :term:`SRC_URI` entries. To be consistent, the following pattern is
-recommended::
+recommended:
+
+.. code-block:: bitbake
 
     S = "${UNPACKDIR}"
 
@@ -105,7 +109,9 @@ Go language changes
 -  After dropping the custom :ref:`ref-tasks-unpack` from the
    :ref:`ref-classes-go` class, go recipes should now add
    ``destsuffix=${GO_SRCURI_DESTSUFFIX}`` to their :term:`SRC_URI` to extract
-   them in the appropriate path. An example would be::
+   them in the appropriate path. An example would be:
+
+   .. code-block:: bitbake
 
       SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 77a11fe27047..c30f4097aac1 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -29,7 +29,9 @@ should be manually added to the :term:`IMAGE_FEATURES` variable. These are:
 -  ``empty-root-password``
 -  ``post-install-logging``
 
-Such a statement would be::
+Such a statement would be:
+
+.. code-block:: bitbake
 
    IMAGE_FEATURES += "allow-empty-password allow-root-login empty-root-password post-install-logging"
 
@@ -177,11 +179,15 @@ c++/binutils)" </openembedded-core/commit/?id=4ccc3bc8266c>` in
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The :term:`UBOOT_ENTRYPOINT` variable should now be defined with a leading
-``0x`` to its value. For example, consider the following assignment::
+``0x`` to its value. For example, consider the following assignment:
+
+.. code-block:: bitbake
 
    UBOOT_ENTRYPOINT ?= "20008000"
 
-This should now be replaced by::
+This should now be replaced by:
+
+.. code-block:: bitbake
 
    UBOOT_ENTRYPOINT ?= "0x20008000"
 
@@ -191,7 +197,9 @@ Git fetcher: support for multiple revisions per URL removed
 
 The support for having multiple Git revisions per URL in :term:`SRC_URI` was
 removed from BitBake, which means the following syntax is not supported
-anymore::
+anymore:
+
+.. code-block:: bitbake
 
    SRC_URI = "git://some.host/somepath;bareclone=1;branch=branchX,branchY;name=nameX,nameY"
    SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
@@ -203,7 +211,9 @@ take care of the Git checkout. This removal simplifies the code logic in several
 places.
 
 If one of your recipes is using this mechanism, you can split the code source
-fetching into two separate entries::
+fetching into two separate entries:
+
+.. code-block:: bitbake
 
    SRC_URI = "git://some.host/somepath;bareclone=1;branch=branchX;name=nameX \
               git://some.host/somepath;bareclone=1;branch=branchY;name=nameY"
@@ -214,7 +224,9 @@ Git fetcher: Branch parameter now required in :term:`SRC_URI`
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The ``branch`` parameter is now required when specifying a Git repository in
-:term:`SRC_URI`, for example::
+:term:`SRC_URI`, for example:
+
+.. code-block:: bitbake
 
    SRC_URI = "git://some.host/somepath;branch=branchX"
 
diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 38c7d6771667..d947a4de7a1a 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -50,7 +50,9 @@ in: https://lists.openembedded.org/g/openembedded-architecture/message/2179
 
 If a recipe has :term:`S` set to be ``${``\ :term:`WORKDIR`\ ``}/something``,
 this is no longer supported, and an error will be issued. The recipe should be
-changed to::
+changed to:
+
+.. code-block:: bitbake
 
    S = "${UNPACKDIR}/something"
 
@@ -69,7 +71,9 @@ This location matches the default value of :term:`S` set by bitbake.conf, so :te
 setting in recipes can and should be removed.
 
 Note that when :term:`S` is set to a subdirectory of the git checkout, then it
-should be instead adjusted according to the previous point::
+should be instead adjusted according to the previous point:
+
+.. code-block:: bitbake
 
    S = "${UNPACKDIR}/${BP}/something"
 
@@ -112,13 +116,17 @@ assignment in recipes::
 
    <filename>:<line number> has a lack of whitespace around the assignment: '<assignment>'
 
-For example, the following assignments would print a warning::
+For example, the following assignments would print a warning:
+
+.. code-block:: bitbake
 
    FOO="bar"
    FOO= "bar"
    FOO ="bar"
 
-These should be replaced by::
+These should be replaced by:
+
+.. code-block:: bitbake
 
    FOO = "bar"
 
@@ -179,14 +187,18 @@ overview of the removed firmware.
 
 The :term:`CPPFLAGS`, :term:`CFLAGS`, :term:`CXXFLAGS` and :term:`LDFLAGS`
 variables used to have hard assignments in the :ref:`ref-classes-native` and
-:ref:`ref-classes-nativesdk` classes, respectively::
+:ref:`ref-classes-nativesdk` classes, respectively:
+
+.. code-block:: bitbake
 
    CPPFLAGS = "${BUILD_CPPFLAGS}"
    CFLAGS = "${BUILD_CFLAGS}"
    CXXFLAGS = "${BUILD_CXXFLAGS}"
    LDFLAGS = "${BUILD_LDFLAGS}"
 
-and::
+and:
+
+.. code-block:: bitbake
 
    CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
    CFLAGS = "${BUILDSDK_CFLAGS}"
@@ -206,11 +218,15 @@ three**: target, :ref:`ref-classes-native` and :ref:`ref-classes-nativesdk`
 contexts.
 
 Recipes that unknowingly relied on this behavior should change these assignments
-to use ``TARGET_`` variables instead, for example::
+to use ``TARGET_`` variables instead, for example:
+
+.. code-block:: bitbake
 
    CFLAGS += "something"
 
-to::
+to:
+
+.. code-block:: bitbake
 
    TARGET_CFLAGS += "something"
 
@@ -305,7 +321,9 @@ The following classes have been removed in this release:
 
    #. Make sure to include ``kernel-fit-extra-artifacts`` in your :term:`KERNEL_CLASSES`
       variable to ensure the required files are exposed to the :term:`DEPLOY_DIR_IMAGE`
-      directory::
+      directory:
+
+      .. code-block:: bitbake
 
          KERNEL_CLASSES += "kernel-fit-extra-artifacts"
 
diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index 5ad284600002..54323d5961aa 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -88,7 +88,9 @@ This does not change the default init manager of the :term:`Poky` distribution,
 which remains :wikipedia:`SysVinit <UNIX_System_V>`.
 
 Reverting to :wikipedia:`SysVinit <UNIX_System_V>` can be done by specifying the
-:term:`INIT_MANAGER` in your own :term:`DISTRO` configuration file::
+:term:`INIT_MANAGER` in your own :term:`DISTRO` configuration file:
+
+.. code-block:: bitbake
 
    INIT_MANAGER = "sysvinit"
 
@@ -189,7 +191,9 @@ Previously, setting :term:`DEBUG_BUILD` to "1" globally would prevent the
 changed so that only **target** binaries are stripped when this variable is set.
 
 This change can be reverted by setting the two following lines in a
-:term:`configuration file`::
+:term:`configuration file`:
+
+.. code-block:: bitbake
 
    INHIBIT_SYSROOT_STRIP:class-cross = "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
    INHIBIT_SYSROOT_STRIP:class-native = "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
@@ -202,13 +206,17 @@ U-Boot configuration flow changes (:ref:`ref-classes-uboot-config`)
 -------------------------------------------------------------------
 
 Declaring multiple U-Boot configurations used to be entirely defined by
-one :term:`UBOOT_CONFIG` variable flag per configuration, e.g.::
+one :term:`UBOOT_CONFIG` variable flag per configuration, e.g.:
+
+.. code-block:: bitbake
 
    UBOOT_CONFIG ??= "foo bar"
    UBOOT_CONFIG[foo] = "config,images,binary"
    UBOOT_CONFIG[bar] = "config2,images2,binary2"
 
-This has now been split into more variable flags, e.g.::
+This has now been split into more variable flags, e.g.:
+
+.. code-block:: bitbake
 
    UBOOT_CONFIG ??= "foo bar"
    UBOOT_CONFIG[foo] = "config"
@@ -233,7 +241,9 @@ See commit :oecore_rev:`cd9e7304481b24b27df61c03ad73496d18e4d47c` for more infor
 .. note::
 
    Single configuration builds have not changed and are still declared using the
-   following statements::
+   following statements:
+
+   .. code-block:: bitbake
 
       UBOOT_MACHINE = "config"
       UBOOT_BINARY = "u-boot.bin"
@@ -249,7 +259,9 @@ Variables to the Environment>` directive.
 
 These ``export`` statements have been moved to the :ref:`ref-classes-pkgconfig`
 class, meaning recipes using these variables that not yet inheriting the
-:ref:`ref-classes-pkgconfig` class should now inherit it with::
+:ref:`ref-classes-pkgconfig` class should now inherit it with:
+
+.. code-block:: bitbake
 
    inherit pkgconfig
 
@@ -322,11 +334,15 @@ The ``cve-check`` class was removed and replaced by the
 Users currently using the ``cve-check`` class are advised to switch to
 :ref:`ref-classes-sbom-cve-check`:
 
--  The following assignment::
+-  The following assignment:
+
+   .. code-block:: bitbake
 
       INHERIT += "cve-check"
 
-   Should be removed and replaced by::
+   Should be removed and replaced by:
+
+   .. code-block:: bitbake
 
       OE_FRAGMENTS += "core/yocto/sbom-cve-check"
 
@@ -345,7 +361,9 @@ Users currently using the ``cve-check`` class are advised to switch to
 -  The ``cve-check`` class output summary file (deployed in the
    :term:`DEPLOY_DIR_IMAGE`) ending with ``.cve.txt`` is no longer
    deployed by default but can be brought back by adding the following statement
-   to a configuration file::
+   to a configuration file:
+
+   .. code-block:: bitbake
 
       SBOM_CVE_CHECK_EXPORT_VARS:append = " SBOM_CVE_CHECK_EXPORT_SUMMARY"
 
@@ -395,11 +413,15 @@ the console when used::
 Using the ``--sector-size`` command-line argument can be done through the
 :term:`WIC_CREATE_EXTRA_ARGS` variable.
 
-For example, a previous assignment to :term:`WIC_SECTOR_SIZE`::
+For example, a previous assignment to :term:`WIC_SECTOR_SIZE`:
+
+.. code-block:: bitbake
 
    WIC_SECTOR_SIZE = "4096"
 
-Should be replaced by::
+Should be replaced by:
+
+.. code-block:: bitbake
 
    WIC_CREATE_EXTRA_ARGS += "--sector-size 4096"
 
diff --git a/documentation/migration-guides/migration-6.1.rst b/documentation/migration-guides/migration-6.1.rst
index 025b8f70926c..019a3495cc76 100644
--- a/documentation/migration-guides/migration-6.1.rst
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -44,17 +44,23 @@ version 4.20. The same functionality provided by ``groupmems`` can be achieved
 with the ``usermod`` command.
 
 Assignments made to the :term:`GROUPMEMS_PARAM` variable can be converted to use
-:term:`USERMOD_PARAMS`, by replacing::
+:term:`USERMOD_PARAMS`, by replacing:
+
+.. code-block:: bitbake
 
    GROUPMEMS_PARAM:${PN} = "--add user --group group1; \
                             --add user --group group2"
 
-With::
+With:
+
+.. code-block:: bitbake
 
    USERMOD_PARAM:${PN} = "--append --groups group1 user; \
                           --append --groups group2 user"
 
-Or written more simply as::
+Or written more simply as:
+
+.. code-block:: bitbake
 
    USERMOD_PARAM:${PN} = "--append --groups group1,group2 user"
 
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index e9e694952799..683873e94c70 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -21,7 +21,9 @@ New Features / Enhancements in 4.0
   its autobuilder. If the network connection between our server and your
   machine is faster than you would build recipes from source, you can
   try to speed up your builds by using such Shared State and Hash
-  Equivalence by setting::
+  Equivalence by setting:
+
+  .. code-block:: bitbake
 
      BB_SIGNATURE_HANDLER = "OEEquivHash"
      BB_HASHSERVE = "auto"
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 76afd16e84fc..9ec3f3a0a2ad 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -45,7 +45,9 @@ New Features / Enhancements in 4.3
 
    Code can now know which layer a recipe is coming from through the newly added :term:`FILE_LAYERNAME`
    variable. This has been added as an override of the form ``layer-<layername>``. In particular,
-   this means QA checks can now be layer specific, for example::
+   this means QA checks can now be layer specific, for example:
+
+   .. code-block:: bitbake
 
       ERROR_QA:layer-core:append = " patch-status"
 
diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index b802e7c1718e..29d53df58b97 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -195,7 +195,9 @@ New Features / Enhancements in 5.0
    -  New ``inherit_defer`` statement which works as
       :ref:`inherit <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit\`\` directive>`
       does, except that it is only evaluated at the end of parsing
-      --- recommended where a conditional expression is used, e.g.::
+      --- recommended where a conditional expression is used, e.g.:
+
+      .. code-block:: bitbake
 
          inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
 
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index ee9df424ee2e..8d098cd7fec8 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -92,7 +92,9 @@ New Features / Enhancements in |yocto-ver|
          distro/...      Sets DISTRO = ...
 
       In the above example, this means that the :term:`MACHINE` of
-      :term:`DISTRO` can be overridden with::
+      :term:`DISTRO` can be overridden with:
+
+      .. code-block:: bitbake
 
          OE_FRAGMENTS += "machine/qemuarm64 distro/poky-bleeding"
 
@@ -928,7 +930,9 @@ New Features / Enhancements in |yocto-ver|
       :ref:`qa-check-pep517-backend` QA check.
 
    -  The :ref:`ref-classes-ccache` class now supports using `Ccache` for native
-      recipes when the local build configuration contains::
+      recipes when the local build configuration contains:
+
+      .. code-block:: bitbake
 
          ASSUME_PROVIDED += "ccache-native"
          HOSTTOOLS += "ccache"

