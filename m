Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D44CC25B70
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.147728.1698154051314044264
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KMnPVPOi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A334140010;
	Tue, 24 Oct 2023 13:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+q93L9FvCBylCtD+QvD//V9WJZ/LLvRu1ebKwsjtIB0=;
	b=KMnPVPOiafmmjaWQfP7Nwh2DZ5u++bcY4lOpk67t9D59ePFy9aBniyunLr6STFEbVSdFiR
	StABTUeSAzXamNu1rkiSlVyFhmgMdX+FYy6HDLBulbXJvcvZJPNlQ000P2c43Y0blCMIMF
	soXVqKd43+fF6SPMyBKT5HieltnbqZvrITKT41rTmI58JnpUEtd0WT4dkahRvU2hpIUVvP
	fiWIndX383KLz9mK7iKUEZuW36L+bLdUWXkFy8oEACdpqbV/2sG+fr/tnV49QhCmU3Mz6o
	3zNe/MxEst9PhM/bKGV8iDgVABpzGy0DhXTj+b/Xf1JL/gMSIkZpbXS1eayuog==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [kirkstone][PATCH 09/16] profile-manual: aesthetic cleanups
Date: Tue, 24 Oct 2023 15:27:05 +0200
Message-Id: <20231024132712.90600-10-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4483

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Robert P. J. Day <rpjday@crashcourse.ca>

Various aesthetic cleanups of section 1 of that manual, including:

  * replace 'HOWTO' with manual
  * add more examples of sdk-related images
  * font fixes

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/intro.rst | 40 ++++++++++++++------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/documentation/profile-manual/intro.rst b/documentation/profile-manual/intro.rst
index 9c8fa3dbfa..86310cf318 100644
--- a/documentation/profile-manual/intro.rst
+++ b/documentation/profile-manual/intro.rst
@@ -7,43 +7,45 @@ Yocto Project Profiling and Tracing Manual
 Introduction
 ============
 
-Yocto bundles a number of tracing and profiling tools - this 'HOWTO'
+Yocto Project bundles a number of tracing and profiling tools --- this manual
 describes their basic usage and shows by example how to make use of them
-to examine application and system behavior.
+to analyze application and system behavior.
 
-The tools presented are for the most part completely open-ended and have
+The tools presented are, for the most part, completely open-ended and have
 quite good and/or extensive documentation of their own which can be used
 to solve just about any problem you might come across in Linux. Each
 section that describes a particular tool has links to that tool's
 documentation and website.
 
-The purpose of this 'HOWTO' is to present a set of common and generally
+The purpose of this manual is to present a set of common and generally
 useful tracing and profiling idioms along with their application (as
 appropriate) to each tool, in the context of a general-purpose
 'drill-down' methodology that can be applied to solving a large number
-(90%?) of problems. For help with more advanced usages and problems,
-please see the documentation and/or websites listed for each tool.
+of problems. For help with more advanced usages and problems,
+refer to the documentation and/or websites provided for each tool.
 
-The final section of this 'HOWTO' is a collection of real-world examples
-which we'll be continually adding to as we solve more problems using the
-tools - feel free to add your own examples to the list!
+The final section of this manual is a collection of real-world examples
+which we'll be continually updating as we solve more problems using the
+tools --- feel free to suggest additions to what you read here.
 
 General Setup
 =============
 
-Most of the tools are available only in 'sdk' images or in images built
-after adding 'tools-profile' to your local.conf. So, in order to be able
-to access all of the tools described here, please first build and boot
-an 'sdk' image e.g. ::
+Most of the tools are available only in ``sdk`` images or in images built
+after adding ``tools-profile`` to your ``local.conf`` file. So, in order to be able
+to access all of the tools described here, you can build and boot
+an ``sdk`` image, perhaps one of::
 
    $ bitbake core-image-sato-sdk
+   $ bitbake core-image-weston-sdk
+   $ bitbake core-image-rt-sdk
 
-or alternatively by adding 'tools-profile' to the EXTRA_IMAGE_FEATURES line in
-your local.conf::
+Alternatively,  you can add ``tools-profile`` to the :term:`EXTRA_IMAGE_FEATURES` line in
+your ``local.conf`` file::
 
    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile"
 
-If you use the 'tools-profile' method, you don't need to build an sdk image -
+If you use the ``tools-profile`` method, you don't need to build an sdk image ---
 the tracing and profiling tools will be included in non-sdk images as well e.g.::
 
    $ bitbake core-image-sato
@@ -64,12 +66,12 @@ the tracing and profiling tools will be included in non-sdk images as well e.g.:
 If you've already built a stripped image, you can generate debug
 packages (xxx-dbg) which you can manually install as needed.
 
-To generate debug info for packages, you can add dbg-pkgs to
-EXTRA_IMAGE_FEATURES in local.conf. For example::
+To generate debug info for packages, you can add ``dbg-pkgs`` to
+:term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example::
 
    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile dbg-pkgs"
 
-Additionally, in order to generate the right type of debuginfo, we also need to
+Additionally, in order to generate the right type of debug info, we also need to
 set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file::
 
    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
-- 
2.34.1


