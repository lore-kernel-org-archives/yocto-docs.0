Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D479DC83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 09:56:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.4653.1752573407074864809
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 02:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gLPdSN4O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 889F242FD8;
	Tue, 15 Jul 2025 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752573405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i5sB8OQWaKLYFGndA1If2zSiWKvzFEzC36laNwORbKk=;
	b=gLPdSN4O6XDzsJuw7YTJSg5vxxXAprx+303pBXbj/HMDvTXVfV6PyGnIAozZbPMihj94Rz
	Ner3Vy+ZE4Tpvj4ZlVTkzoFZJX3L5oTtiesNcT/sb0bx1sf/wXW26ts2o0V35BG9d6Xy1T
	HBztKccwzUHpuabssk7v5i/voJxnoM4zKdfCrBQG743xVznZ7/pB3MHEhGiQxqWqmRx98k
	lbX1zFOwMV5ZnCQkvOOdDMxvp3b77O5Rmp8RDBDIvdVndNxekIfu1/9GVqWiz469sItkiQ
	0c1/8J3FGlFUbXH4YKh+YSwp2KcPapl83gqOJ9bLEo00d+P1ano6qoZbBWkJrQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 15 Jul 2025 11:56:40 +0200
Subject: [PATCH 2/2] dev-manual/start.rst: remove shared PERSISTENT_DIR
 mentions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-fix-persistent-dir-v1-2-e3f31214b677@bootlin.com>
References: <20250715-fix-persistent-dir-v1-0-e3f31214b677@bootlin.com>
In-Reply-To: <20250715-fix-persistent-dir-v1-0-e3f31214b677@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Bj2HNt8OEWdErTN6npprMMG4vnASxBm2k42qNaZPlqM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBodiXcQd8Dq+k6FNdlX0JmHbX0WxE18+Mhy6jsM
 O+ftdxcz76JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaHYl3AAKCRDRgEFAKaOo
 NtGyD/wP5eDC9zxUaONjAL/Egyc60adUqJK9ns0AzzKReViCJ0S/Ttepu1dR0RmYVlhYivQRedL
 rFtwdhHqPhnz/UwxHSzf5t3WFy7U6jzkNn4KKrHwjGiUIPZWBd0J/jdhxLYVk7rJTm5p5WBsAV4
 YdNj3NAyVI7DOqApZMQLK4ggnG4YFxMcVdaB6L/l5EK63BuL99YYpqMSapEPwLTX6sK4OT/ctoR
 skvA/HcaV3jy7RmXkBRR/52ClzAUBr3VvbsriRmXCMLwcwXKXdORa+YGDpXkwbbSwdl2Nh1yUYs
 10B4i567QATl7GTFqCBK1rU4RsK8Q7UMzUdcC/druSxaU17AFpRBmMFdFJB+tsIo8QdiH8me5El
 0P4Cb21lcFAMQ8yvqFelNfhMMADgf4zdacvUJYTVaesUEbGRA4fJtyJFUY2sdCHy6V+JBUau/hb
 kc1qH67BR99XuIgXVL5kB7xYgtGcEvXbu45YkQHgMbHVK0u58OCtjg4Zv4aKyltKbLFfp8MWpA3
 VCagIIfr4UZpfsotEvjJ11U9ecyTq/nlXCmtRVBbdlYBAH++nwMBJSL2kInw3L7D4dns8cUKyCM
 qcf9rtJIjhtO+C789jTAJFNnFxu0AkvZyVhlABSesGHyGICNEqf5cTZ4ThddpxOs7tdUmgLXZj3
 G/uPaPL4K5Yz8aQ==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7336

Remove the shared PERSISTENT_DIR mention introduced by 3954eda78f22
("dev-manual/start.rst: mention that PERSISTENT_DIR should be shared
too"), as it should _not_ be shared.

Instead recommend setting up a hash equivalence server.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/start.rst | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 7aea3974a..e10367752 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -228,10 +228,16 @@ particular working environment and set of practices.
        used by developers in the same organization and share the same
        source directories on their machines.
 
-       If the :term:`SSTATE_DIR` directory is shared for multiple developers,
-       and you are using a :ref:`overview-manual/concepts:Hash Equivalence`
-       server with :term:`BB_HASHSERVE`, the :term:`PERSISTENT_DIR` directory
-       (``${TOPDIR}/cache`` by default) should be shared too.
+    -  Set up a local :ref:`overview-manual/concepts:Hash Equivalence` server
+       with :term:`BB_HASHSERVE` and :term:`BB_SIGNATURE_HANDLER`. A basic setup
+       would be::
+
+          BB_HASHSERVE = "auto"
+          BB_SIGNATURE_HANDLER = "OEEquivHash"
+
+       See the :ref:`overview-manual/concepts:Hash Equivalence` section of the
+       Yocto Project Overview and Concepts Manual for more details on the hash
+       equivalence feature.
 
     -  Set up an Autobuilder and have it populate the sstate cache and
        source directories.

-- 
2.50.0


