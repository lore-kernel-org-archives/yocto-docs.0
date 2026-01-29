Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148A3D6B06E
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:50 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17122.1769700280485223899
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=R527RRCF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D7646C22F47
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D725E606FD;
	Thu, 29 Jan 2026 15:24:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3736119A8864;
	Thu, 29 Jan 2026 16:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ngl3kX0aVswIdBiXKRx4CGycdfS3Cfw3lji0UZHDrF4=;
	b=R527RRCF8JGrfPutFw36EPAp70A8FC2XTPF0wib4IOxAXeCzcEAQBh+3JTcLuIgDpfnlEX
	yZSTmu5xKsQnMs2giXyzM1DYlL30onf5u/oujQeMsKwxvX2JPP4uH2vi4ZEshpoRjmgUoI
	bHCAVLBW/9mkQgHy+9U7ynI24baspG5+tIAerzW/spmKW1leKeLLx8Ds6xb7HCmTKnomOi
	fcIFTw/D822iBsE5JB6IidXxyyNPaU140F1lbXFAMhc6SX9MPLdjPvh50USa4JitAJFnWD
	FkASVReJH5qi1qhsCzwRRnk8wOOCTpiPKotTuzx/amiIxBmdntRgF76I3ACDWw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:42 +0100
Subject: [PATCH v3 51/57] ref-manual/release-process.rst: remove repeated
 "in the"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-51-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+QE9UHu1IIIsP4hHOP6yClD9rS3VXtw9QSmO9+ndH9Y=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uRs75DxC/GY8BvLkhteSHNMvs1PwNiw5CdM
 kBObJFEzs2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kQAKCRDRgEFAKaOo
 NuLKD/9kOBLABI33zyXckbwYpf/AH8P06oCJwT0AQ812zrbZ9uk1oaEwoSafDnmC6mYkVHvbd2m
 5cBfwiHIB/p+mcX/kJcwBi4+MLF9iw9GxTuWA31MXCerlegPnPQyn30V57Xr7d6swLBfAyy2TLQ
 pMZwWM3PaHdlRIG8jqP1UKcKNxBpFvI9nTkMMxv6WSO3IIoYN5HFdP/nOfNLcvTQr5ZHZ/q9sRE
 I1ODGbwLF3xxQWkrcvCGMSYcajd56raX0MCZpVwnh6iu9J6LRcNl+HeQgNFR6YgPWWGJbN2wI5/
 cIBsUX8Xfemc/iTtok15MvkOKpbQjNzihK5JM9qKBZH8snlu30ZbLWYgRJNFpBwRROl4/WujG7O
 EkZQE6XW9aoSPLhxnxhrvPs755zia5wjv9V5uVzDdwCioAGittPx8cZf2EdbVlFeEntpMqiY8qP
 vHVMs2j6sQinyNLClM7bJrQ66dmJ7S/vaD/7FeMQYbp7KK4RjCs0Cr/nW4Uw8oFDGVLcOA1YyJJ
 GWMQceMDTAEEZkeSfuuVP2+sQzAJR9+u5Rq7TXTWMNY+idJXB9ITJd104pFeT0/e4UwBr0GNeFe
 hP/awCbkgcQC5iTKRJe6kZ3thZwsRNnnFhNzmzJTqBcCjMWlgF1EnaL39uSZiTTRAj0TkgASsIj
 ZK++ULoj1b7F5HA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8837

Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index a75ca52cc..a55187c14 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -234,7 +234,7 @@ The Yocto Project's main :yocto_ab:`Autobuilder <>` publicly tests each Yocto
 Project release's code in the :oe_git:`openembedded-core </openembedded-core>`,
 :yocto_git:`meta-yocto </meta-yocto>` and :oe_git:`bitbake </bitbake>` repositories. The
 testing occurs for both the current state of the "master" branch and also for
-submitted patches. Testing for submitted patches usually occurs in the
+submitted patches. Testing for submitted patches usually occurs
 in the "master-next" branch in the :oe_git:`openembedded-core
 </openembedded-core>`, :yocto_git:`meta-yocto </meta-yocto>` and
 :oe_git:`bitbake </bitbake>` repository.

-- 
2.52.0


