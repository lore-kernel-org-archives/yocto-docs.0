Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.13218.1628102076163025945
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 11:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 661E8200002;
	Wed,  4 Aug 2021 18:34:34 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/6] bsp-guide: overrides syntax updates
Date: Wed,  4 Aug 2021 20:34:21 +0200
Message-Id: <20210804183426.22333-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
References: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated with openembedded-core/scripts/contrib/convert-overrides.py

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst | 52 ++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 5f62376d69..b80354a05b 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1042,7 +1042,7 @@ also supports several other machines:
 #. Edit the ``init-ifupdown_1.0.bbappend`` file so that it contains the
    following::
 
-      FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+      FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
    The append file needs to be in the ``meta-xyz/recipes-core/init-ifupdown``
    directory.
@@ -1269,9 +1269,9 @@ located in the layer ``poky/meta-yocto-bsp/conf/machine`` and is named
    include conf/machine/include/tune-cortexa8.inc
 
    IMAGE_FSTYPES += "tar.bz2 jffs2 wic wic.bmap"
-   EXTRA_IMAGECMD_jffs2 = "-lnp "
+   EXTRA_IMAGECMD:jffs2 = "-lnp "
    WKS_FILE ?= "beaglebone-yocto.wks"
-   IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
+   IMAGE_INSTALL:append = " kernel-devicetree kernel-image-zimage"
    do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
 
    SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyO0"
@@ -1458,29 +1458,29 @@ kernel recipe (i.e. ``linux-yocto_5.0.bb``), which is located in
 
 Following is the contents of the append file::
 
-   KBRANCH_genericx86 = "v5.0/standard/base"
-   KBRANCH_genericx86-64 = "v5.0/standard/base"
-   KBRANCH_edgerouter = "v5.0/standard/edgerouter"
-   KBRANCH_beaglebone-yocto = "v5.0/standard/beaglebone"
-
-   KMACHINE_genericx86 ?= "common-pc"
-   KMACHINE_genericx86-64 ?= "common-pc-64"
-   KMACHINE_beaglebone-yocto ?= "beaglebone"
-
-   SRCREV_machine_genericx86 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-   SRCREV_machine_genericx86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-   SRCREV_machine_edgerouter ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-   SRCREV_machine_beaglebone-yocto ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-
-   COMPATIBLE_MACHINE_genericx86 = "genericx86"
-   COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
-   COMPATIBLE_MACHINE_edgerouter = "edgerouter"
-   COMPATIBLE_MACHINE_beaglebone-yocto = "beaglebone-yocto"
-
-   LINUX_VERSION_genericx86 = "5.0.3"
-   LINUX_VERSION_genericx86-64 = "5.0.3"
-   LINUX_VERSION_edgerouter = "5.0.3"
-   LINUX_VERSION_beaglebone-yocto = "5.0.3"
+   KBRANCH:genericx86 = "v5.0/standard/base"
+   KBRANCH:genericx86-64 = "v5.0/standard/base"
+   KBRANCH:edgerouter = "v5.0/standard/edgerouter"
+   KBRANCH:beaglebone-yocto = "v5.0/standard/beaglebone"
+
+   KMACHINE:genericx86 ?= "common-pc"
+   KMACHINE:genericx86-64 ?= "common-pc-64"
+   KMACHINE:beaglebone-yocto ?= "beaglebone"
+
+   SRCREV_machine:genericx86 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+   SRCREV_machine:genericx86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+   SRCREV_machine:edgerouter ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+   SRCREV_machine:beaglebone-yocto ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+
+   COMPATIBLE_MACHINE:genericx86 = "genericx86"
+   COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
+   COMPATIBLE_MACHINE:edgerouter = "edgerouter"
+   COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
+
+   LINUX_VERSION:genericx86 = "5.0.3"
+   LINUX_VERSION:genericx86-64 = "5.0.3"
+   LINUX_VERSION:edgerouter = "5.0.3"
+   LINUX_VERSION:beaglebone-yocto = "5.0.3"
 
 This particular append file works for all the machines that are
 part of the ``meta-yocto-bsp`` layer. The relevant statements are
-- 
2.25.1

