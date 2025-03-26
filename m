Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE55C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 13:21:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.22222.1742995309122656634
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 06:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F/8LD+Zx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A4ED443A7;
	Wed, 26 Mar 2025 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742995307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+bHrYLLbRlYtLhSKqX1HEiur/MxOO6T2JunHuoJlsR0=;
	b=F/8LD+ZxYXf1vmh97P4Jd3mKcxORjxFLhjj/BCyPnxAoVp7D52FLmTL7qkdnUjP8YA9LZN
	3T+LTJ4OrkQzk7sbwdFpy5sT0oh4AzjQz4hMH/evI1x+oidOtw8dO0hK6zz9u7nXcCsECF
	rtSImTyQ9FygECxuG6iKOhpuNwfJ+0LAkhkygZKPOsg0i07SNAemZdJUtsCSleJ5mx73ib
	OeJn8CZz8hEE9GLW65vrdYhNcE8ruX0IeSYANYbgOqfTQRw778MoD4aHRL5dQMAiPLYrtj
	+E675SYpq9hVsnAx+i5e/fhTeNGT87hjZK2Ao9dI08zf5g8NLwU3VZnYpbSq7Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 26 Mar 2025 14:21:42 +0100
Subject: [PATCH v2 6/6] ref-manual/variables.rst: HOST_CC_ARCH: fix wrong
 SDK reference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-cc-vars-v2-6-36b80c64c4a9@bootlin.com>
References: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
In-Reply-To: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cjHHvb93u6gS7PKhlzVHN5pQOMb5bNxecPGpXmApPwE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4/9psG89omd5BB19u07FePF6kNUb30buTC9fy
 1vm0lKPOPOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+P/aQAKCRDRgEFAKaOo
 Np6BEADMgdbJL7nEnfwkWkyz2r0+EBGo5Qo0f/9/5R7ufAq63pUL2vKSWRZdquCtbDRW6Fk5zwZ
 ko05rYyXbRlcerZ+uara1Qo3XP17PMQd740WZ27UgOtOQcoe839H6hUrsrsBSskwckRiyCWZ4zl
 g0pH/jWCKbfhB/iCn2Y/RTPUuRtjtSWxvmti4QoBKm7N6AJz3wTIS1NAAw58s10e3PESgo/ebsc
 EksKsW3dzfPCrFMiKoKVTWpyab7E37Goez/ve5MUD1RJQ75qYIxi0QbJvzEvWDhGtwmTaz2rLcL
 z/Fe191SbHRUHQ4oST3FUibsv5aMDDNVhfsAnoXmilKoNDjOldGsT8GhQNcxwrX8Crv2UVyF7kb
 hoR4KQKGBUAAyBiDtHBPV8ORlwmLK6DnMBbwYhcoe46w+AhL/T4ZNH+NNzMjMAlc8HEhdoQH1j4
 Tvm1C/vWYvHgSJK+KA9HVS+JA1QzAJ2gPjNSfURlT5IAoVGb4x2VZWAL7i105Y6QPqYeCAhGZ/g
 PXXU/Cyf2PjERQSs0m1Ywg7/ddel3C6OmO3CKEKkG+fxwGXoHXQ8EObFRL01uzwUj+qL7K/gfVE
 FUWs9+6FxwpHicZaILRavXlyeCaeNWXCbyO2aHdWj2DSjUON2clr7SO8/iu3VwHTfKOb34C8Pjx
 Blst7NTisAXwaVw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 13:21:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6640

When building for nativesdk recipes, HOST_CC_ARCH equals SDK_CC_ARCH,
not BUILDSDK_CC_ARCH which doesn't exist.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b7c5ddf1c..557c7fb92 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3671,8 +3671,7 @@ system and gives an overview of their function and contents.
       -  :term:`BUILD_CC_ARCH` when building for the build host (i.e.
          ``-native``)
 
-      -  ``BUILDSDK_CC_ARCH`` when building for an SDK (i.e.
-         ``nativesdk-``)
+      -  :term:`SDK_CC_ARCH` when building for an SDK (i.e. ``nativesdk-``)
 
    :term:`HOST_LD_ARCH`
       Specifies architecture-specific linker flags.

-- 
2.47.0


