Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4DDC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 16:11:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.673.1683821513839855054
 for <docs@lists.yoctoproject.org>;
 Thu, 11 May 2023 09:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HjavKKQ6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3E1C4FF812;
	Thu, 11 May 2023 16:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683821511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BGlCkVsWn8eFbrVkSK/d5FHsgXSCXgeiwQQ6zvXTo/s=;
	b=HjavKKQ68GgAzj0/Beukr7JSbVzlf5I/6Owq5xO8Pq0Cm/qGwLomgqgKPKVbLdVYz55KA+
	ZDyl9g/Q5AZ2v3IfVuqomHktB2+usdQbyS3swN20BEZtfFgt0rD6EBLISOyrxXN5pVHAiy
	hRK3RWKF47gpKt7r1UtW2mye+Mk63J5lujRhYXalSYktaeVCZIXZmOXIsl4AE5kmSlZxxY
	APj0GTxHlbNtD+rKxn48VuGrqVFQmDoxzlWIIvoCML+R8L3Cz2i144Ik9lUqOa2aHRDUfC
	rduz/N8lLwGxX39aU0wfgR3F50SAKLszcRMB0KFJAhTHUcSUv/ewzHSmC606AQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 1/2] ref-manual: improve description of kernel-fitimage variables
Date: Thu, 11 May 2023 18:11:39 +0200
Message-Id: <20230511161140.2387483-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 May 2023 16:11:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3931

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Mentioning that they are related to this class
  (for further information about their usage)
- Replace "fitImage" by "FIT image"
- Minor formating and style fixes

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Jamin Lin <jamin_lin@aspeedtech.com>
CC: Sean Anderson <sean.anderson@seco.com>
---
 documentation/ref-manual/classes.rst   |   4 +-
 documentation/ref-manual/variables.rst | 105 ++++++++++++++++---------
 2 files changed, 68 insertions(+), 41 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 94b6a3ebd7..2f96ffb82f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1582,13 +1582,13 @@ The :ref:`ref-classes-kernel-devicetree` class, which is inherited by the
 ===================
 
 The :ref:`ref-classes-kernel-fitimage` class provides support to pack a kernel image,
-device trees, a U-boot script, a :term:`Initramfs` bundle and a RAM disk
+device trees, a U-boot script, an :term:`Initramfs` bundle and a RAM disk
 into a single FIT image. In theory, a FIT image can support any number
 of kernels, U-boot scripts, :term:`Initramfs` bundles, RAM disks and device-trees.
 However, :ref:`ref-classes-kernel-fitimage` currently only supports
 limited usecases: just one kernel image, an optional U-boot script,
 an optional :term:`Initramfs` bundle, an optional RAM disk, and any number of
-device tree.
+device trees.
 
 To create a FIT image, it is required that :term:`KERNEL_CLASSES`
 is set to include ":ref:`ref-classes-kernel-fitimage`" and :term:`KERNEL_IMAGETYPE`
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4b69843d4d..b7d3c05ce2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2921,9 +2921,8 @@ system and gives an overview of their function and contents.
       table file, examine the existing ``fs-perms.txt``.
 
    :term:`FIT_ADDRESS_CELLS`
-
       Specifies the value of the ``#address-cells`` value for the
-      description of the kernel FIT image.  
+      description of the FIT image.  
 
       The default value is set to "1" by the :ref:`ref-classes-kernel-fitimage`
       class, which corresponds to 32 bit addresses. 
@@ -2941,67 +2940,82 @@ system and gives an overview of their function and contents.
       See `more details about #address-cells <https://elinux.org/Device_Tree_Usage#How_Addressing_Works>`__.
 
    :term:`FIT_CONF_DEFAULT_DTB`
-      Specifies the default device tree binary (dtb) file for a fitImage when
-      multiple are provided.
+      Specifies the default device tree binary (dtb) file for a FIT image
+      when multiple ones are provided.
+
+      This variable is used in the :ref:`ref-classes-kernel-fitimage` class.
 
    :term:`FIT_DESC`
