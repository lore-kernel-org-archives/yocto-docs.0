Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFF1D6B076
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17220.1769700284332687406
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1gJ/eXak;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C695F4E4231D
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 978C9606FD;
	Thu, 29 Jan 2026 15:24:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42805119A8863;
	Thu, 29 Jan 2026 16:24:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=la4WWR+CaGbluDjsNtVOnCekxf1gugq6sG9f+o+QLhM=;
	b=1gJ/eXaks8Jp4pHlztgrfhSvxPrO5CuDXkY5o+nJQxPKru2JQTXJlO7hi3hSphjVmub4Hl
	Z3Xq+9CGdDrh7d53CQJvbh9+YmKTDb718SHEWKi1X/i7vwScZHHhrEVuHNbtoSZUY8zmBX
	P0F5s7bvhSREvxpzrXy10Hm/4Np6SwZxJNxF3sPVswCVfkv0Cv1RsiieY8uKy2DmNDIwOD
	Tez77nMfOOpkbvMaNDSkd5jyZPv47YEucri3onReHD/1Kbg93Ak9xCjzlMqaWvCPC4StiP
	wcbc3bWkX0OwgdUMunG9x8Pwu07KilPrLeRuZUDyXuw9PppfAmix3alDdYsTvA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:45 +0100
Subject: [PATCH v3 54/57] ref-manual/yocto-project-supported-features.rst:
 remove obsolete poky repo reference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-54-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=d6JpK2mWZS4vis94xlcCx6Qi81mwK4LaVdWn8Gw94/M=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uRK6PJIudwLCFrQHyAWB/lC7EGkdpgOCoJT
 Awc93SBBQ+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kQAKCRDRgEFAKaOo
 NqYYEACdTVwXatuA3i5ORd2CvDlz71KV3vc55QrEmpU9f0ULqyNMdkzmkfkqc+gclXbC2C43/xz
 iCsq/DCkQLbT4z733OOD8+nn4dEGnykSV6A8Jx9JY0I4VBAz8YiabDFIUs3T43fQoKmMOHriYcf
 jZs+6aYUFGpugt7jgwYsAezHYRBAXwtbP5OCqV4oDjOZou9v4XusYiIWfu2W6wtfM0Rb/wosx/x
 nlMCSPDyUMlGrxVhGVPkhz1Zc4aB3bWaQFCkFGAC/KfQ65oMDlUG3lzWJ34ia+PlhVCC8/ZCOBd
 DBWDccXhxyKfQzhdkTbyoEOkwaEdha15NFbW/AiDinY3czeIdIHMR6/z0ezyI8qcZYi1KqDmGAF
 MWi6E/Qij6O8OCko1PHVAxRn902js/FFSr5zzSkpBUEPyeihzmTh5nNs49aEgQMTtiHvF3PuUku
 A9gu2klug1ts2jwiSSFH9oBmC2aIEY5zEDr+O6/Vuc2/Mgbu5rgsFtD8fJz8UR5fLRyOsKqrWOd
 b3dj1xMwvYq0y5CuYLPYvnpUm/CbU3Bqnx+Z1npc/DCfX2ait/qpM+vR6/N8wWwYijfL8B4s5qx
 Jj2Qz/ZYLJC3c/rE3eS9bJJ83J8Wocgn2MgSmux6tRv0wNAatkpDpBc16GKtPnV0KARlIhrZE7f
 Us35w3PAJhcOz2w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8840

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


