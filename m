Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988A8C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 11:58:48 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9229.1737115124165629379
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 03:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=es/EKvMk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1B761BF206;
	Fri, 17 Jan 2025 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737115122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AjO0xwh92Z2iie2gTgAQ6zmxjEd7VxtBUbpXrmVzgFw=;
	b=es/EKvMkzCQqgt4laHmZhOFu7nVIYtb2YZERTeSMtq1++JjoHk/pbVsH4oqRTxu4aDaDMy
	B5ONsSshe5A2U0KlQ3CArwykJU/LVodXFSUAc2Y8LSYyg8qOcP3WzRa2U2eoAx9++l/ajm
	zCabrrOOE6fbtXWXc04P0LlNOoyU4oGGqOGrGCe3uBwPwXPeuwgtc49eILepS77UqU56qn
	L+E3oTHxkZoEw3vjAT5d84pC7cFMTEuu6bSnZsz/SUXBCSerZwRn8jajvwxJEHi+cCxwdw
	L4TnKS+KQ+bfcZVuvTnkO9BuOoAxIsiwhnVdaacLJU7CWEwc3kjOgkBxWVGgjg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 17 Jan 2025 12:58:15 +0100
Subject: [yocto-docs][PATCH v2] dev-manual/building: document the
 initramfs-framework recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-initramfs-framework-v2-1-91d5c23ae5d4@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANZFimcC/32NQQ7CIBBFr9LMWgxgm1hX3sN0ATjYiRbMQFDTc
 HexB3D1837y318hIRMmOHUrMBZKFEMDvevAzSbcUNC1MWipB6nkQVCgzGbxSfgW+Ip8F8bqXnl
 0fnQjtOWT0dN7s16mxjOlHPmznRT1a//7ihJKWO90Mw7y2OuzjTE/KOxdXGCqtX4BqT0mhrgAA
 AA=
X-Change-ID: 20250103-initramfs-framework-ab241fecf9c9
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alejandro <alejandro@enedino.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6805;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rG+5Qe1bjsYGVdMmaasad/GFwxRUjvZp2+UFICrHJDA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnikXxkM7iR3ExesY8HlGyDFEm526qsz/Cn8j3l
 uAc4sgm+xmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ4pF8QAKCRDRgEFAKaOo
 NilXD/9s0TNJRQcsrc5oF4w768O/4slpGEJVig1mty2fcrbrqYlOtMvDQG3vkviVpQMMpNqKWAr
 OYDuOb3MsEsgXxil57Gq1wqIBaIdRo3Hl50z679IJyAEh0Gq21smryKNvwVDn6H6H6dj+I1Cxhs
 oGeLNp+QFEky13aMw+sZBBP7ha9B4ppp3rpKrPFTrXM3QPczTbIRM25whJedShLvvdughERORNz
 1gaFDw5YPWMPzhukNZtBAvd6PxF1wu+Sx3MM0AniS+3VZAyotWn1gh6opnBFgkdO6euELdztRWL
 AcI8hhuGD8IYjhemoKrIkyIwNt9qKariI8VaMqTAJgP5Cr1kIm0k1tp9CzqbwIjiBTHS8svGzMX
 HnyJpkacGxZJpL2kJ1PbQsSWua+yxL1mHdIvmC/tfeA794LuzqJOszQvk8YVUkhYzgTUN5xQ14z
 Ntvuq+kXd43mnDHQD2NW+jg0gJMRMDYSDJtnyB6E0lOa+IHiKGQxRx0QZ0qDPdcF3ZC/MO7wWrj
 kXvkBI/pwF46y3jq8rpzgaLxrmeWRsl3tvFz3Z1wjCs6BQ25dR7eWs+zEb0dVC8C7N4/ZTjJIjW
 0h+zyCw6QbilFuu5tl80uOioAi2jzhvALqjT//9sJ9q+lTr4ga4kn8l7fAi8AahrSmXDPGQfrss
 fk67Io0vlWsTRDg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 11:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6131

[ YOCTO #14747 ]

Adding a initramfs is a common task, and the way oe-core offers to do so
is by using the initramfs-framework recipe and companion modules. There
was already documentation on adding an initramfs but the documentation
was lacking details on this framework. Add it before the multiconfig
section because it is a bit more important IMO.

Reported-by: Alejandro <alejandro@enedino.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Various rephrasings and typos from Quentin Schulz (thank you!)
- Link to v1: https://lore.kernel.org/r/20250103-initramfs-framework-v1-1-bfc2cf950842@bootlin.com
---
 documentation/dev-manual/building.rst | 83 ++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index fe502690ddc45694a9b0ae2d5e98894fe5153d74..853642d513a62afd9ef3fb7bf1b49b8455d27c77 100644
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
@@ -308,6 +310,85 @@ Follow these steps to create an :term:`Initramfs` image:
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
+variable :term:`RDEPENDS` to ``initramfs-framework-base`` and the other packages
+on which the module depends at runtime.
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
base-commit: 6b44257874858db3aa426d3e84a79c41cb4937a3
change-id: 20250103-initramfs-framework-ab241fecf9c9

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


