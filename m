Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276C0D6409D
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:16:45 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10755.1765962998420520545
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 01:16:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DLskA5wn;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 413D4C1A594
	for <docs@lists.yoctoproject.org>; Wed, 17 Dec 2025 09:16:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEE636072F
	for <docs@lists.yoctoproject.org>; Wed, 17 Dec 2025 09:16:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D354A119500A8;
	Wed, 17 Dec 2025 10:16:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765962994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wL9odGAUppTgClchJ+ZI8K1o22kDVq9+tR7ZQgfD684=;
	b=DLskA5wnl9Ny6BkNiWpb+KkqlalydPC7nDWIRNJRcySKBmDbDvfLwdw4Ol1upFnkdvGgfg
	VCoHJSdZCDl1RSoN3uJokP+247tyOKI4mEWfhaVVeLHSkLmot6cs3xYDEUHfbt1VrwaOue
	48xLZJqj9NfbkV6cdoSiKmAkLP61kHfIJakKzR74CkaI3ArxK9Duqf5dpwQjQ6zK7fMSHY
	vE13dhMjMpBYp/faWRGEgWkLJSVnqNY7GCs8eOi+eeUJtkVtGi1J+xfAQNinuTwo/SN38G
	RVn4wdBJ2yr7Yl4knFoTTQXI0o0sj/uV6z0KSeObpiT1+eo5emwiW9DKUHcTXQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 17 Dec 2025 10:16:30 +0100
Subject: [PATCH v3] ref-manual/classes.rst: document the image-container
 class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-image-container-v3-1-ceb72620a254@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAO10QmkC/2XNyw6CMBAF0F8hXVvTRyjUlf9hXEAfMkZa01aiI
 fy7LWw0LO/k3jMziiaAiehUzSiYCSJ4lwM/VEgNnbsZDDpnxAirKWEcw9jlo/IudeBMwFYroRt
 pRcMkyqtnMBbeq3i5bjm++rtRqTClMUBMPnzWlxMtvU1nlO30iWKCbS/qVmgiWsrPvffpAe6o/
 IiKP7FfQewFhikWnJjaSqqIlv/CsixfxdfqowQBAAA=
X-Change-ID: 20251023-image-container-fdc6d79f6729
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5290;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mQo1Ajz+38UCKfML0N89LnPrBx++tXWMNIbr3nTZF+E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpQnTxEllRQxil74MxleRzAIcZbgTIO+6r/qp7U
 vZAAaYJXo6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUJ08QAKCRDRgEFAKaOo
 NuitD/wISpWgKO6mlkMWpJEpKtZSIGziSe8zVpmzKQhnPV7rwopR5P08IZFGPQwvtAvyPFfdQK1
 WWDvSXHkTSbWeMhBD0aZpbkrsF88jry8cjj0FV9sjG+SdIYPzfpXkxRGH03Z12UH91Dhbs17HWl
 Q+KHQ3o3cBaPhQBmyB5HmjHQnyohpvJZu5oAFK6fnmh1/QXopNgddqCbP/WGzKUFGzqtPDJmBkJ
 0/Hn8Bxm7ys9HIJoIAQCOSqeMW7lntGtbRNmwte92jBE4q0tPol9ZN8Er4xRY0mb11e5bciueBz
 PD8gS7motBMgfzpnf2Mp/Nd7FRw8oQIjR5SaGnZQLAr9rJgGqnnDXu04ybLziCPbErAfsjFR/Bl
 YoDMI0cOGRSn3/gSom/YoGtrALB1L9jZoWDq349KwTlDIhTq9FhHBCFIJVVqXmjcTumWMW74CYK
 zXAeUaE9wxOVJx6hDQ9saugzHL3kv8LGS1Fs+jmoCpv/SK7oCTtpIsi2hPywJdxDrm7HTDmh+E9
 0l0cJUnpPAuk/qQ7GEUjEPY3gRw2VK7ibnE6+P+KE5JLSmBZBtmasxA83AG38NfOhzY88cAg/of
 owb6rEhnaWijz18JJcTZspHXYMHC5JnA3OxvXYZ+NU6JLBBuRmhBgO7zhDyAXdhI0ulx/ri0sak
 /KhT5cgl4wwnBWg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Dec 2025 09:16:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8299

