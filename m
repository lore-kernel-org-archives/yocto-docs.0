Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB47C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 14:25:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.10496.1647959106802221164
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 07:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RG72TrpQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4D3A640014;
	Tue, 22 Mar 2022 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647959104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vQnMZRzc1CXamlxVTIKdgjmZ3JhJje1aDX6hnFFaCNY=;
	b=RG72TrpQueOND/pLfyFM+3iRgFyeum6fOMSJD6jxQi6PLo0Z2OBJUynvHVWB4YmU+V38IL
	c6uHVCFQeGx2bspXnItgvQPYEqMtg42V/jDKgSCfwBhqGD+hhJWNGymmw2HNENqu8uGtZ2
	TL9TS227D9XVttjhlMsEvLoMrQEl3fCE5eVvbVts+FwOH1v8uC097qbp6/yHNosGnDZ3Sd
	9I0dtppqLwizVF1SDfiDXcDP6mHMz2zB1gj1g54k78KATU4Kec0Wdbmq94q7xZpvr8Lr99
	JA4U5Hv3PoC010rBhI5aZhifaBg5V7JLp16fvOv4ZZPMZ3M9WQGZcONfbC5TeA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] [honister] docs: fix hardcoded link warning messages
Date: Tue, 22 Mar 2022 15:25:02 +0100
Message-Id: <20220322142502.550191-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 14:25:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2680

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Sphinx complains about hardcoded links which can be replaced by an
extlink.

So let's apply its recommendations.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss+yocto@0leil.net>
---
 documentation/bsp-guide/bsp.rst                  | 7 ++++---
 documentation/migration-guides/migration-3.4.rst | 2 +-
 documentation/overview-manual/yp-intro.rst       | 4 ++--
 documentation/ref-manual/system-requirements.rst | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 65652ff898..1cc92d721d 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -166,8 +166,9 @@ section.
 #. *Determine the BSP Layer You Want:* The Yocto Project supports many
    BSPs, which are maintained in their own layers or in layers designed
    to contain several BSPs. To get an idea of machine support through
-   BSP layers, you can look at the `index of
-   machines <&YOCTO_RELEASE_DL_URL;/machines>`__ for the release.
+   BSP layers, you can look at the
+   :yocto_dl:`index of machines </releases/yocto/yocto-&DISTRO;/machines>`
+   for the release.
 
 #. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
    based on current Intel CPUs and devices, you can leverage this BSP
@@ -877,7 +878,7 @@ Yocto Project:
    your BSP layer as listed in the ``recipes.txt`` file, which is found
    in ``poky/meta`` directory of the :term:`Source Directory`
    or in the OpenEmbedded-Core Layer (``openembedded-core``) at
-   https://git.openembedded.org/openembedded-core/tree/meta.
+   :oe_git:`/openembedded-core/tree/meta`.
 
    You should place recipes (``*.bb`` files) and recipe modifications
    (``*.bbappend`` files) into ``recipes-*`` subdirectories by
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 6105015a24..8143cd4813 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -140,7 +140,7 @@ configuration provided and tested by the Yocto Project, there is
 simply no sense in continuing to enable prelink.
 
 There's also a concern that no one is maintaining the code, and there
-are open bugs (including `this serious one <https://bugzilla.yoctoproject.org/show_bug.cgi?id=14429>`__).
+are open bugs (including :yocto_bugs:`this serious one </show_bug.cgi?id=14429>`).
 Given that prelink does intricate address arithmetic and rewriting
 of binaries the best option is to disable the feature. It is recommended
 that you consider disabling this feature in your own configuration if
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 7aee9db04f..3ca81428cf 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -217,8 +217,8 @@ your Metadata, the easier it is to cope with future changes.
    -  Use Board Support Package (BSP) layers from silicon vendors when
       possible.
 
-   -  Familiarize yourself with the `Yocto Project curated layer
-      index <https://www.yoctoproject.org/software-overview/layers/>`__
+   -  Familiarize yourself with the
+      :yocto_home:`Yocto Project curated layer index</software-overview/layers/>`
       or the :oe_layerindex:`OpenEmbedded layer index <>`.
       The latter contains more layers but they are less universally
       validated.
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 5c15b6de56..6df59a1745 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -320,7 +320,7 @@ If you would prefer not to use the ``install-buildtools`` script, you can instea
 download and run a pre-built buildtools installer yourself with the following
 steps:
 
-1. Locate and download the ``*.sh`` at &YOCTO_RELEASE_DL_URL;/buildtools/
+1. Locate and download the ``*.sh`` at :yocto_dl:`/releases/yocto/yocto-&DISTRO;/buildtools/`
 
 2. Execute the installation script. Here is an example for the
    traditional installer::
-- 
2.25.1


