Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC33E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 16:35:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.558.1735922106718099299
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jan 2025 08:35:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dZhU2IYj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE855E0002;
	Fri,  3 Jan 2025 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735922105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YOedYfXEk1qlHoqr/V8E7wvQrq0E7mEajj3p4DdfFmc=;
	b=dZhU2IYjJ07NpDaM+ozjq0ukaA823DssckIhDr8JAvk/EvFbQ+31+kZsMKw4Xi0Lap3Uum
	bsDVZfQhN6lk7ogr5IC0uiMX/J52YQoec+DW7aUXVlV+C+BFzUOzJNFVuDVDiLt9Rp8e1y
	j9GZBLbUMnl8gq4kfmZoKknfcJ9P42Oqzlqk0bgf2v+eufMVTh1sRNtCJkZsR0SUCgNWsR
	jH2pS1kNYHWdHe3Ub+44P/y092PGTFdxmui/uxOJlWZTrRWI8bsX2JjfjSbwPPM/n+6fP9
	6w4mDFK6FD4b9WFIiZsjUx8ZjmUxJ6kn5dt8bjohsPA+62frJfP1y0hW3LtMuA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 03 Jan 2025 17:34:53 +0100
Subject: [yocto-docs][PATCH] dev-manual/building: document the
 initramfs-framework recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-initramfs-framework-v1-1-bfc2cf950842@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKwReGcC/x2MQQ5AMBAAvyJ71qQtDnxFHKp22YiSrSBp/F3jN
 JnDTIKIwhihKxIIXhx5D1lMWYBfXJhR8ZQdrLaNNrpSHPgUt1FUlIH3Lqtyo60NoafWt5DLQ5D
 4+a/98L4feFBL+GUAAAA=
X-Change-ID: 20250103-initramfs-framework-ab241fecf9c9
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alejandro <alejandro@enedino.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6137;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vpaBIUF1LQrnDQ6z1dbvH1YXKYGaO7/3DWwJkjOoUrI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBneBG4J0vBRwHl9dRRMEgWxQ6+dUAHEW6IEohBE
 8FdmztvlJWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ3gRuAAKCRDRgEFAKaOo
 NtYWD/9rLzx1/qE42w25XOgD9AF+qEMxCDkau42MDTZKFAPKLdIH2sJXE46bZtf8QNM/QdPe+KB
 ao4chPpEDbUocPnGcM4EoMAxkVFWdAgHhR+5ZDGKWbTZGff9uxGDZ9+YuE8hGltGwDhiaGrOwZV
 8JfDy2BB977VVUKoTZhhV1wQ+pA6vGovjEUDz0PZTQMzGXGd3Qwv7YOGJB8LJ3ap+ytkhhpjQ0l
 eMVgmNOPGwyYGVuhDwUSMjsjyJ2eBl1iC2+jbbaVPF++kJl9t56CVQUJIlRTTqiPLgG7gqxf5Af
 iQ8LSWyLpZ8YEBwsqz3zQuj6Pt7wTmdQFNP/KvfNOsoEb/De5uN9vXlzJl+UGDPXcVNWqjtMsAz
 8pcE+7D1XWvFbC95Ag6lIRCN6zS1tBdk4CygGoG8QJhHMX0/cn3rPDoCN4tROvIuJaecU5ftv8p
 Iz+pfKsMH5AfUBola6/J4+Dw1tYv4ibiuOUulec4aiQOS/zbnsFoXR9fv1Z4OTYGULgy6gkOpMr
 8k+vo8O/1vOOJYQ+WSVe9jbkSUo1ahBA42UxlAoCpVijML/Db5dA+8jbGsBdSdVmiMo2TLuZkKy
 LfOA11woIYlYQKd4toUSo7bGDs6/8JNhFFtI9FzQwqzZ1SFDq8J3R2Gs8TdQ/npo8NXpinm+LP0
 QfQHswSyQ/t9prg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jan 2025 16:35:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6059

[ YOCTO #14747 ]

Adding a initramfs is a common task, and the way oe-core offers to do so
is by using the initramfs-framework recipe and companion modules. There
was already documentation on adding an initramfs but the documentation
was lacking details on this framework. Add it before the multiconfig
section because it is a bit more important IMO.

Reported-by: Alejandro <alejandro@enedino.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/building.rst | 74 ++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index fe502690ddc45694a9b0ae2d5e98894fe5153d74..fe720fcacc562c70bb886062153b587f5df11651 100644
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
@@ -308,6 +310,76 @@ Follow these steps to create an :term:`Initramfs` image:
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
+   character special file. This package should always be installed if using any
+   of the additional modules below.
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
+variable :term:`RDEPENDS` to ``initramfs-framework-base`` and the packages on
+which the module depends on at runtime.
+
+The recipe must install shell initialization scripts in :term:`${D} <D>`\
+``/init.d`` and must follow the ``<number>-<script name>`` naming where:
+
+-  ``<number>`` is a two-digit number that affects the execution order of the
+   script compared to others. For example, the script ``80-setup-live`` would be
+   executed after ``01-udev`` because 80 is greater than 01.
+
+-  ``<script name>`` is the script name which can you can choose freely.
+
 Bundling an Initramfs Image From a Separate Multiconfig
 -------------------------------------------------------
 

---
base-commit: 3f3a9f53fea6c7d533b9e999dc959dcc3bed7745
change-id: 20250103-initramfs-framework-ab241fecf9c9

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


