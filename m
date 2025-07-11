Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A770C8303C
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 08:08:46 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8738.1752221324074028650
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 01:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bvC2iw18;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FE0A433D2;
	Fri, 11 Jul 2025 08:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752221322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F9GgY7CehbdYKCHTkBkXHyqEv52nzPnVsNW5FZA6qt8=;
	b=bvC2iw18yt/AQnjVzSvXX4XYLaXqkzbEDJfJ3tIyo338Y87G0Fez5B0WM5P/cnVDThEve4
	oMzemtZ9jB3nREKgB4jiQr5Yk9X5yuNfWNm4psVAgMGua92MUNW5F4FwA9gkNY9kzOkGz/
	LNmMTajsvgSU2wkGTpQCWVewQjUI8qoY8wNgFJgKA96B/qk11m2isbKl0CO6YMJ2rHj/J3
	B4PMXvA+arOx7GMHTJkXRcdk/CUdTd9Zr71k2ERcwRAq3RkcwK9q421UHOvYroDmFwXnFY
	F3ZRjr8HR2fWT+FVGUjWZQup/1D63mGWuQyR20dKI21vqM4ZC55kETszFax+/Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Jul 2025 10:08:11 +0200
Subject: [PATCH] poky.yaml.in: increase minimum RAM from 8 to 32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-increase-minimum-ram-v1-1-2287f499498a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGrGcGgC/x3MQQqAIBBA0avIrBtQMYquEi3MppqFFiNFIN09a
 fkW/xfIJEwZBlVA6ObMR6owjYKw+7QR8lINVttWd0YjpyDkM2HkxPGKKD6iC27tyWrT+hlqegq
 t/PzbcXrfDyhNS65mAAAA
X-Change-ID: 20250710-increase-minimum-ram-4c4f8e2015ab
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fQZOXvrUl2mrbutWy/x9WGwqX/cvaqyGDMPsqyQr5Gk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBocMaJzgSfXb8MV/aVDmVAkUxK97re19NMsYeUV
 lTHw54ZktWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaHDGiQAKCRDRgEFAKaOo
 NgVhEACD/MtKmKAAff2llBEb0Kg+gGPpG40L8o8ynOZbKzmxULcxviOQ7vk7oavk9YaXe0o8x0V
 2IaLFRzDll47RipQwcwFy1Qky6VUxXO69Axtn6ReXCnynIrOfHpeA3jAfaTz/WL1JJMGdYi4KzJ
 B3DX0gnPEzT291UJPhx/ykcYuZqfnaXhpHsh01vjM+rfteirCPlnLlWeT+wTpGAS0KlL7WETpex
 5hMwsYbfxSl+05Ppi4hBIihPHU9MjKfmtYo7ZWdTQL/AI0ePvIaQqmRM1Qoh9hES2y+C1n8UDOr
 AVPDY9MUDGh8podcwdBISrZifS5Mp1fpodROS9TJprue3AAAu39AK01xBXPLX6pqoVa3DkkNOvY
 BjOs3BTkNM3ZNMIBZ41ivqvqCF4+65AmSgz9CPrnpnxckeKMCoIcO4kCPZoJPzJVsYeaP6duLsq
 hJuQPUdJI5/C9heO+Xoe59tyc2HhgU2ALVECbVAmc0f7V8HGlEQ6m0iIhpKIPINEKj5IAAMF4QE
 yW9miY+8WkLR6PMqePdLvn6La6GQv/LPP7YWIXLaI1Urbux93SUkF6phSDGW3QbwwZeassgYRAC
 Ks0Z5S6rUQl46hX52l6RzBwQqDXUyuqkCS8Je4BdB6wnTs0Im2t6iyVNX8Xy5UoWYNtX0t+jeWD
 IGQaF2StS+0Ug6g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdetgffgfedvleevgfeffefhudeuhfehleffuefftedtheegvedvgfdtjeduiedtnecuffhomhgrihhnpeihrghmlhdrihhnnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrs
 hdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 08:08:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7308

In the light of the recent LLVM addition, and other such heavier
recipes, increase the minimum RAM requirement from 8Gb to 32Gb.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 39ece05e9..cdd78d2e5 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -32,4 +32,4 @@ MIN_DISK_SPACE : "90"
 # Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) with "rm_work", rounded up from 38
 MIN_DISK_SPACE_RM_WORK : "40"
 # RAM (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) on a 4 core system
-MIN_RAM : "8"
+MIN_RAM : "32"

---
base-commit: 161a8549441e8c38791ab7f63001b2a15a39d2f2
change-id: 20250710-increase-minimum-ram-4c4f8e2015ab

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


