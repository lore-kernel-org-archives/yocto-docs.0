Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89ADBC531C7
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:58:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47279.1784725110905802733
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 05:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oS6MQnhL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 887B64E40ED0
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5DFC160388
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD7CF11BD3BAA;
	Wed, 22 Jul 2026 14:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784725108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/gTmnCpZaRXq55CRlfDNIDiqAN45Uk/GMTLNFeKgeD8=;
	b=oS6MQnhLKVbPp8zY/bHlpfueI7YvHGxfGEhW9eeg8AvwG+R+aN8GmbcRKVRRlFTLxFwoVX
	8TJGmLv50TJZJELADTd7nKnSUUb79i0bDcjOMUuiIvBg3ddn1p6tGKHPzv9nxBW5kBmiDo
	58kX6JtqW/Okjkv6mS2Wd7wgQ9gk3HMZ8IzQAzLPfikH9PVGN0qq4vbrmunq7pIdXlGDPA
	1n/b7DnDBqdhKoF5nf3GjGg0uvvAbrDBIQEKr751kZKv5ZPLpOy+XUCdDVKz6o/2a06RZ6
	x4POE+B9izeU6Y9tNd2BOnWVM1JIW5BUdmZshtnKpL8VQBgEcVaKfwj0Yp8pCA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Jul 2026 14:58:14 +0200
Subject: [PATCH 5/5] ref-manual/variables.rst: SSTATE_MIRRORS: link to the
 new sstate-mirrors-setup doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-sstate-mirrors-doc-v1-5-570baeb41c32@bootlin.com>
References: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
In-Reply-To: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3hBvOqt1rJo2ZKsAkDCnI2N9St2APiBz/42C4VTdf8I=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqYL5vNvH9BhpJLEERm74E43pVRzzKE7XhgB0Uu
 AYyxeKRPxiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamC+bwAKCRDRgEFAKaOo
 NoD9EACMCzmUPTK/kBuGlS91Qe6pIbZAbXQW71218AmeulduPMCo6BLeT9JKGucxX7uE3+ju217
 UjneEkFLcLP8l5/z5ImRRR6BN4KEt2CHGRw07hrTTNwn7SMKafuKWeE+7ECUpSy7NhQ/2BPhwc5
 AZfDsBYtncreUDPeQ/y4P4dh/hpHEn0SOCtHLtk9kxMi3oQcf0wXZev+fFW6DS0CvGIToWUvd1c
 nkTb7rWCwER6qPcqBDTpOgkjKTmk1paCslJgJXINoyE43imJPGcGeX2w3BHdYiW2y6/iSMV5cdn
 QXDY2zEr3N1bHCYg09+NwvqrPfm93aJ/FiqkUErFwEQoa3GnJZddyCFd9qCrS+PJDDARKP8/4V1
 zDsjxwan6GHdO15SLOlyT3CSSLplz4MhFl+rryynb0Xfff8wBZAQz1XjNwHNozFUa7X7q2/0eYT
 fD7Ikf2S2+KBchFT0Jm/ar6OSVhE38g+uS/wJpYvNzF6gc2LKWh1HtgHIScc8GQCTRpu+XsGnrM
 fA3ciN6dpoIkMcoTWqB6DOF6ZlPVQVH7CEp70pHXcL4spBxIkSHuh/5VdAo9pInvPic6PkOVORi
 HjkALrV/ISi+vnNtnkXutW22KZjwsHisT/I7UMprP+mV7mV5Wfzcm7IJoPgl4xMjyudWWmBRM/J
 trJV5+2kRMomhSA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10113

Add a link from the SSTATE_MIRRORS variable definition to our new
sstate-mirrors-setup document, which instructs how to set a basic server
along with tips on hash equivalence, etc.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3f4788648..2c1d77ec9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10110,6 +10110,10 @@ system and gives an overview of their function and contents.
       reusable in real projects building binaries optimized for a specific
       CPU family.
 
+      See the :doc:`/dev-manual/sstate-mirrors-setup` section of the Yocto
+      Project Development Tasks Manual for details on how to setup a shared
+      state mirror.
+
    :term:`SSTATE_SCAN_FILES`
       Controls the list of files the OpenEmbedded build system scans for
       hardcoded installation paths. The variable uses a space-separated

-- 
2.55.0


