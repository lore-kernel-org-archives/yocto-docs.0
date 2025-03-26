Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83424C36013
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 13:21:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.22221.1742995308617551658
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 06:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RjHRQkcV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D813443A0;
	Wed, 26 Mar 2025 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742995307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TUMYDs7i7zLexU5JMnXD3N/6axu8HTkzvSYB7DSLQXA=;
	b=RjHRQkcVA1tDeB7jJ4LMy8tCUK8yyqPnJOMYjfAjwDAPid1f6uE6r0V6lo0H34NvkqYfB7
	CsPYKBNc73FI8sb5YMPLTAuhgjMBpIFgRT/5E4Pmbzx0ZqRkzEi0znm+RzfykSQ0401dqY
	Qog/JbgwU0dDzmUM2jtOvoVXfAl6IiU03lWBKTMpnKBNjPRbACTkfydzSbXZotzJwuv8Xy
	KKfcLN4aoyCPOo7VrsBq1i9WNlsQwkCM6HoQuwBxM+O5UzGlNZM8PsyGE7UiXQUNuP8UGd
	HwuAszugIrAWbqLioKhRysQ2iz4dj/ArPzcPunDAW45wk52TJuhK2PL9zmxrQw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 26 Mar 2025 14:21:40 +0100
Subject: [PATCH v2 4/6] ref-manual/variables.rst: document missing
 SDK_*_ARCH variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-cc-vars-v2-4-36b80c64c4a9@bootlin.com>
References: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
In-Reply-To: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=D8XMaY5cr7BGmks0BZCKbwxlWoeTnAd44MEC4knkKYY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4/9pcTmiybXArBywQmE70gt2bRrBgjiH44Pi9
 7XYJysnVMiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+P/aQAKCRDRgEFAKaOo
 NtcxD/0WI/VYoVeHA3S0UUGY3IpLqSL5/yMEDfsZ+ae8iYivRBmUuNA9Ff4JzBUH3Rt38f2sbG8
 K67KnSoQvIZfksCW+lQak2d2/r2SiLLQLldqrTmKux4vf8AEGak51d3pHPcKoC1nkmDU/zcUVAH
 sb9x8q7olFY6BpqU5goYIfAhoSiTlFnvSPZYheUtGymbG5jrGDb8fALCjv6owJY13jujo1ylW2f
 xBZwFB21Q8Nqn8Yc1iOar/8ER3qNz/dl3vhxbMR/Vxr05lE2nxJ6RVSz+DHJTxU/HaWcsInuwNd
 iBkP1nZn2uRGyuQE3yhzLUgEFj6q58ORol58fk4QHE6UL7zfE73J8PX3XN6T6Z+mAjjM2I5RfED
 3xG+SZ4SBnxFsZwplebBUDrlkYBVoGGJCQoH4hrCuAz/UwWverAb4VVVY5IZoQWH8KlZnsKz7JI
 4U35mDIsJbTVZJcXvof7cQ7rc3shxRhcbU/+mYuDxjqI7miyPHP5/r/YJxgU7+0EX+XP9sychfO
 VfA0NmX72yAyi0/qb6GD+4/AalWSrpjFhop5HXWNqPK0rGI/io/8jAxSk9R6w4o+o5vsrfVIbhN
 rZfKEP7aBVKV8kbXBGJKlC2f9x6GPM8xOQVO3S7Diy9T+K8Ga+zhakPyc4b2NJ5smRYKzNpWX/N
 bHaTYeWITbhnhnw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhpr
 hhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 13:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6638

These variables control the flags for the assembler, compiler and linker
when building for nativesdk recipes.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9ee63622f..2e57685ac 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7889,11 +7889,21 @@ system and gives an overview of their function and contents.
 
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
@@ -7975,6 +7985,11 @@ system and gives an overview of their function and contents.
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


