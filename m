Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA57C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 08:23:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.6629.1739435004071112106
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 00:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fBAwipN9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E885204A7;
	Thu, 13 Feb 2025 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739435002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9FBA/WeryChPGUWzKtZPOzMO6SSzbhwXjILYMIx26ow=;
	b=fBAwipN9mDvY/V5B408ce5YZ5Vl/NUUIiRyTCq5x6s4DiNQvPLKFbi91d6g9eblRa55IXc
	35V9SB+fpIGYaY16+0HPKH+S+R3DMAijdJEmtRUoGOsw9uWEqYOMEPJZa2MwJjWiKzL5qV
	Cu2vb6JH/gKFAOoW6JGjm1ld+OgalUsgaV7DKua0/l2u5HXJ8jANJMxDwoLeyicNzV5qIM
	maF255MzYM2X/cCqQmABi9idMdjjiPPFgvphh53emj0xoHH4mJE5+84p2ZTs4M3w4ri/D9
	9yVnKFYvIG56YTVc4THKaxtPGzB17Gd2cq675LipCnQLAhx27S0y0u3wClN8Cw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 13 Feb 2025 09:23:18 +0100
Subject: [PATCH v2 4/6] dev-manual/multiconfig: rename to use Multiconfig
 term
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-multiconfig-doc-v2-4-f2bd35115cb7@bootlin.com>
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
In-Reply-To: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=K38vQ8GdfEPPgWAtmkQvx31l5MnTeJTeaWQOhHdFnvE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnrav4mtUq1/Ua8ubgR3SsXHjJTkdN0J/paUZLi
 b16Fkunq3SJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ62r+AAKCRDRgEFAKaOo
 NqGGD/wJyx6Rvqyx2u0EKsm9MIdc1cLhb3EXgMQPzSWWxv/Rq51N/CdUgEzklmdLBBvnPdD4gLT
 EN56YhkDKv5fXdialIPMnv18lDwFBXo00zshFXh3LNItIAMZclf3CP8Ee9nyjxppOuSnsK9pMao
 4/6VsUFssnhIyHEqfeGc4EeLtle/64JCm0hZqcENzIqMMxkLNRkJiplBfIzoo8AP6kDUHj32ueW
 RSZEzHL1C6kGmysoqLDgpbDIsHVCWoF7fdNT2U+Nik3IETAYhNC9lq93GoAFhP/bJlnDU0YPz06
 rYa24TgOAVtzRoYKfhU8QLi+ZAr8ogHrm5VeL7hErhIdGcxI+Z5p78sUwbmw1ntjxUke4djs27q
 gYY4lz7Ov/RPm1qdo2nkhXFGS87vrIXvzTg7iIpCxmb1PUSsBOuWAgkvspGJG2+WbuW9Q+5GzUH
 WCZi5g25BDJ97oT0XNbqxRnp3Jqg4u+07jvxqpIP7VFjQtaOW1oqF++xssmTDRgkdoQSJ0CI8Jf
 EEQJiTp8YsPEjjYXbI5TRFMvO979RFKFBxPPVRdm+K9YAMV3LebDH/YszY9RUvZBUm+tADA8IDr
 3B9q6HCYM2F9NT/Lxo23PTcgUx2Owa1E3lAjMUm5bamfV1P6HKReSKcHzZwJFMS3qKyKqz6Q6hl
 xPIUOFpSTaQIlew==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegiedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhv
 ghrrhihrdguvgdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Feb 2025 08:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6361

Rename this section to explicitely name the multiple configuration feature
"multiconfig".

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/multiconfig.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
index 8464f80c3..d8f6470d5 100644
--- a/documentation/dev-manual/multiconfig.rst
+++ b/documentation/dev-manual/multiconfig.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-Building Images for Multiple Targets Using Multiple Configurations
-******************************************************************
+Building Images for Multiple Targets With Multiconfig
+*****************************************************
 
 You can use a single ``bitbake`` command to build multiple images or
 packages for different targets where each image or package requires a

-- 
2.47.0


