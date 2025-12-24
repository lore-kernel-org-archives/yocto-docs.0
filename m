Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596BAE78482
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123738.1766593937149658310
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=c+6VJg4P;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A4A5F1A23E4
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 756656073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2F0110AB1376;
	Wed, 24 Dec 2025 17:32:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GPnz7KACrwzllAwYZz7TRBcoznpW/O7GEwKF+qfbCbQ=;
	b=c+6VJg4PlFzbsQG477Wnrnlck4Ej9vZhMffoig9QHqbS5SmYeenFB2qEQ/gEfaHPqhGwgr
	ZpYH24Y0l8RO2pifySILejy8XjAKjmtPIDOgFyIcqa1XHlScRvBxwMwfKzrl8PBhpi0cU7
	zE/qwGUyd85BOxlHqLZuhQOPV1IeAd4+Zhy7Ww7cvi9lWh0m+8OqfPkAV+B2p7XOdoktT3
	kqP28XjnGiLIaUhuQViql5ugFBoSUZ3p0nkx3BsXPg/nimgDmX+FCBqXwdXEdk/2i9MHit
	eEfUJfMz6g/eXl0gpxBb/ekrPBHJ0LQ3fJRwyV6lg4DEbbi6V0L1psvZAVdghg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:05 +0100
Subject: [PATCH 39/53] dev-manual/licenses.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-39-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3413;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cg1kb2OEUwrliiSQuQXjkSXlpUozeC4ZLp/3Su6ErbA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVur/aN4s2Fi+f5kkc/KiiUnSNUOrknwyym+
 Ffde1ohvbOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbgAKCRDRgEFAKaOo
 NrJbEADOJAszHmyfr+oqJHB5r5Px7eOfSyWCq2796Cu5bndoRtfv95dNk03AuTXUGc4VeTZm5Zb
 MT1VTEkSS0vu3Lmd5w+vnnDF5lauRRpb0ufojSJuGrROh3+VXqRox9XHtyn1iIPIFvG/s/ibG1Q
 ZQBGBD84yH1OUai/ALcIdITxOCtp4eDmBjz2CHRUcjacmm+TseI+oRq1VGpy5Nrp0LVIi6N0K9z
 Ay1NcPwRinnxrQ79qlRH/jEQTBQ/eheHVp6uHoSTUb+aPTiUrXz8CwhJSA2dNakRLEMB6ScvMC7
 o9YFXEj4nUhrOMf0kmcUBOLxPdOvVE7xZx+hCfk4a4QfblaLAOQx4ApgFaYWm0yPCr9GSQTEY+0
 jaK5uveo8x0FVy+aCirlyPYCEjeRkHFTKEsg9u1MBknjvkuqIQcf8OG0GzS4PD83Y6JQB3+uZGr
 E4lJw/5lQVaQ79PFP0lzUnrCPa7KW6dUtqbLhZ/0xAmmbdmk1Wq5BK2dSdSTk/EH+UHLpc3W1Om
 qFhx7+eWcbMeAMK5EhzDahSLJdWV3tcD+oDCnO/xmaxfzq072VTBuG1iXAIWVg0MI2A+Pw/3v5G
 JXs8RVtryLtvmRwzwFolyQcm6jABQblSZAXz/88+It3WyHK/nyabK7X/VvlBj8Y1fLe2a9LtZ0q
 CROqMzUd22kA5Iw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8368

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/licenses.rst | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 7d6636eef..edd503bd6 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -112,8 +112,8 @@ commercial or other special licensing requirements. Such requirements
 are defined on a recipe-by-recipe basis through the
 :term:`LICENSE_FLAGS` variable
 definition in the affected recipe. For instance, the
-``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` recipe
-contains the following statement::
+``meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` of
+:term:`OpenEmbedded-Core (OE-Core)` recipe contains the following statement::
 
    LICENSE_FLAGS = "commercial"
 
@@ -136,7 +136,8 @@ needs to have a matching entry in the global
 :term:`LICENSE_FLAGS_ACCEPTED`
 variable, which is a variable typically defined in your ``local.conf``
 file. For example, to enable the
-``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` package, you
+``meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` of
+:term:`OpenEmbedded-Core (OE-Core)` package, you
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
@@ -464,18 +465,11 @@ those layers are used to patch, compile, package, or modify (in any way)
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
2.51.0


