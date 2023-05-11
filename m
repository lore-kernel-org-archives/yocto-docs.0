Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E725C77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 16:12:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.769.1683821517531244700
 for <docs@lists.yoctoproject.org>;
 Thu, 11 May 2023 09:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Wc/o5eQn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 233646000F;
	Thu, 11 May 2023 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683821515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uKPlsKw6nnh9a+hCF4RGhLmwycpFR89d4wd+JA0yy1A=;
	b=Wc/o5eQnUiN7frKlwOePD/s5WzMy+JvmR2sJ9LpV/UO1Ytf7PNDJP/BRpJVQArt0BY8ykG
	DRyYl+j04lgqo1qWdc0jeP05YQliRkdRCiIz+CZyYoEEtlVAsHYMGdzV+qpk3LuSM5NliL
	0CBqXYjAAgebXWqaIFFZ4JloMKq1zP46kcAWxxDBQWtLEXrrAN2TeUEMKAeAShco6vjBzc
	LIHZkG8+puxb+zoqTIBJ72xNbJ7+dsVf9JzlOk7TEtGQowX+ufo7PUxWI188I8Hmy3T+PH
	/3HHLpfsLw7FW7Q+1UKl1WAMkoI87HL8pYLmH3f2TuJqSThWojbnEsF97Hkyeg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 2/2] ref-manual: document uboot-sign class and variables
Date: Thu, 11 May 2023 18:11:40 +0200
Message-Id: <20230511161140.2387483-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511161140.2387483-1-michael.opdenacker@bootlin.com>
References: <20230511161140.2387483-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 May 2023 16:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3932

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Jamin Lin <jamin_lin@aspeedtech.com>
CC: Sean Anderson <sean.anderson@seco.com>
---
 documentation/ref-manual/classes.rst   |  39 ++++++++
 documentation/ref-manual/variables.rst | 121 ++++++++++++++++++++++++-
 2 files changed, 155 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 2f96ffb82f..9a79ec51b4 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3178,6 +3178,45 @@ You can also specify the machine using this method::
 See the :term:`UBOOT_CONFIG` and :term:`UBOOT_MACHINE` variables for additional
 information.
 
