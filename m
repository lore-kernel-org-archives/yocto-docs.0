Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D4ACDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:26:11 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.44798.1697217967236913899
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 10:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OcQ7qvkM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C5F360005;
	Fri, 13 Oct 2023 17:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697217965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YjFnDBh4sNWBvkqDJByy3AkLqJfveSM33DbXw5lc5mI=;
	b=OcQ7qvkMCd885VVHWVDMuVAhhv5b0j3vVbHLZ9sSllGOhix3c80A+5nuBqgdek8bj5P58S
	ljFAAxMm8LqQM7V+P4GtGgcUEPy+1/1trbPHQ9d1efRzArQ6OnE6aLZuKJ7aWUge2WHhqB
	VuTJNxmHRzK2puKMh23Bt/Vb+flDtUj2W0BaWy7oPrse9pbbMfFjgMxNPZvUiDiMFoOUc1
	RQoegFIl/Yk6Oc0IEVenAoF+zg4GaZtJd0Mp9xGB3UGPbtgBGwr3bwxnjQsjI9LX2T+8C+
	GHc16WK8EH8P/V9R63Xo62WhEWe5e2h7TLbLl7cFYxNAP+Mb5Ur18rOa0T/XBg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/5] sdk-manual: appendix-obtain: improve and update descriptions
Date: Fri, 13 Oct 2023 19:25:45 +0200
Message-Id: <20231013172547.82195-4-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4368

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Improve text formatting
- Stop mentioning all possible values
- Update examples
- Correct descriptions

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/sdk-manual/appendix-obtain.rst | 50 +++++++-------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index f40ea6d4ab..ad531cbf24 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -39,27 +39,20 @@ Follow these steps to locate and hand-install the toolchain:
    download the installer appropriate for your build host, target
    hardware, and image type.
 
-   The installer files (``*.sh``) follow this naming convention::
+   The installer files (``*.sh``) follow this naming convention:
+   ``poky-glibc-host_system-core-image-type-arch-toolchain[-ext]-release.sh``:
 
-      poky-glibc-host_system-core-image-type-arch-toolchain[-ext]-release.sh
+   -  ``host_system``: string representing your development system: ``i686`` or ``x86_64``
 
-      Where:
-          host_system is a string representing your development system:
-                 "i686" or "x86_64"
+   -  ``type``: string representing the image: ``sato`` or ``minimal``
 
-          type is a string representing the image:
-                "sato" or "minimal"
+   -  ``arch``: string representing the target architecture such as ``cortexa57-qemuarm64``
 
-          arch is a string representing the target architecture:
-                 "aarch64", "armv5e", "core2-64", "cortexa8hf-neon", "i586", "mips32r2",
-                 "mips64", or "ppc7400"
-
-          release is the version of Yocto Project.
-
-          NOTE:
-             The standard SDK installer does not have the "-ext" string as
-             part of the filename.
+   -  ``release``: version of the Yocto Project.
 
+   .. note::
+      The standard SDK installer does not have the ``-ext`` string as
+      part of the filename.
 
    The toolchains provided by the Yocto
    Project are based off of the ``core-image-sato`` and
@@ -67,16 +60,16 @@ Follow these steps to locate and hand-install the toolchain:
    developing against those images.
 
    For example, if your build host is a 64-bit x86 system and you need
-   an extended SDK for a 64-bit core2 target, go into the ``x86_64``
+   an extended SDK for a 64-bit core2 QEMU target, go into the ``x86_64``
    folder and download the following installer::
 
-      poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
+      poky-glibc-x86_64-core-image-sato-core2-64-qemux86-64-toolchain-&DISTRO;.sh
 
 #. *Run the Installer:* Be sure you have execution privileges and run
    the installer. Following is an example from the ``Downloads``
    directory::
 
-      $ ~/Downloads/poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
+      $ ~/Downloads/poky-glibc-x86_64-core-image-sato-core2-64-qemux86-64-toolchain-&DISTRO;.sh
 
    During execution of the script, you choose the root location for the
    toolchain. See the
@@ -216,21 +209,14 @@ Follow these steps to extract the root filesystem:
    also contain flattened root filesystem image files (``*.ext4``),
    which you can use with QEMU directly.
 
-   The pre-built root filesystem image files follow these naming
-   conventions::
-
-      core-image-profile-arch.tar.bz2
+   The pre-built root filesystem image files follow the
+   ``core-image-profile-machine.tar.bz2`` naming convention:
 
-      Where:
-          profile is the filesystem image's profile:
-                    lsb, lsb-dev, lsb-sdk, minimal, minimal-dev, minimal-initramfs,
-                    sato, sato-dev, sato-sdk, sato-sdk-ptest. For information on
-                    these types of image profiles, see the "Images" chapter in
-                    the Yocto Project Reference Manual.
+   -  ``profile``: filesystem image's profile, such as ``minimal``,
+      ``minimal-dev`` or ``sato``. For information on these types of image
+      profiles, see the "Images" chapter in the Yocto Project Reference Manual.
 
-          arch is a string representing the target architecture:
-                    beaglebone-yocto, beaglebone-yocto-lsb, edgerouter, edgerouter-lsb,
-                    genericx86, genericx86-64, genericx86-64-lsb, genericx86-lsb and qemu*.
+   -  ``machine``:  same string as the name of the parent download directory.
 
    The root filesystems
    provided by the Yocto Project are based off of the
-- 
2.34.1


