Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F98D44175
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:23:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9864.1765534978338899786
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 02:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0lX4e6o6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D3DC71A212B
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A81ED606DF
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20917103C8E11;
	Fri, 12 Dec 2025 11:22:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765534976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9kq4lzHmAG+e8/NqVjG/e9PPNnaydov1AzKecptgspY=;
	b=0lX4e6o68+WqiYXnZgMwNNOLxSAXyVI9yQfSXCxNbW1vUkOmgSMDCZpld1QJkC3njaHYOo
	gCSssc83jB+2GTWXeNLSUicWI0bEzgykiyLcXnHmYJ5zzLvTRA9acJkH1/jcYptoQZ+CtI
	oa9duEKigWlzD/+CDR1hDm1chOrtxYtufivsUk4LBTJ9IRjRm34EWM1Ga/k3e5FswvCmIS
	tLDR5it4KkS4qVaI9inPsUgHN8ud5UjwMfjoHGj5oaBM/RlTkVHHFA1Nkk3uMnoqAsfMzA
	oTMyZIX2jKONJ0TekRjdvYz3iAFJ3+rNN5bLt2t4ZcGf/NKEDO1tj2Tqiixzuw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 12 Dec 2025 11:22:49 +0100
Subject: [PATCH 2/2] ref-manual/classes.rst: document the image-container
 class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-image-container-v1-2-fb6586d06813@bootlin.com>
References: <20251212-image-container-v1-0-fb6586d06813@bootlin.com>
In-Reply-To: <20251212-image-container-v1-0-fb6586d06813@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2943;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=R9iR99xT89JG3hRJ0CthnHnwvSK5AgDe3ihk05E3iio=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpO+z+E2uJ/lmpS0IHZiLHLoqtlV+3MIn40FcMT
 Xl6mn3B0smJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTvs/gAKCRDRgEFAKaOo
 NohCD/0T2c6FJwX7COIsdNABe8wtFol2YKcqwHaB683xZqaHg/N1SY2nz2Dq3/3djVn7LKlWaIr
 3p4Cs9E1rGpprxsY6vl7ltehO/x75P8BmPRWHXT6krzppTQTgsK2ZUyokvCTKd4OEKdg1OQkyVw
 vzzaTbhMzMZ1q3Nz1M/7rVlOLlistsHacv/XTomvLM4ZcFpKj0Nj/YpcM+cTtQazR0uYpXsHjV+
 mC6YLX7L7mM16ttEz4WNnFqV+yEA/6TVijAsPRahEhpQEogRHhc0Z/RjniEn0cxKxVTZHEYu45K
 RAkctMRgk7Bw89jEQrjWp0S/ZACchKFZotTlU5N4RrLa6GN0wfjCMib/SrT89173sXth8fUe2zp
 pXg1fsZ/pXF1iw8GlKjEzhjtomE+q68WCsD2+UFpBw2Mu+mMDj4+HBvzKQHNgazsDjNltzuUHl9
 Ybo0ctoDA1gQaF+ILfLGtMI3bDBpd0iRN3Laz/7VMk2SgGh0g7tvDYAqqEfFtLhTeUDt7k739H2
 pFCXuzD0x8gA8YkzjB2oDDRMunnWyDK3DUO8VCxIOGMtXcjFDgYdivH0aFvcMbgj+DtY2j4rcOh
 okscem4ChZRtnr9i0jqtmICzacGZz8kYs5HQZVOsgLm+k8KSm+rlsI3vi6LpUaCPRRNGxKd4TI1
 RKM+gI92TlBPB1w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:23:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8266

Add documentation for the image-container class, which is a simple class
to generate an image suitable for creating a container.

This answers in part to questions asked in [YOCTO #14368].

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a56a2f719..0097b7c46 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1258,6 +1258,57 @@ The :ref:`ref-classes-image_types` class also handles conversion and compression
    :term:`IMAGE_FSTYPES`. This would also be similar for Virtual Box Virtual Disk
    Image ("vdi") and QEMU Copy On Write Version 2 ("qcow2") images.
 
+.. _ref-classes-image-container:
+
+``image-container``
+===================
+
+The :ref:`ref-classes-image-container` class is meant to be inherited in
+:doc:`image </ref-manual/images>` recipes. It provides relevant settings to
+generate an image ready for use with an :wikipedia:`OCI
+<Open_Container_Initiative>`-compliant container management tool.
+
+.. note::
+
+   This class does not build and install container management tools on the
+   target. Support for this is available in the :yocto_git:`meta-virtualization
+   </meta-virtualization>` layer.
+
+An image recipe inheriting this class should also add the ``container`` image
+type to the :term:`IMAGE_FSTYPES` variable::
+
+   IMAGE_FSTYPES += "container"
+
+This image type does not deploy anything specific in :term:`DEPLOY_DIR_IMAGE`,
+but will simply add ``tar.bz2`` to the image types.
+
+You must also set the :term:`PREFERRED_PROVIDER` for the Linux kernel to
+``linux-dummy`` in a :term:`configuration file`::
+
+   PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
+
+The ``linux-dummy`` recipes acts as a Linux kernel recipe but builds nothing. It
+is relevant in this case as a container image does not need to include a Linux
+kernel. Selecting it as the preferred provider for the kernel will also decrease
+build time.
+
+If desired, the :term:`IMAGE_CONTAINER_NO_DUMMY` variable can be set to "1" to
+skip the ``PREFERRED_PROVIDER_virtual/kernel`` check.
+
+After the image is built, the generated ``tar.bz2`` archive can be used in a
+container generation file. For example, to be used with :wikipedia:`Podman
+<Podman>` or :wikipedia:`Docker <Docker_(software)>`, a `container file
+<https://docs.docker.com/reference/dockerfile/>`__ could contain the following
+instructions:
+
+.. code-block:: dockerfile
+
+   FROM scratch
+   ADD ./image-container-qemux86-64.rootfs.tar.bz2 /
+   ENTRYPOINT /bin/sh
+
+This is suitable to build a container using our generated root filesystem image.
+
 .. _ref-classes-image-live:
 
 ``image-live``

-- 
2.51.0


