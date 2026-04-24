Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D68F589DF
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:29:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16369.1777019342908725577
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XKGHqaog;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 555DA4E42AE6
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D5A3604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55D111072073E;
	Fri, 24 Apr 2026 10:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fj0FZTcwhtsqvOmGWUszQVHksS1jCyoj3bjZfPG9QPI=;
	b=XKGHqaogpgQSgjW6ZPf5gWoeuHuSoO2HoI8/4NvXbKECPWgovviAimy8BF+Y0U4Dfmi3mC
	WbQfFcsE+sO9HLD0Dk2nSLg2zYmFIpJ5lUsk5mOwSEeDVLcYI/TLFFy2GERaltvJkus8Fk
	pp5VdaVNV/pmloKBGO+/Cby0NmZXhafTEgMUhb+RK6s7RR2/vcF4ETdo4Pd3/3cWkcAngr
	usaUQg3uIiOYwx7kU6vKajG50bjMWSlwIBSBQwqpSfq5Ymh2h7WB6bJP72eZrwSewjD3fG
	AWhleGYE5aLE6G80bqzDmIZ+plqRXPJNEuWvcjkYLVu+QXelyIsbOimqiZbiqQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:40 +0200
Subject: [PATCH v2 12/18] migration-guides/release-notes-6.0.rst: cover
 recent changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-12-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4642;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=CDabcsLWsozj1it/B3S7xIOTKAvJDoy6PED1ra+QdbM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym/Uey3CkJNxABa62bNPrBxIJpcRDjtkQpBn
 aTXDdtWrLmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvwAKCRDRgEFAKaOo
 NlVQEADKwuJ4DacnCvPoZkbGqvdN4GHJbLC1nCFg72M0qWXLOq1jA4Zq+j2w1FwyAGvOUJ51CwG
 EQ3A75CqvLOYPUo4Bla66rVtN310nGZQL1zp7Kx71unwK1OxXggXe+u2nYs4y5lfXb4VgcnECIB
 PktlFQ1AhgBmguzPUdRvIB/59meLQ4h1cLuHgaCvMgaux/+C3MXzkZSyaGbgc6/FSvJ//8begB5
 JkSz1ZoEOaUmBYxi7nT3zyCwuQyKBSz1bfjIVwcdfJUvQFHMTlOsJ84u2VgZZeWDxxL9SlUlqVG
 yC6dozGL6b0fRA8U4Uu1jSZMKxwiK5Yy8uN32UW5GSHsZPhnZY4Ro9F8GXwE4A5CH08HogFjaCY
 Fu6nEHK34rXFrcOg18EMiltcg9kwqC6Wmokj8tBm4+kgpJ7ChRpjcuIz0Gkbmm16zE12P3BRz5W
 55iYFJqcS2g3C7bPxGX8GuNpc2FX8473RAVfdCy2B1NyUwYm0Jy6sjCbpxgD05KlCz4UU3wmH3g
 WCxKWE80rJhjR4Wk/1H+WM5GYRy5AX4eUXSqQbOUy32H2ScqIcR+oTEsjuHFFheKSRGcvsW4Yre
 qVdtUPo14uC0d3cCj+182Y7nwO/QIB/GqFJoZiTDtgDlky+erYghNpOMmjYUiZncMXvJ86CRV80
 xoY2boYoCrLdzkA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9350

Cover changes between 00de455f8d3a ("classes/cve-check: remove class")
and 9a83f0878b6b ("busybox: fix for CVE-2026-26157, CVE-2026-26158") in
OE-Core. There were no changes to BitBake and meta-yocto since the last
update of these release notes.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-6.0.rst         | 31 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index 9d611d70a..524a1a199 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -237,8 +237,6 @@ New Features / Enhancements in |yocto-ver|
       in the default distro setup (appearing as ``nodistro`` :term:`DISTRO`)
       (:oecore_rev:`175fcf9fad699dd122680d3f6961af9bf8487046`)
 
