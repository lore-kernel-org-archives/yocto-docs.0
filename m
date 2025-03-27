Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC80C36017
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:07:58 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.45789.1743066477164818133
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 02:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mO7N7oAt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC4E443305;
	Thu, 27 Mar 2025 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743066475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uT/EiwlgzbOvu4bJfcCn/bSJk8HwvX+ooobDaKTpAJU=;
	b=mO7N7oAtaA00RxkFSIBQZpEUe80zQJ+CRIDUfclSnu30/PXow0acANLK835jDrpffVrAlj
	59ljHZUvF45P5xW65nTD3PYZPBEG2EFXVnBxpXtZ55NcdoPN8iBHFroJkM/L5UD1rfD3cF
	lQJ3Ik66JM+mZUqiwWF/CuPGFuLazrev/lpX0gYuXnIQg1FmdrCEZT+IYzaQlofeJOS/Ts
	L1mRscy9o3+nS7Qn1MXZszXN6ACv2KwRmjnMgBc+JM7wMPw8RLxsvlw9wChBup18iE6yVp
	ycij+jkf9fo7WKHPi3pe+nKqyvVWFAM319+w9uFDJUkveUiO0nicK8STJrHrJQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Mar 2025 10:07:30 +0100
Subject: [PATCH v3 5/6] ref-manual/variables.rst: document HOST_*_ARCH
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-cc-vars-v3-5-742dbddce008@bootlin.com>
References: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
In-Reply-To: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=J1Vr4B5X5KceuASvfzYZGkvXTJZQms1lJPT7Dl41Ixc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5RVpLtKlWCYDdFpasMLamzpzNRqB2kLgQKe1z
 uG22BsY9dyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+UVaQAKCRDRgEFAKaOo
 NhMqD/9IgPEPHSZeWc70xA/KNF1Awx2M4JKWaQDDtAUyrYOeBeFE6H+Obrwy9bQNBGsqrmAETqE
 1weZjAiQvUikIO6rxKKex+0wQnGKhk3l4FaiNc2q50JmguRQF9dd8K4yWN1xS+QxSkWBdZgFR5M
 XYHKBnfmWB7As+k1Bya5lkGC3lcZxgrkXxDgEE3KVLjl0m3dj99PN7lfZM2ezOhmU+IRJtBCTrG
 KRlYoPNCnVqlKvmwqwIl1wbsoajuup+OQ6fLyhbExUjW7rFwtOtJLvdf2LTf+xfbPZrclHUpVpf
 WlDemAPy8Rstd7ytYg3UFVAU7KOFysA+LXhW0l7/UP6KfKB90ShUv38RMEQEyW7Nv3q1qiy1EA/
 9g6JTPLdDxUBuvYynYUM/rB+Uv3ZjTzCUJG5ydyuWTkpl7RQSsGTsBT6FOif/9IMUKPiv5VOX+u
 +++ijBpiz10nKjkwGK8mw+vmC1YcyePZOMnl1K+1ueBYIwvpTIdoejaMSGuYP6gAjlRjKM4Jxai
 cVgkp0D9QPYkXFcS/dlw7p/s0RKs3RMfQRm3ZYInpCvDJ8WhIgFdyWlpIAOTYJ9sn6s+D1jsYpW
 z3gkyHFVkFNw6P/gMmt66KTvws1TutMTq6irrBis2K5Rr2nO631fFCZEGnA6K97PHfzDb7kOSCW
 on1oxriLlziY3aA==
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
 <docs@lists.yoctoproject.org>; Thu, 27 Mar 2025 09:07:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6651

These variables control the flags for the assembler, compiler and
linker, but depend on the context.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4cb416bd0..c3ed1a106 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3673,6 +3673,20 @@ system and gives an overview of their function and contents.
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
@@ -3689,6 +3703,19 @@ system and gives an overview of their function and contents.
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


