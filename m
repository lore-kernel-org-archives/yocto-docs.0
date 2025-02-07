Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045AAC0219C
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 16:29:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.73794.1738945738245425545
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 08:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LPFXvXF3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8C2444338;
	Fri,  7 Feb 2025 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738945736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2EcxpaFiy54vwd2m0AQHfQbxv+ib1OBmSZn5TFVrlNE=;
	b=LPFXvXF3G+AQlumaBBYupLyDDEj0a4/yMdisvJ2OYW33CKG91MltF5VGnkAPqqfmlGfj00
	GzHsDd2M6qdxr7TMOk9tuXWPJfj6rnZyS5qE8Kl34f7zMV1NcVymqt1JW01KyjaOKglgBm
	dzn3b2qE63gwY01JmKGnEczd+c0eLHFhjWmsaL26lIolfgEkWjmz5XaHjhWzzHC+RLVwHJ
	ksJ4YtYC2WPTfWfJgBj5Glos/KGRwPMDyT3IXad+VJ4JpQBhIAjF3z98IJOcBNWhJZNiUk
	MUJL8OpGFXvmGcXpXxcj/cA2DT3LcKQ+EAu6hMG28qmQh4crz/+kSeTuquhUNA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/6] Improve multiconfig documentation
Date: Fri, 07 Feb 2025 17:28:50 +0100
Message-Id: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMI0pmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyNL3dzSnJLM5Py8tMx03ZT8ZN1kY3NjE6NEs8QkS0MloK6CotS0zAq
 widGxtbUAJ/dZK2EAAAA=
X-Change-ID: 20250129-multiconfig-doc-c37342a6ab91
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Mark Hatle <mark.hatle@kernel.crashing.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=NMx2rkZkWZa9S+0ZizFpPlAAYSLD+kNKuCZTFOpdF/0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnpjTGVcl7rTDlx71w9tSpVAd7g0MaVutNHCReO
 pwB2dEtMtaJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6Y0xgAKCRDRgEFAKaOo
 NkqED/9mNMMpxxHxmjH4dlnVUKvHWh9JiHCi5/whxVzUf8Wuc5+TYXwIWJbyB8P6Trh8hqyXXNf
 ztVCpQDlJxX/qRhYHOhaMLDvRBxswz9vBoAoRj8d2j9hsuTLLYVGrOn7vIEL30yMw2i/rUZh+Wn
 8CnvLJzhS5l3oDHyAAM8B+f3hBCFkXi/NhnllB0Qv+8Ux4Sl0f9jz0mMvLxgurcJNguaXhobmNf
 yRUuAvEY7JKNjAqDwbC7n9u3KdlYomurMrlZuV3SA6JmZQzG7ZXCFSEiGL5lspT49eTirZ9X2Up
 tBjY2yVX/+J+8ULZ/+1/JkxhbIjuepxAQqqlfckd/zBvUbxYRIMNHDfMZns4jMph6DoXo6hy+pO
 Zk7swG3BYyMwcnPGBHfP87Nb6rf8TwCdkc8KCO7OyqDLURG1t3EQ3PbsagFqD61MTzDTWgX2ETl
 Ld39BUKIePPLsBsx2nQExHQzCwhILpiOnWYhTtTTRm+IGnrD2rr4oyeqg/hF9HubTWJSzEv3M1i
 K4BgP/YWkLHquCcjR8UbNm2vpLuRNujorCaD9F+VRiwuK22Ktf6r4fkrP/+2lvL4PJ15fn4KU4o
 kGi0noGoTMYluQ+e/fDU4k0Fh+vRJFTq2rkhNFKOLUieWCCUqMEi5Et3bIkuwC9Pwu0hK+EfEVi
 fTe1fNccYodvKzA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddvfeekffetleeuvdfghfejgeffudevgeffgffhjeetjeekvdfgueevtddujeeknecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopehmrghrkhdrhhgrthhlvgeskhgvrhhnvghlrdgtrhgrshhhihhnghdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6301

This series moves the multiconfig doc to its own document in the dev
manual, and adds 2 sections to improve it.

It also adds BB_CURRENT_MC to variables.rst, and fixes previous
references of that variable in the doc.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (6):
      dev-manual: move multiconfig documentation to its own document
      variables.rst: add a reference to BB_CURRENT_MC from bbdocs
      migration-5.2: fix references to BB_CURRENT_MC
      dev-manual/multiconfig: rename to use Multiconfig term
      dev-manual/multiconfig: improve the current doc
      dev-manual/multiconfig: add suggested best practices and baremetal sections

 documentation/dev-manual/building.rst            | 156 +------------
 documentation/dev-manual/index.rst               |   1 +
 documentation/dev-manual/multiconfig.rst         | 279 +++++++++++++++++++++++
 documentation/migration-guides/migration-5.2.rst |   4 +-
 documentation/ref-manual/variables.rst           |   3 +
 5 files changed, 287 insertions(+), 156 deletions(-)
---
base-commit: e2b6ee590a3a790b41636077e702724c9869d7f5
change-id: 20250129-multiconfig-doc-c37342a6ab91

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


