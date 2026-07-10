Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901EAC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:24:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8313.1783671845537076331
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 01:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KFEUUWRj;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: lianux.mm@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso912688a91.0
        for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 01:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783671845; x=1784276645; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XrgMET+49KlPCoUBqqsZIUvzBdGqSyocv3AMP1F3w/k=;
        b=KFEUUWRjfStqxTS0ezwF3Xz3gHjSFtk4/cfJMBsii9HEKbUjdkZHQ8EeKEucyZ7nAe
         pGeiKZNo5jvFV1sle9mo0cVKjgq0993qRZ8fZdwg9aAOIaILpyB5BasVgbNUAeuKwiDP
         HGn7yXIPRilPN11zGJPv6tJ6jgyJQF7JAGDRJ2/dE8l8+jetK7w/v2iKn/TsKIkFhzxl
         hoUoMibRl+nof3nr2oJgICLM1hMsWA0677sxh5Vt3nOY6nDL5RcoPR1FFne7UZ9MCh6m
         ImVWIieoPh2EG3DrJEw5sNqCdfkZznYrjvNTnLdiUvlI+3YRp03jPh46qbvyEKPfQ480
         bi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783671845; x=1784276645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrgMET+49KlPCoUBqqsZIUvzBdGqSyocv3AMP1F3w/k=;
        b=BM4Xo9/KjNUDyPOPGFq256ZtNOpTFZYNnj7yOM/HxI9iARsvSnKH2zPQtNqLNehvET
         /ceRfdPVuEPvvQ72IXx3yMt60Uet5SqL1Gs9wWmfQPMr5l5NL70rjMQSs82q9fj7cQtI
         AX4Fmv1wk2BiCUWmJeOfgV5Lam3uNkheVBuuk6R3uldCgSl117hQ5pr3mVhdJlfbk3EV
         VGz3c01c54RVDyVbFRMnZMGqduT6S+bah36v36alolx1tXibUeDHKz3Qyr0+zcWvM8Z6
         llen/B/dRkpGabRV9pKE/mogN0vFGqSYuLDThPRBwAEKRXQBmejeN/VDPvWS33boMAGd
         27vg==
X-Gm-Message-State: AOJu0YzJ8bX3oSxuz7NDeBUYMzs2UuM4b17Nt7RNKSNdWlb06cJf71aC
	ESd/Z/TIKFaw9t161AKSoCeuRcsaZv64wRpyMV3F//CmQLYwke3MJ2cLEO0rWlOM
X-Gm-Gg: AfdE7cmnFQ+0dv1t09Cxj6S/OpLbmL3A1GBB3qH5iH+NjjSyte4peMw1ub5y3OFHhAC
	qeddk+i+mqysiyGLw28HBsMGtNdFmJJNsPJlUZ0oUw21LywqAslGf5D9KmGE0Ev2pAW5XkFjlrK
	yCuU6w+lgf58h1jkjmWc0B3IaAwdVcRb6OIP/W6v3eMFUtEsYXShLRRzUiD8N1paixpIy8EScRK
	kwPGk1dsezl+cYQu7i+tG0Tul3dCsxR4opaWH9YE0bFUdJUcHsBHleYsO+lE/o5naQxBtf7TomO
	P91Irg6LOOIDV0CI+f/C1sLxva+xRP18OIyAoHhs/aaFLDB08mO7T+lV45C1wfbbKPr6SRtPXCg
	8Y4Fd1Ah2tK1q3F6qsMjD0GFRPGBXsTpDXv4pYkgts1wfNck/Hzi6E1iA2IHqoT7WdK/FtJsH3o
	3Fa86OvGIhSPzYqjIxWUGzVG8dXovMu7d2mw==
X-Received: by 2002:a17:90b:2701:b0:38d:a8be:a592 with SMTP id 98e67ed59e1d1-38da8bea6c9mr999316a91.19.1783671844635;
        Fri, 10 Jul 2026 01:24:04 -0700 (PDT)
