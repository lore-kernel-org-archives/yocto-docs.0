Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14868D6B06C
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17124.1769700281522652884
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=F9t06Afj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F34E84E4231D
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7CA8606FD;
	Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94EBC119A8866;
	Thu, 29 Jan 2026 16:24:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N7F/RRXpf+M9xZxQwX+eUuvFeixLQ8UlYnMTK3X7Q98=;
	b=F9t06AfjWqjanvBm7Od4DIuueT3t5V79N82yLC+gUMtS06GP96Y8tRR4sxurX8OONs2x7X
	RJ8xvUPcXiV3ZZuA9gsTYzEKKEKa4p73xh2XcbNHY2LTOpDJ7O5ShFXwSHAs/O45sZ7iYz
	4R0IqAVcHoSB1WnYX17eALRJqgu9AS5rFiIvRb3VR6+M+HXCIc/hEQ3NTfJUy3hKohTRTT
	l/2f7EstpY3dXebkX2WIaFY9PPBciJEz2HJeueNuBniJ6CmtakXTMCUAOrJFSuDkSF6bhE
	sfeS0hTmldYozX2zQOTtG1eyYA0ufgWR76XbQZqg5gQbqyLooMwiMM/G9VuswQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:43 +0100
Subject: [PATCH v3 52/57] ref-manual/system-requirements.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-52-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=QBPGYheuqDjfbMHXsRiq0a3T5JJqeumGeM8DXyh2rJE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uRryPCmJSp4pA/u4YrJeY5TInYpBNKuIiYP
 Us/rK3NK4OJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kQAKCRDRgEFAKaOo
 NisyD/97EE+vpUPstHx/SjsmJJ9w6z0cNx4OUXSgGJPMxYWIHXExOwom9KnzRRSN23m/7i4q3OV
 w9PxsPluMkerqehKs7VNVATK9Nk5p76kbuHW1zvgXYe6QXiu3kqRyU7mwzY0m4FB/X3uLOEeIfM
 4yGEgWhk/Nr2CVQrf0KDRqwlEEGbMn07rfAaphX1pczTzw38R5by9EokSkOQpGJ3SfsYvXr65ll
 x5/Pdt/y+i2RLW3a6o1KhOApetyDI8bEezO8QgcRoGOVlxInIm7nQS12linlomqYJucZxu7VrWJ
 df+60DB74lAi3mutDEvgFKVQy3J1Il3ux14aGHcVvwnWnfJUAYVPSEl0AILcDz0sI1vMlyc5JFK
 bBB0AprI4F0rjvaDm/UcWig3UzOmnaycN1iGbtPaXbV8B5379xWieyXPXBv1h0W+mUxyv3Pb0WV
 K9XXMAGCVD3VDRwTug2c7hJ9mkhyigzhXNkTmMurqC7HHOQgVyQy3lxvxf9H6WAUAlkAjZsNifi
 ZlzoifGv8CbfanoOtyXCLDKTiHVTyfOktJWy5N9fKAcxv4oJVIH+08P9hosLLfIKRlKmB4Mt/X0
 LKEWpxnOmnzA4Iv8T/YZcE9UyL9TdnZTymu5XgSmHEHWC8YF5ZFv3T0ECm41mVi5DDC+QUCnuq7
 U2HGf5PGhulF2cA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8838

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index a56e683ca..9b681290e 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -405,8 +405,8 @@ installer and automatically installs the tools for you:
 
 #. Execute the ``install-buildtools`` script. Here is an example::
 
-      $ cd poky
-      $ scripts/install-buildtools \
+      $ cd /path/to/bitbake-builds
+      $ ./layers/openembedded-core/scripts/install-buildtools \
         --without-extended-buildtools \
         --base-url &YOCTO_DL_URL;/releases/yocto \
         --release yocto-&DISTRO; \
@@ -420,26 +420,26 @@ installer and automatically installs the tools for you:
    To avoid the need of ``sudo`` privileges, the ``install-buildtools``
    script will by default tell the installer to install in::
 
-      /path/to/poky/buildtools
+      /path/to/bitbake-builds/buildtools
 
    If your host development system needs the additional tools provided
    in the :term:`buildtools-extended` tarball, you can instead execute the
    ``install-buildtools`` script with the default parameters::
 
-      $ cd poky
+      $ cd /path/to/bitbake-builds
       $ scripts/install-buildtools
 
    Alternatively if your host development system has a broken ``make``
    version such that you only need a known good version of ``make``,
    you can use the ``--make-only`` option::
 
-      $ cd poky
+      $ cd /path/to/bitbake-builds
       $ scripts/install-buildtools --make-only
 
 #. Source the tools environment setup script by using a command like the
    following::
 
-      $ source /path/to/poky/buildtools/environment-setup-x86_64-pokysdk-linux
+      $ source /path/to/bitbake-builds/buildtools/environment-setup-x86_64-pokysdk-linux
 
    After you have sourced the setup script, the tools are added to
    ``PATH`` and any other environment variables required to run the

-- 
2.52.0


