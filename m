Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D84C25B6D
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.147723.1698154047218942904
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nUNfvBF5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83CC66000C;
	Tue, 24 Oct 2023 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEFYXav1P5aGqCf62jc1SznLxxwRNMdAj4nK/8vTSgw=;
	b=nUNfvBF5mgTW7+e5AudtGe7jVlt5l+Zp3nW940xLZSGjDW2goJ2lHewS79r8diYHf8H9MF
	qwaz4yEDEX9CUjK7YAwOKNkvF0S09EIV/SI7fo0C9E4lokNtBz9zgHO+yU2Nzw1aAfLeFw
	CUMukVI3GLj1JMQjlxx10w1M1dQeZqE32t27UH9+SKlsSaj055lDbHf9sFNg2eDntzw2wm
	LFhgDvqHpA8llhPxazDLtBTqhvIdoPuowalsuM47dXM/tEUUcEssD4LBQFrIGpwHdPV6F+
	iJlpd13wwfWKWsiXiQgUiyeuNkRWZRRuKp7vN4CKZuKRGwG57ORwgtwa8//lhg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 02/16] manuals: update linux-yocto append examples
Date: Tue, 24 Oct 2023 15:26:58 +0200
Message-Id: <20231024132712.90600-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4478

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst        | 32 ++++++++++++------------
 documentation/kernel-dev/advanced.rst  |  3 +--
 documentation/kernel-dev/common.rst    | 34 +++++++++++++-------------
 documentation/ref-manual/variables.rst | 12 ++++-----
 4 files changed, 40 insertions(+), 41 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 8b29290b59..f9e13d145a 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1449,39 +1449,39 @@ The kernel recipe used to build the kernel image for the BeagleBone
 device was established in the machine configuration::
 
    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-   PREFERRED_VERSION_linux-yocto ?= "5.0%"
+   PREFERRED_VERSION_linux-yocto ?= "5.15%"
 
 The ``meta-yocto-bsp/recipes-kernel/linux`` directory in the layer contains
 metadata used to build the kernel. In this case, a kernel append file
-(i.e. ``linux-yocto_5.0.bbappend``) is used to override an established
-kernel recipe (i.e. ``linux-yocto_5.0.bb``), which is located in
-:yocto_git:`/poky/tree/meta/recipes-kernel/linux`.
+(i.e. ``linux-yocto_5.15.bbappend``) is used to override an established
+kernel recipe (i.e. ``linux-yocto_5.15.bb``), which is located in
+:yocto_git:`/poky/tree/meta-yocto-bsp/recipes-kernel/linux`.
 
 Following is the contents of the append file::
 
-   KBRANCH:genericx86 = "v5.0/standard/base"
-   KBRANCH:genericx86-64 = "v5.0/standard/base"
-   KBRANCH:edgerouter = "v5.0/standard/edgerouter"
-   KBRANCH:beaglebone-yocto = "v5.0/standard/beaglebone"
+   KBRANCH:genericx86  = "v5.15/standard/base"
+   KBRANCH:genericx86-64  = "v5.15/standard/base"
+   KBRANCH:edgerouter = "v5.15/standard/edgerouter"
+   KBRANCH:beaglebone-yocto = "v5.15/standard/beaglebone"
 
    KMACHINE:genericx86 ?= "common-pc"
    KMACHINE:genericx86-64 ?= "common-pc-64"
    KMACHINE:beaglebone-yocto ?= "beaglebone"
 
-   SRCREV_machine:genericx86 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-   SRCREV_machine:genericx86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-   SRCREV_machine:edgerouter ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-   SRCREV_machine:beaglebone-yocto ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
+   SRCREV_machine:genericx86 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
+   SRCREV_machine:genericx86-64 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
+   SRCREV_machine:edgerouter ?= "90f1ee6589264545f548d731c2480b08a007230f"
+   SRCREV_machine:beaglebone-yocto ?= "9aabbaa89fcb21af7028e814c1f5b61171314d5a"
 
    COMPATIBLE_MACHINE:genericx86 = "genericx86"
    COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
    COMPATIBLE_MACHINE:edgerouter = "edgerouter"
    COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
 
-   LINUX_VERSION:genericx86 = "5.0.3"
-   LINUX_VERSION:genericx86-64 = "5.0.3"
-   LINUX_VERSION:edgerouter = "5.0.3"
-   LINUX_VERSION:beaglebone-yocto = "5.0.3"
+   LINUX_VERSION:genericx86 = "5.15.72"
+   LINUX_VERSION:genericx86-64 = "5.15.72"
+   LINUX_VERSION:edgerouter = "5.15.54"
+   LINUX_VERSION:beaglebone-yocto = "5.15.54"
 
 This particular append file works for all the machines that are
 part of the ``meta-yocto-bsp`` layer. The relevant statements are
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index b5290b61b3..e38a8da25c 100644
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
index 4279cbb707..3406fcfe75 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -455,13 +455,13 @@ Creating the Append File
 
 You create this file in your custom layer. You also name it accordingly
 based on the linux-yocto recipe you are using. For example, if you are
