Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37CBCDE00B
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:33:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7576.1782380028323462897
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tetzxzvq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9DAC74E408D9
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CA6C5FF03
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0141106F07AD;
	Thu, 25 Jun 2026 11:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782380026; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k7r+nDBzCiVPW0fic3g+PxGl7G4EWm+UY7Wtpitlras=;
	b=tetzxzvqdIkkybSh2a1kkrByESYMQzWXUhpE8gaZiA7Tn+fAswsXXL51i1721mlv/4KCjl
	DKS2AK12m/dJxBeE3h8dLxEkeNaEsSgVo1KTyv4FFac1BhboBKu73r+OvhqQe4Ky/lnFPZ
	M0D6CaYIiBLXof9Sz6TCwAMEDv+uUcjEpES+IPeZoskIsqZOCecKN7pssZ2qFH5u6oCJbc
	386rYElEn0NY2NfcyYMVD9Kb/Ekhf/ekko8pMdzh6/zQKprCRPwETM1Y6Ufr35qBcZKnry
	Q/2u7dCVyt1+AmOQqNdDa97UdaLWtFK5kGNWHtb5214OVGf1UN2cWBS4TAmicA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 25 Jun 2026 11:33:31 +0200
Subject: [PATCH 04/11] bsp-guide/bsp.rst: fix raspberry layer content
 example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-wic-migration-v1-4-fef8d481aecc@bootlin.com>
References: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
In-Reply-To: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4O2gJHJ5hOP2bhjmK93oQI4t7HgbH518gUfWQRnv99Y=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqPPX0xwyGM7UZASYCZYz9K+LH+pv7l+Qcu670c
 Y26RabpmZOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajz19AAKCRDRgEFAKaOo
 NihRD/0WRix+y3ArfNLXE8z1BlNcofPRLee8o5vbigJPh69tbwdOFiCFwmepQBfqtGoKgnoSp7G
 Z8C1JirNxo/H+SnBA+io8JJpQ8LHVbCunCIGVWVVVxMAcpm1LoizxarStpB/zZT8nnqajXc+142
 EZfI/SFAQZlAH/ijb2qXoVhrzk/Twyctw7v8RVIqXA+OYSIsYPoezv/6y5CIdNr/xfePcAmfhXi
 3su236I2mda/S/aYpde8wBpnLs1LX5QR3wHuQCQd22WmiU9gsCy+WxzZECfdLvHhxiz/vtU09ij
 YCOCz2Pnick0HlL2fagzo2qJZl9FDwBFQwCMo49eTQygKm8mMVfJufquuvkN9tD67q/5ubhL19D
 5hEXaY6nIrP0DqBTg8383bizGzjpspiTZT89GdKXTmqneaiUviPQNnRNZuFScYM0C8CaYzN+RoF
 Djg9NNmqVrunmBx0+CSXreNjYCi91WmAYGdbtMdKR3qWPUEJV7R4nQ25jYcPjYZ3vM/F+4K8bgC
 kj3Z1GllQJVMMKW9BLVl8jAzqs1zEBvsMFzIwR0WF7YKUljIjXAx9+f/b1xuhoB9+GKyOT2GOwI
 krgqkDOH/BOZp4cQFrCKwdUOt0bSbOv2jxlqRWJBsEsaqDwLboG+3wQji1xIpBI9CWOY8AW73f/
 3Nc4fxvkpmPoSiA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9887

The last two items were on a single line, but should be two lines.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/bsp-guide/bsp.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 4ced9665d..9cf0642d7 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -440,7 +440,8 @@ the :yocto_git:`Source Repositories <>`:
    meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer_git.bb
    meta-raspberrypi/recipes-multimedia/x264
    meta-raspberrypi/recipes-multimedia/x264/x264_git.bbappend
-   meta-raspberrypi/wic meta-raspberrypi/wic/sdimage-raspberrypi.wks
+   meta-raspberrypi/wic
+   meta-raspberrypi/wic/sdimage-raspberrypi.wks
 
 The following sections describe each part of the proposed BSP format.
 

-- 
2.54.0


