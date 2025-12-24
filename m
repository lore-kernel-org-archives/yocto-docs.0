Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3631EE776FA
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123213.1766593940011212274
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vxYKn913;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 640E64E41D8E
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BC016073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35A1D10AB1366;
	Wed, 24 Dec 2025 17:32:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ivrJax4TGo4ppFCXX+he3VbZqsFjeqTwOAY0+TYYhKU=;
	b=vxYKn913OW2we24l0XFcTXZVzhaiJxjKEArHKxDLPm7jAfuqhrU97rmY5U23Gh+nKl5a3X
	jxQNpEArZ2144Id2V9nhdr2COmyYx7t/7m9MtcmWpDpziLaWPGRyUrnQrXjB3VJzK8qWGu
	e10c4FSp3MH3sA2ogq7PTty7xGyJ2OjFeKcTPjiHJCvEJ5WknsZu72v8gcxeGdtxu6MuRP
	AN+/4wL9Z/kdnEbs053nHsJ5RnxpVcYIR/SVWmLdfvNSee28aG10W06CzgxLUZDNJJtF/t
	i6Gc2WGXUuOhd6zR6MC0W9fzk6WDurnib56ZNPr0KSYF4oz+Zx3NNaz1QCp+pQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:09 +0100
Subject: [PATCH 43/53] dev-manual/upgrading-recipes.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-43-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4893;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=sDplMkXp3EwNnka1++/SvKytpxiqpdyC6kFx3A9Vlss=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVuwd0+lqCXcBx9sdJz7X4wLLK5TbYkvrfGH
 KnLgwKi6gyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbgAKCRDRgEFAKaOo
 Nkh1D/48RMd205ZgPjIl/NLHJzbiZf/z7n9G8gJ6FVNt7+RvzmuE7aDxQbpJy3vqdnrq6vsszPL
 N+cLAWNMukR6WqSl8Yl0yDv68hMsaCTGm4OYy0Sxxpqc60EuuaebxyM4xNi79XPUX71bM1JYbFq
 smjDI3rh3NCTcEyB8BAKEIjc82aE2OrhMLEzpTN41k9I2n50L9Yi25N2TYX0zrgfMFBmr24A7fU
 jQlG4oTja9dfaXIMg38WKlnMxulHswBu5Sq1qfcKTYlZnqtJ9dvk8dPBcld1U0si60C2DCNHkxx
 RlRkNxmqVAvjv0y3naWk3OyaafJb4NEBvlxcz9myrTQrbrc+cNQt3ipcRJYekMKUsH0rcwaDOan
 LpzOJz+t2VfFhf1qk4SfTJV1M22iqlRKeroLppbNTdYXlequPqpftdoPgYeWQR+b2F23WFvWDrO
 EWcOL25O07xUey0g75Etx+zETv7h418VyMoOYeqoHjZlsYqt52h88cfnSZVljM4cCxqcPWX/ULV
 QGCKAqlu4dVf4kFxR6ipCpUdg8kNBttnQVoU/hdJrKS/McIS7qKl9YWhxfs9fzrR3pTuKvKNTzG
 4cwnc5dAIf4wiYFmetr9ArNL17QoUFGVjN+cs+3Hxam20s+KNJ9NALw3Xplr+ks4C3z1luO20vk
 kOMtqYx0QW+RZFw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8372

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/upgrading-recipes.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index 2e6567867..f86f515f7 100644
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
+   NOTE: Creating workspace layer in /home/scottrif/project/build/workspace
    Parsing recipes: 100% |##########################################| Time: 0:00:46
    Parsing of 1431 .bb files complete (0 cached, 1431 parsed). 2040 targets, 56 skipped, 0 masked, 0 errors.
    NOTE: Extracting current version source...
@@ -275,8 +275,8 @@ directory automatically upgrades the recipe for you::
    NOTE: Executing RunQueue Tasks
    NOTE: Tasks Summary: Attempted 74 tasks of which 72 didn't need to be rerun and all succeeded.
    Adding changed files: 100% |#####################################| Time: 0:00:00
-   NOTE: Upgraded source extracted to /home/scottrif/poky/build/workspace/sources/nano
-   NOTE: New recipe is /home/scottrif/poky/build/workspace/recipes/nano/nano_2.9.3.bb
+   NOTE: Upgraded source extracted to /home/scottrif/project/build/workspace/sources/nano
+   NOTE: New recipe is /home/scottrif/project/build/workspace/recipes/nano/nano_2.9.3.bb
 
 .. note::
 
@@ -298,7 +298,7 @@ newly upgraded recipe::
           .
    NOTE: Executing SetScene Tasks
    NOTE: Executing RunQueue Tasks
-   NOTE: nano: compiling from external source tree /home/scottrif/poky/build/workspace/sources/nano
+   NOTE: nano: compiling from external source tree /home/scottrif/project/build/workspace/sources/nano
    NOTE: Tasks Summary: Attempted 520 tasks of which 304 didn't need to be rerun and all succeeded.
 
 Within the ``devtool upgrade`` workflow, you can
@@ -320,8 +320,8 @@ directory::
    NOTE: Adding new patch 0001-nano.bb-Stuff-I-changed-when-upgrading-nano.bb.patch
    NOTE: Updating recipe nano_2.9.3.bb
    NOTE: Removing file /home/scottrif/meta-openembedded/meta-oe/recipes-support/nano/nano_2.7.4.bb
-   NOTE: Moving recipe file to /home/scottrif/meta-openembedded/meta-oe/recipes-support/nano
-   NOTE: Leaving source tree /home/scottrif/poky/build/workspace/sources/nano as-is; if you no longer need it then please delete it manually
+   NOTE: Moving recipe file to /home/scottrif/layers/meta-openembedded/meta-oe/recipes-support/nano
+   NOTE: Leaving source tree /home/scottrif/project/build/workspace/sources/nano as-is; if you no longer need it then please delete it manually
 
 
 Using the ``devtool finish`` command cleans up the workspace and creates a patch

-- 
2.51.0


