Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C415D6B06E
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17213.1769700275814432528
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sJf5oRdC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 45D811A2B09
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C7B7606FD;
	Thu, 29 Jan 2026 15:24:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13110119A868E;
	Thu, 29 Jan 2026 16:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700273; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7tKBkLuatH9Gz27qVpBEGhM1TMEp3bhA+6cPbBpOUMU=;
	b=sJf5oRdCvqeN9MoZDeerXHaMOPJXakB0jDrEDZaBgF/hC60Y5LmYuB6MqRHdunYuFlySNb
	01KNmZr284CXwmE0J/TFTAOh2qZO1zcFpXyUZRHF6ewqqgA8QpsEn8acHiUQMbEZQP9+ey
	p7zLjibciJyQb/8nXZLxNVTcF77xcI/U7acrZPRE/3Y0ypvymG2EWReBY5GYWf6AmK4XY0
	yCkWBCL3JVtccpWIOQcHXAiEwrmmjt6zR3sTmGsInK0YwZu1trHzhCFz/zcgxflBul7s/P
	UnRoFUGCQ1WqRkA49ncSUtBEuqnWr0KNjkj5oEHOXcPDfCeJteFCb7DCt7Hlkg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:35 +0100
Subject: [PATCH v3 44/57] dev-manual/upgrading-recipes.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-44-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4984;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zFshia1rd5eji1rAtX8mAvF4Z+ewYPoSDuEEH9v1CYY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uPAfqoP0AO7EksuUugxBvJEw810hVKf7ilk
 ZerTbcT+aiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jwAKCRDRgEFAKaOo
 NvlPD/9/h3QwCpwLtG2VOtCO57EY22x20njaELd3qTVfZRIUs9AreSMkhDEhHSA5xqfdT/YyaD4
 wlyrTl3HoIOo28Rx19VLauAZgoZWKHRXUxev2eCY2gTG36GLuCCvM11Sa1byjJ6/LHuAZVuCBrt
 ci+jJOgTRyBK/Njg1iTc2vIvn/7qFjdM3XWefRnSv4kpv3sbKC+kSTTWnCNwWDCGThBbLdxyljK
 H2p8kP8MDwumR0p4qGaBNDxdr0q2TbIR0pJFw1QgwvB6YxBb6PqA9xxrTJYB2cVwwhGRo1dkAf2
 +cNc6V1oNSrm9HsgQrEqwZSejgpAlKZi3X0QepU0+3bpBFsqhk565HJVPr6ZvmlqRbaRdttmHuk
 aB1/o/DYfYMeP+Q5hxFWXafONdP/rOKbQaQIfy8EO+bUdUZdzBHNArxVnzwZk7BcKg9LLC9ET55
 cQ0N6aLsUHXk9y+3x9Z+NH6rJdiVfQDCVvivrzNT6Pk4xaEq8yKPYUP+rmX25qX1qRBPHMq3zSJ
 zG5lEUmX5/Bgjj4bwe4sne3EecjhGcSLVgCgA3OfT1asPeccFO3X8a/KEk8dlZW56XoLZg2xL0H
 DR5bk2ch5us2AKWEE9n1momDf2rpDWecBJkEV4c32Jtqk16FbZYOGI29TZ4sioOkg3K0lYAoH0O
 fJnMmo1IMsxsUmg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8830

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/upgrading-recipes.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index 2e6567867..c4199d160 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -84,12 +84,12 @@ The following steps describe how to set up the AUH utility:
    AUH is not part of the :term:`OpenEmbedded-Core (OE-Core)` or
    :term:`Poky` repositories.
 
-#. *Create a Dedicated Build Directory:* Run the :ref:`structure-core-script`
+#. *Create a Dedicated Build Directory:* Create a new :term:`bitbake:Setup` with
+   ``bitbake-setup`` or manually run the :ref:`structure-core-script`
    script to create a fresh :term:`Build Directory` that you use exclusively
    for running the AUH utility::
 
