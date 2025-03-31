Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B05DC3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 15:05:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.54561.1743433498430226618
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 08:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m2P9lVoV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB5EC44539;
	Mon, 31 Mar 2025 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743433497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=btYOpd2xd3rCTHBNwIDcX1fjEN4KDkoDtqBoT+oZvKE=;
	b=m2P9lVoVt6zoUV0leUPprWzhc1od74psK1tL1VdjW/twfXjlMR4WtaEBlfZkashQZyLRWa
	XnRvUhrxYfsd9SuxKxOY5CtB03Jxx4bJMPlvZRPQZSo5ikzC72zlSGsgE2XneEvaXFp92J
	R1TbmsxDYAxYGJbbglG9L3O1NkS5RKEo8SOUAoCe92gHZkN8xFMkRlZDIa8Hz0Jms+fodK
	mHrHPMF1abpHSmDNqOkd+wuLeB5nUBfutQRAcIQ9EmmJaKS/9ZIw9ZagaSLkNwD0o0MUjG
	O/IA9OyPeIPQgqKXG+R6B2ZkPPtB2qLm3KgY3fIpEHZ+d6YpEjfYi1TaGdtkvg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 31 Mar 2025 17:04:50 +0200
Subject: [PATCH v4 6/6] ref-manual/variables.rst: HOST_CC_ARCH: fix wrong
 SDK reference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-cc-vars-v4-6-2281f4c47652@bootlin.com>
References: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
In-Reply-To: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dwzfYhYXYJ2jl6x6ly/dQfuzDQyZkRRAlo7Sv3L+B1k=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn6q8W56knMzsIc5vifE3oZkeraoqFBI2kLjr6T
 u9f82buLZSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+qvFgAKCRDRgEFAKaOo
 NiySEACfc3Y2YNRKXvVH4Cnl/0ENRmfw5O4q0yn2y843sGFKNYfonAENWEOi+PPwHHaX6ptrB1O
 UDSZ+hp0JVT5zxS2bNAj9uD3fWKItj4934Gpdbhih7eWWk7cy+WsoXkg5scXMC6iyf5OhU5eSFG
 Ld3MvKMPuTW4PxjwJzv2F2xT8wWy0JSLIwrDGVgjWGrLd3MFKBjK5wMp5kyOiH5cXjFIyechpTv
 FKVB+YbWNA9yiqSkxxY3+SafrEmWngohNz8XfVxKhHAH49g+Q5K64r+VYaLQ3cq6DRjkUKLMvhU
 SrjPsQgYch9Y1SHicEEFdjy37EpAD0EGsGnM9X8Uvq3SDxM/SqsCHpJrZ+QM+pHI49bmXT7pVqS
 rx+RM5UMyH6RQA3fNc/IvSY5kCNDr1l6sm9kd1fLwtWNSI/UH40MUMksLVKi5AZpKpSRR1+edc0
 g5BHIsXmfxiXPmRN30kmIIMbbFSf2yw+q1IuJLEi3z2U6CIGjh6T+8qRGA2Ftao1O0Upzx0saBD
 MjHWLrECL8Zuni06Gbgk/LGJJTxPgnkUL4R/n4l3zHNdpYSEeUfEWTr/nhzse8SJG3TgYyWe7sV
 2LsPFiZN8ITV5kqq6Tu/ZN+KewCsdCgw4OgBhhyJ9uqMpfu4zE81ZerpR82vXIUgTr/Tio04saY
 PL3nXf84+3Dc9Bg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhv
 ghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Mar 2025 15:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6692

When building for nativesdk recipes, HOST_CC_ARCH equals SDK_CC_ARCH,
not BUILDSDK_CC_ARCH which doesn't exist.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 15e950859..0f65620a5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3725,8 +3725,7 @@ system and gives an overview of their function and contents.
       -  :term:`BUILD_CC_ARCH` when building for the build host (i.e.
          ``-native``)
 
-      -  ``BUILDSDK_CC_ARCH`` when building for an SDK (i.e.
-         ``nativesdk-``)
+      -  :term:`SDK_CC_ARCH` when building for an SDK (i.e. ``nativesdk-``)
 
    :term:`HOST_LD_ARCH`
       Specifies architecture-specific linker flags.

-- 
2.47.0


