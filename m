Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3971EC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 15:26:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.1296.1635866761547444812
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 08:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A64D840006;
	Tue,  2 Nov 2021 15:25:58 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: correct "take affect" by "take effect"
Date: Tue,  2 Nov 2021 16:25:47 +0100
Message-Id: <20211102152547.20066-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Nov 2021 15:26:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2067

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst  | 6 +++---
 documentation/sdk-manual/extensible.rst | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9eea8081c7..3bf600ca9e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1850,7 +1850,7 @@ system and gives an overview of their function and contents.
 
    :term:`DISTRO_EXTRA_RDEPENDS`
       Specifies a list of distro-specific packages to add to all images.
-      This variable takes affect through ``packagegroup-base`` so the
+      This variable takes effect through ``packagegroup-base`` so the
       variable only really applies to the more full-featured images that
       include ``packagegroup-base``. You can use this variable to keep
       distro policy out of generic images. As with all other distro
@@ -4116,7 +4116,7 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_VERSION`
       Specifies the version of the kernel as extracted from ``version.h``
       or ``utsrelease.h`` within the kernel sources. Effects of setting
-      this variable do not take affect until the kernel has been
+      this variable do not take effect until the kernel has been
       configured. Consequently, attempting to refer to this variable in
       contexts prior to configuration will not work.
 
@@ -6770,7 +6770,7 @@ system and gives an overview of their function and contents.
 
          You cannot set the :term:`SDKMACHINE`
          variable in your distribution configuration file. If you do, the
-         configuration will not take affect.
+         configuration will not take effect.
 
    :term:`SDKPATH`
       Defines the path offered to the user for installation of the SDK that
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 8ef44e39ac..c5970f74fa 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -315,7 +315,7 @@ command:
       $ devtool edit-recipe recipe
 
    From within the editor, you
-   can make modifications to the recipe that take affect when you build
+   can make modifications to the recipe that take effect when you build
    it later.
 
 3. *Build the Recipe or Rebuild the Image*: The next step you take
-- 
2.25.1


