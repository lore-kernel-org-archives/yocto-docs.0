Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C42CF11F0
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:11:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.41662.1728562259625457184
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XZ+YtiCF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28700FF811;
	Thu, 10 Oct 2024 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHKAkt4PpFjs9rAZ1m9D8Df/A0w//QxpiYBJ0xxN7k0=;
	b=XZ+YtiCFtCEUvE2cM6m1UZ0QrDybHMvmpLV7jU92mumDM6Senv2q8cBoo19JOO4JHAM7Du
	kc4q2GCZP5/Sg8T1d6Bjo/U4OMQsDe/J17eFrz3d5zl+0wZEp4lnZIF/t14kdbGfqYGQIL
	iEt4Sp6HRHpKbME3QAfnmZpRob7rS9qduNOp3IOx3pn8ZABIVqEDufnXqfuDS28Peu//HW
	FFxgbF3SLldKp4N+fgT1RdOwFTepe3igEKU2pC21hk4smO6yr4Z3yvo8Tr3pawdQxDHOtG
	RRHOrWqsMDl1JCg5tzH1I03o4H5E49iQf6hiPsRfu0y9S04nJeJIcVpwhDfFJQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:33 +0200
Subject: [PATCH v3 08/16] ref-manual: add missing image manifest variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-8-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=df4aYclX/e9VilGYMrsJEMpxAx6vzZGP6MDZrTyTj+E=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8RO7W646eO2qe3AHxNcbS98CHKtl1Uj1Gb81
 hhyjCX8YKCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETgAKCRDRgEFAKaOo
 NqmUEACmeb5BQ2RRgJnTivdG3PPXbPnxfBSlrDzhV2QbL2m4XnNG3ki7wUZsXRQ7lKBbqJ3Ushw
 mmt6DEincjCCc+QnIaJgwRvbKhmOiRcmqg9fvk+zel+MlyNPB/oVWtExm+e6/lfj6qHfUmwYAzy
 CLOaI1237hmQGg6ZSfukeQ94eQMTT1bM8JKIhYRy9Wo9sIA/qJMdaqX9f9ZqCZiyQmvGTImx9IN
 MXsHNedEtZgD16RA9uRKq1vvYzpxM8iQNWuA1ABgGqOd++jtBDemFRupsZacnpQEYU4zwNaF4gA
 /ydwmoqoJ1fSYgAAjrc+xJDLKq7Q4AERpX1BqpeDx5dzPVp0adD/Fv+BVZDbU6zZtCz8LpKXbY+
 q2VDX6pRRjqpXCl9DEUVjzSFqAT0o4ogBUOPn/hfetvVf0HkpAM7OlSPsxz+UMAaf3pzYlI9ofG
 ZFxNCjg/oDb2g77Z9hMkupRmuVKXdaSwnfcUWdHH/5Gv7EjsKnwzHuBAe1OQZQwnvzfvwH4oMeY
 zYt5Ss8F/a/E/Oi+L3ku0X5N/O8qE4+lutxtD/+CM/UZ0/xyMJn10yLFIg2u+Fb7uIJ4ZWP7LFB
 NQquQZUfO6GZteA8YxYOvNbJy4bxYhkAIzBxR4j5CwUOPi6bCOMF1QLTkXkT2M2hIjiDszLIZpZ
 O5CO+ohSfWrGVZw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5461

New variables that control the output of the image task manifests.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 744c0bc11..40771a51b 100644
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
+      :ref:`ref-classes-core-image` class, the :term:`IMGMANIFESTDIR` setting
+      points to a temporary area that stores manifest ``json`` files, that list
+      what images were created by various images creation tasks (as defined by
+      the :term:`IMAGE_FSTYPES` variable). It is set in the
+      :ref:`ref-classes-image` class as follows::
+
+          IMGMANIFESTDIR = "${WORKDIR}/image-task-manifest"
+
    :term:`INCOMPATIBLE_LICENSE`
       Specifies a space-separated list of license names (as they would
       appear in :term:`LICENSE`) that should be excluded

-- 
2.46.0


