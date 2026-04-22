Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4964BF9EDE8
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:23:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83820.1776867782656109172
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vFk9hbkq;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB7F8C5C3C8
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 235605FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0399010460BA8;
	Wed, 22 Apr 2026 16:22:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867779; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TMc9a8dtefNnWVBsijJCtM5fo5zbkPR7PLN9CdXhzzA=;
	b=vFk9hbkqoSTI9l2725jIEmviKF/68wMkEPO6D54b5mYaKUt4OpSNQDlzdcV7zES7XREBt0
	6w6uogO40KJ+OaZZWfZ4p50DjdVv07OU9BH6g9k0G+xXfoxDLGdnHYW1ujwoC1z5sF2QPP
	jP7l9dqgXKQ73fwoyIo/XKqXrXnzGNnDjNz/3rl+3zv8TvFu0Lmr38+g3Sve6xYOJ8ucS/
	gOqAZcLEZsSfsnZXoiNSrAYMPhKwZqzIGqGV0yOsaStPQVu6xysu9oBcy60N8wPldluIID
	4mzSGM/wE+rqM+xasf7b1H82QWDcoscFr7K0sidw+ZiyzG39phi4RNAhGs646w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:44 +0200
Subject: [PATCH 11/16] migration-guides/release-notes-6.0.rst: cover recent
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-11-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4017;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=oo4k6sFB1MI0qJdW2vXqypuvgGYUxz5SzC8BYHrXlmo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm5+paPKd4ABRX045DplopmUW1UekTWLyf17
 QCnc2Mlco2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZuQAKCRDRgEFAKaOo
 NmRmD/wOwtnYCEXI2W2A0dEwZp1knT2mzb0NUdXh/ME6b6PLocIZNBihvozPhDp8KLZ8VHiEK6Y
 zIddCckPRVUpUJYhQfoBd4n1sA42VESMuoAm5ugtMx9JAXxrv4FYuRFVhdy0phOBMt3kLr4sL6K
 RQbDxQC3W1yfjkoTXNEqwQABV7yvuIKPZ3aLxP9qxsDztZksaaA358UqARwAhRqElnn8cw+gIoY
 x8v57gTCo3T3pm/34xCIrdexO/onulYQCBKasf38Y715R2CkWM271h12VHpj/TXATPLkpqxdHqR
 fDVnc5Z8hWyKOgzXey7M1V1CBvEdG5vorpc1I2NP/ygkekYcdBBsYuL1qQLAJuOdbnrxAzzWxts
 GaEQZ0HwNOgdPk1bcc7mO652g61MoiYWB/tjnURUNr1xr/qIYOUyaYkcoLAmnN92T5y/ylQk1CS
 EXHErrH5wF7q8H3XzwH4x1MLJzObSR6Oci/KoKg7sbLbsaNBllGKfxQIdbr2wfaOm9AwYYu45fz
 BscpRqBerzfDluRBZ1ziYVRL58z7wBF8EgG0AeQ13Gst0eK8uy9Z82HTrb2jp+j4u4I62/VW5ES
 K3XmIgX0ICL+g2eBKyPU9Tw/hUCqCBx2GbtV7u3obqFwl1dOwSU06DUHGxwn57QrMldITM2vXoQ
 b/AYvQoOzKj5Xgg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9321

Cover changes between 00de455f8d3a ("classes/cve-check: remove class")
and 9a83f0878b6b ("busybox: fix for CVE-2026-26157, CVE-2026-26158") in
OE-Core. There were no changes to BitBake and meta-yocto since the last
update of these release notes.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-6.0.rst | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index 9d611d70a..c8b2c94cd 100644
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
@@ -297,8 +298,6 @@ New Features / Enhancements in |yocto-ver|
    -  Re-implement sector-size support
       (:oecore_rev:`b50d6debf7baa555fbfb3521c4f952675bba2d37`)
 
--  SDK-related changes:
-
 -  Testing-related changes:
 
    - :ref:`ref-classes-ptest` support was added for the following recipes:
@@ -374,6 +373,9 @@ New Features / Enhancements in |yocto-ver|
       -  Update data if CVE exists (:oecore_rev:`9ea6d9209b95f8d31975d71315fb52343e6aa729`)
       -  Validate that cve details field exists (:oecore_rev:`80ff4903ea1b839f9cd9393b314c3adfbb80b765`)
 
+   -  ``oe-pkgdata-util``: improve the ``lookup-pkg`` error message for
+      :term:`RPROVIDES` packages
+      (:oecore_rev:`46ff3a8d2c18fcba87c711bb23dbdabae20eef84`)
 
 -  BitBake changes:
 
@@ -463,8 +465,6 @@ New Features / Enhancements in |yocto-ver|
       configuration options when fetching Git repositories
       (:bitbake_rev:`4c378445969853d6aff4694d937b9af47c7f7300`)
 
--  Packaging changes:
-
 -  Clang/LLVM related changes:
 
    -  ``compiler-rt``: 
@@ -517,7 +517,6 @@ New Features / Enhancements in |yocto-ver|
       :term:`SPDX_INCLUDE_VEX` variable
       (:oecore_rev:`d999ac407c86b462134008818d5863ecb577f3c6`)
 
-
 -  ``devtool`` changes:
 
    -  ``ide-sdk``:
@@ -580,6 +579,7 @@ New Features / Enhancements in |yocto-ver|
 -  New :term:`PACKAGECONFIG` options for individual recipes:
 
    -  ``curl``: ``schannel``
+   -  ``gstreamer1.0-plugins-bad``: ``fdkaac``
    -  ``gstreamer1.0-plugins-good``: ``qt6``
    -  ``libinput``: ``lua``, ``libwacom``, ``mtdev``
    -  ``librepo``: ``sequoia``
@@ -590,6 +590,7 @@ New Features / Enhancements in |yocto-ver|
    -  ``python3``: ``freethreading`` (experimental, see
       :oecore_rev:`c56990178b31b893fbf695eaf6b67de501e9d2e9`)
    -  ``python3-cryptography``: ``legacy-openssl``
+   -  ``systemtap``: ``readline``
 
 -  systemd related changes:
 
@@ -733,6 +734,10 @@ New Features / Enhancements in |yocto-ver|
    -  :ref:`ref-classes-archiver`: Don't try to preserve all attributes when
       copying files (:oecore_rev:`6e8313688fa994c82e4c846993ed8da0d1f4db0e`)
 
+   -  :ref:`ref-classes-useradd`: allow inheriting the class with only
+      :term:`USERADD_DEPENDS` set, when a recipe only depends on users/groups
+      created by another (:oecore_rev:`09a901b9874f76e665fb4ba9e537703a792011e3`)
+
 Known Issues in |yocto-ver|
 ---------------------------
 

-- 
2.53.0


