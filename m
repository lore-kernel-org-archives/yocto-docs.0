Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4736C021A6
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 08:23:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.6628.1739435003769287091
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 00:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Osh6GR3I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AF10204A9;
	Thu, 13 Feb 2025 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739435002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6yL9aWywCtm6mjJMxAJU6RWzRSeuy/lAyt5VG5AFZU=;
	b=Osh6GR3Ix3Is4WQ7au82Yg/GiJ+MQrRCwibV6H47CxpZD8te7pjU5BRszY+bxeQfDuAnZg
	83jWVPaFexnBc3KEDI2uUtztjmJBmVVG6NN77Gy//f4NwrDjgomnigMJGQDPOD2P+36qQa
	8fs9y9HpF9YC2UE9RSDDbkYWpObLb16Cml3SJGrcNOWGR08UG3/xaRypdelkOitzbhoJpj
	KiBLiy4lSlv3wyz/tlbSR4UM6PNPhailYGuRx9mn/a0qzk4aA9Tke1siPi6k2xDcXNSV/X
	wI4ZU4yPDGGkiYX64TbsmOAkQQrlnRz3kvCYoLHllS1VlafVHBVSq5LP8o/0XQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 13 Feb 2025 09:23:17 +0100
Subject: [PATCH v2 3/6] migration-5.2: fix references to BB_CURRENT_MC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-multiconfig-doc-v2-3-f2bd35115cb7@bootlin.com>
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
In-Reply-To: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=k5dWHSw5q05d/y9H0jcpGnWNPvRlGF8Y1Xvjq1F6z7U=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnrav4LLQwRQ7OrHwFDdCqde7Ud09Am1OzTQ4Dz
 6NV76rFGWWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ62r+AAKCRDRgEFAKaOo
 Nj4BEACDV8POc42bucFzxQ/2jJ/qAZE8gFbZJmRdEcIhaggjFlZWmj9Zp0dgbTNf8GpRGZgkBUt
 bfPZiXNrwypAhHtjWo8yol8z3HGMlI3k1hOnlUepWUzujDrzjjRym7ziqTvtMZN7l8gg7Um9Pub
 UWfKDAmrFFRK2gHJrp4KqxrILtjrFeHNg5gsGNvGbQCXZOXSpZHiH46x7wI7d8n83YwCHZVwM1N
 qDUmxWQouIoZeY7Xqq85FApthj6x66D1gYzJYkE5uRhs4U68DXjslkJ3qza3aVczDy2JmmuB4Gj
 rjoLknfCirSY4A5YzuuDw5xmCp1vhs1QZ5hIwtzgTPARY4ZBIWIdY2Sz55vLCo8FvUOfAhc5cv2
 /uNe5WFd8A3RXwNujsUCn/KSrur5MoaOIBxihWB9CZ5NxAdt4PWks3egpc4YFzRAWlOhkfpOaNr
 8UwE3PheEi22vi0YmvnEIjMSLQqhCsqaNRZW30jmxNnxvCvr5BkmjS/8RBfAoIar4TSAsDMXxQQ
 /HHYPRnlKaQoZ8jOwLCyVWkTd8WwLAq6vPdwo9Pm84xXCl93T37LaljEF4SATWpPCnxYaX8FVvi
 WAdPGSvsiDw+4pN1fMT0eHSGUx8HuSLaY4pyPLO8TEDxhg14H8Y/9RlrNiVqJ98gtOlwaPd+xa9
 iyM3A2YA4xGY4zQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegiedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Feb 2025 08:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6360

Now part of the documentation.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index de2ea773e..75bc4dbc6 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -97,12 +97,12 @@ systemd changes
 Multiconfig changes
 ~~~~~~~~~~~~~~~~~~~
 
-The value of ``BB_CURRENT_MC`` was changed from ``default`` to an empty string
+The value of :term:`BB_CURRENT_MC` was changed from ``default`` to an empty string
 for the default multiconfig configuration to avoid needing to map the values
 within BitBake. This was already not happening in some cases so this fixes
 some obscure bugs.
 
-Any logic based on ``BB_CURRENT_MC`` equalling to ``default`` by default should
+Any logic based on :term:`BB_CURRENT_MC` equalling to ``default`` by default should
 be changed to be equal to an empty string.
 
 Virtual toolchain provider changes

-- 
2.47.0


