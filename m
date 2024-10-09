Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE91CEE323
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19650.1728487497019538000
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RK4VmmNT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DB59240014;
	Wed,  9 Oct 2024 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2fYpZUYFsJRu+rix7ov5TLCZqSOyIvKVrcZreqVMDKU=;
	b=RK4VmmNTDGwxSJG7l5VziSezpQSb/88SumHUcVvKoo2mcQx+NROsahMUC7k0KzIopFHnCu
	w8IXHDoBIZJqEtHDbi322DlJlkvkIkUOy/MS2uLzh04+KP+5/SVUPDwwduGO7qM+hJSQyK
	Ae6+al+ZwXt/wilZJwjAQMUia0KZEPzkFb6P/mz3U06HkomugLX9Zub2gvfWu/kaivDiqy
	CIUfe2sNz99gw50injqkrAKLWccen595KSwI8hz1OY4+cs+qYen8eVRMUWzSsirm74LlPT
	jcVem4pBTQhdhnKiGwB6KfEl+IX/nfAhj2ax4TeRVxNPgpobHl9RlRp3sH3zRA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:16 +0200
Subject: [PATCH v2 08/16] ref-manual: add missing image manifest variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-8-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2923;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fEDtsMLm/fV0EOq4yzWmxjROGlhTJv99wA74MzRV02M=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBDDAGoNi4wvDV18T0HqmX7PHoHj/8ZK8lnO
 cjUxmn0eYiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagQwAKCRDRgEFAKaOo
 NtuGEAC4lHyteYRKSh8NtDj5SusDXAeAbHAfq20EKwLlXlhnpK58gV1PgZQbEG/4TUHRQRN/XB9
 QBuoo/yFbWxdQofAbJhQVLHavosTtxrdsH0wA63B1++sxihSj/2XdFsodPID10qA5A6yMWzseJ7
 y2jsBxTylTns+6BOn9bhyXRedvMXQByDLGTaWCFfC8NSg4cAc2J95uv3Z96Pawzlpm/OEh6fTwV
 6LMsVeYQvDQu+Xchf1ntAgCeiQSbYvBFYIvwrPxDghXERNmfN/iBHBHCTWX4aXw59v0LzuEqnjM
 FGQAJN6Kbei3iiv7Us9zSxdMsoRLYnbPoUO+/z7tNH21HrJSorWtshkBAip29nf4i2LRpoXG8+t
 OzQYGKMz12AnPRlhoesSJ+jDWARx6CJCFOoGS1AGaceNAvSRieaUmw3wcQM4m8p7L+HlSvZJOHD
 s/kfg+Y17dnDQtcj3iRy2UNbhzreVI/rhmAtZVB4joAmGMw3xKb7OWDhvgYle69l7o+gyJWEM8u
 dTlOb/gEmOMf+jrNSVAxYmPPyqvAWjHH6yuPfcYoKdw4a74q3W/DQE6rpl6sLHRBGz/sKQn9vNN
 /yd+QQq5pFPF6WTc3mRiekwk5MceP57wiDsC3wkILeO6/VDJxzDhQPmvTZssVttGojKQeBReEaA
 x+d4onGloCtWRRA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5437

New variables that control the output of the image task manifests.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 29 +++++++++++++++++++++++++++++
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


