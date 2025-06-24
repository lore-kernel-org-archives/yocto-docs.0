Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7656AC77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 11:53:58 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.6388.1750766037009224601
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 04:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fhu1QRCU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B2FD43B68;
	Tue, 24 Jun 2025 11:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750766035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ITxJ8TxFoyTGoTZH3rAZ09fjvIlvmjffdtAGMVM1kE=;
	b=fhu1QRCUizJYK7SgcaBBc/idBf2Flub41LmEbjIt3QUkMXdXLWvHhWyQ2QADtQueiYu2kK
	LJbykdTtbsKqAj7kZv/3TW18yDex9ifyDnF0ab5oEg0cNNhnhnKmU40gMGG3HFDmbn+0/9
	TPx2Hk/pdawRsAgszdxOso0MylVltLgWWSXJUL4hHwtsgjaYSUJJ1xiAi77kShCIKN6f0y
	Lbp3+E2JQvPz44jjHeoF9i1/KM3zz9wbsZLJcOLWOrBEHluOeFJ0mFT9RJqWBzinf3SzS2
	v9jedRMmwc4Uwp5e0Gq7dW+HpjMwcbBxHziAndXCyPG1phvWgboN1a+0uxtRmw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 24 Jun 2025 13:53:50 +0200
Subject: [PATCH v2 1/2] ref-manual/variables.rst: document
 BB_GIT_DEFAULT_DESTSUFFIX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-migration-5-3-unpackdir-v2-1-3b258b758b27@bootlin.com>
References: <20250624-migration-5-3-unpackdir-v2-0-3b258b758b27@bootlin.com>
In-Reply-To: <20250624-migration-5-3-unpackdir-v2-0-3b258b758b27@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qdSe4W40G5dlPZjeOydD5RYfgKAp4JGH58Eyf8UzXco=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoWpHSqomd1XGUlONGApVokel2EcV0vWStcV6ve
 1Mu++6psvGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaFqR0gAKCRDRgEFAKaOo
 Nk3sD/9OGIkV+QJWrI4W4AMG1tvis8OUt9EaBwqu3QxygPvmZLAtSfIcXZ3QshVFxbf0yNCwKdc
 T9LzSfHcOXpDWfdzXQ4m3dECQazZWPy/xAK8soBtoXlytfbJhvuVuybpddPhFHCsTSjtJ5X0QtI
 B4TQejDhWPj1tyuaEaueZhm0dm1Vi4YDfCwHWqXylpUAHb82ya24TyKAEfuDAuSWBo5i2Zn9dNE
 phZVyOLafYIT/cBwiw7N1mcHhr4sja69lNJ/brZ2TrOto19OcxDwAcEGvSnomf57mPf3bWbWgzB
 +35rL2rQAIEhkKdwtFfso3sY6YORr/qc/RhZiTYI9j+S15iMCEDB8fjIUGpXh8qM/MiC8kbN+w4
 ILAJkjZC5gAAGlykxGC8j1NHc/FsS3nBK13fVc8mnBBdkc1yYpgu8o7iXnA4WecBhHy/WFkeaDb
 /2ZYVG2cihbu8txv9fCDr8BobGL2kXHyqADqDoUzoFantudACjK3e6MbWwTk7NEhCWj65iZT4LZ
 fEyi8mmljmJV/rNaLjsdYTiunLC0NZa13++FRySwMAt46SpKGUpIIvt5rpVVQfFbbVj4K2WgAuG
 mr0efsdsqenaGTIB/U65fL20Mv8S1blHxcUA31VNrnqFRPtuTAefEdnasNnX52oQKIuHP8Yq+XB
 TaII1hA5vquGNMw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 11:53:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7211

Recently added in BitBake with 378db0fdd95f ("fetch2/git: allow
overriding default unpack directory with a variable").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0a748c918..c56418e2a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -560,6 +560,13 @@ system and gives an overview of their function and contents.
    :term:`BB_GENERATE_SHALLOW_TARBALLS`
       See :term:`bitbake:BB_GENERATE_SHALLOW_TARBALLS` in the BitBake manual.
 
+   :term:`BB_GIT_DEFAULT_DESTSUFFIX`
+      See :term:`bitbake:BB_GIT_DEFAULT_DESTSUFFIX` in the BitBake manual.
+
+      In :term:`OpenEmbedded-Core (OE-Core)`, this variable is set to
+      :term:`BP` by default in :oe_git:`bitbake.conf
+      </openembedded-core/tree/meta/conf/bitbake.conf>`.
+
    :term:`BB_GIT_SHALLOW`
       See :term:`bitbake:BB_GIT_SHALLOW` in the BitBake manual.
 

-- 
2.49.0


