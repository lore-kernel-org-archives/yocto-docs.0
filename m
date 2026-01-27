Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD7CCA6CAA
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5823.1769501994205221099
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KQ9iF0kY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA4D94E422CA
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 82003606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94664119A8687;
	Tue, 27 Jan 2026 09:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0+tFm9Gu1XW8SeqW3KOxWFmk7sMMH3zr9I9/Zki6aGQ=;
	b=KQ9iF0kYF/liwcI1aJbSWgJNtV/7lrJLgqJDzDyuDXz+jNU8Zrp9CK31WYBP/UiDNtdt6t
	0776dJorpTuQdjzACnPW7+kIz9JG3o8Rg/j7/OvnCKdtCN+Zg9EjJjwU7BzIzFP9qBjQOh
	D38BvJUjgqLm3xASZQHHXTWx4HkRe6Bq9ZewIXamRKWXR63LPZLyG8G4NiU1Tq97OedmZz
	LxbqJsKw2lnl16EKf89/UowFRnjPcWOEEOTOcEwVe0XT3TuurSnrhoHrBvfUHoc2pRWq/i
	qByxraIQbnuiZa/DpnfvpzrNp8jj4sfzuVH0+UmGU6M1PIMWe0vkVf+66bD8bw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:39 +0100
Subject: [PATCH v2 44/56] dev-manual/upgrading-recipes.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-44-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4928;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BQVc/Vj/Z58qV0jzjSvi5UTviY9zAPjJOXLYgpb6ULE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUFcjhvs7FxOIzcHnLn3CrtN54TsO5jazt7F
 /Hi+leC9xyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BQAKCRDRgEFAKaOo
 NiU6D/0YhPnCx/H/8xLCyRQHKa1UAj7Q9LvIiV4jVrd/ecGbZfw/PPsaiOOLgq0dfCA/sOVPldp
 tRpdjVIwJx1ojTLydD3Te/MBFeqV6HJ0yya/R6XshF3ZFhAgmawQ8t3680GktWVFlxqoAyzVOCy
 CK4HHfzoW4kQFX+Vyo515HL8Dq1StIo9EkRzFv7yuaHSAoBkhbHRDtxyrJjfwWrPf+NVJJDvwVO
 D13Uxg+rFFjuCn7hXMNINvxhYQag+K6GSQhDDnl1Q5bv6stWkqI2yhVNakoUOYcseIgQqHZTp/N
 pSPx7Uit1YMBpnCklrJV0sNyRBtvd1DumjbwIBNPruVKzSSGTNRRTHrj1E8mxo+u80wdHH6TPwV
 U3PfEggdw8IaNlAtxBMefooRnnEyvCMpLKCHcpuNRE6/c1flAY0aUawI9qjkR0cCtyd7HQm4JKd
 1tWzzI4WanWkzkavPCmdjyZB/oCvs1Q5WMMhsBrOyljSRahw3IOIie9t2uoxjia6mgWjqURoOFW
 jHVx/09J3bIECIG/00oE+OQ4+8YtFTg0+zsICMeA6JRdZUJH3vVbkAjoOyz4/PgM5d4IecU79du
 3ZFpD5SGTdtX4YdaCGe9r9cwGHMJtQnP6aHsNHnttHVdYxe4t/xjr0conSDSUzmNz8GFXwo6bQX
 tnHDCfv0Lz5DEqQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8705

Refresh the document now that the Poky repository is obsolete.

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


