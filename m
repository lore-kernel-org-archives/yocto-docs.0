Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761F5C87FD9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.3507.1753783014132399788
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kO0pRIkI;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADB134420E;
	Tue, 29 Jul 2025 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ENzv2g8DOHPYyP03BQI2tRBrG/cRFt6AB/w7RiNZmEY=;
	b=kO0pRIkIL7ngDrSPW9tVj18Z0hXPaTm8CPogYEhrOwd4wwKZS6QU9XDhqZlpltBhzv20HU
	tOh/0+rvXXZIous0+LO4ZFGxwR/klCVhX+pUeHHf2UxTqlMBjs3adzVRQqkTghz+Rg/n+q
	lolIxwuElWwz6WWuzAVDPtG8tW4pfqPytDxh4Euwx3fKprdo4x4ivHuqaD6o+MZI8UOZzI
	9zCKsj0kG5RDxMw4g9EVX8q66TeNnOIS5YoqeYjJeIcPaCRZEHOifagcff/kLHXmg7y7kI
	NWQ7X79SZh0lRqHes5/aVdt3qp4ZLnl6XWc+/TsMSSrUjmMgkG/8TKVkVDTmpA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:50 +0200
Subject: [PATCH 16/19] ref-manual/tasks.rst: do_package_qa: update link to
 qa checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-16-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BpakCkNND2TPRt6jfg0CzM1cPqEqs0eSvjn4g03DAsw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrgaDeYrAGII1qbWeNpQV4b5dmMZ7bPgDddv
 AAUvlKZup2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia4AAKCRDRgEFAKaOo
 Nh6qEADCP/gaorSe9dRB1k5T3Xi79zhL6gCLUucfuNV386ucNRl/PPpnB9Ef8ro8L7Ecoy6pIJD
 tMtQLTWcoH9+hhBAtptAj03AI/F7Al4gv3B4J05LqKJfFLO2GacVXW+SniaEvA91KhBVEKnvTzx
 J+Jlk3pnxiNm0rR52+aKw4pN3ltxzispQ6NDYY7QDZEfrNa43IYEBLL0u6zYdcCwdEvwjfj6xoA
 N6Ez33sdv2mVpssykchAE1svC3Gu+wMBlgZ1F8IYVn/UFYc/2yx5OaDcjJE/lPojVGhocHU/lZs
 y1Tf7QTY7SfbnzXOB2Se2LJH0OASoDc4IJTNTNz2SEO0r7oqm64YiMbHOsOinbUzK5w39rsyH3R
 xtv7NMgoo2I8u6p+uN0OULJIM7ZfzVGRkCyCk2X5vJr/lWQVfpXGG+xPsWuEkjjIGtdowjep2uz
 kl7H158v/R1dGqLSUmQYVrwQwcP3BcUNZMZfewZ4MmH4SfjWejZu+Y1el00QDYuKGn4vZDCe2zV
 R9SmTBGGaCBSK3nbx2NHjXZuTnPAVkGfY8Z3bfX7gqjALpoedqHXb6+NsRj2bgB2+ewNySEDHHj
 clKar1DRogjpZF98YLUPlXVNKomG3+0PIG4gEPp3SXF4jFmnBJXzB9CRV8mVJnV8ElEv4pgk1Ox
 35Nx41UHbrER4Zw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7407

Link to the updated qa-checks document that contains the entire list of
checks. The insane class was recently updated to remove all its checks
description and move them to qa-checks.rst.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index d7b19e04b..90f70c1ac 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -225,7 +225,7 @@ section in the Yocto Project Overview and Concepts Manual.
 -----------------
 
 Runs QA checks on packaged files. For more information on these checks,
-see the :ref:`ref-classes-insane` class.
+see the :doc:`/ref-manual/qa-checks` document.
 
 .. _ref-tasks-package_write_deb:
 

-- 
2.50.1


