Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7815EC7EE32
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 11:53:58 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.6390.1750766037174628501
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 04:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V6/aMiVW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACA1543B8A;
	Tue, 24 Jun 2025 11:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750766035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87XzT9leXy4R7p8XTbsFNARNgvC8M1uVgUz7w82gfMs=;
	b=V6/aMiVWIPnryQf6h6weFqkdi1DOnJo4hYUy8SphQDjl0sQ3axn07V8Ve16nVOyu0Y/Hfz
	7pktDQYg2Sgvw2Y8booUZjSwJqJECzq6DytbuIqQnS2RaY+rbdH8ll3RFS9GixnbeNJVuU
	gkhQBD6KNAb3I791SOkjU5MAbMfu/nMVCaZBjkj8CFgFHEXYHuJrmw3mdVDn40y0Mx5+kK
	Ug0b4i45LPwIXlACJ06UijkKcwNcS0JbBzl0UDKKtQER6DGoR1te18uMBEF94SUzewWCf6
	ufy5u8EymcWg6KwKQzRKmLlvt/Te0iauMHV9W6qYPpJ5xITCLbbiMYWHVTH4kQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 24 Jun 2025 13:53:51 +0200
Subject: [PATCH v2 2/2] migration-guides/migration-5.3.rst: add guidance
 for breaking WORKDIR changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-migration-5-3-unpackdir-v2-2-3b258b758b27@bootlin.com>
References: <20250624-migration-5-3-unpackdir-v2-0-3b258b758b27@bootlin.com>
In-Reply-To: <20250624-migration-5-3-unpackdir-v2-0-3b258b758b27@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Alexander Kanavin <alex@linutronix.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2966;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=B4R4NgggmTUZSKlWEjGHovRLqsWib77nTKHydtwCy7E=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoWpHSLykuehGdNpGMEPjbzZzFyybE29EDG3dbk
 wC5+dRCwb6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaFqR0gAKCRDRgEFAKaOo
 NuCnEACLz5V49xogfqg8WIO4qR7G9NcO4xkEHSd2v77CJEY936q8WcZWQbzR1nHPkEyRQCOChY/
 J3NXAmXmi/obWf/XL8jYA0GaFqaD5Q1DirusUD6juj99iFTg7oZ8jCIZxXRdY0z9ZZVYc/wCSK5
 O0mcNmSkKfoBQ1k1fDtt+sTNVLCUD6QkNWGx6rtmSd15L8YlX5W5uj5UczcNFCYyUotvnlFEwGy
 Ulug1c6BbCXPfygF8CRVh14hpNzhN8c2LtWvpzrSIOOJx+gu/QzJVwfZXKaSfMtsKfOt0Gfa6R2
 eQ50I9x3Z5iYsIpKixXE+kyhDTMZi6ttGcIA0ndV1ynpEAgyNpb715z4yttI4Mf3FFT+3p6t6Ki
 buLA2UAHvRkEas6hfOJp9Ag9kyBUFC/LHXCnKrtActF+uoKOY87p47Ct338vZbLvrH9SS6oO7mU
 xRM8SWA+U7205l7QRssFyr+ck5JDUd5n4Sef7ifvNy/TXmv0j86Gxlnu/4R0XEYFK5n0An/wj7R
 dSdihSYAp2Z+jHmwEYq1670rcYCfhSFBhKp3lsA/Bk1FcFXTdlWUkVhNOWU4x1MFnYPqJ4hiiMz
 BzviaVO4E8ZEzzulpSiv4G3rnZZcYrJSnWZr93TBjqa4OFJWjzNit2v3Ks4r2QeFkpiKXi+TuRv
 kJe8xcrSXg54E5w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhgvgieslhhinhhuthhrohhnihigrdguv
 gdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 11:53:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7213

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.3.rst | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 09095c7bb..4d2e1763c 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -14,6 +14,56 @@ Migration notes for |yocto-ver| (|yocto-codename|)
 This section provides migration information for moving to the Yocto
 Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
 
+:term:`WORKDIR` changes
+~~~~~~~~~~~~~~~~~~~~~~~
+
+``S = ${WORKDIR}/something`` no longer supported
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+If a recipe has :term:`S` set to be ``${``\ :term:`WORKDIR`\ ``}/something``,
+this is no longer supported, and an error will be issued. The recipe should be
+changed to::
+
+   S = "${UNPACKDIR}/something"
+
+``S = ${WORKDIR}/git`` and ``S = ${UNPACKDIR}/git`` should be removed
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The Git fetcher now unpacks into the :term:`BB_GIT_DEFAULT_DESTSUFFIX` directory
+rather than the ``git/`` directory under :term:`UNPACKDIR`.
+:term:`BB_GIT_DEFAULT_DESTSUFFIX` is set in :term:`OpenEmbedded-Core
+(OE-Core)`'s :oe_git:`bitbake.conf
+</openembedded-core/tree/meta/conf/bitbake.conf>` to :term:`BP`.
+
+This location matches the default value of :term:`S` set by bitbake.conf, so :term:`S`
+setting in recipes can and should be removed.
+
+Note that when :term:`S` is set to a subdirectory of the git checkout, then it
+should be instead adjusted according to the previous point::
+
+   S = "${UNPACKDIR}/${BP}/something"
+
+Note that "git" as the source checkout location can be hardcoded
+in other places in recipes; when it's in :term:`SRC_URI`, replace with
+:term:`BB_GIT_DEFAULT_DESTSUFFIX`, otherwise replace with :term:`BP`.
+
+How to make those adjustments without tedious manual editing
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The following sed command can be used to remove S = "${WORKDIR}/git
+across a whole layer::
+
+   sed -i "/^S = \"\${WORKDIR}\/git\"/d" `find . -name *.bb -o -name *.inc -o -name *.bbclass`
+
+Then, the following command can tweak the remaining :term:`S` assignments to
+refer to :term:`UNPACKDIR` instead of :term:`WORKDIR`::
+
+   sed -i "s/^S = \"\${WORKDIR}\//S = \"\${UNPACKDIR}\//g" `find . -name *.bb -o -name *.inc -o -name *.bbclass`
+
+The first change can introduce a lot of consecutive empty lines, so those can be removed with::
+
+   sed -i -z -E 's/([ \t\f\v\r]*\n){3,}/\n\n/g' `find . -name *.bb -o -name *.inc`
+
 Supported kernel versions
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 

-- 
2.49.0


