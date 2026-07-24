Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F7FC53216
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:25:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19147.1784899512549306852
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OC1hGKFv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0F2A1A11E8
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9991E60395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F27F611C124EE;
	Fri, 24 Jul 2026 15:25:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784899510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JwOLzSqWzHZCXED23EofBbHLp2nd8u0aa47D8hkcdgY=;
	b=OC1hGKFvKGt7C6dSAFb+UEcKTdyE5bp6lbq15lNxfxvvSz2Rm3GKj/AtU+QLOk67ZBlkK3
	5pgYS6nlioHZH7DwkZyt9Kvwm7xTNLP/cW9WnNrwj8WTPdvTCM6TjBkT/mcl90zBLvdtGb
	25EdYHuvyFFxt2eX1avzhExOHxPfannoTBmHGLp6EUj1tDrOipkmNM36ceXla0r2fRedXJ
	3by9goLV9+etMvOBjkOdfG1V7nqVkCYgAB8nrU8RCZR6mHTS4ARhpSx0V3oLYyCJtcleu9
	Qceio2/LA+Zf/7ZVhVXSiChaijAv9Z2aSjvs/UHFxDeONkpH5QvyPbusm1bLrw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Jul 2026 15:24:59 +0200
Subject: [PATCH 2/9] index.rst: move the contributor guide out of the
 Manuals section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rework-welcome-page-v1-2-491772cc4b65@bootlin.com>
References: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
In-Reply-To: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=L8i0R/vbb8GS+mC+FbAL7qlOBqAbWkUIHEVRw64Rp48=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqY2ex3iKcL3SyT6fD/JP6qczNfebfa5QVxFWMK
 bt9EiSLQ3KJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamNnsQAKCRDRgEFAKaOo
 NkKMEAC12pD7i6tPzPplKpv4KgD51seaWZNc8VxcRsuMTQeewvzbPwJvO9wmXmS2aId4upSLgoy
 AzU780X0vH77boV3Dznmq4XaxPr+qJehvPSLHQ89XArVqKNICIBcSB+Xc2Z0iUNRr2rdZY47tZ3
 /hC6I1A/xAn46KoBWIdhasJm1Y6pn85Ngm+uDtp5bgjCl306G/lywDO2e9VWH204/W364ZHyHxF
 kEwt9vEIwpV19kgnykS2bms3h3oRlJZRKUy44BbO7/YV+nC/hdN0ZnwEtvOEzpBf9z1EyBYRbHn
 P30LbSfcJs+q3Z9t/0bcMgNtrpQBzqiqeEVGddCr5/YY81vdpkega9DU8fBzN5dcdIz4Tbc48zC
 WC/1NOjMllpB6K2YBBDuKLvk10yDlrmd/0WHd3s04SK+ZaZm3rNlNqIqaLseY38h5ZSHkLxWIx1
 B3I1s3xvfmZ6WBLwc4UHMDf6QUeLP5niKtEGi+z0Bg+9bQFBt+P8n/lQiuqXSzuC5XeNjYod8JV
 zq8IEK6u9BbRC/xLQjdiMTM6Zs3X57BMrQgK4r5EHXE5tFwET9ZaGjZOU2IT1qRyA7jANWwGP2Y
 7mBNKZnW8k72oBOCvsHNm+oS8cyR3skt81CXm/E6DyJkwr3X0Uuk3S/3pmicKsuQgxYJyxX6q6/
 3VAwQtf37nAD1Aw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10129

In many project, contributing sections are usually separate from the
technical documentation and put to the forefront. Let's follow this in
yocto-docs by creating a dedicated section for it on the main page.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/index.rst | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/documentation/index.rst b/documentation/index.rst
index 802f895b4..9a5a83811 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -29,6 +29,17 @@ Get started using the Yocto Project.
    Yocto Project Technical Overview <https://www.yoctoproject.org/development/technical-overview/>
    Tips and Tricks Wiki <https://wiki.yoctoproject.org/wiki/TipsAndTricks>
 
+Contributing to the Yocto Project
+=================================
+
+Guides on how to contribute to the different parts of the Yocto Project.
+
+.. toctree::
+   :maxdepth: 2
+   :caption: Contributor Guide
+
+   Contributor Guide <contributor-guide/index>
+
 Manuals
 =======
 
@@ -41,7 +52,6 @@ infrastructure.
    :caption: Manuals
 
    Overview and Concepts Manual <overview-manual/index>
-   Contributor Guide <contributor-guide/index>
    Reference Manual <ref-manual/index>
    Board Support Package (BSP) Developer's guide <bsp-guide/index>
    Development Tasks Manual <dev-manual/index>

-- 
2.55.0


