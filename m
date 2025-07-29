Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500BFC87FD4
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3369.1753783013934556864
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Pfj0ncM/;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D64744202;
	Tue, 29 Jul 2025 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rqenvUvy6wtqLKuF0deH1AMNUtzYsVThx5IxS5YEDTE=;
	b=Pfj0ncM/Gx+CXuP40CwdmB+CWsb9t9FlRCehF+yAE4736Wo/bmjlibpXMdKUXSja2o5T/8
	KsoFjpmpIckzMapsga46VczPKXPavZ8qFaAhyq1Xcf8lDunBOAwm0HUnJcaSpWGhBzwMwJ
	aw7IeDb8IHVM8dk6K3MxNqebpRlJY6+ZpRPwk/aD7EXUTgdBdWfLQQkv3JVWa2augW9B8x
	reSO0yz9HJin/1CjaM+1s/9/F0nU3BKVSxyZ2rpQhEAM0aGziQWMBJ26jxPEEXzUDackSt
	ZHG/HAgrCqWTeKJe/cp+KUZ33tRns/S2wuf4VE2fumDohZ2dL+kCQdn/xxfhyA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:43 +0200
Subject: [PATCH 09/19] ref-manual/variables.rst: document SPL_DTB_BINARY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-9-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tkAPOacpKTzyaxxZU/Yv4Wk9Wo5z3uLiRTmCig3QWGI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrffVkO+IFOhBxnvYTh/NpLWWba839oyR6rW
 BP2Ouh924CJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3wAKCRDRgEFAKaOo
 NkMaD/0Su8YpRIziS6OuN53jqqG0TOVM9kkfoRwrf1eSO3ljFJkvKgP0e1QCUSErv7lm9VlFAbp
 zcP4RkPFlN2ljz+G5Zy3kvEntldKqHGtxg3f7gcs1++3Nve8egHy8fVIVJho1xS7plBqb9NJSEm
 1K+4NjudEwc5SsAUu0fzvFGHoL7zeo3/oBEmO5TAuXmduRuSZFDfM9eWw7JpmjaHmekQm6dgEUH
 lIblvwLNTzGfXKb6oCvfIfBxE+sgibXo9s8tI9m62jFDxlZ6MoWnwhAVOB1+Ix3SjtlCGIb7368
 qI6SBKyPtoMxJ17r6vfJ5bnuGyMkz+EAJPRbi5iSftVQbyP90MiVgLf0M0kgB8ssnsx+kuxdLa6
 QmRvSggJx8cMgYNRbAtR/ErmF3Q6W+FW/7Ez5sdj9rUxD/sv+dOBpYZB32u5CtwQgFWDGMQMlx8
 5rbXBD6kUxQMkRoDWHCapX8zpxHRqRuUJS/zsPgAVWVXWrG+ipOL6CPwfmuQY7tyo0DCrycU/IX
 aGv8kjXZTq/jFA9JdCOK4Fs0XAWLvrF9PBYIdZe8zZeINPT50ABQxh8SC3gzgLgSUOeQQLLp+/Q
 1rJWGSKp9AIF+b67UB587ZLthEFap0iFAqGZzGo96DQHJD9ktlMuJtTRAlKfGyJwgG/s4KrlwVJ
 ZLKzj97yE6p++fA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7408

This variable is part of uboot-sign but not documented.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 3 +++
 documentation/ref-manual/variables.rst | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 748f0395c..0f4405b98 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3166,6 +3166,9 @@ The variables used by this class are:
 -  :term:`SPL_SIGN_ENABLE`: enable signing the FIT image.
 -  :term:`SPL_SIGN_KEYDIR`: directory containing the signing keys.
 -  :term:`SPL_SIGN_KEYNAME`: base filename of the signing keys.
+-  :term:`SPL_DTB_BINARY`: Name of the SPL device tree binary. Can be set to an
+   empty string to indicate that no SPL should be created and added to the FIT
+   image.
 -  :term:`UBOOT_FIT_ADDRESS_CELLS`: ``#address-cells`` value for the FIT image.
 -  :term:`UBOOT_FIT_DESC`: description string encoded into the FIT image.
 -  :term:`UBOOT_FIT_GENERATE_KEYS`: generate the keys if they don't exist yet.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index bd82b9484..d722d722f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8875,6 +8875,11 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Board Support Package Developer's Guide
       for additional information.
 
+   :term:`SPL_DTB_BINARY`
+      When inheriting the :ref:`ref-classes-uboot-sign` class, the
+      :term:`SPL_DTB_BINARY` variable contains the name of the SPL binary to be
+      compiled.
+
    :term:`SPL_MKIMAGE_DTCOPTS`
       Options for the device tree compiler passed to ``mkimage -D`` feature
       while creating a FIT image with the :ref:`ref-classes-uboot-sign`

-- 
2.50.1


