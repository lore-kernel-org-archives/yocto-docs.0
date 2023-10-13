Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64DACDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:26:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.44838.1697217963039401996
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 10:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=byyFb6CO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC940240005;
	Fri, 13 Oct 2023 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697217961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMu22tDVA04VDlAFMe9BtIFC+aWdbr/3NQqGBQbwqCg=;
	b=byyFb6COK/jWTuDGH4bMG1PfNkx+iwqznHhvV6RDNJRpTjLf9Qw1XQ3USY+PMzSPZHzOoC
	+ipfiUdy5C/jGouXgtoGStTRRze2jnNVhuEzbaf/3qrCmZZP44X1iKKF4GdPs8A/w3ZO49
	eTuVjpgqk9askyAHm0bmlhFKxsnwwMIUZ/2Kiz/bUbqrnqFb6Mi+WWFVA10XVLZwgit8TM
	hZ9OhBoHQNgnHvXQTkvNsJe6GNsxEmJ1bS87VpTpLn6FZ+ovtnfQp8QYtzlOgvtwoGc2u/
	RDMCzCdEw+Kh0TPmNTW/GBnJdKx6lYZRJD4NRR+mashWQTW4NquoRYXFrvSn7A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/5] manuals: update linux-yocto append examples
Date: Fri, 13 Oct 2023 19:25:43 +0200
Message-Id: <20231013172547.82195-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013172547.82195-1-michael.opdenacker@bootlin.com>
References: <20231013172547.82195-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Oct 2023 17:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4366

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst        | 28 ++++++++----------
 documentation/kernel-dev/advanced.rst  |  3 +-
 documentation/kernel-dev/common.rst    | 40 ++++++++++++--------------
 documentation/ref-manual/variables.rst | 11 ++++---
 4 files changed, 36 insertions(+), 46 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index c78fbeb68f..c1160397be 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1449,39 +1449,35 @@ The kernel recipe used to build the kernel image for the BeagleBone
 device was established in the machine configuration::
 
    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-   PREFERRED_VERSION_linux-yocto ?= "5.0%"
+   PREFERRED_VERSION_linux-yocto ?= "6.1%"
 
 The ``meta-yocto-bsp/recipes-kernel/linux`` directory in the layer contains
 metadata used to build the kernel. In this case, a kernel append file
-(i.e. ``linux-yocto_5.0.bbappend``) is used to override an established
-kernel recipe (i.e. ``linux-yocto_5.0.bb``), which is located in
+(i.e. ``linux-yocto_6.1.bbappend``) is used to override an established
+kernel recipe (i.e. ``linux-yocto_6.1.bb``), which is located in
 :yocto_git:`/poky/tree/meta/recipes-kernel/linux`.
 
 Following is the contents of the append file::
 
-   KBRANCH:genericx86 = "v5.0/standard/base"
-   KBRANCH:genericx86-64 = "v5.0/standard/base"
-   KBRANCH:edgerouter = "v5.0/standard/edgerouter"
-   KBRANCH:beaglebone-yocto = "v5.0/standard/beaglebone"
+   KBRANCH:genericx86  = "v6.1/standard/base"
+   KBRANCH:genericx86-64  = "v6.1/standard/base"
+   KBRANCH:beaglebone-yocto = "v6.1/standard/beaglebone"
 
    KMACHINE:genericx86 ?= "common-pc"
    KMACHINE:genericx86-64 ?= "common-pc-64"
    KMACHINE:beaglebone-yocto ?= "beaglebone"
 
-   SRCREV_machine:genericx86 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-   SRCREV_machine:genericx86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-   SRCREV_machine:edgerouter ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-   SRCREV_machine:beaglebone-yocto ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+   SRCREV_machine:genericx86 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+   SRCREV_machine:genericx86-64 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+   SRCREV_machine:beaglebone-yocto ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
 
    COMPATIBLE_MACHINE:genericx86 = "genericx86"
    COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-   COMPATIBLE_MACHINE:edgerouter = "edgerouter"
    COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
 
-   LINUX_VERSION:genericx86 = "5.0.3"
-   LINUX_VERSION:genericx86-64 = "5.0.3"
-   LINUX_VERSION:edgerouter = "5.0.3"
-   LINUX_VERSION:beaglebone-yocto = "5.0.3"
+   LINUX_VERSION:genericx86 = "6.1.30"
+   LINUX_VERSION:genericx86-64 = "6.1.30"
+   LINUX_VERSION:beaglebone-yocto = "6.1.20"
 
 This particular append file works for all the machines that are
 part of the ``meta-yocto-bsp`` layer. The relevant statements are
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 355326de6e..bcaaaeed14 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -69,8 +69,7 @@ to indicate the branch.
    You can use the :term:`KBRANCH` value to define an alternate branch typically
    with a machine override as shown here from the ``meta-yocto-bsp`` layer::
 
