Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47E3E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 14:33:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.14134.1734964392953261519
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Dec 2024 06:33:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AZOibvaH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6BC720007;
	Mon, 23 Dec 2024 14:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734964391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W2RlbKilosI8428ZKOPAXE6/MIAHE29qLIoa5/9PY1E=;
	b=AZOibvaHB/5BPOL4pZdD29jhR+HHELcDPObyBb/fo816CF2im1ROgVO3n7QJo0BpQzCLdH
	wituXTRNdHMX6AMKJEKuUH5owfumhaAiDLKSXK8WoaiIMvZUyuIICFf67fZS3CkYoKjZU/
	kH9f2XaYK0/1W4vnSLqYrUWgH2exWoVKCdBGVJw36IvmLR3MAeMXAbHoKxa5mYS1LnIbLs
	PbrUpzAxr6jlGSjyjqLcf/bGJQwZl630PEfSdLgWU0dewo6zdyENjaimmrfuCm6TXzZNXu
	HqojlGA9sqJOc7g/G2yPJBoOJ2jQPDZu6Y2xP+D6EQFpn9z/YRScacDKwiYLAA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Dec 2024 15:33:06 +0100
Subject: [PATCH] contributor-guide/submit-changes.rst: suggest to remove
 the git signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-patch-no-signature-v1-1-b59c3641943f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKJ0aWcC/x3MQQqAIBBA0avErBtIU6KuEi3ERp2NhVYE4t2Tl
 m/xf4FMiSnD0hVI9HDmIzaIvgMbTPSEvDeDHKQSUo54mssGjAdm9tFcdyI0zmpSpMU0zNDCM5H
 j95+uW60f8nmL/GQAAAA=
X-Change-ID: 20241223-patch-no-signature-afc5e4e51709
To: docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jaekyu Lee <jaekyu.lee@lge.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ENhdxj16/9rgh7q9kdbSXTEPQhliyLIg7TDHVrA3Bnk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnaXSlh22B+WP4uQLAA6dTF6Svd40idr6rsw+vE
 s1JCOJEOxGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2l0pQAKCRDRgEFAKaOo
 NhujD/4xfCZ0SQOrjGsvcMQhBZTjDtr6+CaYy9K341MoM1Jo+je4xvtr3QT/KKsD+QtpPB7M+zV
 mWmvU9Dr/Ud3fSufgzdI8y13qi+IItkebE3sj09AA+WwSRkr/RLSei+u1sXSBUyXuxeoG+EJkha
 ZxS4ntsSOAbyf182JWdRH0vk04LPtbg0LIkdcq9c3NkEWA5T3OATqOA+UMbbEEtSdreze13KCmF
 6iWzL1BbxwqSnhZFtUj9anjn9xroAgcLvJFtdu3i2fUUNfkFnn2ulXOjKzFxHQLZ6Q0EINpm0ev
 BgV76sLZGCLaSiZdF0xWeB7/JEQL3VTxe34naCwuxj9VH0J9w4Ert1M82ZKSTdveV1S4Y8tbUPa
 Hp74OdygA4dx+JY0LZVfTvFCUIty6OyHXiJLFEEQk/N5gc2LAHOgEOjmWJT7XJqrBvFNlxFylhf
 oLbdifCXq3BbTTNg7TRum9FeCT4rCtiz2CbrsFoUSVN2VizEQNb77lk0aQXaPv4ljuzBQBC6+mv
 Y+U0xjEsH+DKID+Sh4NUEnO2Y0of5TVNtisivNXfemDNLawxv9K30WE55dChY8yk0SY4gjWjgTB
 Fqe1Jhe485H/b88BRZFwXOIORgQHXLxbHu1QY7Uyf0CtukPh0GNNq9WmOGJGa/v/TRFl3/AZnS6
 pYifpl1m1d3566A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Dec 2024 14:33:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6014

By default when sending patches Git adds the git version at the bottom
of the patch, which is not necessary in most cases. Suggest to remove it
when configuring Git when sending patches.

Suggested-By: Jaekyu Lee <jaekyu.lee@lge.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Following discussion on: https://lists.openembedded.org/g/openembedded-core/topic/106323318
---
 documentation/contributor-guide/submit-changes.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 7dc8da7aebccd896bcb341e515891dfef2792fa5..85ca987df219c1ffdd9f9cbe78fa34a780e17e43 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -65,6 +65,13 @@ use to identify your commits::
    git config --global user.name "Ada Lovelace"
    git config --global user.email "ada.lovelace@gmail.com"
 
+By default, Git adds a signature line at the end of patches containing the Git
+version. We suggest to remove it as it doesn't add useful information.
+
+Remove it with the following command::
+
+   git config --global format.signature ""
+
 Clone the Git repository for the component to modify
 ----------------------------------------------------
 

---
base-commit: c4bc09f61621938086be377653121d6b4e62b570
change-id: 20241223-patch-no-signature-afc5e4e51709

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


