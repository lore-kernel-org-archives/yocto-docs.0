Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B82C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:12:15 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web11.18403.1752073926386788085
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 08:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pPtI+LD+;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AEB044A0E;
	Wed,  9 Jul 2025 15:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752073924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LChE8GrxJ6u+q9ClnjqUEpyVn8v4F1FxFv16u+4BHp8=;
	b=pPtI+LD+RnckEL5VO2U4wj43KHhWy45aok+KS2LwEvFNNkYM2zTT3kHQUoBvdMha4pCgs7
	Su4XdA0VKj15vZjYEXYUOXw/+nLNoAMy0asGOMcEwkUcb2gSncjdn1DU9gPab1HipFS2IR
	QljRP/nl4KgH0T8LShNaAsasz3jf576KBknIfk3kb//tIBdIX8d9qQaJyiE0v1I1lAJL5n
	Asx69JDzovjwUYinV+1hGmix3pw9o0LIx+Dp3HRkCPQwq7jVCd1GRztVYhKxxs0z15Al7q
	npdzjutoJqyQeW+KjdpCtpH8ZIsB6WduyMX5RqHf6TwzkU45iv+O++ypdTWXJw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Jul 2025 17:11:59 +0200
Subject: [PATCH] overview-manual/concepts.rst: fix sayhello hardcoded
 bindir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-bindir-docs-v1-1-04d950c17d55@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAL+GbmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNL3aTMvJTMIt2U/ORi3USzJIMUA2MjU1NzQyWgjoKi1LTMCrBp0bG
 1tQAnPYo5XQAAAA==
X-Change-ID: 20250709-bindir-docs-a6b0d0325571
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Thomas Perrot <thomas.perrot@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zqKJYnkcfwPx+MRLPIBcRrNksx1NDMfocLuRJkMg1oU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBobobDZS/zObZYkxZN28/CsXshN1B7s8Gj3aSs2
 8I9nER1JVWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaG6GwwAKCRDRgEFAKaOo
 NmwiD/9NwawtVNq2j7bQpzVxhR6YfzNHyLIDAofkZR2UDP+JKXArgPAbzyBzvy3ieLVAmAnNPeR
 IlY4leMKMkagdUSl3/9s/1uZR0BDl3jS2WbRopyiboUHYqb6kQeH0NSLY+2SOt+kJR/lPeObsTh
 /rFe8MxczFPRxr6H6kNDzXBq/aSNKR5Hnn6LD3/AVxtgx3yGPqcYV9EFXSIlKpf2YNty9/9XUjl
 jAy/r1fYwrgChwRSDBAI0gYThsVFAV//ZJh6BHE+sEOzOiuqQwTVrztltjwVdLBYsSNf9OLrbxC
 4k+up5TqOjw2Y/fO6bxOfoqKqMTn4nHFRB6QkH7WtI/ouQ00b2/hFx2FhDH7hkY+YO/qnbZM0wA
 s+cLHH3g3OBkkgPQcqHGfHExJqCA7irzdWuGQL0V14cKepvF5XjwIVSt8P8uxplyljqFKhdudef
 bGvt3lKBTHdbBEuN3XrSNFKcvgRF5XzzMPZpE3r8N5iNCChIHkj4M8s8v4QjwIUM04Z+e2c6GLz
 rRMQ2KF3AAvWgtz3033MiC28hfiC33F85xoPuhFkXmZOA6BWTsLEBkBe5bZxvnoryWRiTnpUf7F
 Re1Lkkcd1lsygYMtF7njyDf01t/DPrzFZVJUjlF1bWTxhlOrUybKjEvdde6dWDNv1ivUo5XYb1Q
 9iNOhWNrUJcHZFg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeijeeltdeiueetffevteelueffiedvffejgfethefgheelieetheeiueeikeeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhin
 hdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 15:12:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7298

Replace the hardcoded /usr/bin by ${bindir}, as it should be.

Reported-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index b34de4d36..c61dcdde1 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -2393,8 +2393,8 @@ The contents of ``sayhello_0.1.bb`` are::
    RDEPENDS:${PN} += "libhello"
 
    do_install(){
-      install -d ${D}/usr/bin
-      install -m 0700 sayhello ${D}/usr/bin
+      install -d ${D}${bindir}
+      install -m 0700 sayhello ${D}${bindir}
    }
 
 After placing the recipes in a custom layer we can run ``bitbake sayhello``

---
base-commit: 161a8549441e8c38791ab7f63001b2a15a39d2f2
change-id: 20250709-bindir-docs-a6b0d0325571

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


