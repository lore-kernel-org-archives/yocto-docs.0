Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E71C83F0F
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 07:58:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.10263.1752047874040360172
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 00:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h6A1cIRb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3644443BA;
	Wed,  9 Jul 2025 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752047872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KoalkesAqEe6qhFphTNI/34aEqda2KVa3IFUt2pkX/o=;
	b=h6A1cIRb18n9RKNvwu59Mqc/tsuNP4lNFoL1eFgTv53w4voirA12PS/Fy3FLSolUdbQmod
	ES+OvQXUwVlH4ZU2lqRlPm78qoZ4qR8suB69Vf9ohSejxj0JlyLnco57p6ZR8iOHlhAZk5
	Tv+3dVnqkws5HN7sl7cEwpVtO2VVmnPr9dOgW2m3rzaAz3gkFDCEu1//hY2rSL11S5xbyR
	7Jm4O74LTCqLMyF/FPet9boYAmPwAJnQwZRo6hUnPcJHFKzjJWxkMhct0KqYHsQTPvhlYt
	UVXpY5+Hp4EIJQtZOcRXE8HKDbK/rL6bKrMe/NnGtbCnIEZsz6oMoM0Fue6wyg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Jul 2025 09:57:29 +0200
Subject: [PATCH 3/4] dev-manual/start.rst: mention that PERSISTENT_DIR
 should be shared too
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-update-sstate-dir-docs-v1-3-9114688f33d1@bootlin.com>
References: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com>
In-Reply-To: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fUGdf1whK97Kxs8FDDHj5ubisuITtfkYT3KfaK/qIn8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBobiD/Ju+7vDmlgVQIEfB6uDztTqMnK0ZhMvyBN
 9Iz5gd2CAGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaG4g/wAKCRDRgEFAKaOo
 NoxLEACqnHVh0Eevl+xo9zKJ6Vj5q+iZ9DeQiKoaNXIauHvnjkvuUshK/eyq5+54pG8BAM3+YP/
 LBt4ZGeqYwu2npWaa3WffVVQIANIeZX+iv5pnN2finFwqEbrgdY8rxdm+7kWThd54QKWlnSOY26
 U6KL7EXeRdZMFRxgeirzyV4ph07zPJZ/Ng1xw/YZDt2EemXp4y8HY/KAoWU261mHM8JPrb1eNoI
 YpypV+MYWc9U4G3EOwzBJA5MNkkgeTN6Ajr5icZx5olx9Zys4PdnN+Tf2a8NvA3Gu/LXyw2IY4N
 6KrtYudHY9YMG5sVivIiaezKzfGaEcIOOug2Ig5YdFponO3yK40UGpu7Hek5Q8YNvXKIddX6UII
 ub7D20FIKMwHB4yTFFl9gLQK1AP5hTlQvr5MwvPfm44nTHUDDqtbYCkWQ9EtOwe4B6MS0PRafpA
 cwA7G++/iQmdGQKNCui91fOsiPQcMLKKX6gvu9SHqrbh+e/8dp2DXGgSezr/+c5z8Fg2ZjJdkH1
 AONHWt+zJhyDYbfPoK3arPDteUyLdqTcc/A6FGusixebOTiuZKTX9/Afacm0DGQUMNyy4xKfarj
 vps6B5fgsnWQPa+6KAGJNvamV10Woe1NBRr+0dxLalzNrokeBa886jg0tv84eZEeNZMvluKKMnU
 1y4/SEudfK1+wVw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeuhfeihffgtdehjedvleelvdfhgeefhfdtteeuhfffhfdvieduuedvvdetteegnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpr
 hgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrthhthhhirghsrdhstghhihhffhgvrhesvgifrdhtqhdqghhrohhuphdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 07:58:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7285

In the "Development environment summary", we mention that the shared
state dir can be shared for developers, but PERSISTENT_DIR should be
shared as well, otherwise bugs described in [1] can happen.

[1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15921

[YOCTO #15921]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/start.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 44bd2de13..1c3f87ea9 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -228,6 +228,11 @@ particular working environment and set of practices.
        used by developers in the same organization and share the same
        source directories on their machines.
 
+       If the :term:`SSTATE_DIR` directory is shared for multiple developers,
+       and you are using a :doc:`/overview-manual/concepts:Hash Equivalence`
+       server with :term:`BB_HASHSERVE`, the :term:`PERSISTENT_DIR` directory
+       (``${TOPDIR}/cache`` by default) should be shared too.
+
     -  Set up an Autobuilder and have it populate the sstate cache and
        source directories.
 

-- 
2.50.0


