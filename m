Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD35E776F2
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123201.1766593927736277951
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZU717Hqz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 421CF1A23E1
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1998E6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B35910AB1388;
	Wed, 24 Dec 2025 17:32:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593925; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6Cnh/Wt2dcdvmyLZInkfixkd/4S0ArgcW4CYwjtIroQ=;
	b=ZU717HqzYzN0kQFc10Lhw1n0y5rix8IIlrLMKs43ChbjiUB3umEIBiNfNTDYlXhkYsfiB3
	WDe7Wp1pEnmH+7CQRw2iu+UjQ3xJlSeoAY0YuWLyin0LSxDmR+YBjkvgIaGwkrCAfiZhW5
	G2BGzYiP1J1Nimgx/dGIDt2vY+mtQZqTHTUrToxEfRaYfj39GtCqOzYFQIM5fiNrovj/dh
	bPkdJG+V8+9lYuMs4xQ2Pa/iz69kKcnkQaRqFV34SNt8oeIo9XjFl0iyW9tybVApOncZv8
	6pR+vLR3k+/HccUPefLYx5DZf5Ew4fJHhw9iS5/82fpZMJ3rbXQRUmp7m6qFKw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:53 +0100
Subject: [PATCH 27/53] ref-manual/tasks.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-27-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Udaab9fURKCsNLW/vircBr/PebTIffJnvRw4mTqT4/8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVrTv/actRT5HvuGTw3TEroEcvdUMqkGOmsQ
 /TUvu2AIVqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVawAKCRDRgEFAKaOo
 NoBuD/4jO6E5p9cPH3sgxZX/0Nv3Y7kp2FMxxmYdLlaIFtG3ArehxLcsCc5+3Cx1nbRpVk3hAQC
 DnHcAQX+cBGSFcZwW42kgiOq4CyMfnwZymAEOYveRWiOsmRJuqtpHWuTSf2F5WHRN8DlCNTQ6jt
 1dRvV8RGIST9Nb5rnFhYmCSUqGwXM3wroa9uMI3E58j+W3IGGk0RldrfpGfxtHQwcw7ELsMgirM
 vRCxO3XRK3ekNFMKPKYSyyX4nqk4lpPmu9IGr1uD3L84FSK7ctvn4tRht/B3sH4SUtu+CvqhkF+
 wZYc0C8GLIG096J6p8MMIC9uPC2QenyEtrkMMtxJb3Jh6gYZbTjQ1Ic+7XJ/9RjymU4cY9XS7v+
 yEb8xRiY3V8NpHkz0sSKLa0ZdVbRfKDbncmLekdvmNIJeBocRfdLLO6Yf8y5diXg+3vUGUHEkk6
 YyPpneBp4d3vcEEd6915gmbDeR4KkRfQWTwDXl8LJU4o5r+OqfD0CqC2/4c3EPOCIauaIW20HZy
 bph/uLStPN3UsAMxmZ/KNdur1G77kZws4jTg+BMTFjRB0f3+wKJ+KCoKunJE0WCQHvzRgePI/dS
 2UGv7wRE/02ASZx5wDK61EF15ca3MJ2bcbV+avNW7SbN7FjmJ38S+RLI0Ott0/FT5ukNeAp+H9d
 VlyousR/PXzLBkA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8356

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 8651f219f..e6301e708 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -191,7 +191,7 @@ that either directly or indirectly depend on the installed files (e.g.
 
    -  The ``tar`` command with the ``--no-same-owner`` option. See the
       ``bin_package.bbclass`` file in the ``meta/classes-recipe``
-      subdirectory of the :term:`Source Directory` for an example.
+      subdirectory of :term:`OpenEmbedded-Core (OE-Core)` for an example.
 
 .. _ref-tasks-install_ptest_base:
 
@@ -288,14 +288,14 @@ to locate and apply patch files to the source code.
 Patch files, by default, are ``*.patch`` and ``*.diff`` files created
 and kept in a subdirectory of the directory holding the recipe file. For
 example, consider the
-:yocto_git:`bluez5 </poky/tree/meta/recipes-connectivity/bluez5>`
-recipe from the OE-Core layer (i.e. ``poky/meta``)::
+:oe_git:`bluez5 </openembedded-core/tree/meta/recipes-connectivity/bluez5>`
+recipe from the :term:`OpenEmbedded-Core (OE-Core)` layer::
 
-   poky/meta/recipes-connectivity/bluez5
+   meta/recipes-connectivity/bluez5
 
 This recipe has two patch files located here::
 
-   poky/meta/recipes-connectivity/bluez5/bluez5
+   meta/recipes-connectivity/bluez5/bluez5
 
 In the ``bluez5`` recipe, the :term:`SRC_URI` statements point to the source
 and patch files needed to build the package.

-- 
2.51.0


