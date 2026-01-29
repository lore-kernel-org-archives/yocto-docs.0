Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF33DD6B07E
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17114.1769700272011382561
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DPGgJ7vL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 760C24E4231D
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49705606FD;
	Thu, 29 Jan 2026 15:24:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78FE4119A887A;
	Thu, 29 Jan 2026 16:24:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700269; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D7YoF5GvodqxJqCKX9sEBURwTcBOomTKsSrlvHkNkmQ=;
	b=DPGgJ7vLleJOdy/+c5JFrk7cVKOqbBgmxc6tSU0+XCUw1QXpqrj4K9mzcyRmbKALLHmN7+
	LAhtI8CsBlJ3q5weZMGqYnTSq9pNIhVog7oRZt4Y4uPnBmh2sLa1bJuFVZE/1+Am4nyaI0
	XbjeBCBm0t9qaj/Nju3VoZ4+BcZbV1xYe4F6VzdT9boMkh0lLzI4VfddfdYiEblID/Kj8u
	ulGzwZok5ed9QG9ks1cg8PStVJaCGghHBz3qE+wI0M61gIBqLJ/KugNkwOeku35JCqeRxq
	kA7OlpG1ckafYfSb+qbTytD1vWQ4kAQ1dgqwfKBXh0SD7j6jK30FHfC49DosNA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:30 +0100
Subject: [PATCH v3 39/57] dev-manual/licenses.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-39-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3737;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=E05w+ARdEjFDmOU/rWOwAYnufn8soSr2aWcleHHxgX4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uPQVbOxmDKL1JIVNddSg9HxTUcQxTv+SnUF
 +VDLizCh8eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jwAKCRDRgEFAKaOo
 NhRAEACJQbPO/iD8C3Ro+9PZIXfhV/CHclspgIyzhCcmhkhf60LGV9O95jS7fxFp7pdIcZ7v3e0
 5V6j6Lm6TQojM7gcYEL5Go52RLOvOF6Gl5Hv3glHcd5QP5kPcG51ktPSqDbxaBbWrwWgxtUD2wX
 OM3tp9GMXi8Hduzb+hCqTi8XDDrB6s0x3MKo7ZHAeFil5ZvBnIKLpjg4MpuANe7uvISj4Zl1zk2
 f8r/EeMT+i4qwXkgbVVrqQLMfg9wBSXVLBy/x4oPhpo9SfYe84H9ow2+FZZP9uEbXq6hxsGzk1o
 IxHA6MZF51MCtqpUbqjKr3MZQYmYwsr4RvZrDBjILVDP1ua3dK/W/owxaB5xJvmulzSUTmNH03V
 L0x6jQkjibb9Bo9sStMju49HxpiZAHZgvXoj3cmTO75ht/H/XAtdopNyUcZKXhnARgvQhw7R1la
 18nrI1+gA9Yykj4dNrhZMCZbkMsE0SE5KSAZm4JkHEerPZRkfVWnwNXdjK2ODaTSpSe6I5UumRc
 ljq9Pnr0NBhyk/8pG/bNWT4rWsvFAeTV4oEsv/fhC9VEQnmJJD8yj9eoeP3/qwyORtpyLxAsaZ6
 qRsV5YrDSxFSsq0EtIdbiEg9soKPbBWZoTxJMJ7IFYwwLLPIxGAXk0JYInfdPLhqvLU9QGCeHtY
 pO4Yih2bhhLAYJg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8825

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/licenses.rst | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 7d6636eef..fff4abb11 100644
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
+     ##OEROOT##/../meta-yocto/meta-poky \
+     ##OEROOT##/../meta-yocto/meta-yocto-bsp \
+     ##OEROOT##/../meta-mylayer \
      "
 
 Creating and

-- 
2.52.0


