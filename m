Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1B6C25B74
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 06:57:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.7640.1714633046276422037
 for <docs@lists.yoctoproject.org>;
 Wed, 01 May 2024 23:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OfFqIN+Z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8105A1C0004;
	Thu,  2 May 2024 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714633044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1gtOYBUA3lKoCwD8kz57inVrXqrW6VACmUVe/eFzGw=;
	b=OfFqIN+ZKDIDe74KMRtIH8tl7HI3C+QqOugpfwrdHER0js1UBFUsVq44d/kV3tEJLstbeL
	FTfiRb3Yn04YX8w7di/Ib6sSXG1VuNEd3p0X9e6CgX6jbFrWBVR706JFSYXAz7F9WDamV1
	evL64Q1C/o6Q79qWzCA1cB1jkYj49KgaT1XQSRvdjjPiKAC03ROEZowVw0ow2tFbBUHrui
	sOoEsLzEmxjGYM7GCobCVwCPup0QzV6M5XE/nuaMry3XOPzQifTmqCafPFjXyzrw1S8Gh0
	nYiRhBISRLmSHUy4gyQfq704TqjJneucKuEEEXYCBEw3QVs0cW/BSRCEZXQO/g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Paul Eggleton <paul.eggleton@microsoft.com>
Subject: [kirkstone][PATCH 2/6] dev-manual: update custom distribution section
Date: Thu,  2 May 2024 08:57:17 +0200
Message-Id: <20240502065721.22607-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502065721.22607-1-michael.opdenacker@bootlin.com>
References: <20240502065721.22607-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 06:57:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5194

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Paul Eggleton <bluelightning@bluelightning.org>

In keeping with the addition of the motd message pointing out that
the poky DISTRO is a reference distribution, adjust the opening of the
Creating Your Own Distribution section to match. Additionally, add a
section on the end pointing out what users need to consider if they just
take a copy of the poky distribution and modify it.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../dev-manual/custom-distribution.rst        | 34 ++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/custom-distribution.rst b/documentation/dev-manual/custom-distribution.rst
index 47faed0d04..0bc386d606 100644
--- a/documentation/dev-manual/custom-distribution.rst
+++ b/documentation/dev-manual/custom-distribution.rst
@@ -4,10 +4,16 @@ Creating Your Own Distribution
 ******************************
 
 When you build an image using the Yocto Project and do not alter any
-distribution :term:`Metadata`, you are
-creating a Poky distribution. If you wish to gain more control over
-package alternative selections, compile-time options, and other
-low-level configurations, you can create your own distribution.
+distribution :term:`Metadata`, you are using the Poky distribution.
+Poky is explicitly a *reference* distribution for testing and
+development purposes. It enables most hardware and software features
+so that they can be tested, but this also means that from a security
+point of view the attack surface is very large. Additionally, at some
+point it is likely that you will want to gain more control over package
+alternative selections, compile-time options, and other low-level
+configurations. For both of these reasons, if you are using the Yocto
+Project for production use then you are strongly encouraged to create
+your own distribution.
 
 To create your own distribution, the basic steps consist of creating
 your own distribution layer, creating your own distribution
@@ -107,3 +113,23 @@ layer. The following steps provide some more detail:
    For information on append files, see the
    ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
    section.
+
+Copying and modifying the Poky distribution
+===========================================
+
+Instead of creating a custom distribution from scratch as per above, you may
+wish to start your custom distribution configuration by copying the Poky
+distribution provided within the ``meta-poky`` layer and then modifying it.
+This is fine, however if you do this you should keep the following in mind:
+
+-  Every reference to Poky needs to be updated in your copy so that it
+   will still apply. This includes override usage within files (e.g. ``:poky``)
+   and in directory names. This is a good opportunity to evaluate each one of
+   these customizations to see if they are needed for your use case.
+
+-  Unless you also intend to use them, the ``poky-tiny``, ``poky-altcfg`` and
+   ``poky-bleeding`` variants and any references to them can be removed.
+
+-  More generally, the Poky distribution configuration enables a lot more
+   than you likely need for your production use case. You should evaluate *every*
+   configuration choice made in your copy to determine if it is needed.
-- 
2.34.1