-      Specifies the description string encoded into a fitImage. The default
-      value is set by the :ref:`ref-classes-kernel-fitimage`
-      class as follows::
+      Specifies the description string encoded into a FIT image. The
+      default value is set by the :ref:`ref-classes-kernel-fitimage` class as
+      follows::
 
          FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 
    :term:`FIT_GENERATE_KEYS`
-      Decides whether to generate the keys for signing fitImage if they
-      don't already exist. The keys are created in :term:`UBOOT_SIGN_KEYDIR`.
-      The default value is 0.
+      Decides whether to generate the keys for signing the FIT image if
+      they don't already exist. The keys are created in
+      :term:`UBOOT_SIGN_KEYDIR`. The default value is set to "0"
+      by the :ref:`ref-classes-kernel-fitimage` class.
 
    :term:`FIT_HASH_ALG`
-      Specifies the hash algorithm used in creating the FIT Image. For e.g. sha256.
+      Specifies the hash algorithm used in creating the FIT Image.
+      This variable is set by default to "sha256" by the
+      :ref:`ref-classes-kernel-fitimage` class.
 
    :term:`FIT_KERNEL_COMP_ALG`
-      Compression algorithm to use for the kernel image inside the FIT Image.
+      The compression algorithm to use for the kernel image inside the FIT Image.
       At present, the only supported values are "gzip" (default), "lzo" or "none".
       If you set this variable to anything other than "none" you may also need
       to set :term:`FIT_KERNEL_COMP_ALG_EXTENSION`.
 
+      This variable is used in the :ref:`ref-classes-kernel-uboot` class.
+
    :term:`FIT_KERNEL_COMP_ALG_EXTENSION`
       File extension corresponding to :term:`FIT_KERNEL_COMP_ALG`. The default
-      value is ".gz". If you set :term:`FIT_KERNEL_COMP_ALG` to "lzo",
-      you may want to set this variable to ".lzo".
+      value is set ".gz" by the :ref:`ref-classes-kernel-uboot` class. If you
+      set :term:`FIT_KERNEL_COMP_ALG` to "lzo", you may want to set this
+      variable to ".lzo".
 
    :term:`FIT_KEY_GENRSA_ARGS`
-      Arguments to openssl genrsa for generating RSA private key for signing
-      fitImage. The default value is "-F4". i.e. the public exponent 65537 to
-      use.
+      Arguments to ``openssl genrsa`` for generating a RSA private key for
+      signing the FIT image. The default value is set to "-F4" by the
+      :ref:`ref-classes-kernel-fitimage` class.
 
    :term:`FIT_KEY_REQ_ARGS`
-      Arguments to openssl req for generating certificate for signing fitImage.
-      The default value is "-batch -new". batch for non interactive mode
-      and new for generating new keys.
+      Arguments to ``openssl req`` for generating a certificate for signing
+      the FIT image. The default value is "-batch -new" by the
+      :ref:`ref-classes-kernel-fitimage` class, "batch" for
+      non interactive mode and "new" for generating new keys.
 
    :term:`FIT_KEY_SIGN_PKCS`
-      Format for public key certificate used in signing fitImage.
-      The default value is "x509".
+      Format for the public key certificate used for signing the FIT image.
+      The default value is set to "x509" by the
+      :ref:`ref-classes-kernel-fitimage` class.
 
    :term:`FIT_SIGN_ALG`
       Specifies the signature algorithm used in creating the FIT Image.
-      For e.g. rsa2048.
+      This variable is set by default to "rsa2048" by the
+      :ref:`ref-classes-kernel-fitimage` class.
 
    :term:`FIT_PAD_ALG`
       Specifies the padding algorithm used in creating the FIT Image.
-      The default value is "pkcs-1.5".
+      The default value is set to "pkcs-1.5" by the
+      :ref:`ref-classes-kernel-fitimage` class.
 
    :term:`FIT_SIGN_INDIVIDUAL`
       If set to "1", then the :ref:`ref-classes-kernel-fitimage`
       class will sign the kernel, dtb and ramdisk images individually in addition
-      to signing the fitImage itself. This could be useful if you are
+      to signing the FIT image itself. This could be useful if you are
       intending to verify signatures in another context than booting via
       U-Boot.
 
+      This variable is set to "0" by default.
+
    :term:`FIT_SIGN_NUMBITS`
