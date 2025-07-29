Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C04C87FD6
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.3506.1753783013901857957
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JZ4sFpL3;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B0ED43190;
	Tue, 29 Jul 2025 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTjJwG2zTBd8259Kn9PYD8NMZj0AK6RK02JAcmNZ6HE=;
	b=JZ4sFpL3iiU7KFl02E1hEQjmQCl3U0coALRjX1a/VebFWSYkDVlkcDh15oKBng7EvsmhgQ
	ncvPYp5iFLO6S903Ot5tcu9/VNYLCT0JX+xLI4OqZ9hSlgBIV0RjqqArdC9mBNosonVNVf
	uL67CQ6vwSOZKTWBHoccJpy90B5/PAWJUs5VyLqIble5nxlGnASKtkzjjk6fhGGAH2w9rU
	kTfILVaYzMjAHaZ6Z5jeQLgH6Fc6jdj2O6M0kglemF8Bml85MPSEiIzhpBjTe8nTGacjt3
	lJ377zDzjn0O2zaC5wum0ioRw9LD/vfPsdmEQYj0B40k6cAFP8a5Qg3mIKPi+g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:49 +0200
Subject: [PATCH 15/19] docs-wide: update wic source plugin names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-15-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6194;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=eJJxglbZ7D2ZrPxj7da1figyhyXs1VKJN67BUnjblj0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrgtTXz1aAwJ8UOQm4ytycPF3i4Wi0v/qAb1
 BqdH18aiZmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia4AAKCRDRgEFAKaOo
 NituD/4mxBCaVs6MEQQxp4dMklbg00Zjkskg7XWM40G87nxGLskp7KIjBb7g3D2nBD/zkcGmNr8
 IElO7LCMuduAhe7oSyCKFFqbA1xSgyff0eW2Frmz0y0AZW+2jE6932dIvFMZrjciN5OuiDrBTxi
 ZYu87twUQHt76DkvExiqImmEWYuO8HhY/MrTe2+S0uXr7KmmfQtMr2wxw/zXHNPgL5GjOphJS4X
 NXbcWSWEb20W9r+gkCG2wvtVUZvx+XezRYfTDs+nTfOAo3gFbNey4up9erElZnC7jXS9Ct/5R0V
 qs+jKUxpYbQwYnupzJEHuJQIvDxF4AVnBBVFKB3fWoVcjNl1oyAY+ikc7T8+tP3qiOUa9bun0yt
 KR2PB8u+xxLf55ONOwW769rqpKkGM5MWTFYA+Dsh7mrR24P1TPFMZ3pl4rORod1M8ZGgnaJLXy0
 szaSKkH836tWTZtcZQO/b9frwCS7Q2XlN2dbeDuqyJiv2KafVt8e7zazrAUML9Wd8vZFpMhTKG+
 d0yXwLhjU3wkZzRL4wNm0uWCdgSyedRWu6dWPcsVtKdWw/2kaHByNu5rkqC9K1expyS/w3xlJKS
 27I85TTDYPAVqfe6w/vPm/Vbgk0MOug2DcinYdL46L+l6VaGBME2jloWVgMdP3JAs/9pC9UQrwa
 jDR4HdMpjDFIb9w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7405

