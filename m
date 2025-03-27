Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F41FC36014
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:07:58 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.45527.1743066477427589820
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 02:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ETXMh1o7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E59AB432FB;
	Thu, 27 Mar 2025 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743066476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hGXF7rNfO0dq9z3gY0ip3d3ZRvCLdoGpY1yEEVdI9l4=;
	b=ETXMh1o7iO9w1IRNVUvzN8NJSz8vg43d/lCdqBTK5gpgv1CGxlKAsyRJ+JzlrCPhEtv0an
	QoXg9oNz8WQjboCI8nqJQDI+IjRz/LTWNIbwIB7KYys7ecOdfkGeVP1Uv5CLSIewf7Zgre
	fjUrvUruW0qMbFI/Z5LwHu80lChP0Rcnv5NJ2lwZ37HVxiFGB+cYChu5IIqOdKSEl1rie+
	jJzwL6tPp6CaPR7xo7CT81Q9nAf8aYTnn7CdPNY8MDeqnBPbSrWFuZF6phA5Lk2hUp0qUB
	qjmnWe9d8Xjn1d8jdwOflTE4ZBmAi6EfSfk7vhzG5UOnEh7PdkXDjBgtsFkw+w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Mar 2025 10:07:31 +0100
Subject: [PATCH v3 6/6] ref-manual/variables.rst: HOST_CC_ARCH: fix wrong
 SDK reference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-cc-vars-v3-6-742dbddce008@bootlin.com>
References: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
In-Reply-To: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tSUOJPK1aKpFp/pQ8ZXRZoYk8/kGk1Y1NEoaH1Qp9zQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5RVqWNo5RhF6Ei9NXEdybz0bf0z117rlbvuot
 cxv0QiOkISJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+UVagAKCRDRgEFAKaOo
 NiDWD/94OpE7xOrH9OCaJEg3WV2pIqVkb49mUAlOOPsTbETXXs/FrkEmEDrnWcqdGf/KWM/c8No
 GJ70lPZ1i7+skctBvVFkmipb8CxEcsXE804DzKJ9Uc5TvaU/3l2B3dJ3GQvKciLHHo75o/o1bDr
 O1BvNfohPs33/z+druPIzwOcrRAHdawDmTK43ITtyuffZDrd6gnXk7ar2GCthANBT7AFmA1z5Tt
 HmxoP0muMZjA7jQQSFVKNYGGVcwTvRaCycKQ9OXthSTeSVxL8Kdbja2tC5eoS3fKnEKqzISsSc9
 lA/dMQ/Nij3l7f+SWsHoDN2NSJ4078xYa6avKZUpsOXnRenTAZaoUYEYcXJF+y3wbpR63l8UQ+S
 vHK8GtLE6xxM+ZKzxkU5UOhVIw7VaXm+TXMhPEaNF1kCDAKZyW41tRou6BbPTRPgaWqyge6sfqi
 dgWypBcrlLPIB5t+bGvc2p6IhieRkyIEK5kIyg9PqTn3hD8FsQeKTkPeAYqE8nB6+tCBuEMykMf
 07Rx/J+bAelxuEJ/09yvCHXdsp5oHiUwgcYphUyryXmln3fRlb6QhpL96S0/iq00ZJHqxIjA8dK
 E4C3cVm87luSzSoS4yqqXf14p3SBfbA1SLe7W2H+9UzFLmBkyoo4W9Z09hUSvAqLA9Z0JfLVWL5
 nAy2sWUpFgMVb/g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieektddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhli
 hhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Mar 2025 09:07:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6652

When building for nativesdk recipes, HOST_CC_ARCH equals SDK_CC_ARCH,
not BUILDSDK_CC_ARCH which doesn't exist.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c3ed1a106..65dac9aa9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3700,8 +3700,7 @@ system and gives an overview of their function and contents.
       -  :term:`BUILD_CC_ARCH` when building for the build host (i.e.
          ``-native``)
 
-      -  ``BUILDSDK_CC_ARCH`` when building for an SDK (i.e.
-         ``nativesdk-``)
+      -  :term:`SDK_CC_ARCH` when building for an SDK (i.e. ``nativesdk-``)
 
    :term:`HOST_LD_ARCH`
       Specifies architecture-specific linker flags.

-- 
2.47.0


