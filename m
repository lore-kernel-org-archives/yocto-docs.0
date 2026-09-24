Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A656C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:19 +0000 (UTC)
Received: from mail-ua2-f31.google.com (mail-ua2-f31.google.com [74.125.226.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3797.1790270949965673337
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SqEbkvVD;
 spf=pass (domain: gmail.com, ip: 74.125.226.223, mailfrom: twoerner@gmail.com)
Received: by mail-ua2-f31.google.com with SMTP id a1e0cc1a2514c-97e96e461feso38213241.1
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270949; x=1790875749; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64MxxPrNvmnlVDbXMLHV2pp/Hz6Zcv3Nuc7Pln5mWmU=;
        b=SqEbkvVDbk1tDpb+WOSmDERChuXReDYpwXzfol/9HO4moSw9KNIds3+N0qGY/Qep1M
         nn6ZV/9b8IHISSLF8SGtghV9rr0RM6UR7xK5sejQMddbYutRtsGkMCzwX4v+V82Kz3qm
         xAYYETrjAx1c+SD3J3LK0tjqB4wsFXXLiJanTuhJoG7QyLGGs6eyRjkZo7kjJ45C+IgC
         kgAGM29QgbF/66S/uBpKUEziZquFTa4/Wr9wL75AIAn17f/HVJv3fiERROi0xDVIgBCz
         AlbWLQh0dNrW1M042VYTVJKqwncmpgD+xUxs+YGvlVIZuW5sJkrl7EjccsyYHVh9pWGR
         eRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270949; x=1790875749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=64MxxPrNvmnlVDbXMLHV2pp/Hz6Zcv3Nuc7Pln5mWmU=;
        b=mfISgW9D6VWScZuI7yci6iGfFoUNQPsX9nyPy4ZsKkhtm+1QpraTTOt4sA425Oi7hl
         0gzuHymEUs8BXx/7V4IhBMgCB+yxVRKYrHyjkYt+MmbTV/ftSJsqCXKtdEts02opmzM+
         vZHRgWtKCu1W2jQSE7HWC2k+QDGYswmMwv7zUgb+axvhORjqW7ALOM01iuNrSn6l2ijO
         TvSHNTCjXl1tQ3/7ihSbUlbhS7vCpoIWKE0SnZMN866O4OLu99HsNdPPsJ+zwZ4A7qpH
         oTZdzTdM/70Jdb4UNLkSIjgiVIZs8Kt6hjUgGqiBY3AH0XKp3INtVNVdhy78L3Pj/F0M
         LXOw==
X-Gm-Message-State: AFuF++n3dH8qMtQUkNa+mbXxkFliA52gyez+KWACUJaSyaRLDLkRNZ23
	yAq7btY3Rc/B0p1VCeeqTiWgLUwbc+uPthCzJ2EINM+sSpjawj+aZkeiQY1Bfw==
X-Gm-Gg: AYBFou3BUUhZrWH6dcqvR20iyHIbLbqm7mrXucgKPFXNkb+Q1Fb4lOCL/VqPL61zN66
	vzD2cYgtN9LPny/OkmvO78NIvbrSolm3AG4FETDbQK09GzaWZxLYYKBaY4q06gLnC4KWlNmM4f0
	K2G5ArMQWywbL2V8n5eXhgj7lE65b3mn7lW6q46h2w5a3UIpBp8C2idkbc6Hoa/fEnC1aC1vhYM
	LWd0i7KLjzAHqTctlXcbpel5Vh8wlU4SKroLyVx3igugqnua2qUySzgnKELOytCY2SG2hcVQg5g
	6gOeWiGntj8tKKmGdD2FVHdjzDbOi69OgG7hfyC0QjOysn2u6HT/i1FruRsgJ3gxNla+2wuA1nK
	eFI8WOee6LwgFMpUvD4v6h1pK+MzuwxYo8Ti5m5tMdc4nMnG6hctTazoqSSCqvKFzWRCoA5+D2d
	NL/ZYQsON8W6qGKvrg7j0wkGFzR/BUWpfuQTNBA/3pN7msUXSE+puAN+py3sY+ktgTmi+6XpJPs
	XonCx8Vd0gP0l/nkyKwZC3rqiZWGKSlxdiAtomA
X-Received: by 2002:a05:6102:5491:b0:7a1:f980:e93f with SMTP id ada2fe7eead31-7af1ebf59ddmr1380347137.27.1790270948647;
        Thu, 24 Sep 2026 10:29:08 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98530725838sm1797974241.0.2026.09.24.10.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:29:07 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v3 07/10] kernel-dev: give each example block one thing to hold
Date: Thu, 24 Sep 2026 13:28:50 -0400
Message-ID: <20260924172853.2665062-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924172853.2665062-1-twoerner@gmail.com>
References: <20260924172853.2665062-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:29:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10630

Several kernel metadata examples put a filename label inside the block,
and some go on to hold more than one file, in more than one language,
under a single "::". A block shaped that way is not any one language, so
it can only ever be shown unhighlighted.

Split them into a block each, dedent what is left, and move the
filename to the code-block caption, which keeps it attached to the block
it names and renders it inside the block's frame. The theme centres a
caption in italics, which reads as prose, so it is restyled to look like
the filename it is.

AI-Generated: codex/claude-opus 5 (xhigh)
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> # rST
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- none

changes in v2:
- the caption takes the theme's whole font stack; the shortened copy
  dropped Liberation Mono, which is why it rendered in a different face
---
 documentation/kernel-dev/advanced.rst         | 139 ++++++++++--------
 .../sphinx-static/theme_overrides.css         |  28 ++++
 2 files changed, 104 insertions(+), 63 deletions(-)

diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 321033b7bd49..ecd0137fa5fd 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -216,24 +216,28 @@ used with the ``linux-yocto-4.12`` kernel as defined outside of the
 recipe space (i.e. ``yocto-kernel-cache``). This Metadata consists of
 two files: ``smp.scc`` and ``smp.cfg``. You can find these files in the
 ``cfg`` directory of the ``yocto-4.12`` branch in the
-``yocto-kernel-cache`` Git repository::
+``yocto-kernel-cache`` Git repository.
+
+.. code-block::
+   :caption: cfg/smp.scc
+
+   define KFEATURE_DESCRIPTION "Enable SMP for 32 bit builds"
+   define KFEATURE_COMPATIBILITY all
 
-   cfg/smp.scc:
-      define KFEATURE_DESCRIPTION "Enable SMP for 32 bit builds"
-      define KFEATURE_COMPATIBILITY all
+   kconf hardware smp.cfg
 
-      kconf hardware smp.cfg
+.. code-block::
+   :caption: cfg/smp.cfg
 
-   cfg/smp.cfg:
-      CONFIG_SMP=y
-      CONFIG_SCHED_SMT=y
-      # Increase default NR_CPUS from 8 to 64 so that platform with
-      # more than 8 processors can be all activated at boot time
-      CONFIG_NR_CPUS=64
-      # The following is needed when setting NR_CPUS to something
-      # greater than 8 on x86 architectures, it should be automatically
-      # disregarded by Kconfig when using a different arch
-      CONFIG_X86_BIGSMP=y
+   CONFIG_SMP=y
+   CONFIG_SCHED_SMT=y
+   # Increase default NR_CPUS from 8 to 64 so that platform with
+   # more than 8 processors can be all activated at boot time
+   CONFIG_NR_CPUS=64
+   # The following is needed when setting NR_CPUS to something
+   # greater than 8 on x86 architectures, it should be automatically
+   # disregarded by Kconfig when using a different arch
+   CONFIG_X86_BIGSMP=y
 
 You can find general information on configuration
 fragment files in the ":ref:`kernel-dev/common:creating configuration fragments`" section.
@@ -278,36 +282,39 @@ kernel as defined outside of the recipe space (i.e.
 in the ``patches/build`` directory of the ``yocto-4.12`` branch in the
 ``yocto-kernel-cache`` Git repository.
 
-The following listings show the ``build.scc`` file and part of the
-``modpost-mask-trivial-warnings.patch`` file::
+.. code-block::
+   :caption: patches/build/build.scc
 
-   patches/build/build.scc:
-      patch arm-serialize-build-targets.patch
-      patch powerpc-serialize-image-targets.patch
-      patch kbuild-exclude-meta-directory-from-distclean-processi.patch
+   patch arm-serialize-build-targets.patch
+   patch powerpc-serialize-image-targets.patch
+   patch kbuild-exclude-meta-directory-from-distclean-processi.patch
 
-      # applied by kgit
-      # patch kbuild-add-meta-files-to-the-ignore-li.patch
+   # applied by kgit
+   # patch kbuild-add-meta-files-to-the-ignore-li.patch
 
-      patch modpost-mask-trivial-warnings.patch
-      patch menuconfig-check-lxdiaglog.sh-Allow-specification-of.patch
+   patch modpost-mask-trivial-warnings.patch
+   patch menuconfig-check-lxdiaglog.sh-Allow-specification-of.patch
 
-   patches/build/modpost-mask-trivial-warnings.patch:
-      From bd48931bc142bdd104668f3a062a1f22600aae61 Mon Sep 17 00:00:00 2001
-      From: Paul Gortmaker <paul.gortmaker@windriver.com>
-      Date: Sun, 25 Jan 2009 17:58:09 -0500
-      Subject: [PATCH] modpost: mask trivial warnings
+and part of the patch it names:
 
-      Newer HOSTCC will complain about various stdio fcns because
-                        .
-                        .
-                        .
-                char *dump_write = NULL, *files_source = NULL;
-                int opt;
-      --
-      2.10.1
+.. code-block::
+   :caption: patches/build/modpost-mask-trivial-warnings.patch
 
-      generated by cgit v0.10.2 at 2017-09-28 15:23:23 (GMT)
+   From bd48931bc142bdd104668f3a062a1f22600aae61 Mon Sep 17 00:00:00 2001
+   From: Paul Gortmaker <paul.gortmaker@windriver.com>
+   Date: Sun, 25 Jan 2009 17:58:09 -0500
+   Subject: [PATCH] modpost: mask trivial warnings
+
+   Newer HOSTCC will complain about various stdio fcns because
+                     .
+                     .
+                     .
+             char *dump_write = NULL, *files_source = NULL;
+             int opt;
+   --
+   2.10.1
+
+   generated by cgit v0.10.2 at 2017-09-28 15:23:23 (GMT)
 
 The description file can
 include multiple patch statements where each statement handles a single
@@ -325,16 +332,18 @@ Features
 
 Features are complex kernel Metadata types that consist of configuration
 fragments, patches, and possibly other feature description files. As an
-example, consider the following generic listing::
+example, consider the following generic listing:
+
+.. code-block::
+   :caption: features/myfeature.scc
 
-   features/myfeature.scc
-      define KFEATURE_DESCRIPTION "Enable myfeature"
+   define KFEATURE_DESCRIPTION "Enable myfeature"
 
-      patch 0001-myfeature-core.patch
-      patch 0002-myfeature-interface.patch
+   patch 0001-myfeature-core.patch
+   patch 0002-myfeature-interface.patch
 
-      include cfg/myfeature_dependency.scc
-      kconf non-hardware myfeature.cfg
+   include cfg/myfeature_dependency.scc
+   kconf non-hardware myfeature.cfg
 
 This example shows how the ``patch`` and ``kconf`` commands are used as well
 as how an additional feature description file is included with the
@@ -873,17 +882,19 @@ new branch as the :term:`KBRANCH` to use for the board as follows::
    KBRANCH = "mynewbranch"
 
 Another method is to use the ``branch`` command in the BSP
-description::
+description:
 
-   mybsp.scc:
-      define KMACHINE mybsp
-      define KTYPE standard
-      define KARCH i386
-      include standard.scc
+.. code-block::
+   :caption: mybsp.scc
 
-      branch mynewbranch
+   define KMACHINE mybsp
+   define KTYPE standard
+   define KARCH i386
+   include standard.scc
+
+   branch mynewbranch
 
-      include mybsp-hw.scc
+   include mybsp-hw.scc
 
 If you find yourself with numerous branches, you might consider using a
 hierarchical branching system similar to what the Yocto Linux Kernel Git
@@ -925,18 +936,20 @@ that have to be regularly updated. The Yocto Project Linux kernel tools
 provide for this with the ``git merge`` command.
 
 To merge a feature branch into a BSP, insert the ``git merge`` command
-after any ``branch`` commands::
+after any ``branch`` commands:
 
-   mybsp.scc:
-      define KMACHINE mybsp
-      define KTYPE standard
-      define KARCH i386
-      include standard.scc
+.. code-block::
+   :caption: mybsp.scc
+
+   define KMACHINE mybsp
+   define KTYPE standard
+   define KARCH i386
+   include standard.scc
 
-      branch mynewbranch
-      git merge myfeature
+   branch mynewbranch
+   git merge myfeature
 
-      include mybsp-hw.scc
+   include mybsp-hw.scc
 
 SCC Description File Reference
 ==============================
diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
index f9e067239b8e..3912872e1890 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -107,6 +107,34 @@ section#welcome-to-the-yocto-project-documentation p.caption {
    display: none;
 }
 
+/* A code-block caption names the file the block came from, so it
+   should read as a filename rather than as prose, and sit on the block
+   it titles rather than floating above it. */
+.rst-content .literal-block-wrapper .code-block-caption {
+    font-style: normal;
+    font-family: SFMono-Regular, Menlo, Monaco, Consolas,
+                 Liberation Mono, Courier New, Courier, monospace;
+    font-size: 80%;
+    text-align: left;
+    color: #e6edf3;
+    background: #2b3137;
+    padding: .45em .9em;
+    margin: 0;
+    line-height: 1.5;
+    border-radius: 4px 4px 0 0;
+}
+
+.rst-content .literal-block-wrapper .code-block-caption .headerlink {
+    color: #93a1ad;
+}
+
+/* No gap and no doubled border between a caption and its block. */
+.rst-content .literal-block-wrapper .code-block-caption + div[class^=highlight] {
+    margin-top: 0;
+    border-top: none;
+    border-radius: 0 0 4px 4px;
+}
+
 @media screen {
     .wy-nav-content {
        max-width: 1000px;
-- 
2.50.0.173.g8b6f19ccfc3a


