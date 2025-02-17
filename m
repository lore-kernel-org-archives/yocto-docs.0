Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2DDC021AE
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:50:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.53281.1739803836075425259
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nBNa62FC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A283944310;
	Mon, 17 Feb 2025 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739803834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dHFuO01BdIY6SlWTUeIicxo4lkg0RFO/jg9lpgRFMW0=;
	b=nBNa62FCU5bFMzdgORK/YOUeaUSihvgjSu0i7y/AZDUUxoSZdPk5lTfQ56wUmDrNtWtnCu
	pHDB1WQHAOKEDHEY1PuHVnWM1jX+bg4CTQ0p2Pkj+K9hnTdwsQqoX9ppnsprb+gh3AYtwh
	wcUT+YYgxYyg9PqBG9hcuqZ2tltkE82gIHIHPmc54AORV5UFTvi5ywknwH2JQ24m1g2zBe
	fRqvwMxaR5WkatMAq5lV9FHctWmeHEqcALrWWE4C0kWNfMGBfJgxPAg08MpAnzKHQeAkzO
	Z7aXS1YS81SsB2YAmkd58SzWho7I+WPKCidxV3s/rlaL/0Q8ukoTxFyt9tGUZA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Feb 2025 15:50:22 +0100
Subject: [PATCH v3 3/6] migration-5.2: fix references to BB_CURRENT_MC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-multiconfig-doc-v3-3-027a9fb282c3@bootlin.com>
References: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
In-Reply-To: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ctfhHovwmVTy1vyqPgSQBMjVEIGw5D2LWPD8dlYRTRQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBns0y5QRFHhXAqXPVdyE0JIE6yQUXFpz0BjWX5m
 erMctwe8faJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7NMuQAKCRDRgEFAKaOo
 Ng1fD/4rYCX7Y9LTAxPr165LUzkfTXRiRi5Q/33OQTz/INwHXOUmZw7nx2R376rsh261mhW5CDQ
 KMW4wMKYQshdMHKXXB5w0qUZxVNNnzxY07/8h3GL99ng6hR6sIK/lSM9j0OQfOoez6HXv9xaRyk
 uA5q1/6ubVecNfwnhIzAfV+JXhmUerCfMxlhAxtABaozqoQApr4w/W5TNfF44ODqpio5mgqHxf4
 7Qwl3jTek+ZNXyK600xJC+tpp0/FJvFOaiwDfa3g9CyyjeglFWDyH6vl+0FlDlo3XVK1KSUynUY
 hJCfOhYw0WTgsaHF6myQ3Ethm4SAxjr9R+0kl+7mhvW0DWpHC1unR5UPupdz3fLpVzbi1q/DznC
 ptIOQMq6zyy3PsRCKeNwBNOjKRVbxtJXhTMLzjs4tYX5PRNHzqLRK7J2VGOSVC1Qx2kjolqenX8
 7TLV5jXwf5MMVLP9V/CGcWjDSHybhc5CaPTeBsztyVQfwYdV34SrDG0t90x4i7I7r63BRqH2++6
 nCx+gNNxFCpfm0e6q9OhYJR00fORuBMvteFmyKHYCARTdNpeEqExVbD3rOU26GPis2b5werGLXg
 eYczUkpKjxI4i6j/ANzgx6sT/cOM3IOKbCqNqBKxiF7YLWxRjOxN/fJZt5MvycFcdWXt4qBoVip
 BuaV3C2NrGFhpEw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:50:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6397

Now part of the documentation.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index de2ea773e55c972c2314d932a8c572e484c61eb9..75bc4dbc6f8bb51f2f3f6e17abcc6ac4d930ef95 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -97,12 +97,12 @@ systemd changes
 Multiconfig changes
 ~~~~~~~~~~~~~~~~~~~
 
-The value of ``BB_CURRENT_MC`` was changed from ``default`` to an empty string
+The value of :term:`BB_CURRENT_MC` was changed from ``default`` to an empty string
 for the default multiconfig configuration to avoid needing to map the values
 within BitBake. This was already not happening in some cases so this fixes
 some obscure bugs.
 
-Any logic based on ``BB_CURRENT_MC`` equalling to ``default`` by default should
+Any logic based on :term:`BB_CURRENT_MC` equalling to ``default`` by default should
 be changed to be equal to an empty string.
 
 Virtual toolchain provider changes

-- 
2.47.0