-      $ cd poky
-      $ source oe-init-build-env your_AUH_build_directory
+      $ source layers/openembedded-core/oe-init-build-env your_AUH_build_directory
 
    Re-using an existing :term:`Build Directory` and its configurations is not
    recommended as existing settings could cause AUH to fail or behave
@@ -121,7 +121,7 @@ The following steps describe how to set up the AUH utility:
 
       .. note::
 
-         If your distro does not enable by default ptest, which Poky
+         If your distro does not enable by default ptest, which :term:`Poky`
          does, you need the following in your ``local.conf`` file::
 
                  DISTRO_FEATURES:append = " ptest"
@@ -143,7 +143,7 @@ The following steps describe how to set up the AUH utility:
    described earlier, you must enable it in ``upgrade-helper.conf``.
 
    Also, if you are using the default ``maintainers.inc`` file supplied
-   with Poky and located in ``meta-yocto`` and you do not set a
+   in :term:`OpenEmbedded-Core (OE-Core)` and you do not set a
    "maintainers_whitelist" or "global_maintainer_override" in the
    ``upgrade-helper.conf`` configuration, and you specify "-e all" on
    the AUH command-line, the utility automatically sends out emails to
@@ -263,7 +263,7 @@ directory automatically upgrades the recipe for you::
 
    $ devtool upgrade nano -V 2.9.3
    NOTE: Starting bitbake server...
-   NOTE: Creating workspace layer in /home/scottrif/poky/build/workspace
+   NOTE: Creating workspace layer in /home/scottrif/bitbake-builds/build/workspace
    Parsing recipes: 100% |##########################################| Time: 0:00:46
    Parsing of 1431 .bb files complete (0 cached, 1431 parsed). 2040 targets, 56 skipped, 0 masked, 0 errors.
    NOTE: Extracting current version source...
@@ -275,8 +275,8 @@ directory automatically upgrades the recipe for you::
    NOTE: Executing RunQueue Tasks
    NOTE: Tasks Summary: Attempted 74 tasks of which 72 didn't need to be rerun and all succeeded.
    Adding changed files: 100% |#####################################| Time: 0:00:00
-   NOTE: Upgraded source extracted to /home/scottrif/poky/build/workspace/sources/nano
-   NOTE: New recipe is /home/scottrif/poky/build/workspace/recipes/nano/nano_2.9.3.bb
+   NOTE: Upgraded source extracted to /home/scottrif/bitbake-builds/build/workspace/sources/nano
+   NOTE: New recipe is /home/scottrif/bitbake-builds/build/workspace/recipes/nano/nano_2.9.3.bb
 
 .. note::
 
@@ -298,7 +298,7 @@ newly upgraded recipe::
           .
    NOTE: Executing SetScene Tasks
    NOTE: Executing RunQueue Tasks
-   NOTE: nano: compiling from external source tree /home/scottrif/poky/build/workspace/sources/nano
+   NOTE: nano: compiling from external source tree /home/scottrif/bitbake-builds/build/workspace/sources/nano
    NOTE: Tasks Summary: Attempted 520 tasks of which 304 didn't need to be rerun and all succeeded.
 
 Within the ``devtool upgrade`` workflow, you can
@@ -320,8 +320,8 @@ directory::
    NOTE: Adding new patch 0001-nano.bb-Stuff-I-changed-when-upgrading-nano.bb.patch
    NOTE: Updating recipe nano_2.9.3.bb
    NOTE: Removing file /home/scottrif/meta-openembedded/meta-oe/recipes-support/nano/nano_2.7.4.bb
-   NOTE: Moving recipe file to /home/scottrif/meta-openembedded/meta-oe/recipes-support/nano
-   NOTE: Leaving source tree /home/scottrif/poky/build/workspace/sources/nano as-is; if you no longer need it then please delete it manually
+   NOTE: Moving recipe file to /home/scottrif/layers/meta-openembedded/meta-oe/recipes-support/nano
+   NOTE: Leaving source tree /home/scottrif/bitbake-builds/build/workspace/sources/nano as-is; if you no longer need it then please delete it manually
 
 
 Using the ``devtool finish`` command cleans up the workspace and creates a patch

-- 
2.52.0