-modifying the ``meta/recipes-kernel/linux/linux-yocto_4.12.bb`` recipe,
+modifying the ``meta/recipes-kernel/linux/linux-yocto_5.15.bb`` recipe,
 the append file will typically be located as follows within your custom
 layer:
 
 .. code-block:: none
 
-   your-layer/recipes-kernel/linux/linux-yocto_4.12.bbappend
+   your-layer/recipes-kernel/linux/linux-yocto_5.15.bbappend
 
 The append file should initially extend the
 :term:`FILESPATH` search path by
@@ -489,36 +489,36 @@ As an example, consider the following append file used by the BSPs in
 
 .. code-block:: none
 
-   meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.12.bbappend
+   meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
 
 Here are the contents of this file. Be aware that the actual commit ID
 strings in this example listing might be different than the actual
 strings in the file from the ``meta-yocto-bsp`` layer upstream.
 ::
 
-   KBRANCH:genericx86  = "standard/base"
-   KBRANCH:genericx86-64  = "standard/base"
+   KBRANCH:genericx86  = "v5.15/standard/base"
+   KBRANCH:genericx86-64  = "v5.15/standard/base"
+   KBRANCH:edgerouter = "v5.15/standard/edgerouter"
+   KBRANCH:beaglebone-yocto = "v5.15/standard/beaglebone"
 
    KMACHINE:genericx86 ?= "common-pc"
    KMACHINE:genericx86-64 ?= "common-pc-64"
-   KBRANCH:edgerouter = "standard/edgerouter"
-   KBRANCH:beaglebone = "standard/beaglebone"
-
-   SRCREV_machine:genericx86    ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-   SRCREV_machine:genericx86-64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-   SRCREV_machine:edgerouter ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-   SRCREV_machine:beaglebone ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
+   KMACHINE:beaglebone-yocto ?= "beaglebone"
 
+   SRCREV_machine:genericx86 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
+   SRCREV_machine:genericx86-64 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
+   SRCREV_machine:edgerouter ?= "90f1ee6589264545f548d731c2480b08a007230f"
+   SRCREV_machine:beaglebone-yocto ?= "9aabbaa89fcb21af7028e814c1f5b61171314d5a"
 
    COMPATIBLE_MACHINE:genericx86 = "genericx86"
    COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
    COMPATIBLE_MACHINE:edgerouter = "edgerouter"
-   COMPATIBLE_MACHINE:beaglebone = "beaglebone"
+   COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
 
-   LINUX_VERSION:genericx86 = "4.12.7"
-   LINUX_VERSION:genericx86-64 = "4.12.7"
-   LINUX_VERSION:edgerouter = "4.12.10"
-   LINUX_VERSION:beaglebone = "4.12.10"
+   LINUX_VERSION:genericx86 = "5.15.72"
+   LINUX_VERSION:genericx86-64 = "5.15.72"
+   LINUX_VERSION:edgerouter = "5.15.54"
+   LINUX_VERSION:beaglebone-yocto = "5.15.54"
 
 This append file
 contains statements used to support several BSPs that ship with the
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 148eebf56a..7d537bf878 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3943,7 +3943,7 @@ system and gives an overview of their function and contents.
 
       Values for this variable are set in the kernel's recipe file and the
       kernel's append file. For example, if you are using the
-      ``linux-yocto_4.12`` kernel, the kernel recipe file is the
+      ``linux-yocto_5.15`` kernel, the kernel recipe file is the
       ``meta/recipes-kernel/linux/linux-yocto_4.12.bb`` file. :term:`KBRANCH`
       is set as follows in that kernel recipe file::
 
@@ -3956,13 +3956,13 @@ system and gives an overview of their function and contents.
       BSP layer for a given machine. For example, the append file for the
       Beaglebone, EdgeRouter, and generic versions of both 32 and 64-bit IA
       machines (``meta-yocto-bsp``) is named
-      ``meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.12.bbappend``.
+      ``meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.15.bbappend``.
       Here are the related statements from that append file::
 
-         KBRANCH:genericx86 = "standard/base"
-         KBRANCH:genericx86-64 = "standard/base"
-         KBRANCH:edgerouter = "standard/edgerouter"
-         KBRANCH:beaglebone = "standard/beaglebone"
+         KBRANCH:genericx86  = "v5.15/standard/base"
+         KBRANCH:genericx86-64  = "v5.15/standard/base"
+         KBRANCH:edgerouter = "v5.15/standard/edgerouter"
+         KBRANCH:beaglebone-yocto = "v5.15/standard/beaglebone"
 
       The :term:`KBRANCH` statements
       identify the kernel branch to use when building for each supported
-- 
2.34.1


