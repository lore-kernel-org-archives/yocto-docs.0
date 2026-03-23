Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C76EC01B4
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 08:50:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12664.1774255826028850209
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 01:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JCg09M3n;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 892021A2F8C
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F0FC5FEF6
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94B75103713F3;
	Mon, 23 Mar 2026 09:50:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774255823; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aNGSuQlzwhJupM4BGQYpQG9MuOtFSihiwhnpyC6meS0=;
	b=JCg09M3npz1xSY4gnRnbmoAVkyI9/5TIq7Vd9IBuHUAmaPud8vaCNdHIckDHe9AoeA3BQr
	wH5DcI85ngONiH21RTAMvBHdadpDBfjGKxwP43PDFWxOaqdt3WqkGK/PL2wrzjugfhn2aO
	OfW/pA5w2NREVYDEGRDv9S0phgAr3ZeS0hrAfvyo0QhPeJX0iYUFHJ/eaJ0jsLpKVbJSmD
	+kGKcltHh3vEHUS0iPX438H4xofcyCxVD34DaJRjDbrC0R9qr1mliGuDaGoaNS+Mi/zDaC
	vNfRCAfJMumF9HXdDzuhrR0F63gRqjj6Iu21u4PnZX8DsIO+ONaCzTbEOfx+Jw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Mar 2026 09:49:55 +0100
Subject: [PATCH v3 4/8] ref-manual/variables.rst: document the LTO variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-release-notes-6-0-v3-4-844ec702f95b@bootlin.com>
References: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
In-Reply-To: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=89Cb8rY5BYdYmebCuwDjgHr5FVPqETGjxWYdT3CrfdU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpwP7LrJhDgp23yVDGN1YSjSgmXcXqXV4qrETGP
 GB/IJGL1uuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCacD+ywAKCRDRgEFAKaOo
 Nk1VD/0TXrRZsoRpk2XcGq7nSJUpMeDkxft7Iiclk+iHfTMaV84ABg6v5YnBIh6LcOCy08DuGdb
 AixFsK5WsKnXxlGLHiqkV+JNbDbYwFknuFpUx5R+pXV+ScLr2p9mGOgScUaV7Gie4j9YrVMT/vP
 NzJ+O720HMJzuDw9/fXYC4lA8TeuvvBCjt1dT7uiK3Ex93A5V5mhhAIeXmxlGGD5kWdPsHrEOKv
 RMmiJVoA5Da+bxw9qVIY9ptSxVRc0MenELC6PoAcOrqlJT2HE9fAsuG646TuYXePQDcwBB2WHuy
 Sh2AYx+54JdrLmJy/NOvHvUPMolPwP+u/yodRbKuB5Qr++Wo6KnB2xXepCs62jWKH9269lNRxa9
 NqeGaez/9A3EESMv+ltVL0rQFjAqPUDl+cJpNJigE/QtqaiWYUCT8Ch37UHGJIr7gplmn+wuSkG
 Vt9ZYuLouJ+UiECPnbd+401tJ4n6cGUnoBjIROsJx7Uumuh4gQUYQ+TDnVRlGzDVz3HVTmHNn/I
 5rxtdT9qGuWGQIzut30TKLbvTnKGFClug3RKXvkRrRtxO9jIP55cy8Hv/sB/Gf4jpFv+RKL2Li7
 cg8Sf6ldAeTODs5Tm09IpGJa47Nd20IBMxPSU4Xh9YEQ5m+It1b/smDIbbtpsCFqJ1MtGEj+bQy
 8ywcst4Xnxe9Gkw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9117

Added by 228b5a91516c ("lto: Add global LTO distro policy file") in
OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 45542d715..6c779e42d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5890,6 +5890,13 @@ system and gives an overview of their function and contents.
       For the directory containing logs specific to each task, see the
       :term:`T` variable.
 
+   :term:`LTO`
+      The :term:`LTO` variable define the flags specific to the ``lto``
+      :term:`distro feature <DISTRO_FEATURES>`. The value of this variable is
+      appended to the :term:`TARGET_LDFLAGS` variable, adding `Link-Time
+      Optimisation <https://gcc.gnu.org/wiki/LinkTimeOptimization>`__ flags to
+      the linker in-use.
+
    :term:`MACHINE`
       Specifies the target device for which the image is built. You define
       :term:`MACHINE` in the ``local.conf`` file found in the

-- 
2.53.0


