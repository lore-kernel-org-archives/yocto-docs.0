Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C47C54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 16:16:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.845.1663863410375483181
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 09:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oPKdLkZ1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F29BA40008;
	Thu, 22 Sep 2022 16:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663863408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FNETaDZH8i63nuy02AEuWb3BotVv1WQkBNUtQc4cB8I=;
	b=oPKdLkZ1fijc7GZhej4OWziBFpZ8qVOFrGP+ROXuywaV94XAX6f5Ttki5RAt8qX2t6I4ke
	ppVaQPqNF2l5Opg2QVAqwfzBkfPYfv0VjySaU5nxfm5mQ1WNENibcetGMdXmXugzItDbyE
	4XIcUetsdNyPTR++xqvTJwKg5o0RgII+/XBRcsOIuNMspNXtG+AH1PAVelrfpi7Iue9cUs
	RzyB5wgr1O3zDiTsNXiqOeD2jkVzbB8u53fBKlDM3a7HelIm6dYRPzFtmoKmlqeduxPrM7
	ETsEmAQZuG1rJQJhS7eAIO/FUjhugTvo5bRtcdwFGIbFuWMVBjCLNKbG+7xOGQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [PATCH] ref-manual: structure.rst: add more subsection levels
Date: Thu, 22 Sep 2022 18:16:38 +0200
Message-Id: <20220922161638.2412161-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Sep 2022 16:16:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3211

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

