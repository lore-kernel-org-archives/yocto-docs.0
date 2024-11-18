Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AF7D10F5C
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 06:21:25 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.34488.1731910876136353553
 for <docs@lists.yoctoproject.org>;
 Sun, 17 Nov 2024 22:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 18 Nov
 2024 14:21:13 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 18 Nov 2024 14:21:13 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <docs@lists.yoctoproject.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v1] ref-manual: uboot-sign: Add how to enable ATF and TEE for U-Boot FIT image
Date: Mon, 18 Nov 2024 14:21:13 +0800
Message-ID: <20241118062113.269253-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Nov 2024 06:21:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5751

Add how to enable ATF and TEE for U-Boot FIT image
and Image Tree Source generation.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 documentation/ref-manual/classes.rst   |  7 +++++
 documentation/ref-manual/variables.rst | 37 ++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index b92f4e4f2..82adab90f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3336,6 +3336,13 @@ The variables used by this class are:
 -  :term:`UBOOT_FITIMAGE_ENABLE`: enable the generation of a U-Boot FIT im=
age.
 -  :term:`UBOOT_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` when
    rebuilding the FIT image containing the kernel.
+-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`: enable ARM Trusted Firmware(ATF=
) image.
+-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`: path of the ATF image.
+-  :term:`UBOOT_FIT_TEE`: enable Trusted Execution Environment(TEE) image.
+-  :term:`UBOOT_FIT_TEE_IMAGE`: path of the TEE image.
+-  :term:`UBOOT_FIT_USER_IMAGE`: enable users specific image.
+-  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: add user specific image in the l=
oadable
+   property of configuration node. It is a comma-separated list of strings=
.
=20
 See U-Boot's documentation for details about `verified boot
 <https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/verifie=
d-boot.txt>`__
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 43f4d7966..c28a03da1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9736,6 +9736,43 @@ system and gives an overview of their function and c=
ontents.
=20
       See the :ref:`ref-classes-uboot-sign` class for details.
=20
+   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`
+      ARM Trusted Firmware(ATF) is a reference implementation of secure wo=
rld
+      software for Arm A-Profile architectures, (Armv8-A and Armv7-A), inc=
luding
+      an Exception Level 3 (EL3) Secure Monitor. The variable allows to ge=
nerate
+      a U-Boot FIT image with ATF image.
+
+      Its default value is "0", so set it to "1" to enable this functional=
ity::
+
+         UBOOT_FIT_ARM_TRUSTED_FIRMWARE =3D "1"
+
+   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`
+      The path of ATF image.
+
+   :term:`UBOOT_FIT_TEE`
+      A Trusted Execution Environment(TEE) is an environment for executing=
 code,
+      in which those executing the code can have high levels of trust in t=
he asset
+      management of that surrounding environment. The variable allows to g=
enerate
+      a U-Boot FIT image with TEE image.
+  =20
+      Its default value is "0", so set it to "1" to enable this functional=
ity::
+
+         UBOOT_FIT_TEE =3D "1"
+
+   :term:`UBOOT_FIT_TEE_IMAGE`
+      The path of TEE image.
+
+   :term:`UBOOT_FIT_USER_IMAGE`
+      The variable allows to generate a U-Boot FIT image with user specifi=
c image.
+
+   :term:`UBOOT_FIT_CONF_USER_LOADABLES`
+      Add user specific image in the loadable property of configuration no=
de. It is
+      a comma-separated list of strings.
+  =20
+      Ex::
+     =20
+         UBOOT_FIT_CONF_USER_LOADABLES =3D '\"userA\", \"userB\"'
+
    :term:`UBOOT_LOADADDRESS`
       Specifies the load address for the U-Boot image. During U-Boot image
       creation, the :term:`UBOOT_LOADADDRESS` variable is passed as a
--=20
2.34.1


