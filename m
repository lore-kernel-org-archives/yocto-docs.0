Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7832DC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 11:30:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.4867.1753788611297785356
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 04:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WuALr2Ba;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAB274389E;
	Tue, 29 Jul 2025 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753788610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiFmrR4LMOjtGCLb6N4mY+mHfuvGzVfg0Q9cmLIVZw4=;
	b=WuALr2BaDS0A86ksFqdkXohrCL8AuGd9FlCoJIAKsVoopQwEHm4TpnGEGbbE5W7L9W490W
	PZ4Ym75cNQeGLDuh7+l5swMYWySgM7xWDcB4zDOr8k3bhZ0Fhdj91vRqHiehj04XOO7c2G
	zfIH7Xk5oj2t11dTM1A5dtgx6FGvd2fepQfbR8KphNEFRfzzGA3FdeCOTvOeU9wqelmJQq
	MuS47Nz2G3UQ3rQGfDKG4vMoQpXd0ZuNE+tAGesDHG6dd1Q/WXbNFRff+6EWXTU90PtojF
	Q4N+tKdt3C5k+jwpNRmBZOZWnuq4Hw05XNiUkVOg9DUQB5+f1KPy+6yO/Yaexw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 13:30:06 +0200
Subject: [PATCH 5/5] ref-manual/terms.rst: sort entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-variables-checks-v1-5-5ad6ca9b9386@bootlin.com>
References: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
In-Reply-To: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2798;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kURiEE3g1FHROkv1uOgK4Ts4uyaUTtTCSefV/MToetI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiLDAUdDJlpSRzJXPnTLJNs57Hw0OY6m13jUK7
 26m5fsKaoqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIiwwAAKCRDRgEFAKaOo
 Njr5EACN/6Xh3FYFZkBWGOVpx/sQ/tJ641pF/to3q5HvjLCFPP++HlJJt0H9YS4AGQ+EL6Za2G4
 Fp7W7vF4w7zaM8JqzwzoPDXp2Koj6CR5NGJqzPyl+/ORRfvBBi7T6EiCW5sSWhFH1uxnC3V/oSs
 +QNL2UMmdZ9Wukd+7jAsXOcJz00kswcJPGDpfwPDf4Dgbn08uThKI3QEDfLfzl4AhxnyyNJQsTG
 SFRgmKYIWdR6Sl2gNhIVzsb3rdr8MxrKRzlV+P+5YILZMa54zl8cYRBmpOrKb1DPL0j55Tn2Es9
 g9ZnKY5sH7vDcXC6C2Wd3wDSLzhH561cl3lfJLptafxd/mEglXRJtBJKRKrx5XioPeh0+X7E1Ew
 5UdGEcGJEqZFLSNq1Vo/wIk2tYUeJSSm78nTqixaxUSB35IhrtB21orVVPI2qE2lMuESZXj90G+
 XJoSG5ovqc36pcP5HVcDUcUh+bQP/CWIpbWKQyjJS6Zf6MEEqdkTSI4b5iYWsjcCnYSEpPzVfuc
 VB5JnXU/MScedL6WkRL/hpbUATVcIABJm6LgklIvSGFirRVTySprZWEFGk7LHXYZ12dvmMT3Ry1
 TEglTKxCCDSPERynMCCZPjSHyNQhp1bX7UbJv+xgLtf1V1deW8crCufhhfpmIWAhZ+rLiEmZjyS
 z3TTPPmwbqUIhVQ==
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
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 11:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7418

documentation/scripts/check-glossaries returns:

  WARNING: ref-manual/terms.rst: entries are not properly sorted:
  --- original_list
  +++ sorted_list
  @@ -17,8 +17,8 @@
   LTS
   Metadata
   Mixin
  +OpenEmbedded Build System
   OpenEmbedded-Core (OE-Core)
  -OpenEmbedded Build System
   Package
   Package Groups
   Poky

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 9f6106141..f3d3d059d 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -304,19 +304,6 @@ universal, the list includes them just in case:
       :term:`LTS` release. See the :ref:`ref-long-term-support-releases`
       section for details.
 
-   :term:`OpenEmbedded-Core (OE-Core)`
-      OE-Core is metadata comprised of
-      foundational recipes, classes, and associated files that are meant to
-      be common among many different OpenEmbedded-derived systems,
-      including the Yocto Project. OE-Core is a curated subset of an
-      original repository developed by the OpenEmbedded community that has
-      been pared down into a smaller, core set of continuously validated
-      recipes. The result is a tightly controlled and an quality-assured
-      core set of recipes.
-
-      You can see the Metadata in the ``meta`` directory of the Yocto
-      Project :yocto_git:`Source Repositories </poky>`.
-
    :term:`OpenEmbedded Build System`
       The build system specific to the Yocto
       Project. The OpenEmbedded build system is based on another project
@@ -331,6 +318,19 @@ universal, the list includes them just in case:
 
          For some historical information about Poky, see the :term:`Poky` term.
 
+   :term:`OpenEmbedded-Core (OE-Core)`
+      OE-Core is metadata comprised of
+      foundational recipes, classes, and associated files that are meant to
+      be common among many different OpenEmbedded-derived systems,
+      including the Yocto Project. OE-Core is a curated subset of an
+      original repository developed by the OpenEmbedded community that has
+      been pared down into a smaller, core set of continuously validated
+      recipes. The result is a tightly controlled and an quality-assured
+      core set of recipes.
+
+      You can see the Metadata in the ``meta`` directory of the Yocto
+      Project :yocto_git:`Source Repositories </poky>`.
+
    :term:`Package`
       In the context of the Yocto Project, this term refers to a
       recipe's packaged output produced by BitBake (i.e. a "baked recipe").

-- 
2.50.1


