Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175BBCA6CB5
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6061.1769501990838460730
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TmRJng1Z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B4151A2A69
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31DCE606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08AE1119A867D;
	Tue, 27 Jan 2026 09:19:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZfgzgbQV/dkXIh2Jq4Thch9vM1ndBVV/vVu+v1hA5Oc=;
	b=TmRJng1ZyL96n6A6/8jgwjRtZGxMyQIcQg+Xoas/8QpQIyvk8ejkgG93UUdkr/K8UcT4Lg
	BGz8EBHnKrTv/dT6tOFs/1t/oiDYECqjJ2jCUQK/vDM+vQQrKtKfViVfUIT64nrapniZwK
	/Xq/fjLu3D2rKyqbXt290s+UUORCz0BqrzQrx+7F88rHJlr05yR6pRPn4JSSZR9fzZh20E
	/wzBlA5oSII1LsDh9FyBwRZE1zFtrNEH7o2Kv5CLyCnBqtC5+z8vX2v2V3cdEkc/ky4pIx
	HWT7hK+PViJiLffchnV5xrg6Vt9hQ7K9Rlt/kwuI/Ev4tmnsaCpb9VwAGLUPtQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:34 +0100
Subject: [PATCH v2 39/56] dev-manual/licenses.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-39-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3659;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KeBVoxdmcOAD5Y0eSJoGP4aMIFJx9WWSPZPuiT3xM9E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUE/ml5XszyhzK+faHJQWChVjXeeO8aRGe4R
 HxJdfU4IaGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BAAKCRDRgEFAKaOo
 NsJ1EAC9oxxnXElPFpSE1vOkz13bSqsVY4g76e2oQkUzHX1WRttfXQqeZQ+enDNOBq8GADtXQQi
 9B24kFr8+vMpTHC9gh3wcGTNe0AdxM7oXC0Rh5H1659p1NmFh5Z4MSihwpdnhYvTaa2HQ+U7qyC
 60E3F7QtlUPKymhsosgWICOs9mTfwxbc3HGjM/yGn21cagMeLGjphKVWx62A6UwLewqA/R569Na
 AOYGIc7lD5RtHAAwIPfeju/6IJlWQAfQL9Er15SaB3Hfolrw3D7mLnOMIFPaOtnlqSUSlqmxmd4
 7SvIorq35aDuGf9ix93JHSZ6yEZw2tbcR4c9s2V9obi9qyNutbq2UEFT7xcWtGABN8qFtwO7Xlt
 d1EtY86XygSQsOCkFRE1pPAYNUVluhSc8QmapVTu+qFP47wlkFr/c1Iz/36vQCpe2xanbTBbHAB
 Fj8GMltme+8L1XdOGVAJ3Gypsv0S/vjMOiGnRt3Pvakn8P7Kyt7bOAkuAqB1X1Kn4TrQ1NeDZ5Z
 tU9tS9rwlcnptPAFpTsajSDGc7ATKDGSwsQFz8IItaW1RC/anabWQVvlPMySemr8w+RfF/PS/Cn
 gqe9dbwGw0TwUsWvIMcsSDAsl5L5aGl6S1rzAxzO5jnTEt0RpSajxdjLqbj5nsfdTBPPLsQs6ez
 g37AH5OTVpSx5hg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8700

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/licenses.rst | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 7d6636eef..1887e8e35 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -112,8 +112,8 @@ commercial or other special licensing requirements. Such requirements
 are defined on a recipe-by-recipe basis through the
 :term:`LICENSE_FLAGS` variable
 definition in the affected recipe. For instance, the
-``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` recipe
-contains the following statement::
+``meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly`` recipe of
+:term:`OpenEmbedded-Core (OE-Core)` contains the following statement::
 
    LICENSE_FLAGS = "commercial"
 
@@ -136,7 +136,8 @@ needs to have a matching entry in the global
 :term:`LICENSE_FLAGS_ACCEPTED`
 variable, which is a variable typically defined in your ``local.conf``
 file. For example, to enable the
-``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` package, you
+``meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly`` package of
+:term:`OpenEmbedded-Core (OE-Core)`, you
 could add either the string "commercial_gst-plugins-ugly" or the more
 general string "commercial" to :term:`LICENSE_FLAGS_ACCEPTED`. See the
 ":ref:`dev-manual/licenses:license flag matching`" section for a full
@@ -244,7 +245,7 @@ Other Variables Related to Commercial Licenses
 
 There are other helpful variables related to commercial license handling,
 defined in the
-``poky/meta/conf/distro/include/default-distrovars.inc`` file::
+``meta/conf/distro/include/default-distrovars.inc`` file in :term:`OpenEmbedded-Core (OE-Core)`::
 
    COMMERCIAL_AUDIO_PLUGINS ?= ""
    COMMERCIAL_VIDEO_PLUGINS ?= ""
@@ -460,22 +461,15 @@ and the source code modifications in one step.
 
 If the deployment team has a :ref:`overview-manual/concepts:bsp layer`
 and a distro layer, and those
-those layers are used to patch, compile, package, or modify (in any way)
+layers are used to patch, compile, package, or modify (in any way)
 any open source software included in your released images, you might be
 required to release those layers under section 3 of GPLv2 or section 1
 of GPLv3. One way of doing that is with a clean checkout of the version
-of the Yocto Project and layers used during your build. Here is an
-example:
+of the Yocto Project and layers used during your build. Removing the Git
+objects can be done like so:
 
-.. code-block:: shell
+.. code-block:: console
 
-   # We built using the dunfell branch of the poky repo
-   $ git clone -b dunfell git://git.yoctoproject.org/poky
-   $ cd poky
-   # We built using the release_branch for our layers
-   $ git clone -b release_branch git://git.mycompany.com/meta-my-bsp-layer
-   $ git clone -b release_branch git://git.mycompany.com/meta-my-software-layer
-   # clean up the .git repos
    $ find . -name ".git" -type d -exec rm -rf {} \;
 
 One thing a development organization might want to consider for end-user
@@ -494,9 +488,9 @@ automatically::
 
    BBLAYERS ?= " \
      ##OEROOT##/meta \
-     ##OEROOT##/meta-poky \
-     ##OEROOT##/meta-yocto-bsp \
-     ##OEROOT##/meta-mylayer \
+     ##OEROOT##/../meta-poky \
+     ##OEROOT##/../meta-yocto-bsp \
+     ##OEROOT##/../meta-mylayer \
      "
 
 Creating and

-- 
2.52.0


