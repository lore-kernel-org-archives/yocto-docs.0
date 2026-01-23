Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8224CD74EDB
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 14:58:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69973.1769180305092072889
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 06:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1HsoDHK/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F11AB4E4221C;
	Fri, 23 Jan 2026 14:58:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C61886070A;
	Fri, 23 Jan 2026 14:58:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F9EB119A87C6;
	Fri, 23 Jan 2026 15:58:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769180302; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HB+QEY1vEk0JLQFK7OuFhFFFPVTZ3MxIhOoqviVpEXc=;
	b=1HsoDHK/bOnau1hR/3e9iLRkZfjgtVIam72X1OyexVOi/hZAC+FyfU1XYaLEe9WMdqSDYn
	dR5a1g6PZOA1p1fQ2qyMbGH9EbhseQeYdTdu80PRk/kp9wieV3kdHvqQ5rCt24wwG1zcHX
	XFyo7zaGQt1+2RSW5vptu540yWG6Q7azkY6L5GtA3weSvRZwGxdtT4lj4dvlj0aXwNsrcP
	pq8uyWDzY0n0dLRmjukL0+qIo8UHgYsPYeo9ECXtvFmi7W74UBUh5Jj1gC7+ZP6nldVaQJ
	/O6m/RgMBwPNg1th1iUE6obcBgV44wOgpfSi1KKtHnk8wKWH4vXEkiwdD7Ew2A==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/5] Redefine terms now that the Poky repository is
 obsolete
Date: Fri, 23 Jan 2026 15:58:10 +0100
Message-Id: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKMc2kC/3WNQQ7CIBBFr9KwFgPT0hRX3sO4aGGwGC0GkGia3
 l2ocdPE5cv892YmAb3FQA7VTDwmG6ybMtS7iqixny5Irc5MgIHgAA2N6O+BejQew0iVVlqARBS
 sI9l55IN9rb3T+cvhOVxRxRIpi9GG6Px7fZh42f1rJ04ZbSWvQRrN6s4cB+fizU575e6k1BP8/
 JZxYFsfsm/6RmouBmBy4y/L8gEetWgg/gAAAA==
X-Change-ID: 20251224-terms-refresh-cdcd529ee508
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KdqwD9Ij2e26Hb0zBfQdMMDHuOvzNCjgrOjBnD4g1ek=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpc4yMf5rr9mmKEEYXReEh8r6xW1CfURFxqWQ1j
 Zogc4bnxj2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXOMjAAKCRDRgEFAKaOo
 Nl/MD/0eyX/pQc53dI9veVDCVQbGd5Y2MctTzJ/upnbp4XA7nQgGuMMNjdSolKVSI0BkIDdrbt8
 HgIlL0a5RoEWKhYNUKGuk8R1JDzmIMqsd4pC4wia0YafR8CgH6XfVs+2yo9qQQrx04PwPpY5+du
 KFXPPBiR9T2tVpAdCDrFHPC8Pftsokyx9t+Pav+5bzgMX0t1A8fEuGKPThZNVzngN/quOaUXWWW
 S1FKIcHPnAO8MAt7x8hzJvK5vIEEgiOaghyrbhFfJN+zPffYNlxlc+zPD6VuDfYKyH4/IvGaMoA
 Pc/of0Cl5P9GfsDu16uLCLJSeu+5x0CEhpQaiuTgygWq7dw8r5DgK+Twq+y9HYm/VfbYv9ByEuC
 6kqxGbLA6+l/xw7srCEnuWKlvOAUpssNwHz0WNwEtsvBJ24Rk0t68vcNYEkggMmq3bCCgd1WZ52
 oWW8cmC+WWcwo8IovPe4j8uzhMTBo4cKXIGCEUgs32LWxLx9CWuWuL/ao5zPrLqq4DcDfkI73JQ
 R2x4QqDnfOlMgTMyf1cne+mYoSd+7Z9bs2zN3MvPKotgwXAYO4FhdlS3b1+sc4BvmXG5GAND19I
 lRCHo92EF1PJnzVR1tMHX8rDjt4avDKt+ly/O06emHcBz+uTIuj1VCyKXw5C5mvfB+wk5GKqu8U
 bxXuwclSo4QLNEg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8641

The Poky repository's master branch is no longer updated:
https://git.yoctoproject.org/poky/tree/README

Redefine the terms in ref-manual/terms.rst to adapt to the new
intended way to set things up, that is: either using bitbake-setup or
manually cloning the oe-core/bitbake/meta-yocto layers.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Rename "project" to "bitbake-builds"
- Apply suggestions from Quentin (thanks!)
- Link to v2: https://patch.msgid.link/20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com

Changes in v2:
- Apply suggestions from Quentin (thanks!)
- Link to v1: https://patch.msgid.link/20251224-terms-refresh-v1-0-691329fd038f@bootlin.com

---
Antonin Godard (5):
      ref-manual/terms.rst: refresh the Build Directory definition
      ref-manual/terms.rst: refresh the OpenEmbedded-Core definition
      ref-manual/terms.rst: simplify the Source Directory definition
      dev-manual/poky-manual-setup.rst: mention the Source Directory
      ref-manual/terms.rst: refresh the OpenEmbedded build system definition

 documentation/dev-manual/poky-manual-setup.rst |  11 +-
 documentation/ref-manual/terms.rst             | 143 +++++++++++--------------
 2 files changed, 74 insertions(+), 80 deletions(-)
---
base-commit: f43bb42123928181d76f81c0343ece777ac143d0
change-id: 20251224-terms-refresh-cdcd529ee508


