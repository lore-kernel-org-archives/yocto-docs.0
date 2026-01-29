Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DFFD6102A
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17094.1769700253831982863
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EzLD8C3s;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 54EA41A2B0C
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B436606FD
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14B56119A885C;
	Thu, 29 Jan 2026 16:24:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VC2PiJ4sl3DPiL4NOIC4fktEAfYszr+z05Qem5cmxCM=;
	b=EzLD8C3sVexmJp6JU99pejnUXFrDq/MDZDSyhvuOj6FKtx9JtniVr5HlZnRQeSx8UxJpC6
	U/atkLkFNWLllGl4S2X9aQuXYr97FmbS2mKVuX6Xg/lulqZRnfqUCAzWt1C5b/bbvQ85me
	gvJ8fpo6QB5oX5F4ZpXH9u/Y2oBJ9EwEPbVK2qRsIMB15K8TULNDbU4oXeOBUypifOIjWE
	6BJrba29yp4jZ6fHPuMjqhnwGiD3cSYrp92JgC99irqic3z4KsY5R1/jTW+2dyxzYZoKqd
	+V5ImnUxIn7iUzy2sQaYVVxcfQayL2O9ZKM7jXuH5dgh66tbMDfGWso/rogJbA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:03 +0100
Subject: [PATCH v3 12/57] dev-manual/layers.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-12-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4285;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qJUuIwl5mZABqNbcadxZkqPuh3/a81Pv/W9sCicjyjE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uL7DyfddIjU8ZszYcxHTQNQk42K/yIy/Y6o
 0yQlhGGu86JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7iwAKCRDRgEFAKaOo
 NmpiD/9EB3xSMigch1fPJMx/F5hjzRu60+mqMibREjKzwXroobHqzRdt3oOq1hlE3LahJHASw4v
 AjcK+4NSgF7ziOAkkiUr4DmTWbxqA60cIOAhF+BuGGT2QD+m9Yx9rFJY95TYoNToDOmXZrg3s0l
 sa7Egh1EJ7fOnaAwQhL3f25bP8ghp1av5mKcy/fTjqhwfeW3TE2C3u/NVQZZOzGC/VgHAWVW6q6
 +rpfHN991K5tonXxrdQfTUcqGlhOwwKRRtTV5MOZHzhJYW52desy/5u4Xuq7xe7q0lwkW0hUqyF
 uzvBbcIk15TEu4ax0EfsolM0Y4qoAjKuaK5PuKWtXi0UcN26w9DEqihdbqvhEljVJa1AG4D27To
 04nEp6r9PWyVxttQUmb/ngeVxgICrDp21dCmWOOpiyLnmx0qtCNCqZ+VMEIUoKf6om7GN2mW3h3
 IOhtBPGAmHYxQySGZUQnX9tCToYuE8CB/NJdVIt+CDHtYih1sgukFTuaLADbAYd2iqlkS2Tu3vJ
 8QFyjs+K6Yu9btwoSf0SzlBC2nB4BUsqJaEdTGCUn7FFsU/QWHWlur+mTu96nluKRByxrlpp2zg
 kk1x9aaCTaKUGZazVsZGcpu2xrtABH6aivEd/MTFBVBMJ7piwxlwSlZUl1UwoT0qw0tWy571Dt+
 7ZrSitsKlYo5bQQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8798

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/layers.rst | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 5abd116be..b7624cf0e 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -290,7 +290,7 @@ following list:
    repository that use the ``meta-layer_name`` format.
 
 -  *Group Your Layers Locally:* Clone your repository alongside other
-   cloned ``meta`` directories from the :term:`Source Directory`.
+   layers in your :term:`Source Directory`.
 
 Making Sure Your Layer is Compatible With Yocto Project
 =======================================================
@@ -529,10 +529,10 @@ possible.
 Overlaying a File Using Your Layer
 ----------------------------------
 
-As an example, consider the main formfactor recipe and a corresponding
-formfactor append file both from the :term:`Source Directory`.
+As an example, consider the main ``formfactor`` recipe and a corresponding
+``formfactor`` append file both from :term:`OpenEmbedded-Core (OE-Core)`.
 Here is the main
-formfactor recipe, which is named ``formfactor_0.0.bb`` and located in
+``formfactor`` recipe, which is named ``formfactor_0.0.bb`` and located in
 the "meta" layer at ``meta/recipes-bsp/formfactor``::
 
    SUMMARY = "Device formfactor information"
@@ -609,8 +609,8 @@ Installing Additional Files Using Your Layer
 --------------------------------------------
 
 As another example, consider the main ``xserver-xf86-config`` recipe and a
-corresponding ``xserver-xf86-config`` append file both from the :term:`Source
-Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
+corresponding ``xserver-xf86-config`` append file both from
+:term:`OpenEmbedded-Core (OE-Core)`.  Here is the main ``xserver-xf86-config`` recipe, which is named
 ``xserver-xf86-config_0.1.bb`` and located in the "meta" layer at
 ``meta/recipes-graphics/xorg-xserver``::
 
@@ -897,7 +897,9 @@ Add your layer by using the ``bitbake-layers add-layer`` command::
 Here is an example that adds a
 layer named ``meta-scottrif`` to the configuration file. Following the
 command that adds the layer is another ``bitbake-layers`` command that
-shows the layers that are in your ``bblayers.conf`` file::
+shows the layers that are in your ``bblayers.conf`` file:
+
+.. code-block:: console
 
    $ bitbake-layers add-layer meta-scottrif
    NOTE: Starting bitbake server...
@@ -905,14 +907,13 @@ shows the layers that are in your ``bblayers.conf`` file::
    Parsing of 1441 .bb files complete (0 cached, 1441 parsed). 2055 targets, 56 skipped, 0 masked, 0 errors.
    $ bitbake-layers show-layers
    NOTE: Starting bitbake server...
-   layer                 path                                      priority
-   ==========================================================================
-   meta                  /home/scottrif/poky/meta                  5
-   meta-poky             /home/scottrif/poky/meta-poky             5
-   meta-yocto-bsp        /home/scottrif/poky/meta-yocto-bsp        5
-   workspace             /home/scottrif/poky/build/workspace       99
-   meta-scottrif         /home/scottrif/poky/build/meta-scottrif   6
-
+   layer                 path                                                            priority
+   ==============================================================================================
+   meta                  /home/scottrif/bitbake-builds/layers/openembedded-core/meta           5
+   meta-poky             /home/scottrif/bitbake-builds/layers/meta-yocto/meta-poky             5
+   meta-yocto-bsp        /home/scottrif/bitbake-builds/layers/meta-yocto/meta-yocto-bsp        5
+   workspace             /home/scottrif/bitbake-builds/build/workspace                         99
+   meta-scottrif         /home/scottrif/bitbake-builds/build/meta-scottrif                     6
 
 Adding the layer to this file
 enables the build system to locate the layer during the build.

-- 
2.52.0