-           KBRANCH:edgerouter = "standard/edgerouter"
-
+      KBRANCH:beaglebone-yocto = "standard/beaglebone"
 
 The linux-yocto style recipes can optionally define the following
 variables:
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 1d85202df4..c781a0682c 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -387,13 +387,13 @@ Creating the Append File
 
 You create this file in your custom layer. You also name it accordingly
 based on the linux-yocto recipe you are using. For example, if you are
-modifying the ``meta/recipes-kernel/linux/linux-yocto_4.12.bb`` recipe,
+modifying the ``meta/recipes-kernel/linux/linux-yocto_6.1.bb`` recipe,
 the append file will typically be located as follows within your custom
 layer:
 
 .. code-block:: none
 
-   your-layer/recipes-kernel/linux/linux-yocto_4.12.bbappend
+   your-layer/recipes-kernel/linux/linux-yocto_6.1.bbappend
 
 The append file should initially extend the
 :term:`FILESPATH` search path by
@@ -421,35 +421,31 @@ As an example, consider the following append file used by the BSPs in
 
 .. code-block:: none
 
-   meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.12.bbappend
+   meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.1.bbappend
 
 Here are the contents of this file. Be aware that the actual commit ID
 strings in this example listing might be different than the actual
 strings in the file from the ``meta-yocto-bsp`` layer upstream::
 
-   KBRANCH:genericx86  = "standard/base"
-   KBRANCH:genericx86-64  = "standard/base"
+  KBRANCH:genericx86  = "v6.1/standard/base"
+  KBRANCH:genericx86-64  = "v6.1/standard/base"
+  KBRANCH:beaglebone-yocto = "v6.1/standard/beaglebone"
 
-   KMACHINE:genericx86 ?= "common-pc"
-   KMACHINE:genericx86-64 ?= "common-pc-64"
-   KBRANCH:edgerouter = "standard/edgerouter"
-   KBRANCH:beaglebone = "standard/beaglebone"
+  KMACHINE:genericx86 ?= "common-pc"
+  KMACHINE:genericx86-64 ?= "common-pc-64"
+  KMACHINE:beaglebone-yocto ?= "beaglebone"
 
-   SRCREV_machine:genericx86    ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-   SRCREV_machine:genericx86-64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-   SRCREV_machine:edgerouter ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-   SRCREV_machine:beaglebone ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
+  SRCREV_machine:genericx86 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+  SRCREV_machine:genericx86-64 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+  SRCREV_machine:beaglebone-yocto ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
 
+  COMPATIBLE_MACHINE:genericx86 = "genericx86"
+  COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
+  COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
 
-   COMPATIBLE_MACHINE:genericx86 = "genericx86"
-   COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-   COMPATIBLE_MACHINE:edgerouter = "edgerouter"
-   COMPATIBLE_MACHINE:beaglebone = "beaglebone"
-
-   LINUX_VERSION:genericx86 = "4.12.7"
-   LINUX_VERSION:genericx86-64 = "4.12.7"
-   LINUX_VERSION:edgerouter = "4.12.10"
-   LINUX_VERSION:beaglebone = "4.12.10"
+  LINUX_VERSION:genericx86 = "6.1.30"
+  LINUX_VERSION:genericx86-64 = "6.1.30"
+  LINUX_VERSION:beaglebone-yocto = "6.1.20"
 
 This append file
 contains statements used to support several BSPs that ship with the
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a3b774b540..fd64088512 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4340,17 +4340,16 @@ system and gives an overview of their function and contents.
       This variable is also used from the kernel's append file to identify
       the kernel branch specific to a particular machine or target
       hardware. Continuing with the previous kernel example, the kernel's
-      append file (i.e. ``linux-yocto_4.12.bbappend``) is located in the
+      append file is located in the
       BSP layer for a given machine. For example, the append file for the
       Beaglebone, EdgeRouter, and generic versions of both 32 and 64-bit IA
       machines (``meta-yocto-bsp``) is named
-      ``meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.12.bbappend``.
+      ``meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.1.bbappend``.
       Here are the related statements from that append file::
 
-         KBRANCH:genericx86 = "standard/base"
-         KBRANCH:genericx86-64 = "standard/base"
-         KBRANCH:edgerouter = "standard/edgerouter"
-         KBRANCH:beaglebone = "standard/beaglebone"
+         KBRANCH:genericx86  = "v6.1/standard/base"
+         KBRANCH:genericx86-64  = "v6.1/standard/base"
+         KBRANCH:beaglebone-yocto = "v6.1/standard/beaglebone"
 
       The :term:`KBRANCH` statements
       identify the kernel branch to use when building for each supported
-- 
2.34.1


