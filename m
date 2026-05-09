Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747ABCD3447
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 17:41:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16175.1778348488166838936
 for <docs@lists.yoctoproject.org>;
 Sat, 09 May 2026 10:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=VWFk5+PA;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rQULN7yWIN7JR8R5mjBFQ2A96op6kIrS4UBwS+/rxMk=; b=VWFk5+PAgefCLtF521OWHvE/s3
	XAElUJxDe65hXgDSXNwh8eGqYrK3xG36JTv16leX/mbP8auaPluuwvlcgdfK7KKNi8DxtC0KR0Nbl
	yZ8v6TGT/2e1xdATA470rTyub5X5njUO/NO/RMITVQ7jZnZg+4fRbYpb6lBTj2EOgz890BMzsXYL6
	iqwbcL0xTOTT73amynFEPuUBev/MkHsOb6tM/IowicLBSexe7u0Hf7WawyR2btMFRbQSQ3BH+ZR+C
	WICcwvJk0e6zrqc3KgbMh16/dNPSnePTou7QxmG+l/XTEUyw44F80kVBQQX2UKsolzKEuz97bn+MN
	/RhKmHZQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53744 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wLlg5-000000004nL-1hxC
	for docs@lists.yoctoproject.org;
	Sat, 09 May 2026 13:41:26 -0400
Date: Sat, 9 May 2026 13:44:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] Quick Build guide: Various pedantic cleanups
Message-ID: <c1c86570-49ec-de55-563d-e43722f89573@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 09 May 2026 17:41:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9426


Tweaks:

  - remove unnecessary capitalization
  - add appropriate hyphenation
  - insert missing word "to"
  - fix incorrect link to point to raspberrypi5,
    not beaglebone

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 7fbf92098..1d5fdc5e4 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -84,7 +84,7 @@ Build Host Packages
    see the :ref:`ref-manual/system-requirements:required packages for the build host`
    section in the Yocto Project Reference Manual.

-Use Git to Clone bitbake-setup
+Use Git to clone bitbake-setup
 ==============================

 Once you complete the setup instructions for your machine, you need to
@@ -352,7 +352,7 @@ development environment.

 In general, layers are repositories that contain related sets of
 instructions and configurations that tell the Yocto Project what to do.
-Isolating related metadata into functionally specific layers facilitates
+Isolating related metadata into functionally-specific layers facilitates
 modular development and makes it easier to reuse the layer metadata.

 .. note::
@@ -367,7 +367,7 @@ layer>`:
     adds the :yocto_git:`meta-raspberrypi </meta-raspberrypi>` BSP
     layer.

-    First, clone the layer next the other layers::
+    First, clone the layer next to the other layers::

       git clone -b &DISTRO_NAME_NO_CAP; https://git.yoctoproject.org/meta-raspberrypi ../layers/meta-raspberrypi

@@ -375,7 +375,7 @@ layer>`:
     it, you must add the layer and its dependencies to your ``bblayers.conf``
     file, which is found in the :term:`Build Directory` (``conf/``) directory.

-    For this, the ``bitbake-layers add-layer`` can be used:
+    For this, the ``bitbake-layers add-layer`` command can be used:

     .. code-block:: console

@@ -387,8 +387,8 @@ layer>`:

 #.  **Change the Configuration to Build for a Specific Machine:** The
     :term:`MACHINE` variable is defined by the :ref:`ref-fragments-builtin-core-machine`
-    fragment. For this example, the meta-raspberrypi layer provides the
-    :yocto_git:`raspberrypi5 </meta-yocto/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>`
+    fragment. For this example, the ``meta-raspberrypi`` layer provides the
+    :yocto_git:`raspberrypi5 </meta-raspberrypi/tree/conf/machine/raspberrypi5.conf>`
     machine, so let's make it the :term:`MACHINE` used for the build with
     ``bitbake-config-build``:


