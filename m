Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1ECD0BB7D
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 09:19:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.10437.1729761541622787307
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Oct 2024 02:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VevNbXnr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA0A4FF803;
	Thu, 24 Oct 2024 09:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729761539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rKJf/4iVOH9u4Li232j6zorgTgkmE3XdrojkZs0sTQM=;
	b=VevNbXnrzLXJVaqYnTwQfmwKK0qY4sIS39ha01MiPH0uxq6nTC5oxoBF4RG0RvVzGApGxJ
	DXbFqRubpiaTHse9NXWCbJJv7N6jfB7pBYcxz5czhtbhjVkcc5YJIcaZQ2MCZcVwiWM0BK
	Bd2YdG5gMWP8Cx6rihtS7GcRPKVs8nyIEparonSGGwmXV4MN5b2UbPPwdxckRX49UQHHYE
	oDtO0HpVhIic0KjrAEyhUUCPd8jnDjGvbSTJrX/7jvdAsstMB4FnWSwztKR7CVrp3CfCjt
	spwmWjU/I1Jl5PH/xdu6+3quQpTDDxqPZczhgZLA8U9k3cWEA/j/QfCchWrU7Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 24 Oct 2024 11:14:32 +0200
Subject: [PATCH] ref-manual: faq: add q&a on class appends
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-faq-class-append-v1-1-673c675cc6aa@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPcPGmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDINZNSyzUTc5JLC7WTSwoSM1L0bWwSEpOsjQ1NksytlQCaisoSk3LrAA
 bGR1bWwsADxE+wWIAAAA=
X-Change-ID: 20241024-faq-class-append-88bcb9536b39
To: docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HbgdikWCTa+dz6EQKsspVCMoXhP2V38JQpcRq28oOgQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnGhECa/IbI7rv8iOpWGHLzixD32swr/M9Ui8XY
 TTCASAQUiuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxoRAgAKCRDRgEFAKaOo
 NiF9D/9fLPjUUz+ZsBSBEQTxjTdxz7s6t0JeK9MxOcJ+DhdQH4pTlbpDeiE7COaL+5OEene7aCX
 XSJ1LRButWTf6iZgqJnIfHnrvtLpOBYGNAcNWnL7r8kD/udmw7puVVF2B5PmMdzNiDyyKH7hhF7
 ziQnQXdmoDiu1JYqcz4PmifhuIDrZvJBLnKrf8rwaF6Zif5fzMNinotNkfUObi95Sv39+/r+8zk
 JIv27Y53YB+YHe84w7tAtAQV1jG8qL3u9KQNuBA0QialA2uoJQOq6sW345uUNUyydqoNZg73Rle
 SQ7yy5ZCd/0Yn3EueGXk3IYdsqIa+BNxThTxHzRa615R259JXeealrF9jG+i4MF8v9EPP8df6Kz
 q2dHJZJUPRtPE66dT36cJswgTgc2z/XL3u494BLbJsNlcpS3P8jew6nTWfmkxigz0iQSlg+zh0B
 ferAnVzyd6i2IhUg0IumRrdR2TPrSFoxiZmrwfkLuNUq9djQJiaKQYDZ3vZoWrVTL1C2wPRmd1p
 Vj7PFNV8nLvTTtOw1FhhnoniXKkbBAkgvzjRWskUJYTNjPokiPB3T6iN52Q2AXiVKR8Ul3Jbg3y
 H2ZpObZT8mdIzRoyX9PY6CDEb5PofPBQd51kTUzFgCTRNB+Zqde4Jv7ELNhtj19PZkM1XPqF2qz
 Juqd8QXUj4kXhWA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Oct 2024 09:19:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5578

Add the suggestion by Richard to the FAQ, with some minor rewordings and
additional punctuations.

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/faq.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index bab284bbfdefae02c284204d3c94891a8238239a..3dcb1f862e24716be703f9fd3e811d2fb9ed34a0 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -259,6 +259,25 @@ Within the :term:`Build Directory`, is the ``tmp`` directory. To remove all the
 build output yet preserve any source code or downloaded files from
 previous builds, simply remove the ``tmp`` directory.
 
+Why isn't there a way to append bbclass files like bbappend for recipes?
+------------------------------------------------------------------------
+
+The Yocto Project has consciously chosen not to implement such functionality.
+Class code is designed to be shared and reused, and expose some level of
+configuration to its users. We want to encourage people to share these changes
+so we can build the best classes.
+
+If the ``append`` functionality was available for classes, our evidence and
+experience suggests that people would create their custom changes in their
+layer instead of sharing and discussing the issues and/or limitations they
+encountered. This would lead to bizarre class interactions when new layers are
+included. We therefore consciously choose to have a natural pressure to share
+class code improvements or fixes.
+
+There are also technical considerations like which recipes a class append would
+apply to and how that would fit within the layer model. These are complications
+we think we can live without!
+
 Customizing generated images
 ============================
 

---
base-commit: 72bbff33fdce60c133074b4ac09721c4ddac5372
change-id: 20241024-faq-class-append-88bcb9536b39

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


