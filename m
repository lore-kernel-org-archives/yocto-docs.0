Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F3FC4453E
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:58:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47276.1784725107906307567
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 05:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yTLrMoE8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A1A864E40ECB
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76E5960388
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A312211BD3B79;
	Wed, 22 Jul 2026 14:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784725104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=jhqOZb6VV0N95DU6CLz5k2Zxr4VuqZoE55c1tQDWWhQ=;
	b=yTLrMoE8Nol/u8njmaa3ldN7rA7C+kWN5SjQRl9H5tCZ3Y/OF12bm6UeRmI5mpdFf9c42C
	qV8nkQ1szSi7ViYR1HTOVwYFYs6A6f2TfTlH5q1psXAPb5qSyIZS0baLsdMxgdbcx81gPh
	TbLnWHz2h74+yl+NsI1hP2x/dlOzhFcuGbokfh4Mc5zhyRafY7h+uXKfNC9C7iens9aMS8
	1Oc74yY+D8fJYUKI3sLIiZ+fU0At9RIOsRW9QKjD+TRa4WtfBTKPaERUcyuAXUDfLkjETW
	yW33Z4/m+pJYXKK+cK8aUkJX5yQgaqov1mh/G+nDczfC+ONdmh5JFQXbffh6Bw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/5] Add shared state mirror setup documentation
Date: Wed, 22 Jul 2026 14:58:09 +0200
Message-Id: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWTPJUH8avAphUcpUx0RqZqoxI
 dydqstv8d4KxipscGlWUH6LSV4quraBeAvLlVHmanDkzuQdoVkJhfEhqlkN5xyRXDrR0XPfHzq
 o4VM5yec3Hca/7TXdOZbvCbZtB7h3Hpx2AAAA
X-Change-ID: 20260720-sstate-mirrors-doc-02f5047e9931
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vreZVenRVI8MEgGDhYE7Sif/yxcTCpo2IQVxMqFjrX4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqYL5uj4XIR9Y6/u41bHHcX41f8taSKyXgzXO8Y
 89KAZqybneJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamC+bgAKCRDRgEFAKaOo
 NqkMD/0Sl4EDN9uJo3sIIYsNxaOd35xzxxfY5gTIO6+nFaxh6ALI8RYXLpRLYSpjchngzcAuwFm
 R7D7w4/INXXutUONb1GtBF+ZDC7cl9FGVzbo324W/db3We8svVm8v8JB1M6KdMuTGEAFZcW2GB6
 5xErR2PAF7s5DSz1wE4zuBPX2Nnsq+BPU9SsJ0TKD9M9BjUbARuV/EV3kjKtlZqVD4aYceGelme
 oOBBskDRV3LWEltA6PFEc9fZ29gWHZ8yfUhHicDyZowX9IAcl4tLj9SaWI15koAq2/ML45p4e7s
 t3g2z2NxN2r3RrYZBK9zH8cOgQLoabzNJdEm9ECWi0OkT3NeLeL/KE56buSAOVEGlvN6azK1ISk
 npS9puCz6v7ymSWWeOtz5cdU30tefMuv4SVBOKDDPn+KKGe5XFtWnIA732DdgrPziR9WyejLOgr
 Ssz7HtqdDMVSdiqiTeM0Xc8fuu77uF/kjs/EokX7KtGaYQmUuDx7IyI6iq7Qw+LFafoQvdL8znw
 nGdClgXeE38Na93QOBsPJ1zkWO1Sgw6eF5bLtwOVvYXcPBAcA/FTM+97wttQzcq/ONjXPKWHhd3
 EiGqrn7yjAuEHTZzxlTZ6UyKckXj0sc55GLpDeIV/qiJzRoa52Jxd4daNq5PIZyl1o4MtOLFKNI
 0u3406DO6cXlMvQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10108

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (5):
      dev-manual: add a shared state mirror setup document
      ref-manual/variables.rst: SSTATE_MIRRORS: remove uninative mapping note
      ref-manual/variables.rst: SSTATE_MIRRORS: remove directory structure note
      ref-manual/variables.rst: SSTATE_MIRRORS: move password note to shared state mirror document
      ref-manual/variables.rst: SSTATE_MIRRORS: link to the new sstate-mirrors-setup doc

 documentation/dev-manual/index.rst                |   1 +
 documentation/dev-manual/sstate-mirrors-setup.rst | 194 ++++++++++++++++++++++
 documentation/ref-manual/variables.rst            |  51 +-----
 3 files changed, 199 insertions(+), 47 deletions(-)
---
base-commit: 358519ca6406a89fee42c45dcaf63a37a374f33c
change-id: 20260720-sstate-mirrors-doc-02f5047e9931


