Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9096FC77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:55:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.4665.1750758904803721817
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f8mWYNWg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B29A43AFD;
	Tue, 24 Jun 2025 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750758903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IaVgp1WPSWiN20yhkx67YH9hpoKyvtvmQHi6Rs+dSR0=;
	b=f8mWYNWgg9SuMzjXa+0EmBDnzaTkBvsL2wkJOrLHyts2Jce0EQsdugZUNpuVbghAr50YA3
	+PkcSTZwMwZdZ8MsINC4zjQxcztq1b0/krpLzit3Jnj4iVqfwHIV/XK6Qo8FwoJcqpH2T+
	f/EtJyusAQFaxvm/K8+W30OmxIOvTuoyQjIwGYYcEVXm0sFdvdcNzsXQuZvGDFPWpF83+I
	Tq92A137/nT2OwB+b0vILFCs0VnUZy16GMJEGB1R9mHNjw69IijCwJ4mePFRzhT7QDefB2
	MJ6WGCMQMcSuDDrrm02rHasuASUA8PlpI6Sw+MIoerH8k9n61lhKVFi0ks9eLg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 24 Jun 2025 11:54:58 +0200
Subject: [PATCH 1/2] ref-manual/variables.rst: document
 BB_GIT_DEFAULT_DESTSUFFIX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-migration-5-3-unpackdir-v1-1-ef6ef00d5cbc@bootlin.com>
References: <20250624-migration-5-3-unpackdir-v1-0-ef6ef00d5cbc@bootlin.com>
In-Reply-To: <20250624-migration-5-3-unpackdir-v1-0-ef6ef00d5cbc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ewIrdUvBg0g+63iIKBBitH5+6a6bWLhX7/gkMcGNum8=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoWnX2SqHGowtGxKHzSCRTjCPDHSIt6B/UM0LLW
 exeL4tSRzOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaFp19gAKCRDRgEFAKaOo
 NukLD/wMZ/D8rIDBVniw1oJuBZEc3tFAITXqK463C5xMUrGWG6QNZiQMt7GZbj15vRL+Q1Wwber
 l+afX6xAwRAZtOnbNYmpl2JpfOlR4zbLvKkM2PSg/nI87N+hraK/8jTkX5ZmNedIPw1aJU669fV
 K4u5e+IXZIDRahpxw/HaszrLyX2pdehYbcD02KP8+n50neEHovqLIdO51gdcav6t4+K6kn5KHOP
 pMsZxy6YLkfFLMLxe2l0VyniX3LAZtmxfYY7kcN4sptb6TOH8nZLr9IKcixMLgZdDWs8wlijl7k
 w5XwChfwrzGzwHbL1eomFrhn9KM0b7jhA5zYiHdt+itvEjiqRsXF4SwhGhmtUcBA5yMEGtfmjq+
 KONNXoi157QcAwjF+O2ZslrY/1u5F2hNxgsPr6eUa/5GhdhU6OWUuqfY7gC7+MUBGB8rEbHmAOW
 31VDIPSEqfWQlyzoDyFCcqxHfraWmSLunoXc4084K8sMvOP9yWuZAgia3X9kbrBDtykyfTdhBQK
 tdft2a4QlaurkkZfAxjnKPWxq6vwtuUsCy6m38e94t13LPfy+kc6PoO9QyDUsb566hl8gTlToO1
 u4UyTPQdhoSOB5Isdg70ZNUPJVc6dlhHqjd3voPM5g1DrD6gfCbH7HNUl8j8Z0WN6Whsd66hcks
 Dw4U+LR1b9kmcuw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:55:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7205

Recently added in BitBake with 378db0fdd95f ("fetch2/git: allow
overriding default unpack directory with a variable").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0a748c918..ae6402220 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -560,6 +560,13 @@ system and gives an overview of their function and contents.
    :term:`BB_GENERATE_SHALLOW_TARBALLS`
       See :term:`bitbake:BB_GENERATE_SHALLOW_TARBALLS` in the BitBake manual.
 
+   :term:`BB_GIT_DEFAULT_DESTSUFFIX`
+      See :term:`bitbake:BB_GENERATE_SHALLOW_TARBALLS` in the BitBake manual.
+
+      In :term:`OpenEmbedded-Core (OE-Core)`, this variable is set to
+      :term:`BP` by default in :oe_git:`bitbake.conf
+      </openembedded-core/tree/meta/conf/bitbake.conf>`.
+
    :term:`BB_GIT_SHALLOW`
       See :term:`bitbake:BB_GIT_SHALLOW` in the BitBake manual.
 

-- 
2.49.0