Add documentation for the image-container class, which is a simple class
to generate an image suitable for creating a container.

This answers in part to questions asked in [YOCTO #14368].

It also adds documentation for IMAGE_CONTAINER_NO_DUMMY, which was added
in OE-Core with commit f0645e172bb8 ("image-container.bbclass: Error if
not using linux-dummy").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Apply suggestions from Quentin (thanks!)
- Link to v2: https://patch.msgid.link/20251216-image-container-v2-1-630e5f91c0d9@bootlin.com

Changes in v2:
- Review from Quentin (thanks!)
  - Merge patch 1 and 2.
  - Rephrase class and variable to highlight that IMAGE_FSTYPES should
    contain container, and that the class should not be inherited
    directly.
- Link to v1: https://patch.msgid.link/20251212-image-container-v1-0-fb6586d06813@bootlin.com
---
 documentation/ref-manual/classes.rst   | 46 ++++++++++++++++++++++++++++++++++
 documentation/ref-manual/variables.rst | 18 +++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a56a2f719..a46a5527f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1258,6 +1258,52 @@ The :ref:`ref-classes-image_types` class also handles conversion and compression
    :term:`IMAGE_FSTYPES`. This would also be similar for Virtual Box Virtual Disk
    Image ("vdi") and QEMU Copy On Write Version 2 ("qcow2") images.
 
+.. _ref-classes-image-container:
+
+``image-container``
+===================
+
+The :ref:`ref-classes-image-container` class is automatically inherited in
+:doc:`image </ref-manual/images>` recipes that have the ``container`` image type
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
+Otherwise an error is triggered. If desired, the
+:term:`IMAGE_CONTAINER_NO_DUMMY` variable can be set to "1" to skip this check.
+
+The ``linux-dummy`` recipes acts as a Linux kernel recipe but builds nothing. It
+is relevant to use as the preferred Linux kernel provider in this case as a
+container image does not need to include a Linux kernel. Selecting it as the
+preferred provider for the kernel will also decrease build time.
+
+Using this class only deploys an additional ``tar.bz2`` archive to
+:term:`DEPLOY_DIR_IMAGE`. This archive can be used in a container file (a file
+typically named ``Dockerfile`` or ``Containerfile``). For example, to be used with
+:wikipedia:`Podman <Podman>` or :wikipedia:`Docker <Docker_(software)>`, the
+`container file <https://docs.docker.com/reference/dockerfile/>`__ could contain
+the following instructions:
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
index 71fe11b83..7c03dc138 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3955,6 +3955,24 @@ system and gives an overview of their function and contents.
       variable, see the :ref:`ref-classes-image_types`
       class file, which is ``meta/classes-recipe/image_types.bbclass``.
 
+   :term:`IMAGE_CONTAINER_NO_DUMMY`
+      When an image recipe has the ``container`` image type in
+      :term:`IMAGE_FSTYPES`, it expects the :term:`PREFERRED_PROVIDER` for
+      the Linux kernel (``virtual/kernel``) to be set to ``linux-dummy`` from a
+      :term:`configuration file`. Otherwise, an error is triggered.
+
+      When set to "1", The :term:`IMAGE_CONTAINER_NO_DUMMY` variable allows the
+      :term:`PREFERRED_PROVIDER` variable to be set to another value, thus
+      skipping the check and not triggering the build error. Any other value
+      will keep the check.
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
base-commit: d84d916d4fc505e8386693306b6a90b0064c0518
change-id: 20251023-image-container-fdc6d79f6729


