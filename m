Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3F4C44532
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 13:32:01 +0000 (UTC)
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11822.1769002317382272122
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 05:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dx4qH4TkTz4Hh;
	Wed, 21 Jan 2026 14:31:55 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dx4qH1bXdzx9x;
	Wed, 21 Jan 2026 14:31:55 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 21 Jan 2026 14:31:42 +0100
Subject: [PATCH v2 01/12] sdk-manual: fix incorrect highlight language for
 text code-blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-code-block-misc-20260114-v2-1-fdd4bb5c2e68@cherry.de>
References: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
In-Reply-To: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jan 2026 13:32:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8613

From: Quentin Schulz <quentin.schulz@cherry.de>

When unspecified in conf.py via the highlight_language variable (and
highlight variable for code-blocks), the lexer used for literal blocks
is "default" which tries to highlight the block as Python code.

These blocks aren't Python but either simply the console output or a
file name (which we should probably just double tick-quote instead), so
let's render those blocks with the "text" lexer.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/sdk-manual/appendix-obtain.rst | 12 +++++++++---
 documentation/sdk-manual/extensible.rst      |  4 +++-
 documentation/sdk-manual/using.rst           |  8 ++++++--
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index a42cbc31b..94c5552e5 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -61,7 +61,9 @@ Follow these steps to locate and hand-install the toolchain:
 
    For example, if your build host is a 64-bit x86 system and you need
    an extended SDK for a 64-bit core2 QEMU target, go into the ``x86_64``
-   folder and download the following installer::
+   folder and download the following installer:
+
+   .. code-block:: text
 
       poky-glibc-x86_64-core-image-sato-core2-64-qemux86-64-toolchain-&DISTRO;.sh
 
@@ -130,7 +132,9 @@ build the SDK installer. Follow these steps:
       :term:`SDKMACHINE` value must be set for the architecture of the
       machine you are using to build the installer. If :term:`SDKMACHINE`
       is not set appropriately, the build fails and provides an error
-      message similar to the following::
+      message similar to the following:
+
+      .. code-block:: text
 
          The extensible SDK can currently only be built for the same
          architecture as the machine being built on - SDK_ARCH
@@ -224,7 +228,9 @@ Follow these steps to extract the root filesystem:
 
    For example, if you plan on using a BeagleBone device as your target
    hardware and your image is a ``core-image-sato-sdk`` image, you can
-   download the following file::
+   download the following file:
+
+   .. code-block:: text
 
       core-image-sato-sdk-beaglebone-yocto.tar.bz2
 
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index e5e9e4a03..fe5e4cdd5 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -121,7 +121,9 @@ is the general form::
 
 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off
-the SDK for ``core-image-sato`` and using the current &DISTRO; snapshot::
+the SDK for ``core-image-sato`` and using the current &DISTRO; snapshot:
+
+.. code-block:: text
 
    poky-glibc-x86_64-core-image-sato-i586-toolchain-ext-&DISTRO;.sh
 
diff --git a/documentation/sdk-manual/using.rst b/documentation/sdk-manual/using.rst
index bfb306abf..eced4a5c5 100644
--- a/documentation/sdk-manual/using.rst
+++ b/documentation/sdk-manual/using.rst
@@ -52,7 +52,9 @@ libraries appropriate for developing against the corresponding image.
 
 The names of the tarball installer scripts are such that a string
 representing the host system appears first in the filename and then is
-immediately followed by a string representing the target architecture::
+immediately followed by a string representing the target architecture:
+
+.. code-block:: text
 
    poky-glibc-host_system-image_type-arch-toolchain-release_version.sh
 
@@ -75,7 +77,9 @@ immediately followed by a string representing the target architecture::
 
 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off
-the SDK for ``core-image-sato`` and using the current DISTRO snapshot::
+the SDK for ``core-image-sato`` and using the current DISTRO snapshot:
+
+.. code-block:: text
 
    poky-glibc-x86_64-core-image-sato-i586-toolchain-DISTRO.sh
 

-- 
2.52.0


