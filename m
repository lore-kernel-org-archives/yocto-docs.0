Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F96D6B070
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17214.1769700276531006050
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GhrRg3Ro;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C375E4E42324
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99B40606FD;
	Thu, 29 Jan 2026 15:24:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9E4D119A8859;
	Thu, 29 Jan 2026 16:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700274; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=51hlssbdk6z4aDjQITX+mr52V7HdyGRhoNWHuosCwVM=;
	b=GhrRg3RorKZtZv+fSTHl7HzedtR7wOZi7LCok7E+4NKFTdDmTt/ou3lkhc3aDxaw8yMcNl
	CAEuWwbffXJjGyO30067WSosGS9TAdyQefd1KnH2M4YGhlgHtx+lBkt5ySR/JFaKxSWaEc
	UgID65B+Kgo7mNh9ajrkQNYVCymMny6pL4UOMS/X82uLfuLO19UkfRfbiez1orLZQzxVCI
	GbZ2YbW2489vtEz7d0PvbixN3NTVaNNE4dyDkzSk0P0sKdcTk3xX+/o3J/CimiTRshytDW
	ZTabTkwGILAHROZ+/HLVkOxjHhFXpZ/B6q62/D+YZKM1wFTKb6bRvO6gdGulEg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:36 +0100
Subject: [PATCH v3 45/57] dev-manual/upgrading-recipes.rst: move
 meta-openembedded to bitbake-builds/layers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-45-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2330;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dbjj41ktIjBQKPmhJl4Bhakgn4vVZ3r2fteBBZYFCVg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uQnkFBh/ATBWz38+ESve2Fcwj8gDQNQAQQA
 lYs1Dvw+pmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kAAKCRDRgEFAKaOo
 NpIBD/0VTo/rbwsKxOeMmEyOZQkcbuY0hZ9/RSd9LrdE3zxQUtO4crwqiS9k5lvVUp4024m0EX3
 +JSQNul9S5Zeh3anhvvLfUxFej1CeC1J79+jT6d2O3zmJC5jtHKeHi1X3l/n1Jti3u33cuyE2S0
 S3TjfJddIkuZGziSFPgGmN1OueYLqoAmwtnzskeHjDOLYfdKlI3SOnxX0vlfcwEXbuSY9LwISMa
 tm3GC5RK4Jg0803gp12tYz20/ubY11tPgpL4zwNbVFTwsobazyL6McvZx69pp0jDEQ0gCznMDkQ
 TJ6sOHpVP9swiWjbcrBu/oJRgUDjwtMqWZyh8/XoiHp61LSEftcsFlxJ4sUfZ1GJXs5dtcPVN3y
 FQP+shjY7e6IaTrPOS3CIYHGjtSyS2ksnWibdTQvwnjazXPH8OIVARBPAW2yoaCc3k0hnhfzSB4
 Q/dXRKeqnLl8ejmZCH/mw8IzzHuJHtU41c3Dcuj5a2L0gqra+A06eFnJv1xutZhtLn+yygkVetx
 0M8VmbXyVb8MC8EM37CTc2RTup5BiWJKkwe5FVNPyNHhz8JVeQqi0b8uluwGjMQvPhDrZlO+bpI
 dKBWWcjcbMq7nM78bQuTJJ+GokTKOs+4C50rp5DUwZ9GdDw8HtCo6Dhm/rzTsmqd1HRKYBpJsNy
 Z/png6AVxyK3OLw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8831

It makes more sense as we expect the layout to be that way.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/upgrading-recipes.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index c4199d160..01fd12d86 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -242,12 +242,12 @@ script. For example, suppose you use the ``nano.bb`` recipe from the
 ``meta-oe`` layer in the ``meta-openembedded`` repository. For this
 example, assume that the layer has been cloned into following area::
 
-   /home/scottrif/meta-openembedded
+   /home/scottrif/bitbake-builds/layers/meta-openembedded
 
 The following command from your :term:`Build Directory` adds the layer to
 your build configuration (i.e. ``${BUILDDIR}/conf/bblayers.conf``)::
 
-   $ bitbake-layers add-layer /home/scottrif/meta-openembedded/meta-oe
+   $ bitbake-layers add-layer /home/scottrif/bitbake-builds/layers/meta-openembedded/meta-oe
    NOTE: Starting bitbake server...
    Parsing recipes: 100% |##########################################| Time: 0:00:55
    Parsing of 1431 .bb files complete (0 cached, 1431 parsed). 2040 targets, 56 skipped, 0 masked, 0 errors.
@@ -319,8 +319,8 @@ directory::
    Parsing of 1432 .bb files complete (1431 cached, 1 parsed). 2041 targets, 56 skipped, 0 masked, 0 errors.
    NOTE: Adding new patch 0001-nano.bb-Stuff-I-changed-when-upgrading-nano.bb.patch
    NOTE: Updating recipe nano_2.9.3.bb
-   NOTE: Removing file /home/scottrif/meta-openembedded/meta-oe/recipes-support/nano/nano_2.7.4.bb
-   NOTE: Moving recipe file to /home/scottrif/layers/meta-openembedded/meta-oe/recipes-support/nano
+   NOTE: Removing file /home/scottrif/bitbake-builds/layers/meta-openembedded/meta-oe/recipes-support/nano/nano_2.7.4.bb
+   NOTE: Moving recipe file to /home/scottrif/bitbake-builds/layers/meta-openembedded/meta-oe/recipes-support/nano
    NOTE: Leaving source tree /home/scottrif/bitbake-builds/build/workspace/sources/nano as-is; if you no longer need it then please delete it manually
 
 

-- 
2.52.0


