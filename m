Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8E8C5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 07:36:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13891.1786606606174059456
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 00:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=l6qWski0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1B0904E411DE
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 07:36:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBAD4602B8
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 07:36:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 132B011C4DA41;
	Thu, 13 Aug 2026 09:36:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786606603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9XcDW3ZfGA3y/bhmlRaXe5KvaDrOWZOMAFf+jtkPwGw=;
	b=l6qWski0od+iakiorQnjBQKfFu+/kUoGIr0T/DsOUeYoGi7mJJMWMqDGr1IAl19NW1EmOM
	TBStgvGadvDPFJ9I6qsKtt/JApwL6z858f/zpdqGl6Znw4PLPmYoZcnnjUXepFt6Ke38sb
	lF5LAqV9QipDgpc1UNxXEWNAKF5nav1CroetWOb30EwDOuQZDsXAr0o30nuGOnPkXfhe36
	cMZLsLrT/x2B700JIS3BHZyQ0x+k4N1kMQTwsH/4LE+/PMfm1HCjOjRD8mPHFsQkSe520P
	Z9HlwdJSiYY6YrCLf/uL7hln5iA77SY2b/hGmRokWZFqP1TkyTcKr99Qz1/nYw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 13 Aug 2026 09:36:26 +0200
Subject: [PATCH v2] ref-manual: add uboot-extlinux-config class
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-uboot-extlinux-config-v2-1-e6c2e4b78afc@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw7CIBBFf6WZtRigD1tX/ofpQkZoxygYoE1N0
 38X7NrlSc69Z4WgPekA52IFr2cK5GwCeSgAx5sdNKN7YpBcNrySHZuUc5HpJT7JTgtDZw0NzJi
 6PSHnnawVpO3ba0PL7/fa7xwm9dAY81k2RgrR+c8vPIvs7Y2WV38as2CCmQaVaHiJZVtespaUI
 7oX9Nu2fQHvitxdzgAAAA==
X-Change-ID: 20260429-uboot-extlinux-config-ff587c00925b
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12976;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=T0dn2M5Vu7/bn3XAE7zp65ov8x84HYsmElzJ7Sfq2R0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqfXQKlN+pxSIwXTXdO5ghDABNkjeeB9hOHdvMs
 NWRxDheOZSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCan10CgAKCRDRgEFAKaOo
 NpEcD/4u8oeObtSB8hPrdMBp8N+Ypeu2Mnn6cGm6XAjtjaU4eXq/7MAIisgRZdGed2AfeyfrEXH
 r61aX1b1XhwhYd+04/ODHsoR2+ztEVBiShe8bYtsFxRkRVFAZe4eE/M9JI6oJ3fjsD9ROZ0Q7dW
 wTwc0s/SJbnDhSZmZ/+PVmJQ1hfmGvBF9xclORVEb5liIqQXwPSvBLiC3mTcKgaNWPs0874rSJo
 74VoDjRk1aX7UIHeCjjpNM/g7lO+poJuxZrD7g9RztsFJ4fFHnHzzxdGNLrh28uufOEmpXcGSlB
 IwrK9fOt4RtQk4XHBwVrV2/5GJPVhBGS6XGsM1z2B0XZpDIQrtW0jUF223me7TLPQT0es9Khv89
 CwhtCh7DmmtmSg30L4OW4P0JmHjYDCz/vet/+DA1TThp2hB/ptv/B801VDEpES5RGpTiiyb9ir4
 EshJFL6E8Z+T36mwPM9/aK2fUhPcgR0eIfuNpouNisfUNb0GQy+OJtOo1LQhewEY5xMAIF+IoWj
 qJuS87Bi83DeL7maFa6KmdUk6rzLu4IdGucEX8yDkhRjFvcQgnO4Gd2Qwk3JcSmQSKL0gwhrqYs
 4hdrxLKb7aAzTnQdMsMp5Pvo3YFdDpkvXUJBlXmi5NsCZqegTsVVFYFnxEY53hGzAtRrvWPdOea
 mfx11J/MMXfEVAQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 07:36:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10273

