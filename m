Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E807BC54E73
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:14:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.8347.1710407654306759138
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SAZnxjcy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C86E72000F;
	Thu, 14 Mar 2024 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zB2zRtJRwfohvsud7R6WoUWK1vDun8svOnMJTmEGGpo=;
	b=SAZnxjcy01z5cZEZvo+CFCQ4zaw60NzJzEd7u4Kw6awB3181g5eDwvR8LjWI18wUzvx1tb
	xWebsse0NSldNjsFSMspfTlH6Y5PyMHSnJrz+Hd5Wq1LqGRvVXDGF7DJJRqjZ256XH1MLr
	U6YVcUs+MCeh3ZfjfRLr+zLVTlbZ0xHArY7IlXy/0wMUTLD2X7KJzCy1zhTpAX1pRARhqj
	lC4O10gp79ZvsMyIWmklSnf+ERlZ6/qRxhonJwILuilDwBVYkQ8J9aWjO1bBvSb8xmrfq8
	wtt1zRGGf/wJJK1AwQe7GsmQ6KPhcgfjzssYsVg3XxqRj5YsgUrmUGtsg0EIHA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Tim Orling <ticotimo@gmail.com>
Subject: [kirkstone][PATCH 8/8] manuals: document VIRTUAL-RUNTIME variables
Date: Thu, 14 Mar 2024 10:13:58 +0100
Message-Id: <20240314091358.84025-9-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
References: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:14:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4967

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Document the convention to use variables prefixed by VIRTUAL_RUNTIME.
Add references to the new term where possible.

Another reason is that such variables are recommended
in a warning issued by meta/classes-global/insane.bbclass

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Tim Orling <ticotimo@gmail.com>
---
 documentation/dev-manual/device-manager.rst |  8 ++---
 documentation/ref-manual/variables.rst      | 37 ++++++++++++++++++---
 2 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/documentation/dev-manual/device-manager.rst b/documentation/dev-manual/device-manager.rst
index 0343d19b9c..49fc785fec 100644
--- a/documentation/dev-manual/device-manager.rst
+++ b/documentation/dev-manual/device-manager.rst
@@ -60,10 +60,10 @@ kernel.
 All devices created by ``devtmpfs`` will be owned by ``root`` and have
 permissions ``0600``.
 
-To have more control over the device nodes, you can use a device manager
-like ``udev`` or ``busybox-mdev``. You choose the device manager by
-defining the ``VIRTUAL-RUNTIME_dev_manager`` variable in your machine or
-distro configuration file. Alternatively, you can set this variable in
+To have more control over the device nodes, you can use a device manager like
+``udev`` or ``busybox-mdev``. You choose the device manager by defining the
+:term:`VIRTUAL-RUNTIME_dev_manager <VIRTUAL-RUNTIME>` variable in your machine
+or distro configuration file. Alternatively, you can set this variable in
 your ``local.conf`` configuration file::
 
    VIRTUAL-RUNTIME_dev_manager = "udev"
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0f9e114771..ccd1963339 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6364,11 +6364,11 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         A corresponding mechanism for virtual runtime dependencies
-         (packages) exists. However, the mechanism does not depend on any
-         special functionality beyond ordinary variable assignments. For
-         example, ``VIRTUAL-RUNTIME_dev_manager`` refers to the package of
-         the component that manages the ``/dev`` directory.
+         A corresponding mechanism for virtual runtime dependencies (packages)
+         exists. However, the mechanism does not depend on any special
+         functionality beyond ordinary variable assignments. For example,
+         :term:`VIRTUAL-RUNTIME_dev_manager <VIRTUAL-RUNTIME>` refers to the
+         package of the component that manages the ``/dev`` directory.
 
          Setting the "preferred provider" for runtime dependencies is as
          simple as using the following assignment in a configuration file::
@@ -9385,6 +9385,33 @@ system and gives an overview of their function and contents.
       Additionally, you should also set the
       :term:`USERADD_ERROR_DYNAMIC` variable.
 
+   :term:`VIRTUAL-RUNTIME`
+      :term:`VIRTUAL-RUNTIME` is a commonly used prefix for defining virtual
+      packages for runtime usage, typically for use in :term:`RDEPENDS`
+      or in image definitions.
+
+      An example is ``VIRTUAL-RUNTIME_base-utils`` that makes it possible
+      to either use BusyBox based utilities::
+
+         VIRTUAL-RUNTIME_base-utils = "busybox"
+
+      or their full featured implementations from GNU Coreutils
+      and other projects::
+
+         VIRTUAL-RUNTIME_base-utils = "packagegroup-core-base-utils"
+
+      Here are two examples using this virtual runtime package. The
+      first one is in :yocto_git:`initramfs-framework_1.0.bb
+      </poky/tree/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb?h=scarthgap>`::
+
+         RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_base-utils}"
+
+      The second example is in the :yocto_git:`core-image-initramfs-boot
+      </poky/tree/meta/recipes-core/images/core-image-initramfs-boot.bb?h=scarthgap>`
+      image definition::
+
+         PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} base-passwd"
+
    :term:`VOLATILE_LOG_DIR`
       Specifies the persistence of the target's ``/var/log`` directory,
       which is used to house postinstall target log files.
-- 
2.34.1


