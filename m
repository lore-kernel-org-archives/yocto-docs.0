Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50061C87FD2
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.3503.1753783011456208778
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LEF6XHVp;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09EFA43142;
	Tue, 29 Jul 2025 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=poW0jdpCRuhCuByYSjRbdxAHPcVKC+ZiAqPrqF3dtlo=;
	b=LEF6XHVpZ9NM1R6U4rkkcWI8vI/PFN0GlNxtGrvK7CapqpE7UAxipVhMRNll11T3VOgFlN
	4BMUooKzLn+XMlLiOeg3CJSUBWPvEar9iLTq0NOArio0DCg1YoNBtxYM5MFT4n21RYLbIO
	yYrSDgSkUdCI4+IWvA5kEqpVhQUsTNjxegWHGDIs4M3ghNg4gG/h8hR1hzsLH6AaAjv6/z
	PHASmZeLZeprUBCOyWBl7Vhucb4sfHbwC8C67tJlKQFS1uY6AGFMxo+s6NQuN8eVNMjZA+
	h4JYj48foyFb8vYDh44t/nOUX5i17xlvbAMgW6HrVZHp8I9sAT23YR9HcM8NYA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:37 +0200
Subject: [PATCH 03/19] ref-manual/variables.rst: document
 KMETA_CONFIG_FEATURES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-3-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Oi3dZcUnUVyLKCpOtw5/yLFJXFroxRVNONnjCF0f5q8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrd/h++D0CKpACddyZgn+EDf4xe/hdrON+9q
 Ltct74fe9OJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3QAKCRDRgEFAKaOo
 Ni6RD/0RvVxWa9hqLCkp0ASArOM/1JvDoxStOLpb3axB8cpPRt46ANUlf/LY56LBRT40BPnUONK
 TNpzhuQpYT4bBM7v4hzina6wA36s2tEuxqza5DhqJhbwpVaRMh+47Re9wBNYGoGKfA5qcyGWbAT
 sfqPEc+gG7KdhSXLQEzga7haKbW5a9vP/gPtARJ0CeHAU3wCQqKLtwzQuw778Q28P5x34u7OFfc
 a1Dogqq09MYnKAt6GH2CNaMUr+GOMfeSkFOfseHGXh0rOx6OU7VqiwzMAIOZ9sU1l1oq+9dfgsM
 X3f9DLMDwz54JGcoLMkJ9hzM4qNdRf57NEyIz8nHy+up3iT0h35ryGGu/jWy5PKaELBntHpuk0u
 aajcl5p9lnR4Q/E6rCt2YNkf6L2eFli1RMXpRrRdpTeM7tWTw/SarnZ5L45tCayI5xfPOv9a405
 96YsyqbN7DuS/uYKokT3aNQ8+rgGcz8PATUEixcjRQ6aUMkrAiZytoqKwzgsmBDBGtQVfcBFXDb
 xY2viJHFCX1yVLHWX6H/+m06f9upAWrxuvcq2+N8QQM00sxdUvMFxxTaPezcJZ3FZxnzqtngumK
 NPuKMF3GFMctMyPwRVYm92kDr1OXTp6QmuaBJoDKsNsLoWv4c3rdOR6dMASguaPqvch95DC60VM
 8FcTHfNF7568apQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7395

The KMETA_CONFIG_FEATURES variable defines kernel-yocto features to
enable.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 03839ac0a..1a4e8a254 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5468,6 +5468,19 @@ system and gives an overview of their function and contents.
       Linux Kernel configuration auditing feature, see :term:`KCONF_AUDIT_LEVEL`
       and :term:`KCONF_BSP_AUDIT_LEVEL`.
 
+   :term:`KMETA_CONFIG_FEATURES`
+      The :term:`KMETA_CONFIG_FEATURES` variable defines features enabled for the
+      :ref:`ref-classes-kernel-yocto` class. The following list of features are
+      supported:
+
+      -  ``prefer-modules``: prefer a kernel configuration to be set as ``m``
+         instead of the default value ``y`` if the kernel configuration was
+         defined as follows::
+
+            CONFIG_FOO=y # OVERRIDE:$MODULE_OR_Y
+
+      The default value of this variable is an empty string.
+
    :term:`KTYPE`
       Defines the kernel type to be used in assembling the configuration.
       The linux-yocto recipes define "standard", "tiny", and "preempt-rt"

-- 
2.50.1


