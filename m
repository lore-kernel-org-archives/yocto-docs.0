Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D814CA6CB1
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:20:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5831.1769502000811505229
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hzgimWwy;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4A8864E422CA;
	Tue, 27 Jan 2026 08:19:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2282E606F5;
	Tue, 27 Jan 2026 08:19:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35FAA119A8693;
	Tue, 27 Jan 2026 09:19:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501998; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=la4WWR+CaGbluDjsNtVOnCekxf1gugq6sG9f+o+QLhM=;
	b=hzgimWwyPXBsy2cB4Oa/r1YHoXaaunx1Jop71Ve9bHKOQ4rGiCEW13PtXuXZDoPbJxdPV5
	YjHs0viBHGp/Im2R3wkptPx2ZtJtxdm6mla2XItl51I7mkfi/u5D6Nq0fBetQPbQsZ8L3F
	gAJuN+80b8jA6jpym88P91hN1G5W9K1zisE3XdgHJjy3z6vHHgyAkdvaNvO60LMIoOFBnZ
	QS1EzGAnXeTv+S6zQJVNkhYySiDuMS5XzUXt/nQRhB4r1YLyj62DWccELa7zeKG/f0lBbp
	OPlc8YjB6v6SP8njLxRRIQCqSZI091ylzBAT5VYjA1WDq0X+y8fJVXeUZxtqvA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:48 +0100
Subject: [PATCH v2 53/56] ref-manual/yocto-project-supported-features.rst:
 remove obsolete poky repo reference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-53-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=d6JpK2mWZS4vis94xlcCx6Qi81mwK4LaVdWn8Gw94/M=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUG1V5g/xN+X+hHk2HzkIs+1hCjrXI4BeyiO
 yZyT1fiKwCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BgAKCRDRgEFAKaOo
 NnWKD/9KUdI09QS5Z/rOSRn4Qk3OY4OpghMDKpunl/dM7oiUgC4xGRjJ/dRx+5Uf02Re7xqrLUk
 +b3q+ZYD2sS57tGz5mSz+AS6b9JCUM3nfxmx6YRCRiPfZqNViIPx40JHuP6UzcWIorXWnqahT4a
 h+GU0T2Kr3MoRZk7F4Xc8fYs1mYfwAfKz8nQ6lN1nmUH+Zt0vV62bQQX9GocAQ+Ouwg83jOTYVN
 bZoSEQvgkE/ceNtEstbCk5Nrild2fUkewtTtAcsQmEDx7ZF48dTii7dSOAmaFhnLVrT85U4Y2s6
 e1pfXQ2Z3TvOrVX3HimFcth/BRyGYOkff1159PG2mprcfj6Qvn1ozlpVn33h8q96QTTWiVy4BiA
 +qFtCrqQa4VdZ0CqayEknshnXBiG/HSrg03xpqR3dU3JvED6zAhdptKQpyaxDLWiRNl30P4zksk
 Si/DMwRIQxxCij2s+y2XkAtC21yfs1srtuUS3/+tfTxyV1odSllpeKnHTFD1h+iGpcNfz+aXP/S
 rLDbRG/73jlJs7UxZEv5/U7icNbHOfmyVMjXmG8psJT7pIWIj5BTwZJ2xPYmMmgZ/Q9yjSXDy6G
 uPywwucWYF2BWwLikLNAnJk4+7CHOySMOy0G2AIwhm4OdxmBFR4g9vELGUqPyMop9WNvr400U5h
 f0D5ng/+vuYzkJg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8714

Poky -> meta-yocto link replacement.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/yocto-project-supported-features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/yocto-project-supported-features.rst b/documentation/ref-manual/yocto-project-supported-features.rst
index eeae6b24a..021fca36b 100644
--- a/documentation/ref-manual/yocto-project-supported-features.rst
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -59,7 +59,7 @@ Below is a list of primary tested features, their maintainer(s) and builder(s):
        qemuarm64-ptest,
        qemuarm64-tc,
        qemuarmv5
-   * - :yocto_git:`Beaglebone </poky/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>`
+   * - :yocto_git:`Beaglebone </meta-yocto/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>`
      - Beaglebone image and SDK build testing
      - Collective effort
      - beaglebone,

-- 
2.52.0


