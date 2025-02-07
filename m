Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3023BC0219F
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 16:29:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.73654.1738945738656002492
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 08:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B6YY/ZBl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1300544345;
	Fri,  7 Feb 2025 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738945737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6yL9aWywCtm6mjJMxAJU6RWzRSeuy/lAyt5VG5AFZU=;
	b=B6YY/ZBlHbNH6dEt4IvHPlNwWfZTfbC7mFrocGC3dnTwftwToz6MU/v6I6fVa8Nvd0UVEG
	bgLwcXgtKHikAzMDHLzXLoiLA8rmesoPgI+5onpE3otVM1kcJeZ0HM9oeKTxYQWe6wd8NZ
	SNkdVOmRnn8z05EHouOazezIJRcOg2YOa7F407Ix6UD+vqgpFd4lpSt2VbEaucf57C9uBB
	zvg8QH1fYR1sD8y57CBL/KHtJaZrgTNG9IFSQ5fw8eObLjHKhk/PCpDIBY/38ZAkzZ0ZmH
	nEKX57RfC6+4ocE+cx0c3ufKPYA0LMqzU/TVyu6GPZ3B6bghSW04eCz5vRcncg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 07 Feb 2025 17:28:53 +0100
Subject: [PATCH 3/6] migration-5.2: fix references to BB_CURRENT_MC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-multiconfig-doc-v1-3-f63cdab1fad9@bootlin.com>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
In-Reply-To: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=k5dWHSw5q05d/y9H0jcpGnWNPvRlGF8Y1Xvjq1F6z7U=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnpjTH0F00isGVIEJa6QIFTq5qcc58VdytGHI+p
 nawYXNRErKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6Y0xwAKCRDRgEFAKaOo
 NtvbD/wJdqLTFv71rb2HAAl8dU2XiCK1KAsepvSadlaIM+vZHVV8g3Ixj6jCRDayh1DGzKjiWek
 v6cO1DXIl70cEOYnlrAlWBha07kjOA931BtzV7V6F4+XhKbsDUWTR3kHlvZwaH+b+UGwdG/xDqz
 6OptzMWh5G33RhdVQZWQaQ1Syp5Fz3ed6ULVPXBv/1FrGrDfA7bfkTAYNFbGK9LontGddVGYBL+
 7at/RhNcDBNlOYGPS3weO/WR6aVXaQMiif4qCCH8NFHnOynTBBF5uDsBz2r2UCfP1SzWp7tBfhi
 Nej9v+iCBxP6+3Yf128bofsIijZfa6LF3JD9Sc1RJiKEQTszsmzOvmyC1avwzFxI1oKWns4f/EY
 dmbKcztG3DuOrr7Xy4fO49z/tIGRmTQTVIrfAIZx0JF8byeYOpCm3QLCXH4grdmmSj2oNXl3lPD
 OuR1PltmpSzz4nXgjLlpd06Lu50mxOUTybpynMP/13CL0LvFjVB8mISpqS79FEIi67/ilIN3mTm
 vs25Agk9sJVEPhNrbHNm1MCGxk7vFKmvOkbYmbiy3X5j/sJCFOyW+vJWyShAi7OZRLxvFoeKWf3
 5O4RTIonXL8q9bwmP//zPbU4hXT7pdNtwnNEoHI3OBWpzmAsV/kNIyChkOftUeoulptlbwAB7Zj
 23DYPS1USAed/1Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6304

Now part of the documentation.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index de2ea773e..75bc4dbc6 100644
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


