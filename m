Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638E8C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 20:09:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.13000.1646770156484989306
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 12:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b8dmqAXG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7C0EAE0008;
	Tue,  8 Mar 2022 20:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646770154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sqoByVh/gnmdpcY4yn87wrweG7Aa9/0qDPq1Eu8Wh+g=;
	b=b8dmqAXG285+wm8Q9FC9xvAIpYAHzjnJF7LBcKrTJJgaDW0dhwKs5t+8nxUyzwe3J4pJ0c
	frwT2er3ToNQTsPJ3XEdjg8WS4itpQg4L6xV4PQT/11O6LRBqqBVcrFhajuIrxz3G+lplu
	vWI29AYyIr/NZynZB3gXAtsdzTFqa17S6QVMVCUy8IDBEef5xwRYTHx8FPzT0f7cofW4Tw
	8O0yYa/6v7dlo5P8KQn021lsqDdJT0sEbviRNBJiPYGdOD8M7BzxEYGCPVY+6P4yUnMNrr
	4cPJ4H2d1mh/WS0bDOZxsAmeLxyAKht++Tsx+pqy0tKcBNqIqIAgaZyqKmpSNQ==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] [hardknott] docs: fix hardcoded link warning messages
Date: Tue,  8 Mar 2022 21:09:12 +0100
Message-Id: <20220308200912.593860-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 20:09:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2552

Sphinx complains about hardcoded links which can be replaced by an
extlink.

So let's apply its recommendations.

Reported-by: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst                  | 6 +++---
 documentation/overview-manual/yp-intro.rst       | 2 +-
 documentation/ref-manual/system-requirements.rst | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 89f1564422..daa7ba4bb2 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -166,8 +166,8 @@ section.
 #. *Determine the BSP Layer You Want:* The Yocto Project supports many
    BSPs, which are maintained in their own layers or in layers designed
    to contain several BSPs. To get an idea of machine support through
-   BSP layers, you can look at the `index of
-   machines <&YOCTO_RELEASE_DL_URL;/machines>`__ for the release.
+   BSP layers, you can look at the :yocto_dl:`index of machines
+   </releases/yocto/&DISTRO_REL_TAG;/machines>`
 
 #. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
    based on current Intel CPUs and devices, you can leverage this BSP
@@ -879,7 +879,7 @@ Yocto Project:
    your BSP layer as listed in the ``recipes.txt`` file, which is found
    in ``poky/meta`` directory of the :term:`Source Directory`
    or in the OpenEmbedded-Core Layer (``openembedded-core``) at
-   https://git.openembedded.org/openembedded-core/tree/meta.
+   :oe_git:`/openembedded-core/tree/meta`.
 
    You should place recipes (``*.bb`` files) and recipe modifications
    (``*.bbappend`` files) into ``recipes-*`` subdirectories by
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index fca02e4cec..8e0c6a8cb1 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -221,7 +221,7 @@ your Metadata, the easier it is to cope with future changes.
       possible.
 
    -  Familiarize yourself with the `Yocto Project curated layer
-      index <https://www.yoctoproject.org/software-overview/layers/>`__
+      index :yocto_home:`/software-overview/layers/`
       or the :oe_layerindex:`OpenEmbedded layer index <>`.
       The latter contains more layers but they are less universally
       validated.
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 80378cedb7..38a3974a30 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -339,7 +339,7 @@ If you would prefer not to use the ``install-buildtools`` script, you can instea
 download and run a pre-built buildtools installer yourself with the following
 steps:
 
-1. Locate and download the ``*.sh`` at &YOCTO_RELEASE_DL_URL;/buildtools/
+1. Locate and download the ``*.sh`` at :yocto_dl:`/releases/yocto/&DISTRO_REL_TAG;/buildtools/`
 
 2. Execute the installation script. Here is an example for the
    traditional installer:
-- 
2.25.1


