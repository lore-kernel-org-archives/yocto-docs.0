Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02D5C35FFB
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 16:03:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.56548.1742227418537936722
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 09:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YMdhpOYj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2909C4429D;
	Mon, 17 Mar 2025 16:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742227417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mt3d6Z//Inxrdh0uqCvowdvLiJIEBbqHj5dOJJ5/U+s=;
	b=YMdhpOYjCzXw/cIzZABfesWwxeOTNnArVwDzac7MUIjpe+MpEf8wBYSabN5DMmWFJEAu8a
	qZk+vNESqvkWMPLwZ0jrvBWo8ONkdL22F9ovUq6XiJE/JDeyEgFPKyVsD0Rf8FvWJCwZPk
	P4/pfNScqvk9clHL0yO6RTho+Ik8nJc9/0OfIxoRKBjly2twsFiVi9l+FrXHkOlix5Dc8W
	F942+1PjisXXy0iytFwHFqOMwBjJdMmtom8fXG3j4V4a8C3C9IV9C5mKyvXEK6cBd/AYp4
	PnKD0YU7zqgTlz3rA00E+MFTpN92QoTZVQ8PgNpr30bTSixiplEmt8AxcUHRFA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 17:03:30 +0100
Subject: [PATCH 3/4] ref-manual/variables.rst: document HOST_*_ARCH
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-cc-vars-v1-3-25edbadfd054@bootlin.com>
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
In-Reply-To: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xIrTn0ZA9X2x8BZLTPWfPgav6jaLFba8ByPKCIVSlmc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn2EfXTGFg57Z0ZS2O0xDxQkQC+j/XHske4wuwg
 nkjuomR7LCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9hH1wAKCRDRgEFAKaOo
 Nm9uEACiwL6ndyT9u1xmsiPP1EoI2Acc4zvmbqshMILC6aBY0y2D8S/bZcVF4zrTNxByuXXXVTz
 NcWKFuM3gw7WymoOJMOVTQyGQDVFMKq5DWdYAxLzLudhO+PQ52GSN//hrMOqsepKqnqzavixddt
 JXvPFS3HG6AK2Gex9IUzvslgWsJLu0X0yaLZWCDbRvgifLSxlp2XjZxp0wtVy4q/l80yWn4SI82
 lMVfDFh/AgKb2EnWeW4T+44jlNgJIpq5IVCTSHW/9Aei20AAT/LzRwSI6u+bclrOsHZt/lV8W5n
 hvb/nJt2WaKCM82P9rS/YVyYstarmo7VHHPgJlaHhw0pzjBP2B+9RKjRyZZNSqrPhg3nmK8yPId
 7OWUtfikW4ssgkb8BwW3HqEEEpSYfMIY4rcSNaYtRZai2ySOZeJ7+AMcuV8azuSrMo9I3xzW427
 gO+MuCEyjGM4l222muzzXqmWA5O4mq1zg73bIuBk4mgz0WijYnTPQ3DbFfIHPY5cYNIQwBm2IPO
 PoRqWymqdfS19WKd/ITQZhpI3mOClpsQvwvtOZvP6b/TtrpYgTPdOf/ggUE/USVgmFLbowZ0z5b
 cu6KML1crZ8Lv7+JZ9MPebd3bhLRtDmINXF3CunL/sw9wCJPnDIRAa2TZ5rjxvFI/MHp+TjRGtN
 l96sVNPQ5hvNrJg==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6579

These variables control the flags for the assembler, compiler and
linker, but depend on the context.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4063fda8c..f339e409e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3547,6 +3547,20 @@ system and gives an overview of their function and contents.
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
@@ -3563,6 +3577,19 @@ system and gives an overview of their function and contents.
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


