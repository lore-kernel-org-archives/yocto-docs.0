Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA75D5E36E
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 13:59:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23098.1765893570327984217
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 05:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yq8x8dIK;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6BC831A2234
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 13:59:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BFD56071C
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 13:59:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06265119435F3;
	Tue, 16 Dec 2025 14:59:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765893565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=T1/TDm8a4iJ1AFmxuHZexYUOyTc64xe1umWAmyuXrvE=;
	b=yq8x8dIKXnaIGMsMgxMuWbcYEH/6lmnvkDou223fSSKaU7ZLH0vh+QqCD4hYf2EBrvpYzu
	wtb56nnMsFy6prC8nDLcM4YC3aq/XbNCyH7fqRCfjIZix7/mUhpy4G2v2NllrAo+8ZQmkz
	6r64C3YKs4ZLTCbPa/vbMKtnKMrw4voCNoVZTPvrYHcaO3GlQmEYj0TKvYEIekPRAlV11O
	2qRzTIef1Ft6HwNdBlj3mwjon97kaUwkY/thnzqPn/xut25m2K6xrHVHLPVaCjW27sxYR/
	EFytk8XtD1RqkOt9YBpxocVlHkohH9QcXiIgoiMkaL1NovH+QDpNkpZer3p7aQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 16 Dec 2025 14:59:16 +0100
Subject: [PATCH v2] ref-manual/classes.rst: document the image-container
 class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-image-container-v2-1-630e5f91c0d9@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALNlQWkC/2WNQQ6CMBREr0L+2pq2hAKuvIdhAe2vfCOtaSvRE
 O5ugaXLN5l5s0DEQBjhUiwQcKZI3mWQpwL02Ls7MjKZQXJZCS5LRlOfQ+1d6slhYNZoZerWqlq
 2kFevgJY+u/HWHRzfwwN12jRbY6SYfPjul7PYeoddCvlnnwXjzA6qapThqhHldfA+PcmdtZ+gW
 9f1BwO3eDbCAAAA
X-Change-ID: 20251023-image-container-fdc6d79f6729
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5143;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=bafz93LrblMKojBTA5A38bE8Y4UD7k88GF4qWUtxarw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpQWW7IUYfTXrZudA31FDGN85g9rsda+xqrr/LB
 FoXkGmf6sOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUFluwAKCRDRgEFAKaOo
 Nnk7D/9y+VXoLHCk3pY9yMC1P9lXA/vjN8MwVxM4IpvvQS3omsQDpA5xn/bWWwOtYszCJh1CSgA
 OzvkV0X8uapGptRwrpfmfhJ3tY4RW7/ylqDwS/aBPDqOdjYRu+AoFhqh1zOv6ySQGM2faCWbS5j
 rKaqGyzPHELgwQOGYvQEFpDQkLWF0u1j6fvvZxptG+l4jzp5Oi5tpXvbnhJTc+SFcpZzxuTH2Pc
 5X/RUnhrpPY5iQ1hoJ4kyGIJNh6qP879EOKf+EKj+8ht28moCJA+E+QqfKd34p0gmIpU2UMZ4vJ
 1aETsN6ei53w4MmmL8Zh+2Nadgq/8LN4QHDFNDTBpRR208QSg0bZNCdG1O5I9xCwoXCA3LXR3MY
 MhFhGG908x9WhMARSruCQY6WDhcTjCDF2oZda6WxltSs2rhPdon/7GtICH/yUPinaZhECIUEnfg
 PkbtH3xSrNP4VJivmfHhAIn0Pbt1TeZcN6odwMzTGQ5N2KGT5n3THjcxOruOAY43vMWjEe3M42U
 rCpCqAmRaqImz6xc6xL+gjRj1o/O3086Xiu16YLCcOXzHKHV0G8LQqhLgPhyjliTBTm49C/WTDv
 aKH9vUeVuGr1a/+ZtDtI4up5wc7lgnMBoBTv5Js8+ZhuMAJAnmDWOgSGt01y5L75eBOzFiC8+9K
 +NfZY7QEuyz4ovw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 13:59:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8288

Add documentation for the image-container class, which is a simple class
to generate an image suitable for creating a container.