To better reflect the subdirectory structure,
as suggested in [YOCTO #14543]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
 documentation/ref-manual/structure.rst | 40 +++++++++++++-------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 6c6f52e799..cfa29076d8 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -366,14 +366,14 @@ remove the ``build/sstate-cache`` directory.
 .. _structure-build-tmp-buildstats:
 
 ``build/tmp/buildstats/``
--------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~
 
 This directory stores the build statistics.
 
 .. _structure-build-tmp-cache:
 
 ``build/tmp/cache/``
---------------------
+~~~~~~~~~~~~~~~~~~~~
 
 When BitBake parses the metadata (recipes and configuration files), it
 caches the results in ``build/tmp/cache/`` to speed up future builds.
@@ -389,7 +389,7 @@ cache is reused. If the file has changed, it is reparsed.
 .. _structure-build-tmp-deploy:
 
 ``build/tmp/deploy/``
----------------------
+~~~~~~~~~~~~~~~~~~~~~
 
 This directory contains any "end result" output from the OpenEmbedded
 build process. The :term:`DEPLOY_DIR` variable points
@@ -402,7 +402,7 @@ Project Overview and Concepts Manual.
 .. _structure-build-tmp-deploy-deb:
 
 ``build/tmp/deploy/deb/``
--------------------------
+^^^^^^^^^^^^^^^^^^^^^^^^^
 
 This directory receives any ``.deb`` packages produced by the build
 process. The packages are sorted into feeds for different architecture
@@ -411,7 +411,7 @@ types.
 .. _structure-build-tmp-deploy-rpm:
 
 ``build/tmp/deploy/rpm/``
--------------------------
+^^^^^^^^^^^^^^^^^^^^^^^^^
 
 This directory receives any ``.rpm`` packages produced by the build
 process. The packages are sorted into feeds for different architecture
@@ -420,14 +420,14 @@ types.
 .. _structure-build-tmp-deploy-ipk:
 
 ``build/tmp/deploy/ipk/``
--------------------------
+^^^^^^^^^^^^^^^^^^^^^^^^^
 
 This directory receives ``.ipk`` packages produced by the build process.
 
 .. _structure-build-tmp-deploy-licenses:
 
 ``build/tmp/deploy/licenses/``
-------------------------------
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 This directory receives package licensing information. For example, the
 directory contains sub-directories for ``bash``, ``busybox``, and
@@ -440,7 +440,7 @@ section in the Yocto Project Development Tasks Manual.
 .. _structure-build-tmp-deploy-images:
 
 ``build/tmp/deploy/images/``
-----------------------------
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 This directory is populated with the basic output objects of the build
 (think of them as the "generated artifacts" of the build process),
@@ -467,7 +467,7 @@ the kernel files::
 .. _structure-build-tmp-deploy-sdk:
 
 ``build/tmp/deploy/sdk/``
--------------------------
+^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The OpenEmbedded build system creates this directory to hold toolchain
 installer scripts which, when executed, install the sysroot that matches
@@ -479,7 +479,7 @@ Software Development Kit (eSDK) manual.
 .. _structure-build-tmp-sstate-control:
 
 ``build/tmp/sstate-control/``
------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The OpenEmbedded build system uses this directory for the shared state
 manifest files. The shared state code uses these files to record the
@@ -492,7 +492,7 @@ another.
 .. _structure-build-tmp-sysroots-components:
 
 ``build/tmp/sysroots-components/``
-----------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 This directory is the location of the sysroot contents that the task
 :ref:`ref-tasks-prepare_recipe_sysroot`
@@ -507,7 +507,7 @@ should be automatic, and recipes should not directly reference
 .. _structure-build-tmp-sysroots:
 
 ``build/tmp/sysroots/``
------------------------
+~~~~~~~~~~~~~~~~~~~~~~~
 
 Previous versions of the OpenEmbedded build system used to create a
 global shared sysroot per machine along with a native sysroot. Since
@@ -525,7 +525,7 @@ recipe-specific :term:`WORKDIR` directories. Thus, the
 .. _structure-build-tmp-stamps:
 
 ``build/tmp/stamps/``
----------------------
+~~~~~~~~~~~~~~~~~~~~~
 
 This directory holds information that BitBake uses for accounting
 purposes to track what tasks have run and when they have run. The
@@ -545,7 +545,7 @@ section in the Yocto Project Overview and Concepts Manual.
 .. _structure-build-tmp-log:
 
 ``build/tmp/log/``
-------------------
+~~~~~~~~~~~~~~~~~~
 
 This directory contains general logs that are not otherwise placed using
 the package's :term:`WORKDIR`. Examples of logs are the output from the
@@ -555,7 +555,7 @@ necessarily mean this directory is created.
 .. _structure-build-tmp-work:
 
 ``build/tmp/work/``
--------------------
+~~~~~~~~~~~~~~~~~~~
 
 This directory contains architecture-specific work sub-directories for
 packages built by BitBake. All tasks execute from the appropriate work
@@ -587,7 +587,7 @@ install" places its output that is then split into sub-packages within
 .. _structure-build-tmp-work-tunearch-recipename-version:
 
 ``build/tmp/work/tunearch/recipename/version/``
------------------------------------------------
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The recipe work directory --- ``${WORKDIR}``.
 
@@ -645,7 +645,7 @@ Here are key subdirectories within each recipe work directory:
 .. _structure-build-work-shared:
 
 ``build/tmp/work-shared/``
---------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 For efficiency, the OpenEmbedded build system creates and uses this
 directory to hold recipes that share a work directory with other
@@ -695,7 +695,7 @@ distribution configuration file.
 .. _structure-meta-conf-machine:
 
 ``meta/conf/machine/``
-----------------------
+~~~~~~~~~~~~~~~~~~~~~~
 
 This directory contains all the machine configuration files. If you set
 ``MACHINE = "qemux86"``, the OpenEmbedded build system looks for a
@@ -706,7 +706,7 @@ support for a new machine to the Yocto Project, look in this directory.
 .. _structure-meta-conf-distro:
 
 ``meta/conf/distro/``
----------------------
+~~~~~~~~~~~~~~~~~~~~~
 
 The contents of this directory controls any distribution-specific
 configurations. For the Yocto Project, the ``defaultsetup.conf`` is the
@@ -718,7 +718,7 @@ file mainly inherits its configuration from Poky.
 .. _structure-meta-conf-machine-sdk:
 
 ``meta/conf/machine-sdk/``
---------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The OpenEmbedded build system searches this directory for configuration
 files that correspond to the value of
-- 
2.34.1


