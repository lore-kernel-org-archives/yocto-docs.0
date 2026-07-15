Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC7CC44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 07:34:25 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1332.1784100856911062908
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 00:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fchPwQ5V;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: lianux.mm@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38511175ad3so4227278a91.2
        for <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 00:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784100856; x=1784705656; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ua9jkOy1OfZrZTQEiwatc4Ahusk+nhnib0wNn+xz9eI=;
        b=fchPwQ5VM3Zq4tp1jD8gPQEt5MeeZkuWQzsKuI0B/uX30BQm8SlTJs2jo4q8SODcck
         FZLtH6jSntnLvDdT/MkjIlrVdlw2PGBuGqjnP9CKfYKcGCfklBesHUDzZ9PBP5RkopsR
         N2frZXzO60Cd9AYe811w869tOfe1UKiEi0anfygXhhTYx4ZF7BtyLoWcbetqtWjrgEBZ
         N5+G+7zUHyDRpSKMIi0LMvzy44EI7RqSYoAyn2NdXgsa9uzM0SUAMfB56EbU3QnOWC2P
         zJ7cuLZvCCXulGUiM5F8CTZEAMrK5UUZHoYswBawMrsmfYcYfKyOoT4yNpErIVfO3TaB
         N05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784100856; x=1784705656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ua9jkOy1OfZrZTQEiwatc4Ahusk+nhnib0wNn+xz9eI=;
        b=s1Wg0gaRRor9nknm3q1teC8c7+wMroN9YfDYBSIhjnWLbYWIR2okZQCtrgDtt7G6EL
         tdcrId9AcxhaDj00vEAxtKsC49DLUq2cNhWECqWMe2aPqOmtNPVMz6T2ChRznjuEvqqi
         4viSSdSc/92SfwfDM512k2bqC6mrngkuriGBkFYmmkjQ5xhvKIz9bCaRMTzb/0OtcVIB
         wO6euCtIvSCKOBPtFs7McZjNDPiOQFIwOa/tUL9BvOx9mvdgh1Whbnl8iEXyzxDzN8kJ
         9Aq7t7yJdyVdZjnDhOhnMIIVxwQifv+rTxZ1LV9vxupVeZJfdUyXGminZFgIX7TJSQto
         u9eQ==
X-Gm-Message-State: AOJu0Yw+0U8imkBBg4XraemcN3agztLPZENl/56F5+DVGSmWq4nrSnvr
	Lrs7AlwfdVuFffxLqhDeJn3SvLTgJ0QA9ZBeyLafn/wH/n7/3UGD0QrP8G3nNmqf784=
X-Gm-Gg: AfdE7clKY06HhCQmZbfGbgjakbHTGXRBE4b7OkDFujGMJbFYnvBQDV3dSh3njrEseiN
	Jn2LBNKbB5eSMmadBNKrQi65gia5JBPJ/96+XnYbLc2fVbF7SoQrgDDV0XzfrOvR6NoLI/MDnUO
	Ypbiw44wv4HdQbdeD+RusOpozQo2XexYj4kzuCXQCz8e25UcLwUF9h9lzo4LUfEm6dyaMJ78V9Q
	sGW2u23iMF6/7lM+ghiszJrge9K606xxEFRnpsP4U0X80lYbs1V1KQNHi8GciiBI576zLDECw8C
	ty6XXBEreX4yBTdu9uUv2pUNkyZnFDJdxX3SSrQlUBayccEdqNa4XWxonY4OPkoPK6o0zbRTEB7
	DJntzLw+6T/FpjmnJJeR1y6Q21gED8Ylsmyq3eCZtrK/GC8BDA3DUQOam28lUMjVvuOT0aGmqHd
	iFVIRO0wvTfgLaAujnv/IL
X-Received: by 2002:a17:90b:180c:b0:382:1aaf:4bab with SMTP id 98e67ed59e1d1-38e1afbf612mr4251334a91.27.1784100856009;
        Wed, 15 Jul 2026 00:34:16 -0700 (PDT)
Received: from localhost.localdomain ([2605:a141:2231:7698::1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6d37sm2600023a91.2.2026.07.15.00.34.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Jul 2026 00:34:15 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
To: docs@lists.yoctoproject.org
Cc: Lian Wang <lianux.mm@gmail.com>
Subject: [PATCH] fix multiple typo and grammar issues
Date: Wed, 15 Jul 2026 15:34:00 +0800
Message-ID: <20260715073400.81081-1-lianux.wang@processmission.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 07:34:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10070

From: Lian Wang <lianux.mm@gmail.com>

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

Signed-off-by: Lian Wang <lianux.mm@gmail.com>
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