Received: from localhost.localdomain ([104.28.163.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19289675eec.26.2026.07.10.01.24.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 10 Jul 2026 01:24:04 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Lian Wang <lianux.wang@processmission.com>
Subject: [docs][RESEND] fix multiple typo and grammar issues
Date: Fri, 10 Jul 2026 16:23:47 +0800
Message-ID: <20260710082347.7746-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 08:24:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10052

From: Lian Wang <lianux.wang@processmission.com>

Fix several typographical and grammatical errors across the
documentation:

- "and and" -> "and" in release-process.rst
- "for for" -> "for" in release-notes-3.4.2.rst
- "does not provides" -> "does not provide" in release-process.rst
- "to be receive" -> "to receive" in submit-changes.rst
- "overriden" -> "overridden" in release-notes-5.0.rst and
  release-notes-5.1.rst
- "now support" -> "now supports" in release-notes-5.1.rst
- "referring WORKDIR" -> "referring to WORKDIR" in release-notes-5.1.rst

Signed-off-by: Lian Wang <lianux.wang@processmission.com>
---
 documentation/contributor-guide/submit-changes.rst     | 2 +-
 documentation/migration-guides/release-notes-3.4.2.rst | 2 +-
 documentation/migration-guides/release-notes-5.0.rst   | 2 +-
 documentation/migration-guides/release-notes-5.1.rst   | 8 ++++----
 documentation/ref-manual/release-process.rst           | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 7cf23c945..ae7a097ad 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -447,7 +447,7 @@ it if you haven't done it yet.
 If you attempt to send patches to a list you haven't subscribed to, your email
 will be returned as undelivered.
 
-However, if you don't want to be receive all the messages sent to a mailing list,
+However, if you don't want to receive all the messages sent to a mailing list,
 you can set your subscription to "no email". You will still be a subscriber able
 to send messages, but you won't receive any e-mail. If people reply to your message,
 their e-mail clients will default to including your email address in the
diff --git a/documentation/migration-guides/release-notes-3.4.2.rst b/documentation/migration-guides/release-notes-3.4.2.rst
index 94dffcb79..51046b6aa 100644
--- a/documentation/migration-guides/release-notes-3.4.2.rst
+++ b/documentation/migration-guides/release-notes-3.4.2.rst
@@ -47,7 +47,7 @@ Fixes in 3.4.2
 -  icu: fix make_icudata dependencies
 -  sstate: Improve failure to obtain archive message/handling
 -  insane.bbclass: Correct package_qa_check_empty_dirs()
--  sstate: A third fix for for touching files inside pseudo
+-  sstate: A third fix for touching files inside pseudo
 -  kernel: introduce python3-dtschema-wrapper
 -  vim: upgrade to 8.2 patch 3752
 -  bootchart2: Add missing python3-math dependency
diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 31b1d3da7..908f1f6a2 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -268,7 +268,7 @@ New Features / Enhancements in 5.0
 
 -  Packaging changes:
 
-   -  ``package_rpm``: the RPM package compressor's mode can now be overriden.
+   -  ``package_rpm``: the RPM package compressor's mode can now be overridden.
 
    -  ipk packaging (using ``opkg``) now uses ``zstd`` compression instead of
       ``xz`` for better compression and performance.
diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 2f049690a..dc770ebc3 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -38,7 +38,7 @@ New Features / Enhancements in 5.1
 
 -  QEMU / ``runqemu`` changes:
 
-   -  runqemu: ``QB_DRIVE_TYPE`` now support for sd card (``/dev/mmcblk``)
+   -  runqemu: ``QB_DRIVE_TYPE`` now supports sd card (``/dev/mmcblk``)
 
    -  Trigger ``write_qemuboot_conf`` task on changes of kernel image realpath
       (:term:`KERNEL_IMAGE_NAME`).
@@ -166,7 +166,7 @@ New Features / Enhancements in 5.1
 
    -  ``fetcher2``: remote name for ``git://`` is now ``origin`` by default.
 
-   -  Codeparser now support shell substitution in quotes, for example::
+   -  Codeparser now supports shell substitution in quotes, for example::
 
          var1="$(cmd1 ...)"
 
@@ -318,7 +318,7 @@ New Features / Enhancements in 5.1
       -  ``systemd``: bpf-framework
       -  ``util-linux``: libmount-mountfd-support
 
-   -  Stop referring :term:`WORKDIR` for :term:`S` and :term:`B` and trigger
+   -  Stop referring to :term:`WORKDIR` for :term:`S` and :term:`B` and trigger
       :ref:`ref-classes-insane` errors when :term:`S` or :term:`B` are equal to
       :term:`WORKDIR`.
 
@@ -363,7 +363,7 @@ New Features / Enhancements in 5.1
       ``/etc/gitconfig`` for :ref:`ref-classes-native` recipes.
 
    -  The ``apt-native`` recipe, used to compile ``dpkg`` and handle ``deb``
-      packages, was modified to avoid files being overriden by other packages when
+      packages, was modified to avoid files being overridden by other packages when
       they share common files. Instead, prompt an error.
 
    -  The :ref:`ref-tasks-savedefconfig` was moved from the u-boot and kernel
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 17ce1753d..a7abb2fd6 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -294,7 +294,7 @@ This documentation was built for the &DISTRO_NAME; release.
    Policies on testing these layers depend on how widespread their usage is and
    determined on a case-by-case basis. You can find some :term:`Mixin` layers in the
    :yocto_git:`meta-lts-mixins </meta-lts-mixins>` repository. While the Yocto
-   Project provides hosting for those repositories, it does not provides
+   Project provides hosting for those repositories, it does not provide
    testing on them. Other :term:`Mixin` layers may be released elsewhere by the wider
    community.
 
@@ -369,7 +369,7 @@ that all of the main supposed architectures and recipes in OE-Core
 successfully build and behave properly.
 
 Various features such as ``multilib``, sub architectures (e.g. ``x32``,
-``poky-tiny``, ``musl``, ``no-x11`` and and so forth),
+``poky-tiny``, ``musl``, ``no-x11`` and so forth),
 ``bitbake-selftest``, and ``oe-selftest`` are tested as part of the QA
 process of a release. Complete testing and validation for a release
 takes the Autobuilder workers several hours.
-- 
2.55.0


