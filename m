Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821A2C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 07:56:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13189.1750146977381658976
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 00:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UphSijVL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C728442A1;
	Tue, 17 Jun 2025 07:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750146975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GYUZXQgW23Hxw4J0Xb481qAfz1CyA0j1ld8miIaCAq8=;
	b=UphSijVLoilrwzuwrI7+VfNkDJqjHgUzKH/Z2awUTP+DZbq9PXlsjFqJLpoZz37l6vMdL2
	x3eTVYAoRCeOIDE95A6VnCyQkmeRLCeZzpx4PLezy2qwCh3vvbSxN8ftz4Wda+rRroVlCe
	S0zzvyUoIzjicu8R2JTz9+TiJ/n2u4/RUrE0QZ+81Cx13kcrht5AdlnBCF8M5iYE5Ks9Kf
	Ek6R5IK/wtKqJ2+HZcxDal/Cr5xWqXZCeA1S9ElDLTnNd/HTFD93/Z7VfcdY7i73cBfs64
	Im4UUBVfwZLGsOGSHjExMLLYz03WPhNi/54ykNnL/c5vYRitLC+jUAf6sWimUw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Supported features fixups
Date: Tue, 17 Jun 2025 09:55:58 +0200
Message-Id: <20250617-supported-architectures-fixups-v1-0-e6c4d2c1cc3f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI4fUWgC/x2NQQqDMBBFryKzNhDTxqpXkS5sMtbZaJhJRAjev
 UNXj8eD/ysIMqHA1FRgPEno2FW6toGwLfsXDUV1cNZ523cvIyWlgzNGs3DYKGPIhVHMSldJivA
 YvOuf9rOOoCOJUcv/YH7f9w8fcOpwcAAAAA==
X-Change-ID: 20250617-supported-architectures-fixups-fc3852640bf9
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=636;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=bT4Cs/GQeRQWVnwCvt3zbU62PPAUbEiZIRVrTTQy8T4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoUR+ec5j0L2AQg8ICyK3xea7kANMEZskUBk6wq
 j5CF43ML4iJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaFEfngAKCRDRgEFAKaOo
 NojdEACVuEE5dr5Xc9FWh9v6okKy0aDRq+yV4knMHImb+WSTddLmr2jGATm0kQ4YITQejzbgzvm
 AbljzL8FU7SRbMNlxTRORM6eAwTJ5WofNhCXHaK7SgOKgVT6GeslydtI0HP5yZZKX3iDfxhWHru
 assq6GDLC5ETdKkI5DevGTMK9q5ja8Wr0sPQPjgQWtkzMujfgLi+VZDjttyCIq3MPWTFGpGS27m
 DVsG5teuQ2bPE3JJm/sDukNLN7zmFmPghAlaDGGehPnFehd2VxkaTpR06K1eEhov72n/EDD2C+d
 WJK3B2+PXR++9jpvWNY98BnDpNhOmZiyDZNWnzPKpqq3bxQDBIx07zhtDF7kc76bMoni4sYLQPd
 OAU6D800vGqkuG/fB5hKKUcOwk1sDCP/pYepO9vhIseMsNCF5jxoYgdHRR2Cu/UFKjkpzwO96pm
 XhTvzmhESnVMFXZZehC7zRMP8kWHQg9CCSF30kagYS9x1LiECL4v175I6YMf58Kzs9oaGBDOFHD
 SM6F2+cYmCopqYdIk4GKH2M9uf3UG4FWrHVyF8KQ6sviaktsNSLG4qbVMWLrgn6DcbY/f055N1x
 pE36K4YVuCbyQceNlnPl/feUlRwYEhAkLpQOf5Xnun4r7bI6TBOedf/YCKsBVx51PTmTHPMgOH4
 k8IwjyQZ0gSEEhw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvkeekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddvfeekffetleeuvdfghfejgeffudevgeffgffhjeetjeekvdfgueevtddujeeknecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 07:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7078

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      overview-manual/yp-intro.rst: add RISC-V to supported archs
      ref-manual/yocto-project-supported-features: move meta-exein to primary

 documentation/overview-manual/yp-intro.rst                    | 10 ++++++----
 documentation/ref-manual/yocto-project-supported-features.rst |  8 ++++----
 2 files changed, 10 insertions(+), 8 deletions(-)
---
base-commit: 8e225b2f50418f705cf467240fcc6a7546c147a1
change-id: 20250617-supported-architectures-fixups-fc3852640bf9

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


