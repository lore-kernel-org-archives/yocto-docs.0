Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5AFC3600C
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10703.1743167257365951161
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A22nl14+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC02B441A8;
	Fri, 28 Mar 2025 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhG+ILCikt3P0dWV3SRef9ELKTW1+gjNuT2eZAzyWzM=;
	b=A22nl14+ExNVfjZkdiL/oC9wkEeR2p4DHq5mn0zXRYmddNbx0XpFzumWcJHj0+vPcRLCLn
	d00Wsvqua4fsJW7U6aRMa1ekZ/QFRwp7lDbo6yYeOLtK7adyOH7U6axYAWfZZRHaDOLjSJ
	/3B8+2P7ZY2+pgvWgGudJCwa7aHDr980l+nVmKEbicSLdtBrv6RIr2/s4ua3cM9c5dDwEB
	Q86wDnRu/xoJQOXYoPgWApmbUVUKoMzdNl+ZkeSA/UsMDQPca+4y6SpuLMTIlXFTYnKxsH
	Foy3WDtNMuYNqjNGwvIBgzrPwvR6hCeiOx68KXt62fN9Z9/oX0jKCIFbsREYkw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Mar 2025 14:07:12 +0100
Subject: [PATCH 09/11] ref-manual/variables.rst: document the
 GRUB_MKIMAGE_OPTS variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-release-note-5-2-updates-2-v1-9-c913513e9140@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cid3Pkp87/wRe7r3MIa99YxFEzqvI2yjWFKBvgAGG6s=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8VmBYkqirVu1jWMhNYsoc92Yq2UIzAngyJa
 Q8eOUEEagGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFQAKCRDRgEFAKaOo
 NvuTEADNepQVSPTj5F52ImjDylvQ6GGKF8I2J07DtLrLsuoM/m/mOG8wHJkwMN5fJZh5Ag37YeV
 ZQH6uct1dEP7owhTvrUeGJsH/reFDcs+PEshbCxEyesn/eK70syBX48wncceXStarQHwZY+dWqB
 RWDceK4tzZqY+ceFb16cG+W1b0FgJPEJtXD4UP3ndTVoR0w2HF7UocpSOaTvXDH0lX4SgxD0Qiz
 zVlOJm6O2G++BBGO6TLE/OgtJ/aFNXne9pIIcUJJx5/DxmhyGftUp2gCwIkkB5znKMd02VdjOrP
 zdJ4su6sw5jIaqLwz4xtp47CiuCioSPoJhXoE8gAExsWSba2dNjax+vbJlvo08StnoaVSvng/1X
 6x3BC4+Ne9WmvMQ6ncsKVlrnNc/Bn0pt1bezijjDhrl4ulNJsHktNS25h/8OCrwhixFp96/Xrqq
 GeAxy8LTtjdHNJnR9UNPYA/pKws6rBnOlm4eNZntadILdc0s5gojcD+TbXsyf0HcfO12ECQSSmp
 uMPjk1CTkbKuTZHybuJXPyFb92tWcfYSb9+VKu0LRJd/V/hqCqVu55Ya2wl5Eyh9JN1yTsF+BHi
 /nLctbHXJNMzr4e0XrYEXcSVgYWwH9v6JDVGhkF14jgPt4y4aJ/YcqPfiKoWahDFLEobiMKcIDc
 qu/8sPmnOnv+moA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6664

This new Grub variable controls the options passed to the grub-mkimage
command in the Grub recipe.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index dace40f59..20563d61f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3435,6 +3435,11 @@ system and gives an overview of their function and contents.
       See the :ref:`ref-classes-grub-efi` class for more
       information on how this variable is used.
 
+   :term:`GRUB_MKIMAGE_OPTS`
+      This variable controls additional options passed to the ``grub-mkimage``
+      command in the GNU GRand Unified Bootloader (GRUB) recipe during the
+      ``do_mkimage`` task.
+
    :term:`GRUB_OPTS`
       Additional options to add to the GNU GRand Unified Bootloader (GRUB)
       configuration. Use a semi-colon character (``;``) to separate

-- 
2.47.0


