Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62485CA6CAC
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:20:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6065.1769501997892698160
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=p3qzfshM;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DF384E422CC
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33437606F5;
	Tue, 27 Jan 2026 08:19:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B666119A868C;
	Tue, 27 Jan 2026 09:19:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501995; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3kq3+hxUz9p3CM01s0RFmZ26oyNeHO2PGj/RGKNndIM=;
	b=p3qzfshMkuwPjz1y8pD3/JnM2uJnxlbEit9Xjft7/7FfjY+vRBOPxQa0pzaFMvbl0GLnQ1
	EuWTnv965zkUTDvaRlK5PHt3ow1lh4wa+9NhJxKpnSMt+5N43SODjxcfioH7XEpec3/N0e
	wP+i+Bg4yuYt5Ilbq9wom6pJdvEgqzUAyTMVaoFiokWwy0oM2XVkb3jhYo6W9y69ZgOJAD
	U9fCSXOXX1mWVrK6M+etxF1QQxgTUFQ2FDiMA4uKhKBwJONoKHnhNK5uCp0hDVWtgCeLp6
	GYPq4b5qtF6BQhMmG2+AYoSWMkgqmUsVVGRvLjfm8WVyGmzQ329Tc8n0J8eZoQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:44 +0100
Subject: [PATCH v2 49/56] ref-manual/release-process.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-49-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Wkw2SsfG2gNRHNKJEpXPri1B77tA5W47J/yvdfZmNc4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUFacE3a9Uc55C7jOh8rETXVzHeXsypGElh/
 GHTjFXRRfaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BQAKCRDRgEFAKaOo
 NjfoD/oCvHHoDqk3MQUBauWsop81xLue7dZDz7Jd0xX6HocRG+TaESRKb2+NJ7+pI3miB36aA+8
 nBNgrZvr7/Pk+7ehXSixFPg6pwnoc7mCTth7YMDc74sySKn7Z0KEns3qhJ9mUqNq6ktE0agHJkl
 puO7RytMsD/PRhOr4HK2sfwFFRJje+xcswe8TotP/S3k93vhipSpcIw/FpEvT/MX+W7nOagNwv/
 kD2DjkRATV+J6booebd0I5W2dkTxjNO9kwVLfFX5w5D7JTQ7m9XpEXtTHqwWlFyswn+0QfYtt0z
 qiDtqekV55wQQwQRoI9CNMQ9BkOQmSxJxdXMPSiVuZkVqD/MfLRzgKVfI/pxa8R6e5SujYsAzjJ
 G0nuknByvtzPX9FqRVe5qp0Mn5H6UKxuiPPaMp0SOFn9dHWztx10k0/swYqbVZElm2KnuIFE3SQ
 wf3SCxQSX38kLCJZW6VPM27ICpIvl+vR+MKOc7L0OcoBatBumpyWbtsx/1rhiz6RQur3TV9Pcbw
 XBO1uJLprZKnrPGCXXdEcYf9/38lyJm+siufLwrw9qEwhwVol8yWelPfiYjbLzqR3LCg/9dDHpF
 vcg3MtKKfxx95thsxDaRTO1b9ghk2fUiHVkjZZj0KYcDdjQhpNWsx6KmbsZSqgdWR+l7ErvALLD
 b+3GYi07QqXLbCA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8710

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 165dfb86d..a75ca52cc 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -232,10 +232,12 @@ efficiently.
 
 The Yocto Project's main :yocto_ab:`Autobuilder <>` publicly tests each Yocto
 Project release's code in the :oe_git:`openembedded-core </openembedded-core>`,
-:yocto_git:`poky </poky>` and :oe_git:`bitbake </bitbake>` repositories. The
+:yocto_git:`meta-yocto </meta-yocto>` and :oe_git:`bitbake </bitbake>` repositories. The
 testing occurs for both the current state of the "master" branch and also for
 submitted patches. Testing for submitted patches usually occurs in the
-in the "master-next" branch in the :yocto_git:`poky </poky>` repository.
+in the "master-next" branch in the :oe_git:`openembedded-core
+</openembedded-core>`, :yocto_git:`meta-yocto </meta-yocto>` and
+:oe_git:`bitbake </bitbake>` repository.
 
 .. note::
 

-- 
2.52.0


