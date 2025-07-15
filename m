Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B788C83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:51:26 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3742.1752569485049022391
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 01:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GNlkkI0L;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4736D4317D;
	Tue, 15 Jul 2025 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752569483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZmBgSa7JYhaMAoqkUQmL/2BHnU3WjgMTuvu6asPmbNI=;
	b=GNlkkI0LNPsQ9bo5HiPO/BFZX7veGbQSUXSOUeXQ5AKw3pybtafMIY0NML9UPfb3m176Cf
	BkfXlFw0bzzQkkMzY4a7CxCnZadHO71Z5nqAsy0EwTmmAbrnXF5d17u0ARb+pUKUIku0yp
	w+MMfjO/giYV0bqPMnRA2zejpQlQ6NlwFFbk9XdU4xZ/WR3irNuCWWMK2/lVkCBf+GFmGO
	LrU+dtpgtdW3oYTLN9f1FBlNV5jGoWgtfRUe7NaGRQpShX9VX3ptTGL/fi35bCLMuHa1Za
	mPZH1hxlDSXYpSAKlpnG9skJ2Ig0Zao+kyG5iYpoEddjLJO2l8ZA8XKkVSaweQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 15 Jul 2025 10:51:15 +0200
Subject: [PATCH] poky.yaml.in: increase required disk space to 140G
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-update-disk-usage-v1-1-ee95dddc838b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIIWdmgC/x2MUQqAIBAFrxL7nWChFF0l+hB91RJYuBWBdPekz
 4GZySRIDKGhypRws/AeCzR1RX51cYHiUJha3VrdNVZdR3AnVGDZ1CWuCMb30LCYYQyV7kiY+fm
 f4/S+H+NXbcRjAAAA
X-Change-ID: 20250715-update-disk-usage-4c8e0e5efe44
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kjHAG99NsQhd/o50rYsg9riR4v3i2rVsSTvEf2vGjqk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBodhaKN0W+oiiDw6iEuaiSQe79MNxNGZVdztG5M
 pgJnN2jZT2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaHYWigAKCRDRgEFAKaOo
 NhwGD/0Wszaw4LGVEWkqffhGJVucdAeMjmFez10FXy6Csh62fPRRPPP9U7oF8GGuSSPBhBdzNKF
 plK0Aiywoew3rpvfg65MLw+OvY3Fm0fSyFcNJeY0MT6xni27Isb1AwHfxULnIPLdNW6xcMcj4KE
 uGyxPEvuHLZJxEGglcxbicLQL9YuVefj9UyViVBMQJFnfls3U/clWFC33uo41L82cDT9p5fN/nA
 TsB0bmJpFrGrK7N8LGklAnfZYF1hYOjYq+7JJ1HGWMNiRNNjnL02jDZ9ajq+bWtD4MuTg1fh0GP
 kxBQheUD9I8JAvMUMH1btN8hTTGD7N3Cm/CffKxw4eNt5MfrdspD+JbIEjTT/u7Av0Qk2jOrj+j
 XaQfx5ADYZ6coLjuz9M3fjoIC2t1c+FFzReDYj0ZmtbXUzzlTyMmOWm06OCyuDSQjiauiLYMK4g
 a0Qs0jJIYTwnkRZ8USQQk9NC/8EhBbc7mU12wEXNO1Abzy2GOv0H5mJkcclrFonqd9qyL+jozb7
 vhXPlCY/urFQcidKU0OGtUApDGROQD2uvkElV9EEodfrM9wldQnlOkyRoCzcm/pRtDMGoiApEMI
 v9OdNRp4z2SA3RkEHVDvBpZwjir2v32VPjidi/DAwKOGZX9vRQsemiKx/XKXT5hmlyJgfqQmP8U
 OY9uUbQI0sxx70w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdetgffgfedvleevgfeffefhudeuhfehleffuefftedtheegvedvgfdtjeduiedtnecuffhomhgrihhnpeihrghmlhdrihhnnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhto
 hhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Jul 2025 08:51:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7332

Increase the minimum size requirement to 140G, after running a build
with distro Poky. The size after rm_work has increase of only 1G, so
leave the current value for MIN_DISK_SPACE_RM_WORK.

Also, update the comment to mention that this is for distro Poky. It was
mentioned in commit message 285ba689ce3a ("manuals: update disk space
requirements"), but not in the comment here.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index cdd78d2e5..7a19545d1 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -27,9 +27,9 @@ MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
 MIN_GCC_VERSION : "10.1"
 MIN_MAKE_VERSION : "4.0"
-# Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64), rounded up from 87
-MIN_DISK_SPACE : "90"
-# Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) with "rm_work", rounded up from 38
+# Disk space (Gbytes) needed to generate qemux86-64 core-image-sato image with poky distro on Ubuntu 22.04 (x86-64), rounded up from 133
+MIN_DISK_SPACE : "140"
+# Disk space (Gbytes) needed to generate qemux86-64 core-image-sato image with poky distro on Ubuntu 22.04 (x86-64) with "rm_work", rounded up from 39
 MIN_DISK_SPACE_RM_WORK : "40"
 # RAM (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) on a 4 core system
 MIN_RAM : "32"

---
base-commit: 576677eae6960dbc2d2ececeba0fde5bba7bb69f
change-id: 20250715-update-disk-usage-4c8e0e5efe44

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


