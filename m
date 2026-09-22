Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8462FC982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 02:04:04 +0000 (UTC)
Received: from mail-qk2-f17.google.com (mail-qk2-f17.google.com [74.125.230.209])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1335.1790042637827733087
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 19:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=reDKZEYX;
 spf=pass (domain: gmail.com, ip: 74.125.230.209, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f17.google.com with SMTP id af79cd13be357-93910ca5aa7so328272185a.1
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 19:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042637; x=1790647437; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V8HVBf7975paMoycrMD9huVQAUxPnIp1hMLaOh5gavQ=;
        b=reDKZEYXCwWFBxeaU8dIEGGIcluCxBwubmWFWT/xkIYyFudgFIWnomaUC1PfA2Gy+o
         bX95zPaDY+hugcuVzzERob24neU7RJpVA1bTwVaP1F+jEy0wbvWSS7jIAZAQkAxKb4YO
         c0246KVUagPFQzo0YpUqlzZnuIs6OJddnkDQUd06xM3ntFb/Lsn6ogLjdSINzSTSg7tp
         ZROqpVBdCeRxIEs4AsZgEdNBkteL4ZHRHJ77jYd2y9RLaxaUcc5izl7OBWEcoap5nPyn
         omhaatTSC5r47T5aex9MCnrvNS4VL+aYqsJz9wdrHuLEJdL4kP2gO+YIxPscg3vGwQqf
         A2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042637; x=1790647437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V8HVBf7975paMoycrMD9huVQAUxPnIp1hMLaOh5gavQ=;
        b=cec/2kZhywmOvXyOZ5Qz/ZDAgXgiQGvVepPF02n0bewcaUAbdiuw4pBsU6YQxUZw3B
         f4okF/1Y1yPUZl0mjjdWM/tSVShHlyilmqPmR2NlZ2+H9kTw+a/m2kgriTtw5sjm2EWi
         zVRaMgEPOEARRBZPkf0U/oUJI/wJHV02PXwIcSIkT6n0usnQfCMoShEH8ZL4/jnvfIeH
         kCVBmxSx4hJckNptavVRDxY55+zU7FJu2Rx3N5rMN7UoQBMxHic9VSxx/Ce+dV6Snzrc
         qzxCl1jaOxz+6MdEf51xCuWKDFjcycHA8ylv2ce47ByBUuy4nx3E0bu39muHQPefGPK1
         twQw==
X-Gm-Message-State: AFuF++muiO9FYVDB86b6LCsK1jbHOynAK6uEmbDdzeLbR9A2OB0g/1c0
	ksywfGsMm4gxFpa5YocblQuZiQj7yjZ+z6EBCxLxFY2ULteMAgH+jhmX8priAw==
X-Gm-Gg: AYBFou3FyNbuzgncI1+60DuIiNLyGpn+HNHZPnNzzk5K5Vdrd7+UHX7qULNHxqYeyGD
	gZzaghwBIUuNt06e9Kw9t+UoRdIL2JNl+X4gjJQcLCXiet0mNIWMBQvzUPmuIiPV2xa7bKvz4N1
	af0RCBfLin8PH7KPayJ8CLA8vdBQuuxlfy0vUSz3Uk5fuPDgbZCwqGAb1Ka7pTmD03Za9Q9KaoJ
	PsCK9WQZ2/MZMjBzjt7BGUtPeE+scBwYM9Uj8EPNZ/T+ZAroX0LdGPsJ8RZARPHCXrUxbMyEVBR
	nJGRiLbmyxVmcM+e/kojYUzyQONNDlldc3XC0mHXcb4Ijs9CL5Yj4DtwY4E1i9neFwNnKLcVW9v
	48pDqIt09YPrCUgKrb4CNw6LWXvUXwLAcesDUo0qAAs7vQt8QItmf0TSGPU4PF4cDr6nObicAVV
	E1siUuBMP+qvVAEfJM3KaPzaQBfKOP37PxyoZ9QhziLKNqrmeI+Q/6jW1qNL9zdNKLlDJtOqrfU
	wPIl8gDjdQU0YmZvZErS6AdbgOH9MPUB99MGtsb0r37AwFKoLM=
X-Received: by 2002:a05:620a:6501:b0:939:c3e6:86d6 with SMTP id af79cd13be357-93c15ef2ac6mr317916785a.48.1790042636675;
        Mon, 21 Sep 2026 19:03:56 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d253165sm16817185a.46.2026.09.21.19.03.55
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:03:55 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 07/10] kernel-dev: give each example block one thing to hold
Date: Mon, 21 Sep 2026 22:03:36 -0400
Message-ID: <20260922020339.481929-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922020339.481929-1-twoerner@gmail.com>
References: <20260922020339.481929-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 02:04:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10566

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
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/kernel-dev/advanced.rst         | 139 ++++++++++--------
 .../sphinx-static/theme_overrides.css         |  27 ++++
 2 files changed, 103 insertions(+), 63 deletions(-)

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
index 1a439e9faf69..d7d1c6da79b5 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -116,6 +116,33 @@ section#welcome-to-the-yocto-project-documentation p.caption {
     -ms-user-select: none;
 }
 
+/* A code-block caption names the file the block came from, so it
+   should read as a filename rather than as prose, and sit on the block
+   it titles rather than floating above it. */
+.rst-content .literal-block-wrapper .code-block-caption {
+    font-style: normal;
+    font-family: SFMono-Regular, Menlo, Monaco, Consolas, monospace;
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