-      Size of private key in number of bits used in fitImage. The default
-      value is "2048".
+      Size of the private key used in the FIT image, in number of bits.
+      The default value for this variable is set to "2048"
+      by the :ref:`ref-classes-kernel-fitimage` class.
 
    :term:`FONT_EXTRA_RDEPENDS`
       When inheriting the :ref:`ref-classes-fontcache` class,
@@ -4396,7 +4410,7 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-kernel` class should inherit. You typically
       append this variable to enable extended image types. An example is
       ":ref:`ref-classes-kernel-fitimage`", which enables
-      fitImage support and resides in ``meta/classes-recipe/kernel-fitimage.bbclass``.
+      FIT image support and resides in ``meta/classes-recipe/kernel-fitimage.bbclass``.
       You can register custom kernel image types with the
       :ref:`ref-classes-kernel` class using this variable.
 
@@ -9094,6 +9108,11 @@ system and gives an overview of their function and contents.
       To pass a 64 bit address for FIT image creation, you will need to set
       the :term:`FIT_ADDRESS_CELLS` variable too.
 
+      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
+      :ref:`ref-classes-kernel-uimage`, :ref:`ref-classes-kernel`,
+      :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
+      classes.
+
    :term:`UBOOT_LOCALVERSION`
       Appends a string to the name of the local version of the U-Boot
       image. For example, assuming the version of the U-Boot image built
@@ -9122,11 +9141,13 @@ system and gives an overview of their function and contents.
       script or function if desired. The default is "uboot-mkimage".
 
    :term:`UBOOT_MKIMAGE_DTCOPTS`
-      Options for the device tree compiler passed to mkimage '-D' feature while
-      creating FIT image in :ref:`ref-classes-kernel-fitimage` class. If
-      :term:`UBOOT_MKIMAGE_DTCOPTS` is not set then
-      :ref:`ref-classes-kernel-fitimage` will not pass the ``-D`` option to
-      mkimage.
+      Options for the device tree compiler passed to ``mkimage -D`` feature
+      while creating a FIT image with the :ref:`ref-classes-kernel-fitimage`
+      class. If :term:`UBOOT_MKIMAGE_DTCOPTS` is not set then the
+      :ref:`ref-classes-kernel-fitimage` class will not pass the ``-D`` option
+      to ``mkimage``.
+
+      This variable is also used by the :ref:`ref-classes-uboot-sign` class.
 
    :term:`UBOOT_MKIMAGE_KERNEL_TYPE`
       Specifies the type argument for the kernel as passed to ``uboot-mkimage``.
@@ -9159,15 +9180,21 @@ system and gives an overview of their function and contents.
    :term:`UBOOT_SIGN_ENABLE`
       Enable signing of FIT image. The default value is "0".
 
+      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
+      :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
+      classes.
+
    :term:`UBOOT_SIGN_KEYDIR`
-      Location of the directory containing the RSA key and
-      certificate used for signing FIT image.
+      Location of the directory containing the RSA key and certificate used for
+      signing FIT image, used by the :ref:`ref-classes-kernel-fitimage` and
+      :ref:`ref-classes-uboot-sign` classes.
 
    :term:`UBOOT_SIGN_KEYNAME`
-      The name of keys used for signing U-Boot FIT image stored in
-      :term:`UBOOT_SIGN_KEYDIR` directory. For e.g. dev.key key and dev.crt
-      certificate stored in :term:`UBOOT_SIGN_KEYDIR` directory will have
-      :term:`UBOOT_SIGN_KEYNAME` set to "dev".
+      The name of keys used by the :ref:`ref-classes-kernel-fitimage` class
+      for signing U-Boot FIT image stored in the :term:`UBOOT_SIGN_KEYDIR`
+      directory. If we have for example a ``dev.key`` key and a ``dev.crt``
+      certificate stored in the :term:`UBOOT_SIGN_KEYDIR` directory, you will
+      have to set :term:`UBOOT_SIGN_KEYNAME` to ``dev``.
 
    :term:`UBOOT_SUFFIX`
       Points to the generated U-Boot extension. For example, ``u-boot.sb``
-- 
2.34.1


