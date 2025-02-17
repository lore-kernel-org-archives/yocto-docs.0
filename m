Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C25C021AF
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:50:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.53280.1739803835849569310
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oYH3iDtp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EECC4430C;
	Mon, 17 Feb 2025 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739803834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j3YNaWto5bLhsMcltGhBD7qLzSz+BUYJzE7BHm4d1Iw=;
	b=oYH3iDtp2/b8SYgcmZ9rS3XtgARKs3no/1/sirlvYo3UUlVgK5KxzOv2aI32stCbUZ+hcc
	A9+RQ8GPxbgIGpq/FwjsIHbvw4MMBvACPM3VAmvWP9BV1B5YrMkWXjDGIi4yVhqu0tdUbu
	TgfRwhivdXs69xYw3A5nb4XHUKVt8URjR1CxshjKEi8b1dwQRxWxzMDLCoJIRX2NdXrMNb
	7Aa+17lbQv9wA5cZmONCyIeqk3X09w1EGM4GLfoKJUKrth+//GrU0Zey5ucu4mChLTp2Vi
	13tnCqTMEsRXUToBiEiy6uHrsn9cyqgOHpUGpPfoU6188OzDH/rHFFa4o8TLzg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Feb 2025 15:50:21 +0100
Subject: [PATCH v3 2/6] variables.rst: add a reference to BB_CURRENT_MC
 from bbdocs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-multiconfig-doc-v3-2-027a9fb282c3@bootlin.com>
References: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
In-Reply-To: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=965;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FeqIn7kOwyf0DifXAfDMj6mUTLA65y4dbK6NE7+GkeE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBns0y5Dd7MH5zq337jtnqjxxzn74tz7gd48Rvm3
 ++0UIhgwP2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7NMuQAKCRDRgEFAKaOo
 NlX4D/9cyEnT9YKkvCKS2VTLH8jDfR3g7xFIPKemOAAtVleHV7Mz4VbNu00nMGB4svGJXoM/YcI
 2y14ov/x4XURkru4XcKf+I7gODvdfR+uaq+bF1eXilkkPGu8KkjsywcGWhxsE4ikzGPwCkilKwh
 tKAPpau6Q+mgkBk26zm6QmcB9HoAJ5VdzjCw05cAJRrb/8HmTySbs34WpjjNAyl/KTDrHuKYEkZ
 2eU3Lg3KxUCMpb+HFS0F5NoNX+4dPsc5fUjVkhd33D3r6aYJzVpnZ0huVA6+09rr/saQwdXOds2
 peQqUi++1yppOnITHJyo1CFhtd/bcB4peMZhIVKdXWG2HiqzqNDHVPv0hmkMX02zDURLNP/4ckH
 qarCYsyNeKGAijKURmew64B5kcPAYdWFnpVMM61cznU0Wzz44KT87aBVBRV1il6gN9EJROyWfv8
 0mKkl+0hnoVXci/sgTCJtGAp10xGEyMAbYhi2nhe3FM4Zz/HE8abHvszW8n7yKNrnVZsb13vRzk
 u23BOWpuRUtjIfQu1fi1LaWiy5hKYt5BVGCfF5gQN3WY1XnSY2xgZ4ozNjyPn/61k870A1ZKJ8U
 deVl8ug17pUVQ9xhRUq4HbuakUiEhQmAncxYdjn94MK+U3XK3GCCTWdyCp5wupX57KdfXksIw/M
 eC5myRzDOmyAriw==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6395

BB_CURRENT_MC is documented in the Bitbake user manual. Add a reference
to it here.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8f39d33be87c5db6688a807156540410..a402815b678c2d4eb77d4e81411d2088257eb1ce 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -390,6 +390,9 @@ system and gives an overview of their function and contents.
    :term:`BB_CURRENTTASK`
       See :term:`bitbake:BB_CURRENTTASK` in the BitBake manual.
 
+   :term:`BB_CURRENT_MC`
+      See :term:`bitbake:BB_CURRENT_MC` in the BitBake manual.
+
    :term:`BB_DEFAULT_TASK`
       See :term:`bitbake:BB_DEFAULT_TASK` in the BitBake manual.
 

-- 
2.47.0


