Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82315CED62B
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10674.1728459695194564013
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l9VfBaRn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B529E1BF203;
	Wed,  9 Oct 2024 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qy9zjAXctxJKYvig3AySXQ6fiBp6rLJI58CUf5VyhFc=;
	b=l9VfBaRnd1/E7I3HuGNrXMk0tnQjR2jmMsZim3EHSDyE/XBN8MN4Z7bL74gyU/RLwchm/e
	f/2k/Ivygg8ne8SNDqHomH/T3WSVYFQ97boldy+ais7qiC5M9EbFQporSceqqhliAOaOBi
	7oKQb++ouQWdqbYNviKtNIizHB6Zk7bBeUUT0dztRtCsidu+PIsBNAj2nbpMzWyaERXwXe
	VkIIvVSP4kQsa8OTcdkHdVPogReHRcSCAPcqdBHcq6xFO6K44k/gZU6G9xJQ3L3PbX84h0
	mLZNGOdpBcIjaWNEWIqPPg3NRXdxYquNFNgidOP2qzH4kVb3U0ciRAGz0S9vsQ==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 08/16] ref-manual: add missing image manifest variables
Date: Wed,  9 Oct 2024 09:41:06 +0200
Message-ID: <20241009074120.866786-9-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009074120.866786-1-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5415

From: Antonin Godard <antonin.godard@bootlin.com>

New variables that control the output of the image task manifests.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9eabc4a0d..cad626317 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3797,6 +3797,25 @@ system and gives an overview of their function and contents.
       clear the value of this variable (set the value to ""). For example,
       this is typically cleared in :term:`Initramfs` image recipes.
 
+   :term:`IMAGE_OUTPUT_MANIFEST`
+      When inheriting the :ref:`ref-classes-image` class directly or through the
+      :ref:`ref-classes-core-image` class, the :term:`IMAGE_OUTPUT_MANIFEST`
+      points to a manifest ``json`` file that lists what images were created by
+      various image creation tasks (as defined by the :term:`IMAGE_FSTYPES`
+      variable). It is set in the :ref:`ref-classes-image` class as follows::
+
+          IMAGE_OUTPUT_MANIFEST = "${IMAGE_OUTPUT_MANIFEST_DIR}/manifest.json"
+
+   :term:`IMAGE_OUTPUT_MANIFEST_DIR`
+      When inheriting the :ref:`ref-classes-image` class directly or through the
+      :ref:`ref-classes-core-image` class, the :term:`IMAGE_OUTPUT_MANIFEST_DIR` points to
+      a directory that stores a manifest ``json`` file that lists what
+      images were created by various image creation tasks (as defined by the
+      :term:`IMAGE_FSTYPES` variable). It is set in the :ref:`ref-classes-image`
+      class as follows::
+
+          IMAGE_OUTPUT_MANIFEST_DIR = "${WORKDIR}/deploy-image-output-manifest"
+
    :term:`IMAGE_OVERHEAD_FACTOR`
       Defines a multiplier that the build system applies to the initial
       image size for cases when the multiplier times the returned disk
@@ -4008,6 +4027,16 @@ system and gives an overview of their function and contents.
       files to be deployed into :term:`IMGDEPLOYDIR`, and the class will take
       care of copying them into :term:`DEPLOY_DIR_IMAGE` afterwards.
 
+   :term:`IMGMANIFESTDIR`
+      When inheriting the :ref:`ref-classes-image` class directly or through the
+      :ref:`ref-classes-core-image` class, the :term:`IMGMANIFESTDIR` points to
+      a temporary area that stores manifest ``json`` files, that list what
+      images were created by various images creation tasks (as defined by the
+      :term:`IMAGE_FSTYPES` variable). It is set in the :ref:`ref-classes-image`
+      class as follows::
+
+          IMGMANIFESTDIR = "${WORKDIR}/image-task-manifest"
+
    :term:`INCOMPATIBLE_LICENSE`
       Specifies a space-separated list of license names (as they would
       appear in :term:`LICENSE`) that should be excluded
-- 
2.46.0


