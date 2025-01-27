Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBD9C0218C
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 09:18:29 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.48109.1737969501300569451
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 01:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ey0wKsmf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41B01FF80B;
	Mon, 27 Jan 2025 09:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737969499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N1EO87olGAe7MSKFBHNWlkY7M+lWNSGS26vfFjTpQS8=;
	b=ey0wKsmfuYMNPi33bOOxxddcqj6YvRG5zoAg1pe3L5Rp8eaCs1zvbI89G7QCCr8GKdi1Ig
	1rJ9CwGrVrM+LjDFxg/1Sfb1/bhQ249OD2IMTh4PQgRPaQbbXrL6AFaYTFVISY/HMySTsJ
	QuVhn7hN/oEMkElRtaMRr2p3PfqpvGwQdpn0vIobYHd+YKKvIbjv+REs/Wfap4m7Y9w+yC
	w6v2Q6pgOpJ8h9xxL7am+lDrs5BGSHnM7BWhi93yCex/1ql0qihFzY+GhLVOaU1s4AMohg
	b+CCkDrbL+PI+28ScmAicCiOHp6AECclVZ8RXHHE1as3gqybo4i918AnJ8IJwg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Jan 2025 10:18:12 +0100
Subject: [yocto-docs][PATCH v3] dev-manual/building: document the
 initramfs-framework recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-initramfs-framework-v3-1-e54d6d834c76@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFNPl2cC/33NwQrCMAyA4VcZPVtpsxWdJ99DPHRd6oKulXZUZ
 fTd7XZSEE/hD+TLzCIGwsgO1cwCJorkXYl6UzEzaHdBTn1pBgKUkKLm5GgKerSR2zLw4cOV6w4
 aadHY1rSsXN4DWnqu6ulceqA4+fBanyS5bP97SXLJO2ugiErsGzh23k83clvjR7aICT4UufutQ
 FFa2SsDtUbVN99KzvkN6OP7gv4AAAA=
X-Change-ID: 20250103-initramfs-framework-ab241fecf9c9
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alejandro <alejandro@enedino.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7021;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=s5Rsll9CL/cmICHT1lWN/aKwVmfWwD2kZaypksMrcmU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnl09b4Rx2P33h8zwquMi81BLe8ImJMaEz6WLYV
 lDUQ+h0BjOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5dPWwAKCRDRgEFAKaOo
 NrQUEACh/tMlB+AZxcXdevUICulYf7hp7++Dho94NaVWh1zoh5KnLJeMI8LIZAwGzKasOdTeC4y
 Rs6RvU7WkTfLRMP4w4O4bYaJNVnR0LO4fo9JFhfWcp9Tpl20SK3bHddlBrjWaFnT7VeKxQBBin9
 PRsSyKTP5HoYFSuP/4oTE/S4VGfxSc78lYxfMHV2/+3ElgvZqokmCH9+eixyJ++cqRx5X/BGCVS
 JGCEYnc8/EeOTqtaQxAazF2vpscD+Ug99ja0rktK1Hn2csUg/HzP1K9iRro599ztdFMXFtMfono
 IXAAFwstWfPQRjSO8eAHj19655tdVFo3ZTiDIiYI1aOJi/ept6N8xP0iNaZSQFZfLOI3Z5rQwg5
 SfTRPSh4nTcuvsNsOqFaS/YrhfNEi/6lkaKRixNEN0jlAZzjs3J6kvJwuNUgQCmGZXtBzYjuW66
 m4VwLKxZJvWrUOLU2cZ1bgFR0yq+FMx9OQwo2fiqtw2VbOfTZB5kk57dVR6UkrxtMwzcQuG4TMU
 rVEUrm/V28ap2Dzlkl5pkYSOGtjnO9dJN5g7S0fHk9MLq13FgPdJn8LODrjrFETr9xIwfSv6sK9
 n0TCYb6CzDOGtHY2rIyFAZXT5p5u/lbLxdz9fYcInjYlZzKcREXCHtJUh9L/+PbiU3lpobtAFj3
 T0CLHpt76S4BeTA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 09:18:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6187

