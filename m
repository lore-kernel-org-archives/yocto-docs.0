Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406BBCD5BB1
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 12:12:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34954.1779365523941845452
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 05:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=FkEDPVRN;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LwlW9WI+VC1Pexf048OOMaSeTX5ZewUar6TtCGfbt/A=; b=FkEDPVRNpLkL/a7O8C/Afn54lJ
	ok4QxkfbgYyIP9hhID8PfsyzIBS86/vS1uqBiYfjbahBZ3c8U8epEumJacwcvx+iX2PvuXQqElPeX
	DwDmXohKL5pFcDUhfk+TuVQHMTxEDDgdS53ppy5uizuC7CMDi6pW7FF9L7kghqVN8V9Gba1uWAFI7
	4jFI0acmDzfxXSy6T+984Wf4yAkrDcfR8JokK+pyl+Yq8+MDwGc38Cynz6/Df8whrDyzV3LlzObP7
	uWe4WZ7wWDfSbbJSSs2BhxmDyEcPX6R9PKzAj5Uy8Quq4FYxdHgwzmVZzxQO4QkBy/FlHmdRJL1ut
	HoTbTzmg==;
Received: from [147.129.179.166] (port=54210 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wQ2Fr-00000002Xb4-1XkJ
	for docs@lists.yoctoproject.org;
	Thu, 21 May 2026 08:12:02 -0400
Date: Thu, 21 May 2026 08:15:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] bsp-guide: update guide to reflect newer beaglebone
Message-ID: <8ba8789a-52b7-d979-1fc8-04224055f60a@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 12:12:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9516


Update the section on describing the Beaglebone contents to reflect
the current content in the meta-yocto-bsp layer.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index a3b57d29f..3fae172b1 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1245,7 +1245,7 @@ to build, and U-Boot configurations.

 The following list provides some explanation for the statements found in
 the example reference machine configuration file for the BeagleBone
-development boards. Realize that much more can be defined as part of a
+development board. Realize that much more can be defined as part of a
 machine's configuration file. In general, you can learn about related
 variables that this example does not have by locating the variables in
 the ":ref:`ref-manual/variables:variables glossary`" in the Yocto
@@ -1319,7 +1319,7 @@ Project Reference Manual.

 -  :term:`PREFERRED_VERSION_linux-yocto <PREFERRED_VERSION>`:
    Defines the version of the recipe used to build the kernel, which is
-   "6.12" in this case.
+   "6.18%" in this case.

 -  :term:`KERNEL_IMAGETYPE`:
    The type of kernel to build for the device. In this case, the
@@ -1378,35 +1378,27 @@ The kernel recipe used to build the kernel image for the BeagleBone
 device was established in the machine configuration::

    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-   PREFERRED_VERSION_linux-yocto ?= "6.1%"
+   PREFERRED_VERSION_linux-yocto ?= "6.18%"

 The ``meta-yocto-bsp/recipes-kernel/linux`` directory in the layer contains
 metadata used to build the kernel. In this case, a kernel append file
-(i.e. ``linux-yocto_6.1.bbappend``) is used to override an established
-kernel recipe (i.e. ``linux-yocto_6.1.bb``), which is located in
+(i.e. ``linux-yocto_6.18.bbappend``) is used to override an established
+kernel recipe (i.e. ``linux-yocto_6.18.bb``), which is located in
 :oe_git:`/openembedded-core/tree/meta/recipes-kernel/linux`.

 The contents of the append file are::

-   KBRANCH:genericx86  = "v6.1/standard/base"
-   KBRANCH:genericx86-64  = "v6.1/standard/base"
-   KBRANCH:beaglebone-yocto = "v6.1/standard/beaglebone"
+   COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
+   COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
+   COMPATIBLE_MACHINE:genericx86 = "genericx86"
+   COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"

+   KMACHINE:beaglebone-yocto ?= "beaglebone"
    KMACHINE:genericx86 ?= "common-pc"
    KMACHINE:genericx86-64 ?= "common-pc-64"
-   KMACHINE:beaglebone-yocto ?= "beaglebone"
-
-   SRCREV_machine:genericx86 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
-   SRCREV_machine:genericx86-64 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
-   SRCREV_machine:beaglebone-yocto ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
-
-   COMPATIBLE_MACHINE:genericx86 = "genericx86"
-   COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-   COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"

-   LINUX_VERSION:genericx86 = "6.1.30"
-   LINUX_VERSION:genericx86-64 = "6.1.30"
-   LINUX_VERSION:beaglebone-yocto = "6.1.20"
+   KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
+   SRCREV_machine:genericarm64 ?= "5cd75b0b5da06045acdd0c66e50656ab82cb880f"

 This particular append file works for all the machines that are
 part of the ``meta-yocto-bsp`` layer. The relevant statements are

