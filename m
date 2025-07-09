Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A7FC83F12
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 07:58:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.10193.1752047874884345029
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 00:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QqhWf/Dj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CEA944212;
	Wed,  9 Jul 2025 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752047872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tb7lumrTykK+72AXm8+NeoU9p1VcpUvktkZO2C4HOkA=;
	b=QqhWf/DjD6q+/itnZoENRZrJPFN0tiAt3IdOi6NCpLQQ7Bp4WxM8rYqWurYmuPlt6iaY2d
	7VN/h3PF7P+HgFhnq5bN5CcLSVAo2IfY7R3fRS6is2tvq8TaxIiCKmJ7Yiro/j8mJYWSUu
	pQW1Q5Lph99oRGWdBsF6FTklrJqCcYxhVSQeAuEcFmj//7mmm/Wx/DKW4RgKW63bc39RVH
	p7oOYCR/tsiZQBPBou1vxrtZZXVlf2Xg/6dLfz3jkvHa7OSyG8Qde6+gVK5EqC538DXEpU
	coMYedV/9+a5K87tQgrZutv6lBTR4VAME7dG6J+0tD4Uyl43qoFnk3DOXKgrwA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Jul 2025 09:57:27 +0200
Subject: [PATCH 1/4] test-manual/understand-autobuilder.rst: mention
 hashequiv server
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-update-sstate-dir-docs-v1-1-9114688f33d1@bootlin.com>
References: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com>
In-Reply-To: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=NAm5dbwL4cuafziuWlEMhWAlSqPA370ilFi96uDWpz4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBobiD+32iEWwGzbOCq0r3sbNWPWhxAj/e0rgKnU
 0u0Tnb9USuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaG4g/gAKCRDRgEFAKaOo
 Nsa+D/0c69gn57Y0xSOpHrSXmHiZFf2Lc4H9LHyqZVvcfhyHKdS3vlbBXZKpZmk3AHVFNozqHWX
 VNUnFz1K7GBTXRhJm6Qrq30yDR5+gkKyMW7dHzhFwQMD3YvYVykqPwIiUEQX2ma0n75QbK7J8c8
 rkBygo+r0s1qZaOduDeLTb4Vv5n44b4LqIMK7I2YPpDauVwFqF7JhOAkwDMBrnEtFzFiuX1Kf00
 bcsvtB68mQYwH+iQ/d767p9LFgGPJz2fYfOW0OJvazVlAHIkEA7T8yDn6JAKM6XB7XIfBqVIg17
 CsUSbTUL0eI0thDsREHVyJ/vyo7WEDhWzlUJckQ3gwPLNjejFh7gmm97Ms04v7CTkhQokj5Uu1o
 efk1X4+kITgdZmsI6HRlhAoObcq5jdPQg1k6cx8hHxkLgYAfqijp8npZculw5ljlldpSukpx5el
 pS4xj3NHW+7nBAq6/WdksMb/QbobREhXkkvBrul/qMYocCgRlc0w3r6QI7DWVSotVIqxVFOZZst
 NN0zM/xZsXMbaXaaIt/qGhw2u84dkRY5cPw/xyhPdihKY/pkzJ43W9Z0WO2MHhos51+WglRVSLh
 Ki7fzrCcbc3cUHRkkbOU7JXkaaQFGWJNwHZXMtqa9bpe4vXkEpDTZkRzCQwmPS4onXSMj+KODM7
 rz3OyZKdJfU0t8w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhro
 hhjvggtthdrohhrghdprhgtphhtthhopehmrghtthhhihgrshdrshgthhhifhhfvghrsegvfidrthhqqdhgrhhouhhprdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 07:58:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7287

The autobuilder also uses a shared Hash Equivalence server, so mention
it here too.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/understand-autobuilder.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index 7f4d1be3c..23b3ef7d7 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -184,6 +184,12 @@ directory to be shared between them. This means once a Worker has built
 an artifact, all the others can benefit from it. The usage of the directory
 within the build system is designed for sharing over NFS.
 
+Shared Hash Equivalence Server
+------------------------------
+
+The Workers all use the same Hash Equivalence server, through a common
+definition for :term:`BB_HASHSERVE`.
+
 Resulttool
 ----------
 

-- 
2.50.0


