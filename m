Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B63BC35FF9
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.47916.1742202393888205386
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=efItEaq9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 758F943295;
	Mon, 17 Mar 2025 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jOaBx39KKS5kgktusoHUy9NkNysN7x6+TJL3v18wQfU=;
	b=efItEaq94twyVGtieHj0Nw+PmquIx/5tAvTRoixraX0ZyZeN4wi62lvwIzHiTlCevHhPB8
	9VJhZHaAF3ToRxNwX9LLW5Dd2r+xFM32jhtlnvAuuThLOSqJB7wErxVi3Ej+XbJ7R0OYKQ
	cokz96WHhhbYbYTdFQoZZZg+0N5tDyUzIYqYn3OvgltfKpLR7sFhZxCfvawHCrO2g4k/BD
	Yi+vNi/CLaLtLDTl31vKJ63lIUo57vFU9y8jf2Qtep2gDo1Jh9M62RFT+XbY6RVEee/5rK
	EKpzMMuFIqeHfjbR8Y8pX3aC+HAzZsAtfirHJMfR6uOq6AwkpxzDP7bEbmkTJg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:06:11 +0100
Subject: [PATCH 05/11] ref-manual/features.rst: drop ld-is-gold
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-release-note-5-2-updates-v1-5-82b0a4182aff@bootlin.com>
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cvgkulSvpEx3+ShPw9syjHi8QtiJVc4csfQx3ZTtSrQ=;
 b=kA0DAAgB0YBBQCmjqDYByyZiAGfX5hbIZ9Dm9oMJMLHl3GewE4SQhMwg4qjg0Y3ub1hzFuzzM
 YkCMwQAAQgAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJn1+YWAAoJENGAQUApo6g2iSAP/iIl
 rp+Zpyqp/4mQ/ShgjurEn/ym5Tm64ktmtxDGysqqWE6oTgg4H/Q1sHJlT8ZFHw9BwXlnJ7APfZt
 b1ZjCUNCU5ss1wIuN0XG4i+DynEk42049ZkUl8Gwylaelv4qK6uriFRfG+mrROAolJWiPeQAkMk
 oSTm6lQ6X8skfw/2eEcou87jw50V9MvZYzhtMQlYMgzxaPLFokvhvRRKgLvTqz9oJyUlDv2SW31
 SUmb3qd9qAhCO6sGNVr45Z+2NxIUonLtbrGJrZ3d6PaJZg/lif3ar77PSoyRwUwvXpoaOgHC/3u
 VoNd4tp0MiG6uQZWMKC2NTzhW72faWMWuh83IAyG4e7SCFwhSI1xwpKG6783asoJo3Lxuvyt4Vw
 GWoKwfXMZFAF0mU9oZiJKIN27964YlwVOLUO0uX14uzrZKYC47L8/N2xtOdaZlnAOdED9GvU1lr
 JK8ipQSvuOGoROqd4y1kHpQCq2k/pEYEpXruzIrmTyC//aAC0ukcqo8ntezDRAwesv4ijTIbUXu
 E9bQY4F+2Pzo9fGL4nGkInx4FwYkj73ghTTL/YXWCdUXn7XH9SPGnhYHKDbNVlg9TCvkl26mrOQ
 kJKaRn6uEYV5DiPeRrMN0wS4cpahmqNlyb83tmTQfr8bz2sQtR6bSdmypmAy6smEZYDIYG4WM+n
 I+w1G
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6566

Dropped in OE-Core after commit a4addb9ab630 ("recipes: Drop ld-is-gold
support").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 746d6337e..2c074ab9c 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -167,9 +167,6 @@ metadata, as extra layers can define their own:
 -  *multiarch:* Enable building applications with multiple architecture
    support.
 
--  *ld-is-gold:* Use the :wikipedia:`gold <Gold_(linker)>`
-   linker instead of the standard GCC linker (bfd).
-
 -  *ldconfig:* Include support for ldconfig and ``ld.so.conf`` on the
    target.
 

-- 
2.47.0


