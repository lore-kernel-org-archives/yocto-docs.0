Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C88C02194
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 11:14:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.17003.1738322067607337011
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 03:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O1Ik1UU2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AB04440CD;
	Fri, 31 Jan 2025 11:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738322066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKXfCJrLtdKZwEvbwdpiaym2lRWKyweHo27EvhMso0A=;
	b=O1Ik1UU2t1TdaJx1hBM11vrvxeCZQJMrkdsloIg8x7AaKXVr99mLupUk+pRbTgb+m6JHEq
	g3GHGEnQy+p8mxh7SAyoSkLae2Yr7C9p8SCB11i7/fY0YgzUbo1o0zWjauGB46WyhV+NhS
	C+ZLJuNRz6eMYBBrlLsoGsiOUTF6Vq/JWnXVkD/XZXpJJuhjiiOwVJbxhStN1Fo16xXI3n
	b7ChJ/L3yC9YUF2Ha04ZeS7Ka56i4CKlbu/0qM6AVRK5J1aZ2ft5WpJGucP66jCJOzpZjR
	2NXfw0lX7iTVdLZ7LtIRCZ1QcDHN8ExXxa1o93adn4MaWXN3iV8SfUJALkJS1A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 31 Jan 2025 12:14:16 +0100
Subject: [yocto-docs][PATCH v2 2/2] migration-5.2: add virtual provider
 change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-migration-5-2-updates-v2-2-4ce688a74bfd@bootlin.com>
References: <20250131-migration-5-2-updates-v2-0-4ce688a74bfd@bootlin.com>
In-Reply-To: <20250131-migration-5-2-updates-v2-0-4ce688a74bfd@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2463;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uZT1SzF6bToJovqD7hTeY3BARhn/O/4gYBLt5BoIgOg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnnLCRP+3fJWcObnORtc2Z1YlbtFWjh5gaMqQiN
 CSOQqscMR2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5ywkQAKCRDRgEFAKaOo
 NkM6D/9l5mjdmeiaXTrbbbycCFsDu25M9akb4w9j1lsqgetATTmbbLDThhDhp4jMvLCnDlun0rC
 X1LoiRpiE/RTJXR5TCWxx7juCuPu1CwZ2RkmM8SL0Bc0EppELMHx8eolsbGjGVOeCqOTz3oqle5
 0X8wer+rsVHRkvI/5BUL5ASHPwY2P2Q0r1bGE+zvgZlhtddql3XUy4WQW8I3HjSp1yDW8BgH8+R
 E/PVFH3GpyNZ21VrlzBoY0GYNPFoLNb4HzjQ3f+lxtoq43hCE7r6FbD81lPIsBW8ZHjEo541hLH
 RypyXiMeBFRZLBoAQXu1T6OiJnpDiRU2oEYFWDPlXKRE3Fh5CNEj4iN0ft9+sYy4SdTm6D/GucO
 w318Mkuxivr6BalpDox9unhB501gG91df4j7gxFS0TAUd2Fr+UrFQITOJbkChKzN7k4OnRj+Q5D
 uMUQ/pYJvHTJkxXjy75tWBSdJN3SlJ8sMFfe9uNUS/novao6hQuSqWn4SHYF5ohRl3Bn1ch1ZUc
 Ps4csCJsNqyROfgxYqaoVO013OilUyn+ZYlD/Atjn7/Gh3X/KTOof16Z6b6JG3ENLjkMdheQI0f
 Wo/FxBd7HydTUBF9XIGlgC6VGLZFnfEjki0igHooSMmzyQP0K0H4DFKDMWqJHkaZnMjuoEeoZZs
 6bkIOq+16n3FiBQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 11:14:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6227

The commit 4ccc3bc8266c ("classes/recipes: Switch virtual/XXX-gcc to
virtual/cross-cc (and c++/binutils)") in OE-Core changes the
virtual/XXX-gcc to virtual/cross-cc (and c++/binutils) syntax. Add it to
the migration manual.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index a60e3e9a8..b29cb2052 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -105,6 +105,35 @@ some obscure bugs.
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
+should be changed to use the new ``cross`` syntax::
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
+A :term:`PREFERRED_PROVIDER` assignment should be transformed as follows::
+
+   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils -> PREFERRED_PROVIDER_virtual/cross-binutils
+   PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils -> PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk
+   PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ -> PREFERRED_PROVIDER_virtual/nativesdk-cross-c++
+
 Recipe changes
 ~~~~~~~~~~~~~~
 

-- 
2.47.0


