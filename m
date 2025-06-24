Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958CAC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:55:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.4868.1750758904734360285
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UHgqwO3c;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56FFB43B05;
	Tue, 24 Jun 2025 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750758903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87XzT9leXy4R7p8XTbsFNARNgvC8M1uVgUz7w82gfMs=;
	b=UHgqwO3ctj2Zf7+L7BHfaxnlU3IkjViC1d4NhJrQP8KsuAXk0EhMvjnzSNid+eS8quWqMb
	2YF+XYB0BN7OphfgpJs2BzhIR2ic7Brla+RCg8Gf29zRToLx6+LhW33Mx10WSJY2CuOkDc
	0ypzM2fzxCL3k6pPwiL4sQ3t6sT+Lat+4CRzvHuxraypxg65v2kcCJIhwaTtw8VIRbYV4l
	4/oP+ibIFuq+z8r+V6xfwj43RDd/ElvS84WVk4nDwcmtfhb0BitluVwKfzLxDWfYtYjT9r
	Ajg0+vhw5ba2pANEegBt2/cOfH3E6N+sSaRocFIJ0Cgh67MDX7v50zQCGrAxxg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 24 Jun 2025 11:54:59 +0200
Subject: [PATCH 2/2] migration-guides/migration-5.3.rst: add guidance for
 breaking WORKDIR changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-migration-5-3-unpackdir-v1-2-ef6ef00d5cbc@bootlin.com>
References: <20250624-migration-5-3-unpackdir-v1-0-ef6ef00d5cbc@bootlin.com>
In-Reply-To: <20250624-migration-5-3-unpackdir-v1-0-ef6ef00d5cbc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Alexander Kanavin <alex@linutronix.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2966;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=B4R4NgggmTUZSKlWEjGHovRLqsWib77nTKHydtwCy7E=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoWnX2vXIjdkH6d4LB5lPJKVTkCeipmzx6tciY9
 XKKAV3Ol0iJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaFp19gAKCRDRgEFAKaOo
 Nr/8D/0YPhNIDHZUbyhLAigkk1bdw5J2492k0/j+4B5xqaGl7Rp+8WGrHuBjloinw9rqLs2PkUA
 Yf8ez3WYp7M8vqNrCmyzMygi7MkqZW2nWxuTzVTPcUD4j1T68u6vVzMfch3kRVZ6Nte6MxgEIUl
 dqlrF3aiv2ukNGAjkhKU93WcGWmZ2OwC9+uiM/cAe3CrOzogTkPfXLcJO9/y7XAb1hSYNaf5YtK
 OloqvjGEHlNe13Z/nb7Lyk3H/yS/KWppv9UwosacsJBeazKCjXdQ0H8MtoI1SdJDQAKrXBQBXge
 vCN0XD4otkNsohQA6UmQVI7a/iFOZZbLhDcqKSguBOWO9H08Zr7uG0vkGgcCJQevP+NE8m4/8TN
 zoQwx+DuO1GOx6975WpItJJ2EHakkAUm/zA0wVMWe23gaB/+MBL3sK2pDXrkSOJiYEGLYPIwIA/
 fS1ZybQmNaFv3tKRwzJz7vYKPQ7Mbcm1D4ll3zwGh9qyK2y7EA/7xYUwgYj/vyGiPH9ee4SvoKp
 MV6IV5yGUSmBXHoyYP2lbKUbiG7PbeK41HTisD6LEjfYon03GqZQ2U8YOzNb5PI1uG2emrX9LEx
 BBDVJ4DqVFCLGv9h+99f5P55u6sBtXEecYwBSaGua3vfHZjDWXa+fNuYT0X1Y0uoLwd34h83+rq
 GD6J57/Y/ElVrqg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrlhgvgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpr
 hgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:55:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7204

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


