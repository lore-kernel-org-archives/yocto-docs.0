Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD27C36016
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 15:05:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.54560.1743433498025745293
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 08:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WVrvQRGn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E1D94453B;
	Mon, 31 Mar 2025 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743433496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Rkp+X+zJ3aPw8viOTv+nyIpydPUOCVloBr1myp1b64=;
	b=WVrvQRGnOVKgRWDsDkRhiUchZzyUy33mbM+BJoS5lURutdxUFMH67DtjXFfLw+WmpPYAMR
	UT1/fFSL9Bbt3PKMCX97OXrYGNMGnelmoQYWrsR6OdugZuI2JTHRMNW8qoYQ4LuaTc7GAh
	1pRlhaTQ7mzipZ7eWnboBRZDoB8GcawwCtfqazHPG7Bx6TuzBGmwPEEK0jlF1D5bAEdTKW
	PudCGGoIehPj5eZsg0ZehmW0zbSck0Sbq8Ffkr3LS+YHoJhxVOtJ4tzgDMLPAyXXgRNhaN
	Uk1t6Vu5d+BmPAoNPh04UBwSDcWByoJh5rZU9RzI3yrg0LUhXwMlyW/pkYDQyg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 31 Mar 2025 17:04:48 +0200
Subject: [PATCH v4 4/6] ref-manual/variables.rst: document missing
 SDK_*_ARCH variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-cc-vars-v4-4-2281f4c47652@bootlin.com>
References: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
In-Reply-To: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2227;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Z0teodrn6Dx4d6xhbBaZH9qtZ0wcPDqgK6gygGH7krU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn6q8Wh3k4oxHL6a8jbyg3HpSZi4aqPUSXZt0GX
 91ZDeM/hOyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+qvFgAKCRDRgEFAKaOo
 NjTkD/0Wcj+Gyl+HTaRoWYHjdZjo51uddjj5QQ44RWg8KJaWBOvLwC3zLn1gpUVTrquhBCfpVLX
 jhgLAnpllo155nB69i/CxrTFFfJ5tieS8z3pe9hRENHxate9aq3WDIeLDXmv3t1HciIP3ssoOmx
 briBzFvdP6r3690tIBdxIc2vyMiCGlTFcXAo0KECafEKzFPWSUQ5DKtjZhY+IRoQtAZKiNd83JP
 waKf8pexg5ZwSGZ1irdbyn6iKFGGXi/xzF+lHeKbTjIKZ9ceAuWWEhbrJR8NSFCyRAJs0v0D+59
 12BXjYdZy7mDby24lfA669yihAeMf58b/RKt+vJG9+/3q4LEEtP65kBOaWmAaNY1bAvJA5i3V35
 hxEaGCgqdz6uhbQSgQ93OmZkS9rpCOeIKhD7MLXtVt/3vkjP/e4R2JWB5DtzHiMWmJB1qFqme8g
 YOt/OE+T2KDlmI5y69nYRGEjFV3nb2C+sHPFDxsfzZrBasE4kKfi3e42pmbeebeUJU2185+Gp2c
 lK4ehR/YrRaEDI4bN6DeSWfQ8TkAq2sD/C4sAhmSp1dUcHJ7gPTEX8TeUE0bboqpFrHfcQ0iUB3
 QYfEQZd/oxuPHRBXAbcAKAdgY3rScRqud4ehPNJ4GQwRhP3yiCylZF4+lVsi1W/GzVHZaBlp1zh
 abIfasJFeRFzF2A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhv
 ghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Mar 2025 15:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6690

These variables control the flags for the assembler, compiler and linker
when building for nativesdk recipes.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 526297b15..c18dbdd78 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7975,11 +7975,21 @@ system and gives an overview of their function and contents.
 
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
@@ -8061,6 +8071,11 @@ system and gives an overview of their function and contents.
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


