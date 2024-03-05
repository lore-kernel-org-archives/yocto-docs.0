Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C93EC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 18:41:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.693.1709664067901051524
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 10:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nPU53vk1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00C59FF802;
	Tue,  5 Mar 2024 18:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709664066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kb92Ue+fLfQGD3H5yG3FN6HPK2AFJhZWhr1lB7U1KTw=;
	b=nPU53vk1wgvAhmpUuw4B2LuQaJkO4K8gcbMHt6I2XQXlbtQsPyOWRUlEOay5HGFuyHnqBT
	0zyK0/TopU3btmBCO7Myl9+TS3OduNeKXIPacD+V8zQBXXdVhzRVB34gWzNJQWtZKjoY5N
	LMrhsUM9uyWM0eGJAIqyhupGVuValBN0WMqoo60tugVGfAixRSX2cJ6uGyNp7yaVbUiXTr
	c1W0O2RiScHlxaEGhsEAguyOA7UGCcvcVULNobcXBMH/qUDk5x/ROYstaVRW37b2VHdGK1
	9qYVHmSurlOWbjXA5PpBmgkluO33cM8pHQRmmM+7SSNjE7cq3KATJ6UZTTWwUQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Tim Orling <ticotimo@gmail.com>
Subject: [PATCH] manuals: document VIRTUAL-RUNTIME variables
Date: Tue,  5 Mar 2024 19:41:00 +0100
Message-Id: <20240305184100.281028-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Mar 2024 18:41:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4936

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Document the convention to use variables prefixed by VIRTUAL_RUNTIME.
Add references to the new term where possible.

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
index 9db1808cc2..6e66dc7358 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6750,11 +6750,11 @@ system and gives an overview of their function and contents.
 
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
@@ -9866,6 +9866,33 @@ system and gives an overview of their function and contents.
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


