Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27A0E99068
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:48:19 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152536.1775814493511007500
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 02:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vPYMb0wE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 13A5EC5C1A1
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F153A603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4615D1045021D;
	Fri, 10 Apr 2026 11:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775814491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NSa9tcteaU7RFgujX0Kuz8AbousiQzR+cqoOdYRXlWM=;
	b=vPYMb0wEMSdMaSvKXbJW5KGJnpFEGn4VVCHCqPH10jOFEWDE08baoccHfH1KsoDJpjliWC
	7yX3V1uUk6XSvJujk2/0Wz+e1Shdh/HeMIsG63Cm5dAn0kKMQTOyay1d8VAkIBEZZb8GVP
	xJBDrgXQWyacZJ0gA+/KuY7/uuy1EBWQjIQed0bH8iZXMGa09P5N8NFBRVtb/A2C9tRmOl
	l8GVDb6lfz85sfGPt8eTQwGtr322VHKvH08IhnmY4oxk5QwHdXgq+cYewXKsAyweflwQQU
	Rqi8zOrnlWD7ueXsdcUerN7bB1Ve11XmgqC5uyIcrta3PapElsptv3Cbvyz+Kg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 11:48:01 +0200
Subject: [PATCH 2/5] tools/build-docs-container: add ubuntu 26.04 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-update-new-supported-releases-v1-2-fc53a1fbbdac@bootlin.com>
References: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
In-Reply-To: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=A7UE2IFPZixSdLQ1yeLTo/RFPNU+ldR4YzbbO3VRxMo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2MdYtyouJFRiYs3X88eMyxAssQI4/T2GLLJuy
 RE4fZpr9XeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadjHWAAKCRDRgEFAKaOo
 NlzjD/9cZInzxn9WouUV5oTHyf/EsMwY7sYCMF9HNejDEOggfjspsOBJalGqTnQrx8Q7Cy1RnBo
 KpsnmeBYi284C0CA9AD6xVhFuRsoUAoiQ1FJ6g8HOG27lKYZcjCEBxCKf5XH09yOGG71hN4FD/M
 GvI5Mq/Z50YLMUttgK0dg3SVXMAaC6FLEqFxWXiXYiiQx0m+la8C/nKkEoDUGGxJn7C1KFVALih
 fl6M3WSof9IGyRevjfpVzYsPnsLUP2DW9Etj/01Hy/7YAWo0cylzA5sEiLOWVXRsmn7XYh3Xcae
 IBXghe34cSY/hE0RNV6idHQBOi+gFP3ZY+rdAEu3e1FxggWlsD8FmQlsZZJuLBvWE29N04CXUep
 dFarloW/qAkN+dY5O1KDpNvmWceAM3zgbxatRPMc7QbN8hmID0PMNMMEcD+Psis4cTewbwU9keE
 5L2XkVAkfk7mFuV9Y8+WCVJtf4c1vmv5xey3PF4NBEQzpiAYwqoOIDlLv3vn7hUFrc66D4IynBS
 0hu9/onm4iGUNKAvE017DMIII9MdW3hpb0zHaPLmruckzeR+LWpLiZfex0zWlar+renk3caDVOp
 Be/vfh/yo5ShMsjvjjqlv+5m1nePhKDn7qtLFCev+7di6KP7yzeU5RyLVkxoos+H84YMvCsq8C+
 6W4wjmzEmKHIZ3A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9215

Added in meta-yocto with 49cbb01d5252 ("poky.conf: Add Ubuntu 26.04 to
the sanity tested distros list"). The current ubuntu install scripts work
fine with this version of Ubuntu.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index f2f54044c..3909839d7 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -50,6 +50,7 @@ $0 OCI_IMAGE [make arguments...]
      - ubuntu:24.04
      - ubuntu:25.04
      - ubuntu:25.10
+     - ubuntu:26.04
 
    [make arguments] is one or more argument to pass to the make command of
    documentation/Makefile, see that file for what's supported. This is typically
@@ -147,7 +148,8 @@ main ()
     "ubuntu:22.04"*|\
     "ubuntu:24.04"*|\
     "ubuntu:25.04"*|\
-    "ubuntu:25.10"*)
+    "ubuntu:25.10"*|\
+    "ubuntu:26.04"*)
       containerfile=Containerfile.ubuntu
       essential=ubuntu_essential.sh
       docs=ubuntu_docs.sh

-- 
2.53.0


