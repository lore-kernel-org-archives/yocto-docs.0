Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4779C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 19:55:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.4869.1683230132211424609
 for <docs@lists.yoctoproject.org>;
 Thu, 04 May 2023 12:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ERDsHoK3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 654331BF204;
	Thu,  4 May 2023 19:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683230130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FbauHAjZxYAEfXnZLrGYtaf5/qdyVln1WoYDJZS76qQ=;
	b=ERDsHoK3P+KFhfgX/i0gtQ1ZW8jOrUcYty57DjpfdTLEvYgUor99+f+sAbcZ9BkllIiHW4
	Q8q1I4ytEdYyPjiyUCY0E5q9g9Hup/bTmpinKHodPb6G+A0xlo7ZyadeBocnW5RWFI6RiH
	C4Pd8qjXVaYpTx/hRAqyD8fa6rbFGLsr8bJ3OtDNMc9MWlEeooIJe6R9xh53T3uDQODU1e
	RmO65Q6na0ewFJyMweHRuQMwZAUjUGwgctBK/MiMz8Y0DLysI6jpmOae27t2ZyfApMq51m
	EqJOe6bNZlBoN4YIiTKDnhOXFu5NXZ7iZgicrbnqRjnhiSPzKsg4WMRDpojuxg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH] ref-manual: document FIT_ADDRESS_CELLS
Date: Thu,  4 May 2023 21:55:20 +0200
Message-Id: <20230504195520.2624698-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 May 2023 19:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3908

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Jamin Lin <jamin_lin@aspeedtech.com>
---
 .../migration-guides/release-notes-4.3.rst    |  5 ++++
 documentation/ref-manual/classes.rst          |  3 ++-
 documentation/ref-manual/variables.rst        | 26 +++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 16320d3db2..04dcc3d9a7 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -22,6 +22,11 @@ New Features / Enhancements in 4.3
 
 -  wic Image Creator enhancements:
 
+-  FIT image related improvements:
+
+   -  New :term:`FIT_ADDRESS_CELLS` variable allowing
+      to specify 64 bit addresses.
+
 -  SDK-related improvements:
 
 -  Testing:
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a78368b380..96d7c0d414 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1590,7 +1590,8 @@ Only a single kernel can be added to the FIT image created by
 :ref:`ref-classes-kernel-fitimage` and the kernel image in FIT is mandatory. The
 address where the kernel image is to be loaded by U-Boot is
 specified by :term:`UBOOT_LOADADDRESS` and the entrypoint by
-:term:`UBOOT_ENTRYPOINT`.
+:term:`UBOOT_ENTRYPOINT`. Setting :term:`FIT_ADDRESS_CELLS` to "2"
+is necessary if such addresses are 64 bit ones.
 
 Multiple device trees can be added to the FIT image created by
 :ref:`ref-classes-kernel-fitimage` and the device tree is optional.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 574af2c2f9..6ee65e1788 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2898,6 +2898,26 @@ system and gives an overview of their function and contents.
       For guidance on how to create your own file permissions settings
       table file, examine the existing ``fs-perms.txt``.
 
+   :term:`FIT_ADDRESS_CELLS`
+
+      Specifies the value of the ``#address-cells`` value for the
+      description of the kernel FIT image.  
+
+      The default value is set to "1" by the :ref:`ref-classes-kernel-fitimage`
+      class, which corresponds to 32 bit addresses. 
+
+      For platforms who need to set 64 bit addresses in
+      :term:`UBOOT_LOADADDRESS` and :term:`UBOOT_ENTRYPOINT`, you need to
+      set this value to "2", as two 32 bit values (cells) will be needed 
+      to represent such addresses.
+
+      Here is an example setting "0x400000000" as a load address::
+    
+         FIT_ADDRESS_CELLS = "2"
+         UBOOT_LOADADDRESS= "0x04 0x00000000"
+
+      See `more details about #address-cells <https://elinux.org/Device_Tree_Usage#How_Addressing_Works>`__.
+
    :term:`FIT_CONF_DEFAULT_DTB`
       Specifies the default device tree binary (dtb) file for a fitImage when
       multiple are provided.
@@ -9041,11 +9061,17 @@ system and gives an overview of their function and contents.
       creation, the :term:`UBOOT_ENTRYPOINT` variable is passed as a
       command-line parameter to the ``uboot-mkimage`` utility.
 
+      To pass a 64 bit address for FIT image creation, you will need to set
+      the :term:`FIT_ADDRESS_CELLS` variable too.
+
    :term:`UBOOT_LOADADDRESS`
       Specifies the load address for the U-Boot image. During U-Boot image
       creation, the :term:`UBOOT_LOADADDRESS` variable is passed as a
       command-line parameter to the ``uboot-mkimage`` utility.
 
+      To pass a 64 bit address for FIT image creation, you will need to set
+      the :term:`FIT_ADDRESS_CELLS` variable too.
+
    :term:`UBOOT_LOCALVERSION`
       Appends a string to the name of the local version of the U-Boot
       image. For example, assuming the version of the U-Boot image built
-- 
2.34.1


