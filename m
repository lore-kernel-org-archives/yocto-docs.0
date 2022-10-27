Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA98FA3743
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 11:39:59 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.5367.1666870797441879707
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 04:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UCN7Gjul;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AE066100003;
	Thu, 27 Oct 2022 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666870794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8lqEcnog5t+MgC4DFyTyaX+s33A+Qes/KFs8eVtNg18=;
	b=UCN7Gjulf1KnAdzmbyPyXREsq3ZzvDdCAlCVnQ/eWjDhgpGmItgwEgXBCvSrzmiO8nMjgF
	ldyTL07aXFucpJynYbSXOvMA5Gvm0cfpd865G/UCEaoxUC9Zl2ukqP9wLBWrXGHbIVrpgs
	Tc9T5j/kmfOIXRhGhfEiJsQLubi+tYuYzq09RhF03AcflGeK1zr0rO9ZR7MKHQbHh2crcn
	gVxWRlFr7uVRLL9RYhJO8aPvCe22HbEVuFql5ZiTCGeF6YHRRoyk2egJ5oWMLU0CGJoB4U
	2a/qySPMcelTlwR8MkM/Fb+amOydshW2Kust/J8ivy5uoxVNQ3uXqu17Ay3jzg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/3] manuals: stop referring to the meta-openembedded repo from GitHub
Date: Thu, 27 Oct 2022 13:39:41 +0200
Message-Id: <20221027113941.34972-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027113941.34972-1-michael.opdenacker@bootlin.com>
References: <20221027113941.34972-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Oct 2022 11:39:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3427

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst           | 3 +--
 documentation/dev-manual/common-tasks.rst | 4 ++--
 documentation/ref-manual/terms.rst        | 8 +++-----
 documentation/ref-manual/variables.rst    | 5 ++---
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 7e17b42886..efdaf80f63 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -109,8 +109,7 @@ them to the "Dependencies" section.
 
 Some layers function as a layer to hold other BSP layers. These layers
 are known as ":term:`container layers <Container Layer>`". An example of
-this type of layer is OpenEmbedded's
-`meta-openembedded <https://github.com/openembedded/meta-openembedded>`__
+this type of layer is OpenEmbedded's :oe_git:`meta-openbedded </meta-openembedded>`
 layer. The ``meta-openembedded`` layer contains many ``meta-*`` layers.
 In cases like this, you need to include the names of the actual layers
 you want to work with, such as::
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index c3defa0766..f24fa4dbb5 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -7555,8 +7555,8 @@ NPM packages:
 
 -  The NPM host tools need the native ``nodejs-npm`` package, which is
    part of the OpenEmbedded environment. You need to get the package by
-   cloning the https://github.com/openembedded/meta-openembedded
-   repository out of GitHub. Be sure to add the path to your local copy
+   cloning the :oe_git:`meta-openembedded </meta-openembedded>`
+   repository. Be sure to add the path to your local copy
    to your ``bblayers.conf`` file.
 
 -  ``devtool`` cannot detect native libraries in module dependencies.
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 1a2c055591..ee14df5684 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -138,14 +138,12 @@ universal, the list includes them just in case:
       which contains multiple (and typically related) sub-layers which can
       be included independently in your project's ``bblayers.conf`` file.
 
-      In some cases, such as with OpenEmbedded's
-      `meta-openembedded <https://github.com/openembedded/meta-openembedded>`__
+      In some cases, such as with OpenEmbedded's :oe_git:`meta-openembedded </meta-openembedded>`
       layer, the top level ``meta-openembedded/`` directory is not itself an actual layer,
       so you would never explicitly include it in a ``bblayers.conf`` file;
       rather, you would include any number of its layer subdirectories, such as
-      `meta-openembedded/meta-oe <https://github.com/openembedded/meta-openembedded/tree/master/meta-oe>`__,
-      `meta-openembedded/meta-python <https://github.com/openembedded/meta-openembedded/tree/master/meta-python>`__
-      and so on.
+      :oe_git:`meta-oe </meta-openembedded/tree/meta-oe>`, :oe_git:`meta-python
+      </meta-openembedded/tree/meta-python>` and so on.
 
       On the other hand, some container layers (such as
       :yocto_git:`meta-security </meta-security>`)
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 59882fb158..1721b7fe69 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7896,9 +7896,8 @@ system and gives an overview of their function and contents.
       <https://www.freedesktop.org/software/systemd/man/systemd.special.html>`__
       for details.
 
-      For example, this variable is used in the
-      `core-image-minimal-xfce.bb
-      <https://git.openembedded.org/meta-openembedded/tree/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb>`__
+      For example, this variable is used in the :oe_git:`core-image-minimal-xfce.bb
+      </meta-openembedded/tree/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb>`
       recipe::
 
           SYSTEMD_DEFAULT_TARGET = "graphical.target"
-- 
2.34.1


