Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C07C282D0
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 08:14:27 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.6633.1741335265651322269
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Mar 2025 00:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 16:14:22 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 16:14:22 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <docs@lists.yoctoproject.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v3] ref-manual: uboot-sign: Add how to enable ATF, TEE and User defined snippet ITS for U-Boot FIT image
Date: Fri, 7 Mar 2025 16:14:22 +0800
Message-ID: <20250307081422.718699-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Mar 2025 08:14:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6503

Add how to enable ATF, TEE and User defined ITS for U-Boot FIT image genera=
tion.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 documentation/ref-manual/classes.rst   |  13 ++++
 documentation/ref-manual/variables.rst | 102 +++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index b93279ff6..02749df3d 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3401,6 +3401,19 @@ The variables used by this class are:
 -  :term:`UBOOT_FITIMAGE_ENABLE`: enable the generation of a U-Boot FIT im=
age.
 -  :term:`UBOOT_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` when
    rebuilding the FIT image containing the kernel.
+-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`: include the Trusted Firmware-A =
(TF-A) image
+   in the U-Boot FIT image.
+-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`: specifies the path to the
+   Trusted Firmware-A (TF-A) image.
+-  :term:`UBOOT_FIT_TEE`: include the Trusted Execution Environment (TEE) =
image in the
+   U-Boot FIT image.
+-  :term:`UBOOT_FIT_TEE_IMAGE`: specifies the path to the Trusted Executio=
n Environment
+   (TEE) image.
+-  :term:`UBOOT_FIT_USER_SETTINGS`: adds a user-specific snippet to the IT=
S. Users can
+   include their custom ITS snippet in this variable.
+-  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: adds one or more user-defined im=
ages to the
+   loadables property of the configuration node. It should be a comma-sepa=
rated list of
+   strings and each string needs to be surrounded by quotes too.
=20
 See U-Boot's documentation for details about `verified boot
 <https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/verifie=
d-boot.txt>`__
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 60984cc8f..3c7e627f5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9826,6 +9826,28 @@ system and gives an overview of their function and c=
ontents.
=20
       See `more details about #address-cells <https://elinux.org/Device_Tr=
ee_Usage#How_Addressing_Works>`__.
=20
+   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`
+      Trusted Firmware-A (TF-A) <https://www.trustedfirmware.org/projects/=
tf-a> is a reference implementation of
+      secure world software for Arm A-Profile architectures
+      (Armv8-A and Armv7-A), including an Exception Level 3 (EL3) Secure M=
onitor. This variable enables the
+      generation of a U-Boot FIT image with an Trusted Firmware-A (TF-A) i=
mage.
+
+      Its default value is "0", so set it to "1" to enable this functional=
ity::
+
+         UBOOT_FIT_ARM_TRUSTED_FIRMWARE =3D "1"
+
+   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`
+      Specifies the path to the Trusted Firmware-A (TF-A) image. Its defau=
lt value is "bl31.bin"::
+
+         UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?=3D "bl31.bin"
+
+   :term:`UBOOT_FIT_CONF_USER_LOADABLES`
+      Adds one or more user-defined images to the ``loadables`` property o=
f the configuration node
+      of the U-Boot Image Tree Source (ITS). It should be a comma-separate=
d list of strings and
+      each string needs to be surrounded by quotes too, e.g.::
+
+         UBOOT_FIT_CONF_USER_LOADABLES =3D '\"fwa\", \"fwb\"'
+
    :term:`UBOOT_FIT_DESC`
       Specifies the description string encoded into a U-Boot fitImage. The=
 default
       value is set by the :ref:`ref-classes-uboot-sign` class as follows::
@@ -9874,6 +9896,86 @@ system and gives an overview of their function and c=
ontents.
       of bits. The default value for this variable is set to "2048"
       by the :ref:`ref-classes-uboot-sign` class.
=20
+   :term:`UBOOT_FIT_TEE`
+      A Trusted Execution Environment (TEE) is a secure environment for ex=
ecuting
+      code, ensuring high levels of trust in asset management within the
+      surrounding system. This variable enables the generation of a U-Boot=
 FIT
+      image with a Trusted Execution Environment (TEE) image.
+
+      Its default value is "0", so set it to "1" to enable this functional=
ity::
+
+         UBOOT_FIT_TEE =3D "1"
+
+   :term:`UBOOT_FIT_TEE_IMAGE`
+      Specifies the path to the Trusted Execution Environment (TEE) image.=
 Its
+      default value is "tee-raw.bin"::
+
+         UBOOT_FIT_TEE_IMAGE ?=3D "tee-raw.bin"
+
+   :term:`UBOOT_FIT_USER_SETTINGS`
+      Add a user-specific snippet to the U-Boot Image Tree Source (ITS). T=
his variable
+      allows the user to add one or more user-defined ``/images`` node to =
the U-Boot
+      Image Tree Source (ITS). For more details, please refer to <https://=
fitspec.osfw.foundation/>.
+
+      The original contents of the U-Boot Image Tree Source (ITS) are as f=
ollows::
+
+         images {
+             uboot {
+                 description =3D "U-Boot image";
+                 data =3D /incbin/("u-boot-nodtb.bin");
+                 type =3D "standalone";
+                 os =3D "u-boot";
+                 arch =3D "";
+                 compression =3D "none";
+                 load =3D <0x80000000>;
+                 entry =3D <0x80000000>;
+             };
+         };
+
+      Users can include their custom ITS snippet in this variable, e.g.::
+
+         UBOOT_FIT_FWA_ITS =3D '\
+             fwa {\n\
+                 description =3D \"FW A\";\n\
+                 data =3D /incbin/(\"fwa.bin\");\n\
+                 type =3D \"firmware\";\n\
+                 arch =3D \"\";\n\
+                 os =3D \"\";\n\
+                 load =3D <0xb2000000>;\n\
+                 entry =3D <0xb2000000>;\n\
+                 compression =3D \"none\";\n\
+             };\n\
+         '
+
+         UBOOT_FIT_USER_SETTINGS =3D "${UBOOT_FIT_FWA_ITS}"
+
+      Newlines are stripped, and if they need to be included, they must be=
 explicitly added using ``\n``.
+
+      The generated contents of the U-Boot Image Tree Source (ITS) are as =
follows::
+
+          images {
+              uboot {
+                  description =3D "U-Boot image";
+                  data =3D /incbin/("u-boot-nodtb.bin");
+                  type =3D "standalone";
+                  os =3D "u-boot";
+                  arch =3D "";
+                  compression =3D "none";
+                  load =3D <0x80000000>;
+                  entry =3D <0x80000000>;
+              };
+              fwa {
+                  description =3D "FW A";
+                  data =3D /incbin/("fwa.bin");
+                  type =3D "firmware";
+                  arch =3D "";
+                  os =3D "";
+                  load =3D <0xb2000000>;
+                  entry =3D <0xb2000000>;
+                  compression =3D "none";
+              };
+          };
+
    :term:`UBOOT_FITIMAGE_ENABLE`
       This variable allows to generate a FIT image for U-Boot, which is on=
e
       of the ways to implement a verified boot process.
--=20
2.34.1


