Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42AEECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 13:26:09 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.6404.1666877167062982324
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 06:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q/ScjBDf;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0E55C100005;
	Thu, 27 Oct 2022 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666877165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=66K+mNAj0BbjgwA7b2bTMU4EeYyeivHOmnTfAVHFyOU=;
	b=Q/ScjBDfml3zNaF9jt2pA30FBBv+OSYOx2/odo5pGT1tEZJlPUZ3++PQxIbDA0pl355vo2
	5Xca6+3vqc72WkvYASwUl5ud6C8J6JAutcQEwjEsGDOkA4vM3apyy+Mfpa6DyMfd/YEodE
	+eD6SHraZeX9vQM/dXbmEFekpcrANlq2ufSieP5V/dwyiAv23EC2PKbsoL3svZ9CW/4N/A
	reBwzbNZphhAjtEehx9vFp1MKSh/yUSPqWFqmKP+yDpSdOHg7ockFE0oaoiaAO6Zj0Zu3d
	otrxGhnEHZh3PKWYm66vzGD7OO36DXtHsnrp4B1mMalJJ+StLPpusb/Cm/F8Dg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: add missing references to SDKMACHINE and SDK_ARCH
Date: Thu, 27 Oct 2022 15:26:02 +0200
Message-Id: <20221027132602.42691-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Oct 2022 13:26:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3429

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Doing this, fix the odd identation of the corresponding paragraphs

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst      | 11 +++++------
 documentation/sdk-manual/appendix-obtain.rst    | 17 ++++++++---------
 .../test-manual/understand-autobuilder.rst      |  2 +-
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 75eb872b32..931bec79e8 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1482,12 +1482,11 @@ relocatable SDK used to develop applications. When you run the
 installer, it installs the toolchain, which contains the development
 tools (e.g., ``gcc-cross-canadian``, ``binutils-cross-canadian``, and
 other ``nativesdk-*`` tools), which are tools native to the SDK (i.e.
-native to :term:`SDK_ARCH`), you
-need to cross-compile and test your software. The figure shows the
-commands you use to easily build out this toolchain. This
-cross-development toolchain is built to execute on the
-:term:`SDKMACHINE`, which might or
-might not be the same machine as the Build Host.
+native to :term:`SDK_ARCH`), you need to cross-compile and test your
+software. The figure shows the commands you use to easily build out
+this toolchain. This cross-development toolchain is built to execute on the
+:term:`SDKMACHINE`, which might or might not be the same machine as
+the Build Host.
 
 .. note::
 
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 7a09a83af8..7d62293cd6 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -132,22 +132,21 @@ build the SDK installer. Follow these steps:
 5. *Make Sure Your SDK Machine is Correctly Set:* If you are building a
    toolchain designed to run on an architecture that differs from your
    current development host machine (i.e. the build host), be sure that
-   the :term:`SDKMACHINE` variable
-   in the ``local.conf`` file in your Build Directory is correctly set.
+   the :term:`SDKMACHINE` variable in the ``local.conf`` file in your
+   Build Directory is correctly set.
 
    .. note::
 
       If you are building an SDK installer for the Extensible SDK, the
-      SDKMACHINE
-      value must be set for the architecture of the machine you are
-      using to build the installer. If
-      SDKMACHINE
+      :term:`SDKMACHINE` value must be set for the architecture of the
+      machine you are using to build the installer. If :term:`SDKMACHINE`
       is not set appropriately, the build fails and provides an error
       message similar to the following::
 
-              The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is
-              set to i686 (likely via setting SDKMACHINE) which is different from the architecture of the build machine (x86_64).
-              Unable to continue.
+         The extensible SDK can currently only be built for the same
+         architecture as the machine being built on --- :term:`SDK_ARCH`
+         is set to ``i686`` (likely via setting :term:`SDKMACHINE`) which is
+         different from the architecture of the build machine (``x86_64``).
 
 
 6. *Build the SDK Installer:* To build the SDK installer for a standard
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index c5e32cfe09..bfd75c81e0 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -56,7 +56,7 @@ the "templates" section, which looks like::
 
 Combining these two entries you can see that "qemux86-64" is a three step build where the
 ``bitbake BBTARGETS`` would be run, then ``bitbake SANITYTARGETS`` for each step; all for
-``MACHINE="qemux86-64"`` but with differing SDKMACHINE settings. In step
+``MACHINE="qemux86-64"`` but with differing :term:`SDKMACHINE` settings. In step
 1 an extra variable is added to the ``auto.conf`` file to enable wic
 image generation.
 
-- 
2.34.1