Add documentation for the uboot-extlinux-config class and the variables
it defines, including how to enable it and how to customize the output
extlinux.conf file.

[YOCTO #15629]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Address comments by Quentin (thanks!)
- Add doc for more extlinux related variables
- Link to v1: https://patch.msgid.link/20260804-uboot-extlinux-config-v1-1-f6cb1603c383@bootlin.com
---
 documentation/ref-manual/classes.rst   |  56 ++++++++++
 documentation/ref-manual/variables.rst | 184 +++++++++++++++++++++++++++++++++
 2 files changed, 240 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 98dff1bac..b015dc169 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3470,6 +3470,62 @@ possible.
 See the :term:`UBOOT_CONFIG` and :term:`UBOOT_MACHINE` variables for additional
 information.
 
+.. _ref-classes-uboot-extlinux-config:
+
+``uboot-extlinux-config``
+=========================
+
+The :ref:`ref-classes-uboot-extlinux-config` class provides support for
+generating an ``extlinux.conf`` file part of the `Generic Distro Configuration Concept
+<https://docs.u-boot-project.org/en/latest/develop/distro.html#boot-configuration-files>`__
+of U-Boot.
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
index e75f42afe..dfcb95374 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -11570,6 +11570,190 @@ system and gives an overview of their function and contents.
       The default is ``txt`` which means the script is installed as-is, with
       no modification.
 
+   :term:`UBOOT_EXTLINUX`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class in a
+      U-Boot recipe, the :term:`UBOOT_EXTLINUX` variable should be set to "1" to
+      enable the class functionality (inheriting the class is not enough).
+
+   :term:`UBOOT_EXTLINUX_CONF_NAME`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_CONF_NAME` variable controls the name of the
+      file used for booting, which is ``extlinux.conf`` by default.
+
+   :term:`UBOOT_EXTLINUX_CONSOLE`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_CONSOLE` variable can be set to control the
+      ``console=`` parameter of the `Linux kernel command-line
+      <https://docs.kernel.org/admin-guide/kernel-parameters.html>`__. For
+      example::
+
+         UBOOT_EXTLINUX_CONSOLE = "console=ttyS0,115200n8"
+
+      This is added to the ``APPEND`` property of the ``extlinux.conf`` file
+      used for booting.
+
+   :term:`UBOOT_EXTLINUX_DEFAULT_LABEL`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_DEFAULT_LABEL` variable can be set to the name of
+      the label to automatically boot after the timeout period (controlled with
+      :term:`UBOOT_EXTLINUX_TIMEOUT`).
+
+   :term:`UBOOT_EXTLINUX_FDT`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_FDT` variable can be set to control the ``FDT``
+      property of the ``extlinux.conf`` file used for booting, which controls
+      the Linux kernel device tree to use. For example::
+
+         UBOOT_EXTLINUX_FDT = "../am335x-bone.dtb"
+
+      .. note::
+
+         The above path is relative to the ``extlinux.conf`` file used for
+         booting. It can also be absolute, with the path being the one as stored
+         in the partition from which the ``extlinux.conf`` file is.
+
+   :term:`UBOOT_EXTLINUX_FDTDIR`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_FDTDIR` variable can be set to control the ``FDTDIR``
+      property of the ``extlinux.conf`` file used for booting, which controls
+      the directory where the Linux kernel device tree specified in the
+      ``fdtfile`` U-Boot environment variable is. For example::
+
+         UBOOT_EXTLINUX_FDTDIR = "../"
+
+      .. note::
+
+         The above path is relative to the ``extlinux.conf`` file used for
+         booting. It can also be absolute, with the path being the one as stored
+         in the partition from which the ``extlinux.conf`` file is.
+
+   :term:`UBOOT_EXTLINUX_FDTOVERLAYS`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_FDT` variable can be set to control the ``FDTOVERLAYS``
+      property of the ``extlinux.conf`` file used for booting, which controls
+      the Linux kernel device overlays tree to apply on top of the device tree.
+      For example::
+
+         UBOOT_EXTLINUX_FDTOVERLAYS = "../am335x-bone-wifi.dtbo"
+
+      .. note::
+
+         The above path is relative to the ``extlinux.conf`` file used for
+         booting. It can also be absolute, with the path being the one as stored
+         in the partition from which the ``extlinux.conf`` file is.
+
+   :term:`UBOOT_EXTLINUX_INITRD`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_INITRD` variable is optional and sets the value of
+      the ``INITRD`` property of the ``extlinux.conf`` file used for booting, if
+      the initramfs is external to the Linux kernel (see
+      :term:`INITRAMFS_IMAGE_BUNDLE`). For example::
+
+         UBOOT_EXTLINUX_INITRD = "../ramdisk.tar.zst"
+
+      .. note::
+
+         The above path is relative to the ``extlinux.conf`` file used for
+         booting. It can also be absolute, with the path being the one as stored
+         in the partition from which the ``extlinux.conf`` file is.
+
+   :term:`UBOOT_EXTLINUX_INSTALL_DIR`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_INSTALL_DIR` variable controls the name of the
+      directory where the ``extlinux.conf`` file used for booting is installed,
+      relative to the root of the partition where the directory will belong.
+
+   :term:`UBOOT_EXTLINUX_KERNEL_ARGS`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_KERNEL_ARGS` variable can be used to pass extra
+      parameters to the `Linux kernel command-line
+      <https://docs.kernel.org/admin-guide/kernel-parameters.html>`__. For
+      example::
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
+      the Linux kernel image to use. For example::
+
+         UBOOT_EXTLINUX_KERNEL_IMAGE = "../zImage"
+
+      .. note::
+
+         The above path is relative to the ``extlinux.conf`` file used for
+         booting. It can also be absolute, with the path being the one as stored
+         in the partition from which the ``extlinux.conf`` file is.
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
+      can be used for booting. This list must contain at least one entry, and
+      default to "linux".
+
+      When multiple labels are specified in this list, all of the
+      ``UBOOT_EXTLINUX_`` variables should be specified with overrides-style
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
+      ``uncompressed`` labels if and only if ``UBOOT_EXTLINUX_FDT:compressed``
+      and ``UBOOT_EXTLINUX_FDT:uncompressed`` aren't set::
+
+         UBOOT_EXTLINUX_FDT = "../am335x-bone-wifi.dtbo"
+
+   :term:`UBOOT_EXTLINUX_MENU_DESCRIPTION`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_MENU_DESCRIPTION` variable sets the value of the
+      ``LABEL`` property of the ``extlinux.conf`` file. If not specified, the
+      name of the label itself is used as the description.
+
+   :term:`UBOOT_EXTLINUX_MENU_TITLE`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_MENU_TITLE` variable sets the ``MENU TITLE``
+      property of the ``extlinux.conf`` file used for booting. This variable
+      doesn't support the overrides-style syntax described in
+      the definition of :term:`UBOOT_EXTLINUX_LABELS` as it applies to the whole
+      ``extlinux.conf`` file.
+
+   :term:`UBOOT_EXTLINUX_ROOT`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_ROOT` variable is mandatory and contains the
+      ``root=`` parameter of the `Linux kernel command-line
+      <https://docs.kernel.org/admin-guide/kernel-parameters.html>`__. For
+      example, the following would set this value to instruct the kernel to use
+      the second partition of MMC block device 0 as its root partition::
+
+         UBOOT_EXTLINUX_ROOT = "root=/dev/mmcblk0p2"
+
+   :term:`UBOOT_EXTLINUX_TIMEOUT`
+      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
+      :term:`UBOOT_EXTLINUX_TIMEOUT` variable is optional and sets the value of
+      the ``TIMEOUT`` property of the ``extlinux.conf`` file used for booting.
+
    :term:`UBOOT_FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
       description of the U-Boot FIT image.

---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260429-uboot-extlinux-config-ff587c00925b


