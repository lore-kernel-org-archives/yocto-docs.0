Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A787E776EC
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123208.1766593935461574240
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BG8RKtUH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F33461A23E1
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C471A6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B6CF10AB1373;
	Wed, 24 Dec 2025 17:32:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Cm9MWeGzWSVGQGms11BYPEx3F2TTwAdAAuM8wdbwZsE=;
	b=BG8RKtUHknD2eIUpo3vEKze0gqtNa8sDr7cFzSY6cgbApJxEcvZTRSS09vg6OnNav1c8EG
	/+kTy4YIT95TxqjAq4RTbuNjWH0VLVkH4UV3sZKUIWuqPDuLWjpp26//w9qLefv/QzQd/0
	bM6WzQIwoLYCbiowv3ed2mSa8y186kmhWpBhmBq4RKtB0kkOOml/tbG8KDLroMBPcoEItr
	nce3+akAcakznvuvIQ3KzatsIFnvFwldSTS5OnOcGvvlQ6NClwkt5AdpeturkSGJ9dl6/a
	kyiT5qZwGsaq6CzngPRl5fC6jj4NdXurOsHar/B1ej/iHah1qdiKrM3DfILk+w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:02 +0100
Subject: [PATCH 36/53] dev-manual/custom-distribution.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-36-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5r3QNSo5SsZMeRHR3ih1bLMXtiHP5WPc1Z7/wBgppcM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVtjjH/hzAso1Bnq+cMh7HsZ+CSdBQnRllOf
 P7qWN6mXm+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbQAKCRDRgEFAKaOo
 Nj68D/44k+rh98ujOpaxENBSQ2T9KvOul4kJHk/Wn5rGSFrZP35F/mvlcLrPYn0mme3JQXrTVo8
 MoZ8sfd3u027l2NEzRetVQ9EV7Z/iYulKNY+688uk25dutoPxd/GPy7mAa427TiHhjxDn4TA7rx
 Q2Z5xULZsJv19mTyqVfonbUYMoOuBw3ujhKCBymJmijBm1MBhd2qWVqvz0oS0XNQSf14kzdkN5z
 mav9csHE/9+kDOqzT2kmdT8Yos7R4RyvT2C7wn4KJv3/VZKQNHJ3VKDO0Ra1Q0IGy16Hwrk39Lq
 OgKSsrENqJHJQRYQzkILXqZfShUmDbtbqD/fUKVBJ+xIaqRzUUjsiFBHSEOjhDKYMJuRPxjk/33
 I9Ez08SypWZ71xzd6JEW6vAuxRK9hB35k/LONR0YvxcKwbXZvRigDX0rM3N2bqL0jlowLXqnU2V
 Di6IuKdiBx3v7PhSqAM5DhnOL7uqSNFHjyC1S6ztWjU4zwHYnm0ZdnB4zn/UFBx4DBgRzDXR93j
 XOqf021UUS3x+4HxC+rO/EewioMfe/rrA/Hsb8+MBIAqsI4rIrjk/h8S0u/CJKH1PklNrI4ZYNi
 Z5AczaY4QvWkp1tOPMJEI7LqoDwKYZ/MEQALkeupeYfw2OSvs1bR3OZiCtouRw+DdjhXbbMEGdl
 hS2ef5nrNAZzHyg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8365

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/custom-distribution.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/custom-distribution.rst b/documentation/dev-manual/custom-distribution.rst
index 55854f00e..4dafd2725 100644
--- a/documentation/dev-manual/custom-distribution.rst
+++ b/documentation/dev-manual/custom-distribution.rst
@@ -3,8 +3,10 @@
 Creating Your Own Distribution
 ******************************
 
-When you build an image using the Yocto Project and do not alter any
-distribution :term:`Metadata`, you are using the Poky distribution.
+When you build an image using the Yocto Project and follow the default setup
+showcased in :doc:`/dev-manual/start`, you are using the :term:`Poky` reference
+distribution.
+
 Poky is explicitly a *reference* distribution for testing and
 development purposes. It enables most hardware and software features
 so that they can be tested, but this also means that from a security

-- 
2.51.0


