Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07912C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 15:05:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.54805.1743433498162163069
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 08:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h2/I2PCd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8152444ED;
	Mon, 31 Mar 2025 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743433496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvJya4aYP4uHh/qMltHn38A+EAEy03jqG9r5ZDnNKZI=;
	b=h2/I2PCdp5pqo38DRBo33HnQ5Yyiu+AvGEs4DcdbyBZH04XzzzWTbmmzne6KobXnb7nP2Y
	K7k9gzgqexnbc+v8c0rws3zZV+J3Pqpq5GPNSa70iDwunBq4wcVH2Vsh8pCAMMCIJygSyF
	J2rPzslEhFTHLJuQlJJoRIaN5No3EpZ0UGFKlAuvcdeUoN6ypDNxyAk8U/9MEgbr3r++ur
	NG1hopwKYzjrkK+UI9nmt346EsQwduVapViwrrqd639JsM4muGM+NnpK29x1QJjQKzbYX0
	nGDbONyB1LeC1z28Hbasiskis82udp5PMiO6yPmfgMDmLi7OhOD4JLJw05SNWQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 31 Mar 2025 17:04:49 +0200
Subject: [PATCH v4 5/6] ref-manual/variables.rst: document HOST_*_ARCH
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-cc-vars-v4-5-2281f4c47652@bootlin.com>
References: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
In-Reply-To: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=GHx5o9mANTbD3MyTVyJEPt4s4ZbKsmfaZl9I6UkaTSk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn6q8WYudzc6HRzEmR+VDKiw0g4Kh1PhKZq6U5f
 ubW+1vv2ZKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+qvFgAKCRDRgEFAKaOo
 NpZZEAChtobAXrEq3IIDp/k9sNEYAimcK6IIZU7Am0COdIDpHCSynAyzju8CFScMtCzHy8+8hBR
 /wjwl8gujvrUczPShRb6f+Vtun4weM1XJQCglLyJd+uBM3OfSGtLFhDiISLxidwj2VsaZH6/bC0
 hgcdTvAdoLT5jUdi6L1aHMy1193y8VKqG8w7OgIzwYZs695bWKUtVzOgUoxgxhlI1ciN7jQBTVY
 ZnlYvr+atDvE1wCm4O4DevaYrLKJxpunA9D/vtcc+t7ODiB72R3PfjaKLFL8/ult7USCK3hWLan
 m2tScmrPJqWKFAVTjCjhmfS0Y8///jt+psGQD2eEzE46gkJ/c0Bh12YbZpT/dmMpqrYo7ZXidqJ
 id+90l3U0ujgzJyDkurRk36+yf8e60JnIyj06h2fXK9GEQKnvu8zghBLa4yNYSizVk6LRuXEv7W
 JUay0pwk60chr7+VU3Bss40h7mHBgN8mfJa7HloxHF/RJkG1XJs6LhEc4i30ZnEqHJqsviSS/Sb
 jtLKXROIDRfTJZmf5It0k9hs9TwBKSrdcsqG8i48viP9dqOO2HKYM3WtU4VodEAfEzC9dRWkqtp
 Mf6NaynEGkcT0BPZd0TXp1K2TUyU7ucZYFpRHYF2BrZFXlguxuzi6okCnHsMkQhU3+5nJLfB9is
 ZkGZ+Ker426QNoQ==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6691

These variables control the flags for the assembler, compiler and
linker, but depend on the context.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c18dbdd78..15e950859 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3698,6 +3698,20 @@ system and gives an overview of their function and contents.
       - mips
       - mipsel
 
+   :term:`HOST_AS_ARCH`
+      Specifies architecture-specific assembler flags.
+
+      Default initialization for :term:`HOST_AS_ARCH` varies depending on what
+      is being built:
+
+      -  :term:`TARGET_AS_ARCH` when building for the
+         target
+
+      -  :term:`BUILD_AS_ARCH` when building for the build host (i.e.
+         ``-native``)
+
+      -  :term:`SDK_AS_ARCH` when building for an SDK (i.e. ``nativesdk-``)
+
    :term:`HOST_CC_ARCH`
       Specifies architecture-specific compiler flags that are passed to the
       C compiler.
@@ -3714,6 +3728,19 @@ system and gives an overview of their function and contents.
       -  ``BUILDSDK_CC_ARCH`` when building for an SDK (i.e.
          ``nativesdk-``)
 
+   :term:`HOST_LD_ARCH`
+      Specifies architecture-specific linker flags.
+
+      Default initialization for :term:`HOST_LD_ARCH` varies depending on what
+      is being built:
+
+      -  :term:`TARGET_LD_ARCH` when building for the target
+
+      -  :term:`BUILD_LD_ARCH` when building for the build host (i.e.
+         ``-native``)
+
+      -  :term:`SDK_LD_ARCH` when building for an SDK (i.e. ``nativesdk-``)
+
    :term:`HOST_OS`
       Specifies the name of the target operating system, which is normally
       the same as the :term:`TARGET_OS`. The variable can

-- 
2.47.0


