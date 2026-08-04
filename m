Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082F9C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 15:25:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19085.1785857109603355347
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Aug 2026 08:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=00ve4sYG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5DF681A13BB
	for <docs@lists.yoctoproject.org>; Tue,  4 Aug 2026 15:25:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 27A4C6029E
	for <docs@lists.yoctoproject.org>; Tue,  4 Aug 2026 15:25:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E28911C33013;
	Tue,  4 Aug 2026 17:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785857102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=vjKentGo+ehAe758DwJJNkTNmOq6rtfbQINnr710n+U=;
	b=00ve4sYGVR7CIinTU4nXwApzfd2seJEKbPeYU20qkTRsRwRq4/6HcT+dSNvzSPZT1qYzLY
	0y0yegALJpJDQn2ll/WawqhowzKHWwbVvxQ42M09n2C8/FajQ/1nnAXUzoHfxWnPgMRO8H
	SXxhBtb360fvOGDrp56q4Do98MzbsoI2JQ0s8coetEzyKYtSLU45gxGxAeAoAcTn3MpQrx
	hZARWIvGruPkAPwkkbZFTgT5+QoMWs+DrmLl4Q+8ehFx/3OQlRS74SIv6t5eLbHI2A+Dg7
	XoFrIy5s3m3oAbysWeJPbI0tI6Pcjq107TfH9f469Vfu2BwELq/JCYiv4AjYbw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 04 Aug 2026 17:24:57 +0200
Subject: [PATCH] ref-manual: add uboot-extlinux-config class documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-uboot-extlinux-config-v1-1-f6cb1603c383@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBBA0V+RWTsQg8/+irgw6USnlKTkIQHx3
 xvb5Vnce0IgzxTgUZ3g6eDAzhY0dQV6X+1GyM9ikEL2opUTJuVcRMrxzTZl1M4a3tCYbhy0EJP
 sFJT248lw/n3n5e+Q1It0vGdwXV/+EKJceQAAAA==
X-Change-ID: 20260429-uboot-extlinux-config-ff587c00925b
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9970;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LapeSCdfzW4qbiR0qQmOzLeJV4vbpU+ngaWiZP+R1hs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqcgRNQk54wo3gnra2hyowCui4hFA5EVzAW3X3n
 21Vj0Y8VySJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanIETQAKCRDRgEFAKaOo
 NiEVD/4o6LfrS37sZIih8FZPLepNPfljqEuXZ2A2GE1gEhtoObzOKUVxFZazhIXFdzkFwpVnesh
 7NZW/MIRIoxh3/m/kkwrY9NIGXtTskoNrTwpvxAjK1cTvHOvPAEM6s2PSO/1X3Z11CLMs5Uf3lH
 2jdnwH+H0Yx03q5fUZR92HtwFAuD9PpAnmEkXkX662JnqpL78fxoPueI/ZHwaoC7bZEBfEyZnqd
 7ixOBFB7LMm7MjNH4L2Ag+syelVI4ZJpCki3KgkC/gr3QUjg5cLyecozH5r2rMlFjzOCu0vO2me
 1RBlru7Q/UGHiP+Y+JgJj/yyYyC5qe/bOL0Rul4ZU/ENM1Tl/XtCPGtgCnA0YjBRiZvmk2gjsEa
 lQTO6Q3X7E3JGcG1ZvB0dfdTLYoxJBO01Pb3JRq7igyImHdiz+utuOP97ywiiS7XEsVOXo5sTFv
 vxvt3zhW6zjgKUD6O/UrV51j8LjFG7af+DMkOzoFRSoGAfE9DdMHWxDrdlzL7d9jk3dUtI5z2qf
 afX5iaM0lqkNzJ2fGJqhsQFIuROyAzlnNPYRigi/qgb39DDIfft91KB41z3Y4YKSNIWlomBCLW9
 0UFxdb5/btn2WGYn1WUaXfTdKbIRZDJPJ6z4UuKzdbFZoL6NgoaWVRqSfZcEwWQ2vOQZw6HcOPy
 UIrXyyGGA5VArLg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Aug 2026 15:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10235

Add documentation for the uboot-extlinux-config class and the variables
it defines, including how to enable it and how to customize the output
extlinux.conf file.