This answers in part to questions asked in [YOCTO #14368].

It also adds documentation for IMAGE_CONTAINER_NO_DUMMY, which was added
in OE-Core with commit f0645e172bb8 ("image-container.bbclass: Error if
not using linux-dummy").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Review from Quentin (thanks!)
  - Merge patch 1 and 2.
  - Rephrase class and variable to highlight that IMAGE_FSTYPES should
    contain container, and that the class should not be inherited
    directly.
- Link to v1: https://patch.msgid.link/20251212-image-container-v1-0-fb6586d06813@bootlin.com
---
 documentation/ref-manual/classes.rst   | 48 ++++++++++++++++++++++++++++++++++
 documentation/ref-manual/variables.rst | 17 ++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a56a2f719..6781c5294 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1258,6 +1258,54 @@ The :ref:`ref-classes-image_types` class also handles conversion and compression
    :term:`IMAGE_FSTYPES`. This would also be similar for Virtual Box Virtual Disk
    Image ("vdi") and QEMU Copy On Write Version 2 ("qcow2") images.
 
+.. _ref-classes-image-container:
+
+``image-container``
+===================
+
+The :ref:`ref-classes-image-container` class is automatically inherited in
+:doc:`image </ref-manual/images>` recipes that set the ``container`` image type
+in :term:`IMAGE_FSTYPES`. It provides relevant settings to generate an image
+ready for use with an :wikipedia:`OCI <Open_Container_Initiative>`-compliant
+container management tool, such as :wikipedia:`Podman <Podman>` or
+:wikipedia:`Docker <Docker_(software)>`.
+
+.. note::
+
+   This class neither builds nor installs container management tools on the
+   target. Those tools are available in the :yocto_git:`meta-virtualization
+   </meta-virtualization>` layer.
+
+You should set the :term:`PREFERRED_PROVIDER` for the Linux kernel to
+``linux-dummy`` in a :term:`configuration file`::
+
+   PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
+
+Otherwise an error is triggered if this variable equals to another value. If
+desired, the :term:`IMAGE_CONTAINER_NO_DUMMY` variable can be set to "1" to
+skip this check.
+
+The ``linux-dummy`` recipes acts as a Linux kernel recipe but builds nothing. It
+is relevant to use as the preferred Linux kernel provider in this case as a
+container image does not need to include a Linux kernel. Selecting it as the
+preferred provider for the kernel will also decrease build time.
+
+Using this class does not deploy anything specific in :term:`DEPLOY_DIR_IMAGE`,
+except for an additional ``tar.bz2`` archive. This archive can be used
+in a container file (a file typically named "Dockerfile" or "Containerfile").
+For example, to be used with :wikipedia:`Podman <Podman>` or :wikipedia:`Docker
+<Docker_(software)>`, the `container file
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
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 71fe11b83..63fb7fa79 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3955,6 +3955,23 @@ system and gives an overview of their function and contents.
       variable, see the :ref:`ref-classes-image_types`
       class file, which is ``meta/classes-recipe/image_types.bbclass``.
 
+   :term:`IMAGE_CONTAINER_NO_DUMMY`
+      When an image recipe has the ``container`` image type in
+      :term:`IMAGE_FSTYPES`, it expects the :term:`PREFERRED_PROVIDER` for
+      the Linux kernel (``virtual/kernel``) to be set to ``linux-dummy`` from a
+      :term:`configuration file`. Otherwise, an error is triggered.
+
+      The :term:`IMAGE_CONTAINER_NO_DUMMY` variable allows the
+      :term:`PREFERRED_PROVIDER` variable to be set to another value, thus
+      skipping the check and not triggering the build error.
+
+      This variable should be set from the image recipe using the ``container``
+      image type.
+
+      See the documentation of the :ref:`ref-classes-image-container` class for
+      more information on why setting the :term:`PREFERRED_PROVIDER` to
+      ``linux-dummy`` is advised with this class.
+
    :term:`IMAGE_DEVICE_TABLES`
       Specifies one or more files that contain custom device tables that
       are passed to the ``makedevs`` command as part of creating an image.

---
base-commit: b7f5b8ee510eeec286f2b0daece2717245b5b177
change-id: 20251023-image-container-fdc6d79f6729