--  Architecture-specific changes:
-
 -  QEMU / ``runqemu`` changes:
 
    -  ``qemuboot```: Make the tap interface nameserver configurable through
@@ -289,6 +287,9 @@ New Features / Enhancements in |yocto-ver|
    -  Enable dynamic LLVM linking by default
       (:oecore_rev:`d0671c3dad87a063b3a41dd07cde89b5684e692c`)
 
+   -  Enable fully static linking when :term:`TCLIBC` is set to ``musl``
+      (:oecore_rev:`75409c60e9e63fdcbb9d4f54130052991362ec08`)
+
 -  Wic Image Creator changes:
 
    -  ``wic/engine``: Fix copying directories into wic image with ``ext*``
@@ -297,7 +298,13 @@ New Features / Enhancements in |yocto-ver|
    -  Re-implement sector-size support
       (:oecore_rev:`b50d6debf7baa555fbfb3521c4f952675bba2d37`)
 
--  SDK-related changes:
+   -  The Wic tool is now maintained in a separate project, no longer part of
+      :term:`OpenEmbedded-Core (OE-Core)`: :yocto_git:`/wic/`
+
+   -  A new ``wicenv`` type can be added to :term:`IMAGE_FSTYPES` to place the
+      ``.env`` file generate by Wic in the deployment directory
+      (:term:`DEPLOY_DIR_IMAGE`)
+      (:oecore_rev:`e4d49702f21fb75444d58f419432649a04e351c9`)
 
 -  Testing-related changes:
 
@@ -374,6 +381,9 @@ New Features / Enhancements in |yocto-ver|
       -  Update data if CVE exists (:oecore_rev:`9ea6d9209b95f8d31975d71315fb52343e6aa729`)
       -  Validate that cve details field exists (:oecore_rev:`80ff4903ea1b839f9cd9393b314c3adfbb80b765`)
 
+   -  ``oe-pkgdata-util``: improve the ``lookup-pkg`` error message for
+      :term:`RPROVIDES` packages
+      (:oecore_rev:`46ff3a8d2c18fcba87c711bb23dbdabae20eef84`)
 
 -  BitBake changes:
 
@@ -463,7 +473,9 @@ New Features / Enhancements in |yocto-ver|
       configuration options when fetching Git repositories
       (:bitbake_rev:`4c378445969853d6aff4694d937b9af47c7f7300`)
 
--  Packaging changes:
+   -  When using the ``subpath`` parameter with the Git fetcher in an
+      :term:`SRC_URI`, properly make the ``HEAD`` point to the value specified
+      in :term:`SRCREV`.
 
 -  Clang/LLVM related changes:
 
@@ -517,7 +529,6 @@ New Features / Enhancements in |yocto-ver|
       :term:`SPDX_INCLUDE_VEX` variable
       (:oecore_rev:`d999ac407c86b462134008818d5863ecb577f3c6`)
 
-
 -  ``devtool`` changes:
 
    -  ``ide-sdk``:
@@ -580,6 +591,7 @@ New Features / Enhancements in |yocto-ver|
 -  New :term:`PACKAGECONFIG` options for individual recipes:
 
    -  ``curl``: ``schannel``
+   -  ``gstreamer1.0-plugins-bad``: ``fdkaac``
    -  ``gstreamer1.0-plugins-good``: ``qt6``
    -  ``libinput``: ``lua``, ``libwacom``, ``mtdev``
    -  ``librepo``: ``sequoia``
@@ -590,6 +602,8 @@ New Features / Enhancements in |yocto-ver|
    -  ``python3``: ``freethreading`` (experimental, see
       :oecore_rev:`c56990178b31b893fbf695eaf6b67de501e9d2e9`)
    -  ``python3-cryptography``: ``legacy-openssl``
+   -  ``systemd``: ``osc-context``
+   -  ``systemtap``: ``readline``
 
 -  systemd related changes:
 
@@ -733,6 +747,13 @@ New Features / Enhancements in |yocto-ver|
    -  :ref:`ref-classes-archiver`: Don't try to preserve all attributes when
       copying files (:oecore_rev:`6e8313688fa994c82e4c846993ed8da0d1f4db0e`)
 
+   -  :ref:`ref-classes-useradd`: allow inheriting the class with only
+      :term:`USERADD_DEPENDS` set, when a recipe only depends on users/groups
+      created by another (:oecore_rev:`09a901b9874f76e665fb4ba9e537703a792011e3`)
+
+   -  ``vim``: disable `GTK+3` UI by default
+      (:oecore_rev:`a07763f03d4faacca4470e4f1f80f766ed068296`)
+
 Known Issues in |yocto-ver|
 ---------------------------
 

-- 
2.53.0


