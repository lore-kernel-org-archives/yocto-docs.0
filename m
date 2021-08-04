Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.13258.1628102077893082438
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 11:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 76A39200005;
	Wed,  4 Aug 2021 18:34:36 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/6] kernel-dev manual: overrides syntax updates
Date: Wed,  4 Aug 2021 20:34:23 +0200
Message-Id: <20210804183426.22333-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
References: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated with openembedded-core/scripts/contrib/convert-overrides.py

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/kernel-dev/advanced.rst |  6 +--
 documentation/kernel-dev/common.rst   | 60 +++++++++++++--------------
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 871ec8ae7b..9c3a478cb9 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -69,7 +69,7 @@ to indicate the branch.
    You can use the :term:`KBRANCH` value to define an alternate branch typically
    with a machine override as shown here from the ``meta-yocto-bsp`` layer::
 
-           KBRANCH_edgerouter = "standard/edgerouter"
+           KBRANCH:edgerouter = "standard/edgerouter"
 
 
 The linux-yocto style recipes can optionally define the following
@@ -113,7 +113,7 @@ To include a
 feature called "cfg/sound.scc" just for the ``qemux86`` machine,
 specify::
 
-   KERNEL_FEATURES_append_qemux86 = " cfg/sound.scc"
+   KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc"
 
 The value of
 the entries in :term:`KERNEL_FEATURES` are dependent on their location
@@ -724,7 +724,7 @@ If the BSP description is in recipe space, you cannot simply list the
 ``*.scc`` in the :term:`SRC_URI` statement. You need to use the following
 form from your kernel append file::
 
-   SRC_URI_append_myplatform = " \
+   SRC_URI:append_myplatform = " \
        file://myplatform;type=kmeta;destsuffix=myplatform \
        "
 
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index a97140b0b9..331e982aca 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -416,11 +416,11 @@ home directory:
    kernel. Thus, the name of the append file is
    ``linux-yocto_4.12.bbappend``::
 
-      FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+      FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-      SRC_URI_append = " file://patch-file-one.patch"
-      SRC_URI_append = " file://patch-file-two.patch"
-      SRC_URI_append = " file://patch-file-three.patch"
+      SRC_URI:append = " file://patch-file-one.patch"
+      SRC_URI:append = " file://patch-file-two.patch"
+      SRC_URI:append = " file://patch-file-three.patch"
 
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find patch files. For more
@@ -469,7 +469,7 @@ prepending the directory that contains your files to the
 :term:`FILESEXTRAPATHS`
 variable as follows::
 
-   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 The path ``${``\ :term:`THISDIR`\ ``}/${``\ :term:`PN`\ ``}``
 expands to "linux-yocto" in the current directory for this example. If
@@ -496,28 +496,28 @@ strings in this example listing might be different than the actual
 strings in the file from the ``meta-yocto-bsp`` layer upstream.
 ::
 
-   KBRANCH_genericx86  = "standard/base"
-   KBRANCH_genericx86-64  = "standard/base"
+   KBRANCH:genericx86  = "standard/base"
+   KBRANCH:genericx86-64  = "standard/base"
 
-   KMACHINE_genericx86 ?= "common-pc"
-   KMACHINE_genericx86-64 ?= "common-pc-64"
-   KBRANCH_edgerouter = "standard/edgerouter"
+   KMACHINE:genericx86 ?= "common-pc"
+   KMACHINE:genericx86-64 ?= "common-pc-64"
+   KBRANCH:edgerouter = "standard/edgerouter"
    KBRANCH_beaglebone = "standard/beaglebone"
 
-   SRCREV_machine_genericx86    ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-   SRCREV_machine_genericx86-64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-   SRCREV_machine_edgerouter ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
+   SRCREV_machine:genericx86    ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
+   SRCREV_machine:genericx86-64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
+   SRCREV_machine:edgerouter ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
    SRCREV_machine_beaglebone ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
 
 
