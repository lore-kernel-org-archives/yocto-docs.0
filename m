Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D917BC25B6C
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.18018.1698154048332892588
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=G33746NM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0ABF1BF203;
	Tue, 24 Oct 2023 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ym+f05kqVJHyRrcN0Vtptazn9ITq6zHmSgqcUzR4DlA=;
	b=G33746NMXKPCMOo3+ZEaoe6wwfZfrxEVTwHCnpINca9Cc/KxWy3QzfCmXCuXQ+2/JoUMzy
	fk6uOvOZqTwaq6kYXeEBGEW0DkFX4Cm+mnxcQoKS3YwN6vYxtiP7LefcPRcn8a2wSn/mFF
	q9xZOAZEQll+JYUCZfVh2S5Yyoxp5kPelA+AM+gUjTJPiHV+b8wtes0FDskMtLZ8oDpwYo
	yqwiPJqQDbiXa7oczlotWklpmwwZrUmDvUfkM9zAX/9aa1cHj+tC1TUMYyM3Z26jsa97WD
	PfnrRhT6kviRxxTurAQ6BuyDC9d+QyL64r7d1JuCWSBfe1tRgRmz5jcnq1wYWQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 04/16] sdk-manual: appendix-obtain: improve and update descriptions
Date: Tue, 24 Oct 2023 15:27:00 +0200
Message-Id: <20231024132712.90600-5-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4479

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
index 841abac5aa..7b458f281b 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -25,27 +25,20 @@ Follow these steps to locate and hand-install the toolchain:
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
@@ -53,16 +46,16 @@ Follow these steps to locate and hand-install the toolchain:
    developing against those images.
 
    For example, if your build host is a 64-bit x86 system and you need
-   an extended SDK for a 64-bit core2 target, go into the ``x86_64``
+   an extended SDK for a 64-bit core2 QEMU target, go into the ``x86_64``
    folder and download the following installer::
 
-      poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
+      poky-glibc-x86_64-core-image-sato-core2-64-qemux86-64-toolchain-&DISTRO;.sh
 
 4. *Run the Installer:* Be sure you have execution privileges and run
    the installer. Following is an example from the ``Downloads``
    directory::
 
-      $ ~/Downloads/poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
+      $ ~/Downloads/poky-glibc-x86_64-core-image-sato-core2-64-qemux86-64-toolchain-&DISTRO;.sh
 
    During execution of the script, you choose the root location for the
    toolchain. See the
@@ -206,21 +199,14 @@ Follow these steps to extract the root filesystem:
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


