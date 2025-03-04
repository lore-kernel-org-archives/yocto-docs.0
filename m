Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E32C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 08:38:52 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.17876.1741077526195374832
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 00:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Mar
 2025 16:38:43 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Mar 2025 16:38:43 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <docs@lists.yoctoproject.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v2] ref-manual: uboot-sign: Add how to enable ATF, TEE and User defined snippet ITS for U-Boot FIT image
Date: Tue, 4 Mar 2025 16:38:42 +0800
Message-ID: <20250304083842.2828763-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Mar 2025 08:38:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6492

Add how to enable ATF, TEE and User defined ITS for U-Boot FIT image genera=
tion.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 documentation/ref-manual/classes.rst   |  8 +++
 documentation/ref-manual/variables.rst | 72 ++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index b93279ff6..d1669ed87 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3401,6 +3401,14 @@ The variables used by this class are:
 -  :term:`UBOOT_FITIMAGE_ENABLE`: enable the generation of a U-Boot FIT im=
age.
 -  :term:`UBOOT_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` when
    rebuilding the FIT image containing the kernel.
+-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`: enable the ARM Trusted Firmware=
 (ATF) image.
+-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`: specifie the path to the =
ATF image.
+-  :term:`UBOOT_FIT_TEE`: enable the Trusted Execution Environment (TEE) i=
mage.
+-  :term:`UBOOT_FIT_TEE_IMAGE`: specifie the path to the TEE image.
+-  :term:`UBOOT_FIT_USER_SETTINGS`: add a user-specific snippet to the ITS=
. Users can
+   include their custom ITS snippet in this variable.
+-  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: adds a user-defined image to the=
 loadable
+   property of the configuration node. It should be a comma-separated list=
 of strings.
=20
 See U-Boot's documentation for details about `verified boot
 <https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/verifie=
d-boot.txt>`__
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 60984cc8f..dbbaac56d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9884,6 +9884,78 @@ system and gives an overview of their function and c=
ontents.
=20
       See the :ref:`ref-classes-uboot-sign` class for details.
=20
+   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`
+      ARM Trusted Firmware (ATF) is a reference implementation of secure w=
orld
+      software for Arm A-Profile architectures (Armv8-A and Armv7-A), incl=
uding
+      an Exception Level 3 (EL3) Secure Monitor. This variable enables the
+      generation of a U-Boot FIT image with an ATF image.
+
+      Its default value is "0", so set it to "1" to enable this functional=
ity::
+
+         UBOOT_FIT_ARM_TRUSTED_FIRMWARE =3D "1"
+
+   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`
+      Specifies the path to the ATF image. Its default value is "bl31.bin"
+
+         UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?=3D "bl31.bin"
+
+   :term:`UBOOT_FIT_TEE`
+      A Trusted Execution Environment (TEE) is a secure environment for ex=
ecuting
+      code, ensuring high levels of trust in asset management within the
+      surrounding system. This variable enables the generation of a U-Boot=
 FIT
+      image with a TEE image.
+
+      Its default value is "0", so set it to "1" to enable this functional=
ity::
+
+         UBOOT_FIT_TEE =3D "1"
+
+   :term:`UBOOT_FIT_TEE_IMAGE`
+      Specifies the path to the TEE image. Its default value is "tee-raw.b=
in"::
+
+         UBOOT_FIT_TEE_IMAGE ?=3D "tee-raw.bin"
+
+   :term:`UBOOT_FIT_USER_SETTINGS`
+      Add a user-specific snippet to the ITS. Users can include their cust=
om ITS
+      snippet in this variable.
+
+      Ex::
+
+         UBOOT_FIT_FWA_ITS =3D '\
+             fwa {\n\
+                 description =3D \"FW A\";\n\
+                 data =3D /incbin/(\"fwa.bin\");\n\
+                 type =3D \"fwtype\";\n\
+                 arch =3D \"fwarch\";\n\
+                 os =3D \"fwos\";\n\
+                 load =3D <0xb2000000>;\n\
+                 entry =3D <0xb2000000>;\n\
+                 compression =3D \"none\";\n\
+             };\n\
+         '
+
+         UBOOT_FIT_USER_SETTINGS =3D "${UBOOT_FIT_FWA_ITS}"
+
+       The generated Image Tree Source (ITS):
+
+         fwa {
+             description =3D "FW A";
+             data =3D /incbin/("fwa.bin");
+             type =3D "fwtype";
+             arch =3D "fwarch";
+             os =3D "fwos";
+             load =3D <0xb2000000>;
+             entry =3D <0xb2000000>;
+             compression =3D "none";
+         };
+
+   :term:`UBOOT_FIT_CONF_USER_LOADABLES`
+      Adds a user-defined image to the loadable property of the configurat=
ion node.
+      It should be a comma-separated list of strings.
+
+      Ex::
+
+         UBOOT_FIT_CONF_USER_LOADABLES =3D '\"fwa\", \"fwb\"'
+
    :term:`UBOOT_LOADADDRESS`
       Specifies the load address for the U-Boot image. During U-Boot image
       creation, the :term:`UBOOT_LOADADDRESS` variable is passed as a
--=20
2.34.1


