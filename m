Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A10C87FCC
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 11:30:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.4866.1753788610821631631
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 04:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kXLhXfAw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A92743882;
	Tue, 29 Jul 2025 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753788609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZpn3xnOexifeJLoTGUw4kMbm5Y/AD9QaOC0206LRvQ=;
	b=kXLhXfAwKld8KpVm4yvs1JiCz1TL/ctXnZvdgcL3VZZT0wkLyzTtVZnKvlKeBMZS6+MN87
	cGN52aUjlyY9mb7DILC+ZpFJnE7h0O/3K5avUn7db06ZHLuLoI8pO4HhAHR+obciN7h9Zl
	2QOvv7FwDHNNcHX8Am8KnWOqF8ww4ni11DBeR2aDB4BQbP0nKl5l3r0U9aX4pAYzTapkm2
	xYHIJm7Urlrm2LGZ0t9zKZCL9avGZU3vM9V0jqYtedCGZNRWGyx88mT9I5k+gYgLsN6/D0
	5yp4CwkbsTvXhlUYPc5EK67L284t3yMmaVMJWy2a3A0yZ1g2+NY6Lr1TZv4Jkw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 13:30:04 +0200
Subject: [PATCH 3/5] ref-manual/variables.rst: fix the glossary
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-variables-checks-v1-3-5ad6ca9b9386@bootlin.com>
References: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
In-Reply-To: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1405;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9c1ll1xRom7PfDFD0GRRJF2kiq/a7tn0U6hyez15xdY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiLC/7yGVZN8V7eXf9Ze150taEI2tzey/MXY9k
 k2o7R5YXxeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIiwvwAKCRDRgEFAKaOo
 NhmYD/4xcvlrKYh78ODLWpq3yupAVV8VkJWmLKhBfXbgRqL5SK73M9/u2deXdRzrQWNU/2JN+pK
 YB1wJjulgyaBk2e8HXMqPVxjEHVnodLRigVs7ATQP2v5CKckzxZrrIkJcb+h672pptqphy/zSGv
 JrEKz7C3Z4Kr5MtumXVE5aZU8Nt/wAuebkclOCWskc7QfRb2AXXMDr67I+KFAc+EBh1VT6wr0E0
 PB1+LZaY2JxdjzYgprhp7uxmKAoeJ52fbsFA9HHkZP0xOz+ochdND5EYusltIwkAMXR7WLoE1Fu
 CRiGdExuIFCQC6H4ITcqCtZYe4nahyLyhEHPo7d+Pw/Jd6ngXAEJA8vYw6lbQzaa9L1ZUvvoBxx
 eyX/uSMCGAWKKg52zs8qBrLTnfIWPEQ73UQOvlm/i/zyEH6kXRlBx/OiokO1wp4aMc9KwyAU4xH
 1d2dtKWgRdWOjV6hwVQxEsa90MVac3PPQ6ZUHSAa8t2WuCUP6vw1QI3x0MxFVJOowIDLKVsRe56
 fU3fsmZI1yakYssFE2Q/nYjRH1fuP3p0whucO9O8n0Ddg2YMfPHQfmVatIn/uicjVPJpyWDMWHm
 gCaoLYzWr4S2uTvtvWvhRGekuI9pC8r9EpS5kPqLv/9Hqhbxur6jSONFXi6m0uR3O2pDKer0Wbj
 TmpoDl2ej9aVxxA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 11:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7416

documentation/scripts/check-glossaries returns:

  WARNING: ref-manual/variables.rst: The variable EFI_PROVIDER shouldn't be in the glossary.
  WARNING: ref-manual/variables.rst: The variable ZSTD_THREADS shouldn't be in the glossary.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6c2344950..15ca6543a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -11,13 +11,13 @@ system and gives an overview of their function and contents.
    check_glossary_begin
 
 :term:`A <ABIEXTENSION>` :term:`B` :term:`C <CACHE>`
-:term:`D` :term:`E <EFI_PROVIDER>` :term:`F <FAKEROOT>`
+:term:`D` :term:`E <EFI_ARCH>` :term:`F <FAKEROOT>`
 :term:`G <GCCPIE>` :term:`H <HGDIR>` :term:`I <IMAGE_BASENAME>`
 :term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
 :term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
 :term:`Q <QA_EMPTY_DIRS>` :term:`R <RANLIB>` :term:`S` :term:`T`
 :term:`U <UBOOT_BINARY>` :term:`V <VIRTUAL-RUNTIME>`
-:term:`W <WARN_QA>` :term:`X <XSERVER>` :term:`Z <ZSTD_THREADS>`
+:term:`W <WARN_QA>` :term:`X <XSERVER>` :term:`Z <ZSTD_COMPRESSION_LEVEL>`
 
 ..
    check_glossary_end

-- 
2.50.1