+.. _ref-classes-uboot-sign:
+
+``uboot-sign``
+==============
+
+The :ref:`ref-classes-uboot-sign` class provides support for U-Boot verified boot.
+It is intended to be inherited from U-Boot recipes.
+
+Here are variables used by this class:
+
+-  :term:`SPL_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` when
+   building the FIT image.
+-  :term:`SPL_SIGN_ENABLE`: enable signing the FIT image.
+-  :term:`SPL_SIGN_KEYDIR`: directory containing the signing keys.
+-  :term:`SPL_SIGN_KEYNAME`: base filename of the signing keys.
+-  :term:`UBOOT_FIT_ADDRESS_CELLS`: ``#address-cells`` value for the FIT image.
+-  :term:`UBOOT_FIT_DESC`: description string encoded into the FIT image.
+-  :term:`UBOOT_FIT_GENERATE_KEYS`: allows to generate the keys
+   if they don't exist yet.
+-  :term:`UBOOT_FIT_HASH_ALG`: hash algorithm for the FIT image.
+-  :term:`UBOOT_FIT_KEY_GENRSA_ARGS`: ``openssl genrsa`` arguments.
+-  :term:`UBOOT_FIT_KEY_REQ_ARGS`: ``openssl req`` arguments.
+-  :term:`UBOOT_FIT_SIGN_ALG`: signature algorithm for the FIT image.
+-  :term:`UBOOT_FIT_SIGN_NUMBITS`: size of the private key for FIT image
+   signing.                                                  
+-  :term:`UBOOT_FIT_KEY_SIGN_PKCS`: format for the public key certificate
+   for FIT image signing.
+-  :term:`UBOOT_FITIMAGE_ENABLE`: enables the generation of a U-Boot FIT image.
+-  :term:`UBOOT_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` when
+   rebuilding the FIT image containing the kernel.
+
+See U-Boot's documentation for details about `verified boot
+<https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/verified-boot.txt>`__
+and the `signature process
+<https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/signature.txt>`__.
+
+See also the description of :ref:`ref-classes-kernel-fitimage` class, which this class
+imitates.
+
 .. _ref-classes-uninative:
 
 ``uninative``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b7d3c05ce2..b7829ae7af 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2927,7 +2927,7 @@ system and gives an overview of their function and contents.
       The default value is set to "1" by the :ref:`ref-classes-kernel-fitimage`
       class, which corresponds to 32 bit addresses. 
 
-      For platforms who need to set 64 bit addresses in
+      For platforms that need to set 64 bit addresses, for example in
       :term:`UBOOT_LOADADDRESS` and :term:`UBOOT_ENTRYPOINT`, you need to
       set this value to "2", as two 32 bit values (cells) will be needed 
       to represent such addresses.
@@ -7759,6 +7759,32 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Board Support Package Developer's Guide
       for additional information.
 
+   :term:`SPL_MKIMAGE_DTCOPTS`
+      Options for the device tree compiler passed to ``mkimage -D`` feature
+      while creating a FIT image with the :ref:`ref-classes-uboot-sign`
+      class. If :term:`SPL_MKIMAGE_DTCOPTS` is not set then the
+      :ref:`ref-classes-uboot-sign` class will not pass the ``-D`` option
+      to ``mkimage``.
+
+      The default value is set to "" by the :ref:`ref-classes-uboot-config`
+      class.
+
+   :term:`SPL_SIGN_ENABLE`
+      Enable signing of the U-Boot FIT image. The default value is "0".
+      This variable is used by the :ref:`ref-classes-uboot-sign` class.
+
+   :term:`SPL_SIGN_KEYDIR`
+      Location of the directory containing the RSA key and certificate used for
+      signing the U-Boot FIT image, used by the :ref:`ref-classes-uboot-sign`
+      class.
+
+   :term:`SPL_SIGN_KEYNAME`
+      The name of keys used by the :ref:`ref-classes-kernel-fitimage` class
+      for signing U-Boot FIT image stored in the :term:`SPL_SIGN_KEYDIR`
+      directory. If we have for example a ``dev.key`` key and a ``dev.crt``
+      certificate stored in the :term:`SPL_SIGN_KEYDIR` directory, you will 
+      have to set :term:`SPL_SIGN_KEYNAME` to ``dev``.
+
    :term:`SRCREV_FORMAT`
       See :term:`bitbake:SRCREV_FORMAT` in the BitBake manual.
 
@@ -9097,16 +9123,101 @@ system and gives an overview of their function and contents.
       creation, the :term:`UBOOT_ENTRYPOINT` variable is passed as a
       command-line parameter to the ``uboot-mkimage`` utility.
 
-      To pass a 64 bit address for FIT image creation, you will need to set
-      the :term:`FIT_ADDRESS_CELLS` variable too.
+      To pass a 64 bit address for FIT image creation, you will need to set:
+      -  The :term:`FIT_ADDRESS_CELLS` variable for FIT image creation.
+      -  The :term:`UBOOT_FIT_ADDRESS_CELLS` variable for U-Boot FIT image creation.
+
+      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
+      :ref:`ref-classes-kernel-uimage`, :ref:`ref-classes-kernel`,
+      :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
+      classes.
 
+   :term:`UBOOT_FIT_ADDRESS_CELLS`
+      Specifies the value of the ``#address-cells`` value for the
+      description of the U-Boot FIT image.  
+
+      The default value is set to "1" by the :ref:`ref-classes-uboot-sign`
+      class, which corresponds to 32 bit addresses. 
+
+      For platforms that need to set 64 bit addresses in
+      :term:`UBOOT_LOADADDRESS` and :term:`UBOOT_ENTRYPOINT`, you need to
+      set this value to "2", as two 32 bit values (cells) will be needed
+      to represent such addresses.
+
+      Here is an example setting "0x400000000" as a load address::
+    
+         UBOOT_FIT_ADDRESS_CELLS = "2"
+         UBOOT_LOADADDRESS= "0x04 0x00000000"
+
+      See `more details about #address-cells <https://elinux.org/Device_Tree_Usage#How_Addressing_Works>`__.
+
+   :term:`UBOOT_FIT_DESC`
+      Specifies the description string encoded into a U-Boot fitImage. The default
+      value is set by the :ref:`ref-classes-uboot-sign` class as follows::
+
+         UBOOT_FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
+
+   :term:`UBOOT_FIT_GENERATE_KEYS`
+      Decides whether to generate the keys for signing the U-Boot fitImage if
+      they don't already exist. The keys are created in :term:`SPL_SIGN_KEYDIR`.
+      The default value is "0".
+
+      Enable this as follows::
+
+         UBOOT_FIT_GENERATE_KEYS = "1"
+
+      This variable is used in the :ref:`ref-classes-uboot-sign` class.
+
+   :term:`UBOOT_FIT_HASH_ALG`
+      Specifies the hash algorithm used in creating the U-Boot FIT Image.
+      It is set by default to ``sha256`` by the :ref:`ref-classes-uboot-sign`
+      class.
+
+   :term:`UBOOT_FIT_KEY_GENRSA_ARGS`
+      Arguments to ``openssl genrsa`` for generating a RSA private key for
+      signing the U-Boot FIT image. The default value of this variable
+      is set to "-F4" by the :ref:`ref-classes-uboot-sign` class.
+
+   :term:`UBOOT_FIT_KEY_REQ_ARGS`
+      Arguments to ``openssl req`` for generating a certificate for signing
+      the U-Boot FIT image. The default value is "-batch -new" by the
+      :ref:`ref-classes-uboot-sign` class, "batch" for
+      non interactive mode and "new" for generating new keys.
+
+   :term:`UBOOT_FIT_KEY_SIGN_PKCS`
+      Format for the public key certificate used for signing the U-Boot FIT
+      image. The default value is set to "x509" by the
+      :ref:`ref-classes-uboot-sign` class.
+
+   :term:`UBOOT_FIT_SIGN_ALG`
+      Specifies the signature algorithm used in creating the U-Boot FIT Image.
+      This variable is set by default to "rsa2048" by the
+      :ref:`ref-classes-uboot-sign` class.
+
+   :term:`UBOOT_FIT_SIGN_NUMBITS`
+      Size of the private key used in signing the U-Boot FIT image, in number
+      of bits. The default value for this variable is set to "2048"
+      by the :ref:`ref-classes-uboot-sign` class.
+
+   :term:`UBOOT_FITIMAGE_ENABLE`
+      This variable allows to generate a FIT image for U-Boot, which is one
+      of the ways to implement a verified boot process.
+
+      Its default value is "0", so set it to "1" to enable this functionality::
+
+         UBOOT_FITIMAGE_ENABLE = "1"
+
+      See the :ref:`ref-classes-uboot-sign` class for details.
+      
    :term:`UBOOT_LOADADDRESS`
       Specifies the load address for the U-Boot image. During U-Boot image
       creation, the :term:`UBOOT_LOADADDRESS` variable is passed as a
       command-line parameter to the ``uboot-mkimage`` utility.
 
-      To pass a 64 bit address for FIT image creation, you will need to set
-      the :term:`FIT_ADDRESS_CELLS` variable too.
+      To pass a 64 bit address, you will also need to set:
+
+      -  The :term:`FIT_ADDRESS_CELLS` variable for FIT image creation.
+      -  The :term:`UBOOT_FIT_ADDRESS_CELLS` variable for U-Boot FIT image creation.
 
       This variable is used by the :ref:`ref-classes-kernel-fitimage`,
       :ref:`ref-classes-kernel-uimage`, :ref:`ref-classes-kernel`,
-- 
2.34.1


