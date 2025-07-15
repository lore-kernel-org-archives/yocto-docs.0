Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDE5C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 09:56:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.4652.1752573407026756711
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 02:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cDodh78A;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 440A7433D6;
	Tue, 15 Jul 2025 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752573405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7oi2soAto+PlQSCIuuPofn36G3FLmmXM1tznh5Cet7o=;
	b=cDodh78AnC9DSTWNw014f94+Ov28X1vCWSEcJBn1s8Dk6HDPEtXn5cbNRnO5HxnuRa9bb+
	K5aZ5a+vT7jTKDkPDiwYQyCEXlhVKmNwI8zaN42w2RkuWR0anSB3DK6Gp1Dajl91Ni0XA0
	PS9OFEiXLf2F9wwFBddrgsajtdocI/GVtK5gvFUWlqDd9f5QbPG4f60x8vckd1J+MiC0aF
	5yrbkQwy/4PUoqdR7PZX0BPPO1KA0NxQm4PdOG8DwiXFRswiI+/Dyp3fPe+ChQymzE31zm
	iiLeKSIjooicDb7VELYHPaOM1kbHff6PpZfXEmuKalXiqVOcWQGTkilxVzA6bg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 15 Jul 2025 11:56:39 +0200
Subject: [PATCH 1/2] ref-manual/structure.rst: remove shared PERSISTENT_DIR
 mentions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-fix-persistent-dir-v1-1-e3f31214b677@bootlin.com>
References: <20250715-fix-persistent-dir-v1-0-e3f31214b677@bootlin.com>
In-Reply-To: <20250715-fix-persistent-dir-v1-0-e3f31214b677@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/gsEL0XGmX8T4Q1aTo6ZwcxwBrftqfNuRzs5XYn6gDk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBodiXcjqb6FseusryJjo5mBwILgnY/k5SzTbEvT
 qRKpE4Y/dyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaHYl3AAKCRDRgEFAKaOo
 NgNQD/9/bI8F18busrCsXwpstYc+bf4UiZ2WNz7OlJyvDStqycmy671Ospk98hMYq223rgF1WMw
 +O+iQTE0me+sLm7T8SNrimNICo1a/1UlvEt1Xqz+fTGzvAvDCvPH/IF9YpL9E2Ksaa8JkmLt/vE
 tyYTGFgimL8tDsOyCft8vdIbRtPjUo36eB0q+1YNQUyMjODqx41psDzoXMV49WmBed25VHrW+21
 UkYWbzkWQt2ulyxKPaM/I/mRgOlNSpomMemmyXSQRcCqaBVxHvi1hCrQvRAKtJEQlU/dCudOibO
 MwbvE+EVcd6/ZEKx3SCt9y4NaJhGfN1K8NB6qM9dqfCOLd9mcIhm5kkL8bQ+pJvPuMKwfeyWPTp
 3k0JaP7OYrrXLFE1xy/dpqo4bipdEtDBmcpmd1PTaaPMH3p+/hhKZyitP3xOhmhJH9zL2QmE6+Z
 9c+2eidXaQ/JLeHheOgpjCbIJoAJD7hAd5aZlQBLz0LOPK0wygfVrw1YD9ADfEAlzb1Vf81Ne1V
 Ytvu5oG0dsimQ9BIqSg3kIbHvAvO21maQd+Jv3ByyKuOeNKL98239dTeuhMwICpyd2D3w8tQcJS
 G57LyHrizLjbXfVT7WBzqiHWtiX26sT0iEnmPmoX9M1HaW+eIeA4t3nN6Ki31KiLuuOo19m/R4d
 Et09o3d56j+xoHQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepmhgrthhthhhirghsrdhstghhihhffhgvrhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihot
 ghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Jul 2025 09:56:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7335

PERSISTENT_DIR should _not_ be shared, I got that wrong in my previous
commit 741aa29898dc ("ref-manual/structure.rst: update with info on
PERSISTENT_DIR"). Remove these mentions.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/structure.rst | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index bf23e2cfe..c9c44bc63 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -365,13 +365,6 @@ directory for multiple builds or move the directory to another location.
 You can control the location of this directory through the
 :term:`SSTATE_DIR` variable.
 
-.. note::
-
-   If you are sharing the :term:`SSTATE_DIR` directory for multiple builds and
-   you are using a :ref:`overview-manual/concepts:Hash Equivalence` server with
-   :term:`BB_HASHSERVE` you should also share the :term:`PERSISTENT_DIR`
-   directory. See :ref:`structure-build-cache` below.
-
 .. _structure-build-tmp:
 
 ``build/tmp/``
@@ -411,10 +404,6 @@ modification time (mtime) changes and hashing of file contents. If no
 changes to the file are detected, then the parsed result stored in the
 cache is reused. If the file has changed, it is reparsed.
 
-This directory and the :term:`SSTATE_DIR` directory can be shared for multiple
-builds when using a :ref:`overview-manual/concepts:Hash Equivalence` server
-with :term:`BB_HASHSERVE`.
-
 .. _structure-build-tmp-deploy:
 
 ``build/tmp/deploy/``

-- 
2.50.0


