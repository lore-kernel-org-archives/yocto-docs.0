Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6530C46CA2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.2904.1702935254897640867
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SfFQfEGq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D33591C0002;
	Mon, 18 Dec 2023 21:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=msLaHQRlAdmBVU0+d5imBNx+mfPaQoHaTukjLvbjWGw=;
	b=SfFQfEGqirZwnp9ILK0oNSMCdbSdvEoKdMP5YRt0E6R/Zf1Z7D9m7/VJc/+vA/4V/pc2XL
	SB48BWouIVJB0sRzvH9+gN4DnAfZXaHI2MMpQ85qNODvpoNMmIs1k1n2Sv5fqAyBPMcEYu
	Qx6O3vJyiHTa2MMLzv8m+Kn/Z626/EUIaa2oGwqbyhq5e+Zo3FpTJ7pGIabx0tBGVS1SFn
	3GHGBbTlHjlEs1wXQ4aTjVGCXAE63sWQAqfumQMihwieOSIyUNGreo7BAze2vA0ovkCW22
	S/SmzY91SPYwoD3APEY13Zi/nGQ0JvSluj8TvMRai5wvQ90+RPDNXYcqDO9ycA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: [nanbield][PATCH 09/20] ref-manual: Fix reference to MIRRORS/PREMIRRORS defaults
Date: Mon, 18 Dec 2023 22:33:23 +0100
Message-Id: <20231218213334.146370-10-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
References: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:34:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4695

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Paul Barker <pbarker.renesas@gmail.com>

After the following meta-yocto commits, MIRRORS & PREMIRRORS are no
longer set in the poky distro config file:

  67b79df4fbff ("poky.conf: remove redundant MIRRORS")
  1b71a3b9418f ("poky: Drop PREMIRRORS entries for scms")

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 12889a5085..b394d31099 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5347,9 +5347,8 @@ system and gives an overview of their function and contents.
       :term:`PREMIRRORS`, the upstream source, and then
       locations specified by :term:`MIRRORS` in that order.
 
-      Assuming your distribution (:term:`DISTRO`) is "poky",
-      the default value for :term:`MIRRORS` is defined in the
-      ``conf/distro/poky.conf`` file in the ``meta-poky`` Git repository.
+      The default value for :term:`MIRRORS` is defined in the
+      ``meta/classes-global/mirrors.bbclass`` file in the core metadata layer.
 
    :term:`MLPREFIX`
       Specifies a prefix has been added to :term:`PN` to create a
@@ -6647,9 +6646,8 @@ system and gives an overview of their function and contents.
       source, and then locations specified by
       :term:`MIRRORS` in that order.
 
-      Assuming your distribution (:term:`DISTRO`) is "poky",
-      the default value for :term:`PREMIRRORS` is defined in the
-      ``conf/distro/poky.conf`` file in the ``meta-poky`` Git repository.
+      The default value for :term:`PREMIRRORS` is defined in the
+      ``meta/classes-global/mirrors.bbclass`` file in the core metadata layer.
 
       Typically, you could add a specific server for the build system to
       attempt before any others by adding something like the following to
-- 
2.34.1


