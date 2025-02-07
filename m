Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC890C02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 08:28:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.65035.1738916888410889582
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 00:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZDCpGD4J;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05AD54430D;
	Fri,  7 Feb 2025 08:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738916887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dE3KAD6LqmRDWKBbYNPjV94UoNAiA00Y2/TmDNtoxV4=;
	b=ZDCpGD4JD4aHkCrvZBAPFum4Zzpz6SRdJqMMtkxCHHjjKv/IdzMesiDGtYtpWgbJ8E0zA4
	tUz+A8Clff0Ko/AtQATHpygBZv5ncFMJZZMDuGWF/QwPsxUZXDXNZS00cAuOl/ZWTb5f+k
	yaCgJVjxDq5s7Rg/Ji1/PBk8+WaJAqLUNUiqs8S6qCBD/ddNQUwbQ4EWmzE2iCmNonCf7I
	aZF9zory9Am49TDPdddGVyJHWQ7liaA2wUBFltHBgWBO4cFQObXVo1mZcd3GOpahWKVoag
	KLgUZO+4vSbUGKLGrXM/IJ2Lwwjg6Hk+tHpCDZdZHX1ea61EVGPIPkJJaXi8Tg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 07 Feb 2025 09:27:44 +0100
Subject: [PATCH v3 2/2] migration-5.2: add virtual provider change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-migration-5-2-updates-v3-2-9571efbb1cd0@bootlin.com>
References: <20250207-migration-5-2-updates-v3-0-9571efbb1cd0@bootlin.com>
In-Reply-To: <20250207-migration-5-2-updates-v3-0-9571efbb1cd0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2797;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=NyWpJZrZkxaBQckrIXIRTyPbXNikjZBopSLvj1h/Hjg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnpcQWHd1v77oy0WXU7wqdvLJmh0/9l7sb56o5q
 bv5XOVsSIWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6XEFgAKCRDRgEFAKaOo
 Nna9D/4hyJwuOsA0HswOahxSkrWYHlwQbF6kJthvcAsGW2buvAQqQAARUfK2iI4b5OwwEinuvw9
 DFjjkdFHkhueI6oLwQFwg1EuBbnDgdJeaNzpd5ADNrSsNK7xyyGAl+RjDyDrtx3Ibmry9TgBI0y
 uLJ6bKO81m/xCHYzjQwf5e08xqMOdRsqhSubAWCJweZjJ9ecNHdBoTsPaxVneASw01uucs6AWsk
 r6U0GgwGUTw+h++llWZy1o/1kRkT4ZZkCdM2lMVLfiD0sBQkruVQeaIlzE2pMPzAfHUGhgYVGwn
 23PKJd+A8w/+qJ7agPCRwX6aLK1AmLgP7vESbj9cuFVSej7kCfmVT2WsYmLPTExWcfZT2QR8Egf
 0UqHeo4calFqtcFn0oTFgaSi09nU4trgEAUXC6duydB0PTZTRpoxInULHdAYX8dAATHtfN33l1m
 M3qMDJr2wmbDK8XNQ2dJItJaQJ55ONy8bU7apF5z+dzxPyNhtaMr6Rh4r6+ZjxVinGoKy83MDjS
 jR8KF5VlSPsmYJGKrI587oa3fbW85aEp/+ichP0jppyjQCcKQaxoKPo+tALJ8qiSkuePQt/KmSW
 Bm+DV/XaHo173F+8TEK8S57tYqu7iEdWSVfmnHgyhH+tAMc3tyoCV9hhjFh3/IIYyk9rnqSoYe/
 0YDFIsR6R1o9fgA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 08:28:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6272

The commit 4ccc3bc8266c ("classes/recipes: Switch virtual/XXX-gcc to
virtual/cross-cc (and c++/binutils)") in OE-Core changes the
virtual/XXX-gcc to virtual/cross-cc (and c++/binutils) syntax. Add it to
the migration manual.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index a60e3e9a8..2e9095bfb 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -105,6 +105,41 @@ some obscure bugs.
 Any logic based on ``BB_CURRENT_MC`` equalling to ``default`` by default should
 be changed to be equal to an empty string.
 
+Virtual toolchain provider changes
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Support was added for virtual providers on a per-recipe basis for specific
+key toolchain providers listed in ``BB_VIRTUAL_RECIPE_PROVIDERS``. As part of
+that support, the ``cross`` providers were simplified to remove the triplet
+prefix (:term:`TARGET_PREFIX`, :term:`SDK_PREFIX` and :term:`HOST_PREFIX`) and
+generalise the naming. Here are example of how references to these variables
+can be changed to use the new ``cross`` syntax::
+
+   virtual/${HOST_PREFIX}binutils -> virtual/cross-binutils
+   virtual/${TARGET_PREFIX}binutils -> virtual/cross-binutils
+
+   virtual/${HOST_PREFIX}gcc -> virtual/cross-cc
+   virtual/${TARGET_PREFIX}gcc -> virtual/cross-cc
+   virtual/${SDK_PREFIX}gcc -> virtual/nativesdk-cross-cc
+
+   virtual/${HOST_PREFIX}compilerlibs -> virtual/compilerlibs
+   virtual/${TARGET_PREFIX}compilerlibs -> virtual/compilerlibs
+   virtual/nativesdk-${SDK_PREFIX}compilerlibs -> virtual/nativesdk-compilerlibs
+
+   virtual/${TARGET_PREFIX}g++ -> virtual/cross-c++
+
+A :term:`PREFERRED_PROVIDER` assignment can be transformed as follows::
+
+   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils -> PREFERRED_PROVIDER_virtual/cross-binutils
+   PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils -> PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk
+   PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ -> PREFERRED_PROVIDER_virtual/nativesdk-cross-c++
+
+The above examples should cover most cases, but there might be situations where
+replacing is not as straightforward. For more examples, see the commit
+:oe_git:`"classes/recipes: Switch virtual/XXX-gcc to virtual/cross-cc (and
+c++/binutils)" </openembedded-core/commit/?id=4ccc3bc8266c>` in
+:term:`OpenEmbedded-Core (OE-Core)`.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 

-- 
2.47.0


