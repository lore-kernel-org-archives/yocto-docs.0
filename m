Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59F2C54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:15:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.8392.1710407719988307636
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PVKborBo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87C341BF212;
	Thu, 14 Mar 2024 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pd4m2QP5wyUswoGESCOsRUpLE8IgWkKBXcXpfFlE/DY=;
	b=PVKborBoBCHEHMEUBz/+8GMlymQyNYFZ72gKIIHWynklji3madYGWrwdTtnEMBJmkypG9Y
	W3MjFXla32s0A+iK4eqoKlrDJGqBv2jV76zTNLHcwZuuGy3e16J1MGoFqXwmfBOVKvGWFl
	dqcCrC13Lf1r0BzTaDPXMGTlwQuqQuvwyzNCp7w5/I1keAFwgQUrt6c0neQ4ml4jwPgu8h
	Fz3ndbGNGaZTtYqyzkXRkOnhP7rS0asJ+4W+o+m5mG2awTauKGSJjUvkzWXg1WLyYpye8p
	Ik9STamqc/R2E38DfH77COblQqRSqZR6q2m/+qPKjZgdtqPskkf7tipvzlD44g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Tim Orling <ticotimo@gmail.com>
Subject: [nanbield][PATCH 7/7] manuals: document VIRTUAL-RUNTIME variables
Date: Thu, 14 Mar 2024 10:15:08 +0100
Message-Id: <20240314091508.84166-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
References: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:15:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4975

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
index ec879f9f86..52fd7d9002 100644
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
@@ -9880,6 +9880,33 @@ system and gives an overview of their function and contents.
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


