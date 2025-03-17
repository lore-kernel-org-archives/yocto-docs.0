Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA23EC35FF9
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 16:03:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.56739.1742227418555801847
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 09:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kgio8UjL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7602442C2;
	Mon, 17 Mar 2025 16:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742227417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q7/sQFsuWoMTeeSlApZBNfiJuDmacThmPuxifftSBg4=;
	b=kgio8UjL5NwP3HeTj56O9nlJPXgOpEVdEVut8RMEdJD8QHv3weKkjv8zYHFUpIXTZ1Cizb
	ScWNZaKe5x2BvD8Gn3pDJYk6gvRtepukCqBBB15JFfMdq3+Sn3VlTqMmfv4u1vm7f6go9d
	hW/R99nBvZq2WDUipB6D+bevqHkS4Z7D2iZHlDDNz6ipMpbgJjii/eNZIR/uJfGFlUWDLg
	V+8U+w1bpwarJEHZx23XPlrDXQKcgYSeY8GxQ3tF6Q0nbugkW9oLG6VEcc7WkXjDBnzsxN
	KKjGqTwrRF8uf6V4AyMMS3nN8cJogUg1NZbZTf8UZCgBSxBkli0mLYRN018WpA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 17:03:29 +0100
Subject: [PATCH 2/4] ref-manual/variables.rst: document missing SDK_*_ARCH
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-cc-vars-v1-2-25edbadfd054@bootlin.com>
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
In-Reply-To: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=DCMW5VhBW1qZM1zF5IGcK1Q9nWjGoSoyXnjsUcS22z4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn2EfXXBXFWzq7lWRgeUUnHHy7UmYtdXlftybaO
 HJC+ISxoKiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9hH1wAKCRDRgEFAKaOo
 NkQiEAC2SX7TjqqbIU1zcCy+kyufdQYKE/nWQG2ZQDIYoBriURWX+sxnWMAZQiHVyJFVnMzESYc
 KqRx9kpQeaSruxFReAcv/wZw0tYvY5zZ4aEzcrssss8TzLTWF0BN8j1e1kHW6hsdW6XsS1p5HEJ
 1Di1eHAWaUrCABU/kSGOR3/MO7KyLYz01xzD3TtU4VnzWfo69iv1dyuJmswHCFcCxJJ+HgKqL+A
 PqCAmmC/rxtE5w/A2BpsFbMLsDVtHTz9dIw8FQGxwJpq6zyFfcRDYqEajYhJ7OnAxmqjpTaXG7o
 5NCUX/MJ8WeUBlo/op4kHhutnob1rOgTRKRu5F928RTAetw3fcBrW1torV9Eco0unG7nWVLyIyd
 +R9VvgWCqbhWSdRbiixKGlhpjVHGsq82PKQeULKiISorZlbnajuUq0F9A4688BDEdm3HeMwB6xS
 ja26kAieR6nTViqX9pANLrurk7PjVSdUIqrMPPPBpPHku8tTMUTJN98tZVWp9wFTHwDDZczw0Vg
 E0kE3n4M4b/i+G8FxJk4At7edkkvkgNYhoREK+p5PGhuDx/pOTSh4/UFwQAuQGeSC0hOsnbqXao
 x60hyJ1RzR1//Gg67ARMrxjb+gvNncM+QUtAjhVkg8t8WCxmsZ3b7/ToEH/Lo8/gfpUFf9rSZ65
 iR+I0Pm2PB48M3A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 16:03:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6580

These variables control the flags for the assembler, compiler and linker
when building for nativesdk recipes.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 24b3f7db9..4063fda8c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7793,11 +7793,21 @@ system and gives an overview of their function and contents.
 
       Only one archive type can be specified.
 
+   :term:`SDK_AS_ARCH`
+      Specifies architecture-specific assembler flags when building
+      :ref:`ref-classes-nativesdk` recipes. By default, the value of
+      :term:`SDK_AS_ARCH` equals the one of :term:`BUILD_AS_ARCH`.
+
    :term:`SDK_BUILDINFO_FILE`
       When using the :ref:`ref-classes-image-buildinfo` class,
       specifies the file in the SDK to write the build information into. The
       default value is "``/buildinfo``".
 
+   :term:`SDK_CC_ARCH`
+      Specifies the architecture-specific C compiler flags when building
+      :ref:`ref-classes-nativesdk` recipes. By default, the value of
+      :term:`SDK_CC_ARCH` equals the one of :term:`BUILD_CC_ARCH`.
+
    :term:`SDK_CUSTOM_TEMPLATECONF`
       When building the extensible SDK, if :term:`SDK_CUSTOM_TEMPLATECONF` is set to
       "1" and a ``conf/templateconf.cfg`` file exists in the :term:`Build Directory`
@@ -7879,6 +7889,11 @@ system and gives an overview of their function and contents.
       :term:`SDK_EXT_TYPE` is set to "minimal", and defaults to "1" if
       :term:`SDK_EXT_TYPE` is set to "full".
 
+   :term:`SDK_LD_ARCH`
+      Specifies architecture-specific linker flags when building
+      :ref:`ref-classes-nativesdk` recipes. By default, the value of
+      :term:`SDK_LD_ARCH` equals the one of :term:`BUILD_LD_ARCH`.
+
    :term:`SDK_NAME`
       The base name for SDK output files. The default value (as set in
       ``meta-poky/conf/distro/poky.conf``) is derived from the

-- 
2.47.0


