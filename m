Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8D4C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 08:23:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.6574.1739435003559138251
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 00:23:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k+Oxg0w6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28644204A8;
	Thu, 13 Feb 2025 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739435002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvMVaWTl+ElqUpjf+YiZfefmM1ZbbGqad6OV3Zlrpqo=;
	b=k+Oxg0w6QL5mtEWT45/MNZ0y7zBSD7IUraqCUUznC3QpQOBymCeh5HguFPQSKUzcyeVscu
	1nPJw7qe+tU5T076w1m3vHskmYi6ZTicucxRDAbRoG0SHZwsl9VA68l8FDaFEjDkbiDJSz
	qBiFbIEAo/ONWhxcxXkeX3nP0j5dd1skkn318ipKuEskQdUr7wk1Y3j8MDWmB9gbqDUIlM
	m/b82KrmI+x/35bV3rf2PpJUPFWh5rKb/EwbxPzK9AyxbC8c5BO/jbTsziOraAfd4IO8rY
	8RoGWsHLffERoJ6lJjOWO+tkMyGp2vEvuIgOSt95JHcCUJf1BdQbx0sWanDlEw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 13 Feb 2025 09:23:16 +0100
Subject: [PATCH v2 2/6] variables.rst: add a reference to BB_CURRENT_MC
 from bbdocs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-multiconfig-doc-v2-2-f2bd35115cb7@bootlin.com>
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
In-Reply-To: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RYSloyBLGtr9c/1aoXZmtiBHTMSYZkiSgPmJzS8NhD0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnrav4Q1kKS2m7hZ4rRHpFXW6MtRxrRELQ7JAMH
 /8H2G2krNqJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ62r+AAKCRDRgEFAKaOo
 NuuVD/9pAF+z1Wcb6RdE7a0RsMuCDFtBCsaN6es9rkK8Cut0QvJw3Yek5tLKtxj7BVjEAnL4c3R
 fyej/Rh3bXUx42aYxYR4wyMNUojbe4Ky+ZQA89Kj56jKhwy3vyKGRsd4F0lhJekXMVhuMLkoA25
 GJK8IrSKaxTl79kfW14VTNIJbL2qgPFcnUgH2pkgTLee8f6C/Mgs+4D+rzY4hyHu5FrluBjb4cb
 nthLBpJQFJ1ia1nfJ+hJaQ3NvooZhk1v30g6uxy5c3gES0Dh0Wh4V8g0dN/ZPGpZXJOKwuyU25p
 Ns4zhon3R3yiya95FvwybBFZuqjafIUYUZrRnhv3qEgNP2I2p9iq//YJXCDKQZDM8a+Wam5suzZ
 VdtCGIcJejROBz8MbpOdFmvZP4pg4sXD2ClfKajDonk/FORxxFXAG4S1Rpfptgb0ErTnELE+Bgs
 AsbJdClHhiOLf0OYfF3tRhtywTDEn9VjBiKGfFKLwK1pgSxEkL9Qrv0pNm5eide3zxBZOZFFKug
 HYR8oNyDCnfTdjFzGKgKRVPtO5OedDyW88uRG1vpu6BWT7IYILkwsq/Uz4umTF4zy5U/pTxDwmg
 8iD09vaWRfcSzoxRe2hqRnpsdLdfUh/ChxKSorOE+kE1TLhdIxkACLcMEBtAejbZzSyTkJVgr/I
 XQMTXLQv+oEuwfw==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6357

BB_CURRENT_MC is documented in the Bitbake user manual. Add a reference
to it here.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8..a402815b6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -390,6 +390,9 @@ system and gives an overview of their function and contents.
    :term:`BB_CURRENTTASK`
       See :term:`bitbake:BB_CURRENTTASK` in the BitBake manual.
 
+   :term:`BB_CURRENT_MC`
+      See :term:`bitbake:BB_CURRENT_MC` in the BitBake manual.
+
    :term:`BB_DEFAULT_TASK`
       See :term:`bitbake:BB_DEFAULT_TASK` in the BitBake manual.
 

-- 
2.47.0


