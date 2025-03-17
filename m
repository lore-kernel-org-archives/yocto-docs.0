Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C41BC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.47827.1742202393340852167
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LM2/F5C6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3AE843289;
	Mon, 17 Mar 2025 09:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkA2Ke2DwxUAWPDEY/NulmKRyXTk39o/k4VE2hMPrwY=;
	b=LM2/F5C6fe0Am4rsn4k8aHmlPgZ7ktbeM9h3jSq7xS7D80YfA3/h++UgTQl3T4Odlehp4B
	bb9xAaOc+eINYSio5kR5KEQ2Xfnggqg1U/gVJcnVrBMHUFn2vZwOF2tqlF8nhSb0wMp4g7
	Ue+RsmhTnnxAVZZr5p8DiPlhbDT0W5NaA80ogRxdEnM7GXRolrW3hns4qm4QB652O7Gmz9
	pZbrQdTtipdbaY8I5Xg/PIQy/LW0o7VZBhcseO0KeyQ9s70akGUX03rFkTrmwTBIFp1FGO
	BxMdVpknJcaIJnzV+1D8O9hVJJzEOXy9J4TV5xWdimjx8PLPUfbJADSOq6T0Ag==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:06:08 +0100
Subject: [PATCH 02/11] ref-manual/variables.rst: WATCHDOG_TIMEOUT: fix
 recipe name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-release-note-5-2-updates-v1-2-82b0a4182aff@bootlin.com>
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=bSAzenfajdWDx0YQtBVGK3wPDE8yEgMY/Ed47I4JMjQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+YVIniQqzOgPFLFt2FrZComUUdFuDamcCyrA
 3MnFlEDFDOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fmFQAKCRDRgEFAKaOo
 NpG5D/97FaMsOneVz7FSMscBtiJU6m+otOWQEY1G8no/gUJqdspfNXT/qLsEweBzvyfuz3+vuX7
 3DKAIybvf6znbemlpYo1TX2M4FjVSATaW58YrdkyEWOo8iBmN9bv+DXGK+WyMSzRLPR7jwsS+6u
 rc6MRgjWbMa1/VsCuR3EgNLVvKYpQcCOoA0vyCJUoiNIcBYyfw7XRQ2dhtKebop2lLepFmmuWa6
 EY0ZeILyQ1ckX+3y+fx5LoxE03doqpn6ql4TrVrkcg5GxrUw4Uq8uD5idUdxffeu7BwZTfNic/U
 hCOL95FhJusLgm0o4/orakHsDdwBMu9q86v3ETZH2lf+kf0w9zoRYKL7pko5N2CRzMT/rWirkK1
 OrLZKntEky/315OQ6kW6nEWPqLsp87sWb6X9FYDmpSBjlmbi+n6GxElE4iQuiaR/ogqMFNQqa2i
 kDRzI2jSBQX9TJOiP4SicoSvRros9t7FoXlYhkXk/3JyAPx7xgT6pqqwz+qiP55pCLy91Y5WNMt
 DxYqb6PCEFNVr8RFuNaSiRDvGLzVmli2ExvW02lvd3VsFfmojiG8Lt6YyTQcs9O0hSZiRx/TYrj
 n5VbUdIfpnSQY0WXRQdjAAdQJCN7nDxctoYVZfPpz5brVojvjoPrV7+7zdQyRJp1kLUmmsg+I5M
 SPxbf6+voaxC4Eg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeludduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 09:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6563

This variable affects the watchdog-config recipe, not the watchdog
recipe.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b697a4e2d..d839c9702 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10454,8 +10454,8 @@ system and gives an overview of their function and contents.
       ":ref:`ref-classes-insane`" section.
 
    :term:`WATCHDOG_TIMEOUT`
-      Specifies the timeout in seconds used by the ``watchdog`` recipe and
-      also by ``systemd`` during reboot. The default is 60 seconds.
+      Specifies the timeout in seconds used by the ``watchdog-config`` recipe
+      and also by ``systemd`` during reboot. The default is 60 seconds.
 
    :term:`WIC_SECTOR_SIZE`
       The variable :term:`WIC_SECTOR_SIZE` controls the sector size of Wic

-- 
2.47.0