-   COMPATIBLE_MACHINE_genericx86 = "genericx86"
-   COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
-   COMPATIBLE_MACHINE_edgerouter = "edgerouter"
+   COMPATIBLE_MACHINE:genericx86 = "genericx86"
+   COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
+   COMPATIBLE_MACHINE:edgerouter = "edgerouter"
    COMPATIBLE_MACHINE_beaglebone = "beaglebone"
 
-   LINUX_VERSION_genericx86 = "4.12.7"
-   LINUX_VERSION_genericx86-64 = "4.12.7"
-   LINUX_VERSION_edgerouter = "4.12.10"
+   LINUX_VERSION:genericx86 = "4.12.7"
+   LINUX_VERSION:genericx86-64 = "4.12.7"
+   LINUX_VERSION:edgerouter = "4.12.10"
    LINUX_VERSION_beaglebone = "4.12.10"
 
 This append file
@@ -640,7 +640,7 @@ appropriate ``${PN}`` directory in your layer's ``recipes-kernel/linux``
 directory, and rename the copied file to "defconfig". Then, add the
 following lines to the linux-yocto ``.bbappend`` file in your layer::
 
-   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://defconfig"
 
 The :term:`SRC_URI` tells the build system how to search
@@ -687,7 +687,7 @@ Next, include this
 configuration fragment and extend the :term:`FILESPATH` variable in your
 ``.bbappend`` file::
 
-   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://8250.cfg"
 
 The next time you run BitBake to build the
@@ -988,10 +988,10 @@ Section.
 
    Add the following to the ``local.conf``::
 
-      SRC_URI_pn-linux-yocto = "git:///path-to/linux-yocto-4.12;protocol=file;name=machine;branch=standard/base; \
+      SRC_URI:pn-linux-yocto = "git:///path-to/linux-yocto-4.12;protocol=file;name=machine;branch=standard/base; \
                                 git:///path-to/yocto-kernel-cache;protocol=file;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-      SRCREV_meta_qemux86 = "${AUTOREV}"
-      SRCREV_machine_qemux86 = "${AUTOREV}"
+      SRCREV_meta:qemux86 = "${AUTOREV}"
+      SRCREV_machine:qemux86 = "${AUTOREV}"
 
    .. note::
 
@@ -1061,8 +1061,8 @@ Section.
    must be named ``linux-yocto_4.12.bbappend`` and have the following
    contents::
 
-      FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-      SRC_URI_append = "file://0001-calibrate.c-Added-some-printk-statements.patch"
+      FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+      SRC_URI:append = "file://0001-calibrate.c-Added-some-printk-statements.patch"
 
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find the patch file.
@@ -1237,7 +1237,7 @@ file to "defconfig" (e.g.
 add the following lines to the linux-yocto ``.bbappend`` file in your
 layer::
 
-   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://defconfig"
 
 The :term:`SRC_URI` tells the build system how to search for the file, while the
@@ -1345,7 +1345,7 @@ the kernel's append file within your layer and then add the following
 statements to the kernel's append file, those configuration options will
 be picked up and applied when the kernel is built::
 
-   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://myconfig.cfg"
 
 As mentioned earlier, you can group related configurations into multiple
@@ -1939,7 +1939,7 @@ build.
 2. *Add the Feature File to SRC_URI:* Add the ``.scc`` file to the
    recipe's :term:`SRC_URI` statement::
 
-      SRC_URI_append = " file://test.scc"
+      SRC_URI:append = " file://test.scc"
 
    The leading space before the path is important as the path is
    appended to the existing path.
@@ -1948,7 +1948,7 @@ build.
    :term:`KERNEL_FEATURES` statement to specify the feature as a kernel
    feature::
 
-      KERNEL_FEATURES_append = " test.scc"
+      KERNEL_FEATURES:append = " test.scc"
 
    The OpenEmbedded build
    system processes the kernel feature when it builds the kernel.
-- 
2.25.1

