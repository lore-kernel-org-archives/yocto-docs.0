Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00089C36012
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:07:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.45526.1743066476971029091
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 02:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CsILpI/t;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6ECB943302;
	Thu, 27 Mar 2025 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743066475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+7SwiEWIoo8wUDFc0c+x/qzLIq3n1fTEk8eu1b1OjEs=;
	b=CsILpI/tA7flpHSQrzLLb8LTh4A6xHl/ECaJGDyMefcvhM2qtW9ANAz2awpgR3umaOctvm
	zZ+AmX/q4M8jNQ5mIcsG7upFTYOG+XZ7XI+RDscz3eTjgdV5rQ+bzDz2QqnYUhhtqTYyud
	3thvh09qhx2IdZpC/MMN1ney+Vr1tFqVd7Qs9P3o+qVmikULl4aZqvtyyAsNkItQ6kBue+
	U1PeVmOEg98l39xS4Fnb+moLG8i8kuJY3RDdGlwt6umh0V0MOg2CquKVF2Czd3kGGgTQhn
	/HLzc8pVaCDUjxA+bnu3chQI4JTRerFFnVv45CtfeMsc4O3AIBXSgGIJK8vFqg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Mar 2025 10:07:29 +0100
Subject: [PATCH v3 4/6] ref-manual/variables.rst: document missing
 SDK_*_ARCH variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-cc-vars-v3-4-742dbddce008@bootlin.com>
References: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
In-Reply-To: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2227;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hZgO6vQMUrR0WG9nf0JHcb0/1ZMY/FLRGqAnbs8ccRw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5RVpPXeu2g4bjeRezD+Jm4ISP/OA81oLawHDH
 /MWpjBRk52JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+UVaQAKCRDRgEFAKaOo
 Nj+IEACVS04SWWwRuXK1bmYRb2VEdEyl2Y83C3D6i4hRaWTLqeBKj9O8qMo7zA9WTF59qRYZUAp
 ECHBLqFclKKM1jdOvufwrWZCxuUqr76HwQIEH6cayJPSblmc9uOurpkc8qN6PaYLJmfQU8Eb0Mb
 fUKDFoiSvqdIi0PqBa9cqh3Jpdx1832sXL2wb/0F7LbE/mUoalHbhNYdRLxc75sJZbzrIrcE5UV
 vNagt6yIRnqivfQ6JQSpxvC3dmp7MdWkg3Edl6SSxyYz9NeuMSgPM2ieWC3yME/UBtLyUG25Jtr
 BX0QiYp+1B9wv3GH2Uh7LKU9oOFndbIg0FxjV8K0gTLbhH0VhIhI7BwN+Th2Y/xyAwi129YkQdc
 g9rNrCnm5thMB/JcK5XOx1Jm88rEXZSj7/dMCGogkWUGHU+e0H3f2HaFmwtWmeuo4x3g00E/PpC
 4OZzhGonXcNUFdn2ZcK9bzcYouvxHNKbVfHvmJeyn2W7X30n5Ej3PVQrCs931suo4DyrTl1uboN
 P9q2t6vN2IXrkPzRMJ/jCCKgOqLjeYO3I8uSXFaHnPygtm7Qj+Ed7CB3DNveMLH+DbRT84qAtg+
 FYBZ/BtQRpKJ1Y2VDDu+NmuJBbbZmBnvOz0rDsfK+aj2zz65o+BAIfT6ypbzntO+TMAT4+nprPF
 AjMrfi6QwyjxS/w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieektddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhli
 hhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Mar 2025 09:07:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6650

These variables control the flags for the assembler, compiler and linker
when building for nativesdk recipes.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0516c1816..4cb416bd0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7920,11 +7920,21 @@ system and gives an overview of their function and contents.
 
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
@@ -8006,6 +8016,11 @@ system and gives an overview of their function and contents.
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


