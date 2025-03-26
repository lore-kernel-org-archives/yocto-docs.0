Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDA5C36012
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 13:21:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.22294.1742995308823696375
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 06:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pQGBosFc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 635CF443A4;
	Wed, 26 Mar 2025 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742995307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4x+KkDtN3au+IlyXf7HI/GTJe3Cm3Yct8Q9Va9lzoaM=;
	b=pQGBosFcyx5qaAlCznRWV5d3TCQT0IqbcDClvfuTfTnGnY20dx3Li7jE3vtHsrLCUHi6HC
	qu6Bx+Nx5jWlLYvFZ/yH2pBU/P9pmiUIyOagZlwN3kilkub4xxUyWHyNe/BKKODFLP5Pqm
	cfiSYp/vC/NeAqJ9OxwPQGkIy5FF0y5/ImrrDgWPpp3P7Ca9RlEU60yeDqGwBuVhl1f5/R
	ficEyg/IQKangdFZj7x7mj0WkNwoIFj8b4vGXn5OJXN/rZRATeBlGWCIhMJbJKY+a6yoHw
	Lyi7aWXDYVaQRRg2UGE6gplMvEDmb3GKqEM5sl7Nf2L+vK5hSyfrjot4k50nPA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 26 Mar 2025 14:21:41 +0100
Subject: [PATCH v2 5/6] ref-manual/variables.rst: document HOST_*_ARCH
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-cc-vars-v2-5-36b80c64c4a9@bootlin.com>
References: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
In-Reply-To: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mZAfn+aFuTLIC1VNC+Q3Gpi6AOTF5mVvGJWo7Ui/1eA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4/9plcfLKo4Fpe4CmRSeTbaeYBA3vHBnSCacH
 gBkJQzMMdGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+P/aQAKCRDRgEFAKaOo
 Np23D/92jSXq8dPJvFIQ+HVpm3PL1jy96/BHIReoo+72XWO3meD6WwnQ/3UmTwRjjSf+HPaqe7O
 A2z814NmomMos7/PU61GQyjULW5bsu2D1SmAPnM4iK53BcHXNbWwFU/87WL1IOy1SCTas+ugbQg
 SjyYoZ9B0Mn+3Bsj2lmStNre0QgvJUZ+bhlYk6b/bg2ZLCY9nDOW/J7Gx3Y2s8dw3hLC2zFaXqz
 1C4uEubdbpg8dnhCXdJuMgHFXWIZ7MNQnVI2x1d+7CM4qjeqEBr8RMOissDiAl/XWX4Wh0e94D9
 m3rQNIWPUluCj/U3UwjD5QTyRBOhTEnff3z3kEP8NsjSh2diLzUoaX6M/v27QqNuX/SESDyrTqS
 4bLnSWp0uIMxxmMlA5OI4e75Pk4/Q/a/Scyb7Mr4n5wivst/fg2InTBqagakEsVl14ITgOj0WPb
 GHHlXrDSsxwUn0rcEswg8OQwqgkTzbCmUVF5VnDXE8/8ERl7orV6J2qnsuPP95b59+A4dgrjZRw
 tgquBst5atDP/+XSqQ7Go79O0v6tMYOmw9zBJ8kaXLidr/Tl7i91LMYp+SDIO9Pij4pgOJOAJg0
 /3JS/4zYs+Ew5uB/ThUY9iY1U+7Mzs5i1uJ68L4nGrULo0Cv+6/9xfAZ5jYe5b2bEhcZK4zizHq
 Obsr9C1uOKUtW+w==
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
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 13:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6639

These variables control the flags for the assembler, compiler and
linker, but depend on the context.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2e57685ac..b7c5ddf1c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3644,6 +3644,20 @@ system and gives an overview of their function and contents.
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
@@ -3660,6 +3674,19 @@ system and gives an overview of their function and contents.
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