[ YOCTO #14747 ]

Adding a initramfs is a common task, and the way oe-core offers to do so
is by using the initramfs-framework recipe and companion modules. There
was already documentation on adding an initramfs but the documentation
was lacking details on this framework. Add it before the multiconfig
section because it is a bit more important IMO.

Reported-by: Alejandro <alejandro@enedino.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Rephrase RDEPENDS mention to be package specific (thanks Quentin!)
- Link to v2: https://lore.kernel.org/r/20250117-initramfs-framework-v2-1-91d5c23ae5d4@bootlin.com

Changes in v2:
- Various rephrasings and typos from Quentin Schulz (thank you!)
- Link to v1: https://lore.kernel.org/r/20250103-initramfs-framework-v1-1-bfc2cf950842@bootlin.com
---
 documentation/dev-manual/building.rst | 84 ++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index fe502690ddc45694a9b0ae2d5e98894fe5153d74..4770a5a184fa63edfeaf60bb3b1aabd8eddc1ee7 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -280,7 +280,9 @@ Follow these steps to create an :term:`Initramfs` image:
 #. *Create the Initramfs Image Recipe:* You can reference the
    ``core-image-minimal-initramfs.bb`` recipe found in the
    ``meta/recipes-core`` directory of the :term:`Source Directory`
-   as an example from which to work.
+   as an example from which to work. The ``core-image-minimal-initramfs`` recipe
+   is based on the :ref:`initramfs-framework <dev-manual/building:Customizing an
+   Initramfs using \`\`initramfs-framework\`\`>` recipe described below.
 
 #. *Decide if You Need to Bundle the Initramfs Image Into the Kernel
    Image:* If you want the :term:`Initramfs` image that is built to be bundled
@@ -308,6 +310,86 @@ Follow these steps to create an :term:`Initramfs` image:
    and bundled with the kernel image if you used the
    :term:`INITRAMFS_IMAGE_BUNDLE` variable described earlier.
 
+Customizing an Initramfs using ``initramfs-framework``
+------------------------------------------------------
+
+The ``core-image-minimal-initramfs.bb`` recipe found in
+:oe_git:`meta/recipes-core/images
+</openembedded-core/tree/meta/recipes-core/images>` uses the
+:oe_git:`initramfs-framework_1.0.bb
+</openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb>`
+recipe as its base component. The goal of the ``initramfs-framework`` recipe is
+to provide the building blocks to build a customized :term:`Initramfs`.
+
+The ``initramfs-framework`` recipe relies on shell initialization scripts
+defined in :oe_git:`meta/recipes-core/initrdscripts/initramfs-framework
+</openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework>`. Since some of
+these scripts do not apply for all use cases, the ``initramfs-framework`` recipe
+defines different packages:
+
+-  ``initramfs-framework-base``: this package installs the basic components of
+   an :term:`Initramfs`, such as the ``init`` script or the ``/dev/console``
+   character special file. As this package is a runtime dependency of all
+   modules listed below, it is automatically pulled in when one of the modules
+   is installed in the image.
+-  ``initramfs-module-exec``: support for execution of applications.
+-  ``initramfs-module-mdev``: support for `mdev
+   <https://wiki.gentoo.org/wiki/Mdev>`__.
+-  ``initramfs-module-udev``: support for :wikipedia:`Udev <Udev>`.
+-  ``initramfs-module-e2fs``: support for :wikipedia:`ext4/ext3/ext2
+   <Extended_file_system>` filesystems.
+-  ``initramfs-module-nfsrootfs``: support for locating and mounting the root
+   partition via :wikipedia:`NFS <Network_File_System>`.
+-  ``initramfs-module-rootfs``: support for locating and mounting the root
+   partition.
+-  ``initramfs-module-debug``: dynamic debug support.
+-  ``initramfs-module-lvm``: :wikipedia:`LVM <Logical_volume_management>` rootfs support.
+-  ``initramfs-module-overlayroot``: support for mounting a read-write overlay
+   on top of a read-only root filesystem.
+
+In addition to the packages defined by the ``initramfs-framework`` recipe
+itself, the following packages are defined by the recipes present in
+:oe_git:`meta/recipes-core/initrdscripts </openembedded-core/tree/meta/recipes-core/initrdscripts>`:
+
+-  ``initramfs-module-install``: module to create and install a partition layout
+   on a selected block device.
+-  ``initramfs-module-install-efi``: module to create and install an EFI
+   partition layout on a selected block device.
+-  ``initramfs-module-setup-live``: module to start a shell in the
+   :term:`Initramfs` if ``root=/dev/ram0`` in passed in the `Kernel command-line
+   <https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html>`__
+   or the ``root=`` parameter was not passed.
+
+To customize the :term:`Initramfs`, you can add or remove packages listed
+earlier from the :term:`PACKAGE_INSTALL` variable with a :ref:`bbappend
+<dev-manual/layers:Appending Other Layers Metadata With Your Layer>` on the
+``core-image-minimal-initramfs`` recipe, or create a custom recipe for the
+:term:`Initramfs` taking ``core-image-minimal-initramfs`` as example.
+
+Custom scripts can be added to the :term:`Initramfs` by writing your own
+recipes. The recipes are conventionally named ``initramfs-module-<module name>``
+where ``<module name>`` is the name of the module. The recipe should set its
+:term:`RDEPENDS` package-specific variables to include
+``initramfs-framework-base`` and the other packages on which the module depends
+at runtime.
+
+The recipe must install shell initialization scripts in :term:`${D} <D>`\
+``/init.d`` and must follow the ``<number>-<script name>`` naming scheme where:
+
+-  ``<number>`` is a *two-digit* number that affects the execution order of the
+   script compared to others. For example, the script ``80-setup-live`` would be
+   executed after ``01-udev`` because 80 is greater than 01.
+
+   This number being two-digits is important here as the scripts are executed
+   alphabetically. For example, the script ``10-script`` would be executed
+   before the script ``8-script``, because ``1`` is inferior to ``8``.
+   Therefore, the script should be named ``08-script``.
+
+-  ``<script name>`` is the script name which you can choose freely.
+
+   If two script use the same ``<number>``, they are sorted alphabetically based
+   on ``<script name>``.
+
 Bundling an Initramfs Image From a Separate Multiconfig
 -------------------------------------------------------
 

---
base-commit: 8bd2bc3c00ca80f4c000a2a8d618a9f8ea3aa54b
change-id: 20250103-initramfs-framework-ab241fecf9c9

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