[YOCTO #15629]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   |  55 ++++++++++++++
 documentation/ref-manual/variables.rst | 135 +++++++++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 98dff1bac..9fbfc0b2f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3470,6 +3470,61 @@ possible.
 See the :term:`UBOOT_CONFIG` and :term:`UBOOT_MACHINE` variables for additional
 information.
 
+.. _ref-classes-uboot-extlinux-config:
+
+``uboot-extlinux-config``
+=========================
+
+The :ref:`ref-classes-uboot-extlinux-config` class provides support for
+generating an ``extlinux.conf`` file part of the `Boot Loader Specification
+<https://uapi-group.org/specifications/specs/boot_loader_specification/>`__.
+
+The class can be inherited in a `U-Boot <https://u-boot-project.org/>`__ recipe
+with::
+
+   inherit uboot-extlinux-config
+
+However, the class functionality is disabled by default. To enable it, set the
+:term:`UBOOT_EXTLINUX` variable to "1" from the U-Boot recipe or from a
+``bbappend`` file::
+
+   UBOOT_EXTLINUX = "1"
+
+In addition to :term:`UBOOT_EXTLINUX`, the :term:`UBOOT_EXTLINUX_ROOT` variable
+must be set to the ``root=`` parameter of the `Linux kernel command-line
+<https://docs.kernel.org/admin-guide/kernel-parameters.html>`__. For example,
+the following would set this value to the second partition of MMC block device
+0::
+
+   UBOOT_EXTLINUX_ROOT = "root=/dev/mmcblk0p2"
+
+After building the U-Boot recipe, an ``extlinux.conf`` is generated and placed
+in the deployment directory (:term:`DEPLOY_DIR_IMAGE`):
+
+.. code-block:: text
+
+   tmp/deploy/images/<MACHINE>/extlinux.conf
+
+This file can be customized using the variables beginning with
+``UBOOT_EXTLINUX_`` in the :doc:`Variables Glossary </ref-manual/variables>`
+section of the Yocto Project Reference Manual.
+
+.. note::
+
+   Multiple ``LABELS`` can be specified through the
+   :term:`UBOOT_EXTLINUX_LABELS` variable (i.e. multiple boot entries).
+   Override-style assignment should then be used to specify label-specific
+   properties. See the definition of :term:`UBOOT_EXTLINUX_LABELS` for more
+   information.
+
+.. tip::
+
+   When using the :ref:`bootloader <ref-manual/kickstart:Command: bootloader>`
+   command with WIC, you should explicitly configure the ``.wks.in`` file to use
+   the ``extlinux.conf`` file generated by this class with
+   ``--configfile="${DEPLOY_DIR_IMAGE}/extlinux.conf"``. Otherwise it generates
+   a default ``extlinux.conf`` file without taking this class into account.
+
 .. _ref-classes-uboot-sign:
 
 ``uboot-sign``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e75f42afe..ccd864877 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -11570,6 +11570,141 @@ system and gives an overview of their function and contents.
       The default is ``txt`` which means the script is installed as-is, with
       no modification.
 
+   :term:`UBOOT_EXTLINUX`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class in a
+      U-Boot recipe, the :term:`UBOOT_EXTLINUX` variable should be set to "1" to
+      enable the class functionality (inheriting the class is not enough).
+
+   :term:`UBOOT_EXTLINUX_CONSOLE`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_CONSOLE` variable can be set to control the
+      ``console=`` parameter of the `Linux kernel command-line
+      <https://docs.kernel.org/admin-guide/kernel-parameters.html>`__. For
+      example, use as follows::
+
+         UBOOT_EXTLINUX_CONSOLE = "console=ttyS0,115200n8"
+
+      This is added to the ``APPEND`` property of the ``extlinux.conf`` file
+      used for booting.
+
+   :term:`UBOOT_EXTLINUX_FDT`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_FDT` variable can be set to control the ``FDT``
+      property of the ``extlinux.conf`` file used for booting, which controls
+      the Linux kernel device tree to use. For example, use as follows::
+
+         UBOOT_EXTLINUX_FDT = "../am335x-bone.dtb"
+
+      .. note::
+
+         This path is relative to the ``extlinux.conf`` file used for booting.
+
+   :term:`UBOOT_EXTLINUX_FDTDIR`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_FDTDIR` variable can be set to control the ``FDTDIR``
+      property of the ``extlinux.conf`` file used for booting, which controls
+      the directory location for locating and loading the Linux kernel device
+      tree specified in the ``fdtfile`` U-Boot environment variable. For
+      example, use as follows::
+
+         UBOOT_EXTLINUX_FDTDIR = "../"
+
+      .. note::
+
+         This path is relative to the ``extlinux.conf`` file used for booting.
+
+   :term:`UBOOT_EXTLINUX_FDTOVERLAYS`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_FDT` variable can be set to control the ``FDTOVERLAYS``
+      property of the ``extlinux.conf`` file used for booting, which controls
+      the Linux kernel device overlays tree to apply on top of the device tree.
+      For example, use as follows::
+
+         UBOOT_EXTLINUX_FDTOVERLAYS = "../am335x-bone-wifi.dtbo"
+
+      .. note::
+
+         This path is relative to the ``extlinux.conf`` file used for booting.
+
+   :term:`UBOOT_EXTLINUX_KERNEL_ARGS`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_KERNEL_ARGS` variable can be used to pass extra
+      parameters to add to the `Linux kernel command-line
+      <https://docs.kernel.org/admin-guide/kernel-parameters.html>`__. For
+      example, use as follows::
+
+         UBOOT_EXTLINUX_KERNEL_ARGS = "rootwait ro"
+
+      This is included in the ``APPEND`` property of the ``extlinux.conf`` file
+      used for booting.
+
+   :term:`UBOOT_EXTLINUX_KERNEL_IMAGE`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_KERNEL_IMAGE` variable can be used to specify the
+      ``KERNEL`` property of the ``extlinux.conf`` file used for booting, which controls
+      the Linux kernel image to use. For example, use as follows::
+
+         UBOOT_EXTLINUX_KERNEL_IMAGE = "../zImage"
+
+      .. note::
+
+         This path is relative to the ``extlinux.conf`` file used for booting.
+
+      .. tip::
+
+         The :term:`KERNEL_IMAGETYPE` variable can be used to get the name of
+         the current Linux kernel being built by its associated recipe.
+
+   :term:`UBOOT_EXTLINUX_LABELS`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_LABELS` variable contains a list of labels
+      (``LABEL`` property of the ``extlinux.conf`` file used for booting) that
+      can be used for booting. This list should contain at least one entry.
+
+      When multiple labels are specified in this list, all of the variable
+      ``UBOOT_EXTLINUX_`` variable should be specified with overrides-style
+      assignments. For example, if the :term:`UBOOT_EXTLINUX_LABELS` variable
+      contains::
+
+         UBOOT_EXTLINUX_LABELS = "compressed uncompressed"
+
+      Then the :term:`UBOOT_EXTLINUX_KERNEL_IMAGE` variable can be specified
+      multiple times as follows::
+
+         UBOOT_EXTLINUX_KERNEL_IMAGE:compressed = "../zImage"
+         UBOOT_EXTLINUX_KERNEL_IMAGE:uncompressed = "../Image"
+
+      This will make the value of the ``KERNEL`` property be different in each
+      of the associated labels.
+
+      Note that default values are used when no overrides-style assignments are
+      found for the current label. For example, taking the above example again,
+      the following assignment would apply to both ``compressed`` and
+      ``uncompressed`` labels::
+
+         UBOOT_EXTLINUX_FDT = "../am335x-bone-wifi.dtbo"
+
+   :term:`UBOOT_EXTLINUX_MENU_DESCRIPTION`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_MENU_DESCRIPTION` variable sets a description for
+      the label. If not specified, the name of the label itself is used as the
+      description.
+
+   :term:`UBOOT_EXTLINUX_MENU_TITLE`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_MENU_TITLE` variable sets the ``MENU TITLE``
+      property of the ``extlinux.conf`` file used for booting.
+
+   :term:`UBOOT_EXTLINUX_ROOT`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_ROOT` variable is mandatory and should contain the
+      ``root=`` parameter of the `Linux kernel command-line
+      <https://docs.kernel.org/admin-guide/kernel-parameters.html>`__. For
+      example, the following would set this value to instruct the kernel to use
+      the second partition of MMC block device 0 as its root partition::
+
+         UBOOT_EXTLINUX_ROOT = "root=/dev/mmcblk0p2"
+
    :term:`UBOOT_FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
       description of the U-Boot FIT image.

---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260429-uboot-extlinux-config-ff587c00925b


