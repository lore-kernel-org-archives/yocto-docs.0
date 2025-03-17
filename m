Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E575C35FFB
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.47829.1742202394643463209
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NiavFIyb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FDA443278;
	Mon, 17 Mar 2025 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aYHr3fSHU+118Lvp2i1PWd7P0lZmOIjjVnzy5fQJOgs=;
	b=NiavFIyb355ZFZdvkNBKgbwT28GSGJEusWYnpqfOX9K2ZBZki9PIWmpb4qGfRJrt7+nG6r
	10QctFpOfJaOb3GmoasUvO7Ix1x6bBSZNxi9Lp6OzQYz/OYTsuIUf8XlynTIwWNICNqY4P
	/t+6AaNp9DMPr2wEr2AvWflzFoqoztWvfrSXXAMC4W2UFYYyDbCA6NZ1eV+s34joyv0qZe
	AR1u33zC27TRZmOjQvKj+BU5a/Ft5OwfVOFuvE1o/yU9Ox/2F3xB3wxdvDMBx2Yho6pRna
	jLMTKo93F9geU5yEk6oBrYRWIGURK58lzkh5pI/kT/bnlxUA3jxrbCoSB4LCfQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:06:14 +0100
Subject: [PATCH 08/11] migration-guides/migration-5.2.rst: add information
 about autotools changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-release-note-5-2-updates-v1-8-82b0a4182aff@bootlin.com>
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Ross Burton <ross.burton@arm.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Au0Uu454Rq9wjqF5jm4fPnJw3M9ksVu3okZXhtTuY9Q=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+YWCyCeNUb9uZsT06+Mq50E20NMWxvPo1JO/
 7KHFoT2iI2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fmFgAKCRDRgEFAKaOo
 NvKeEADCNBEVw2yuHNZY3eN/uDWeku+9TAzW3OUwN/M//d9duIUHYWi8uHhPb0BAvM/ahtuimlR
 r60TGJpQvbuMm7CdM4BEK47dMdkjwM7D3dbz1JB0aYDruSnn0hXDBVr3arcXeRnBMcyeBfOrBu/
 9SlYiBogGf7RG9O5HB5ggPm6N1pgmUrHDblw2PFJ75lr3N2D/r4OTCnBgblaMYqSwYeuhSjgpt4
 E9FUTwbqCDD2xUnQFiBvYtuOF+f4HimWGZy19GiO8/v5nG6mPDY4Cl4uaOjWEXpyEJYeVfQ+xEn
 oaohFVD5HuYZCiM01bqKan3FXfBEQzqASnkLoBI85zvIp0AkgkrYbEznabjG/PN5yCG0cWCeANm
 5Cbd9Ee4wzQ7iACM3MpRNMagmbugIKPnB1fhlEuwpZ4So1InIih4uMseNWeqZI7XrEkdCaz3ySl
 WHk//cKEv/ssSg2pE2hYhjBsuyeeB34sD3QrP6cEaUplUXS+pOtgLNtMpBbkTu0T8HxuQdQKRkX
 NhClzOaywqcDGtTvZLJkjhiC96ix5kqNLxVZ2GT8z6xiQtvPiydSSdXUIxBVVbuxA4IBmBRmV/E
 r2xMs90SeQcRrtQMAmTMYMyjdv09jdm4J4bw6uOddJSV2yzLZfcxCbLWgMoZnEY8yjDp0ryXT9K
 TmsZF2BbVXV0O6w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeludduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekuefhiefhgfdtheejvdelledvhfegfefhtdetuefhfffhvdeiudeuvddvteetgeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtohepr
 ghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 09:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6569

Original patch by Ross Burton:
https://lists.yoctoproject.org/g/docs/message/6466

Moved to the migration manual as it is potentially a breaking change.

Co-developed-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 75bc4dbc6..1b8e56551 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -140,6 +140,17 @@ replacing is not as straightforward. For more examples, see the commit
 c++/binutils)" </openembedded-core/commit/?id=4ccc3bc8266c>` in
 :term:`OpenEmbedded-Core (OE-Core)`.
 
+:ref:`ref-classes-autotools` changes
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Changes to how ``aclocal`` is invoked means that ``ACLOCALDIR`` and
+   ``ACLOCALEXTRAPATH`` are no longer used.
+
+-  Directories containing m4 files are no longer found automatically and
+   passed to ``autoreconf``. If a recipe fails to configure because it cannot
+   find m4 macros, then usually the solution is to set ``EXTRA_AUTORECONF += "-I
+   path/to/m4"`` in the recipe.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 

-- 
2.47.0