WIC plugins were renamed after commit 2de444fc3ef4 ("wic: plugins source
bootimage/isoimage rename to allow be imported") in OE-Core. They no
longer contain dashes, but underscores.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/bsp-guide/bsp.rst        |  4 ++--
 documentation/dev-manual/wic.rst       | 16 ++++++++--------
 documentation/ref-manual/classes.rst   |  2 +-
 documentation/ref-manual/variables.rst |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 7eaa4d870..a6444d9af 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1425,8 +1425,8 @@ Project Reference Manual.
 
 -  :term:`IMAGE_BOOT_FILES`:
    Files installed into the device's boot partition when preparing the
-   image using the Wic tool with the ``bootimg-partition`` or
-   ``bootimg-efi`` source plugin.
+   image using the Wic tool with the ``bootimg_partition`` or
+   ``bootimg_efi`` source plugin.
 
 BSP Kernel Recipe Example
 -------------------------
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index fced0e170..07170537b 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -309,7 +309,7 @@ Here are the actual partition language commands used in the
 
    # short-description: Create an EFI disk image for genericx86*
    # long-description: Creates a partitioned EFI disk image for genericx86* machines
-   part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
+   part /boot --source bootimg_efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
    part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
    part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
@@ -348,7 +348,7 @@ populate a specific Wic image partition.
 
 Source plugins are subclasses of the ``SourcePlugin`` class, which is
 defined in the ``poky/scripts/lib/wic/pluginbase.py`` file. For example,
-the ``BootimgEFIPlugin`` source plugin found in the ``bootimg-efi.py``
+the ``BootimgEFIPlugin`` source plugin found in the ``bootimg_efi.py``
 file is a subclass of the ``SourcePlugin`` class, which is found in the
 ``pluginbase.py`` file.
 
@@ -365,14 +365,14 @@ implementation, it looks for the plugin with the same name as the
 partition. For example, if the partition is set up using the following
 command in a kickstart file::
 
-   part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
+   part /boot --source bootimg_pcbios --ondisk sda --label boot --active --align 1024
 
 The methods defined as class
-members of the matching source plugin (i.e. ``bootimg-pcbios``) in the
-``bootimg-pcbios.py`` plugin file are used.
+members of the matching source plugin (i.e. ``bootimg_pcbios``) in the
+``bootimg_pcbios.py`` plugin file are used.
 
 To be more concrete, here is the corresponding plugin definition from
-the ``bootimg-pcbios.py`` file for the previous command along with an
+the ``bootimg_pcbios.py`` file for the previous command along with an
 example method called by the Wic implementation when it needs to prepare
 a partition using an implementation-specific function::
 
@@ -384,7 +384,7 @@ a partition using an implementation-specific function::
        Create MBR boot partition and install syslinux on it.
        """
 
-      name = 'bootimg-pcbios'
+      name = 'bootimg_pcbios'
                 .
                 .
                 .
@@ -550,7 +550,7 @@ changes all instances of "``--ondisk sda``" to "``--ondisk sdb``". The
 example changes the following two lines and leaves the remaining lines
 untouched::
 
-   part /boot --source bootimg-pcbios --ondisk sdb --label boot --active --align 1024
+   part /boot --source bootimg_pcbios --ondisk sdb --label boot --active --align 1024
    part / --source rootfs --ondisk sdb --fstype=ext4 --label platform --align 1024 --use-uuid
 
 Once the lines are changed, the
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index d12b1c56b..662121ed9 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3265,7 +3265,7 @@ The variables used by this class are:
    :oe_git:`meta/conf/image-uefi.conf
    </openembedded-core/tree/meta/conf/image-uefi.conf>`
 -  :term:`IMAGE_EFI_BOOT_FILES`: files to install to EFI boot partition
-   created by the ``bootimg-efi`` Wic plugin
+   created by the ``bootimg_efi`` Wic plugin
 -  :term:`INITRAMFS_IMAGE`: initramfs recipe name
 -  :term:`KERNEL_DEVICETREE`: optional devicetree files to embed into UKI
 -  :term:`UKIFY_CMD`: `ukify
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3369bf67f..cefbfd096 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3839,7 +3839,7 @@ system and gives an overview of their function and contents.
    :term:`IMAGE_BOOT_FILES`
       A space-separated list of files installed into the boot partition
       when preparing an image using the Wic tool with the
-      ``bootimg-partition`` source plugin. By default,
+      ``bootimg_partition`` source plugin. By default,
       the files are
       installed under the same name as the source files. To change the
       installed name, separate it from the original name with a semi-colon
@@ -3917,7 +3917,7 @@ system and gives an overview of their function and contents.
    :term:`IMAGE_EFI_BOOT_FILES`
       A space-separated list of files installed into the boot partition
       when preparing an image using the Wic tool with the
-      ``bootimg-efi`` source plugin. By default,
+      ``bootimg_efi`` source plugin. By default,
       the files are
       installed under the same name as the source files. To change the
       installed name, separate it from the original name with a semi-colon

-- 
2.50.1


