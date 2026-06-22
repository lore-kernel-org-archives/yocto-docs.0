Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D809CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 20:29:20 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6433.1782160150049349544
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 13:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=C1vZ65rH;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GspfnQ+9pgyZbJ4OmvwJ4grM+gy1rnMwAu6FGGgwBu0=; b=C1vZ65rHQkkyRA8O8CLXAsjb/c
	oCJ4zjKjR/yHzYbaJ4atoNDMjYhMU9tptBKr38gKGw9N/mat7M+ByKrwmlsJdhWpfKFdDo+tcr4+W
	1EG0vbJCPHJbAzB+Ss2hQ+4YFtdSMPodrhQDaGHkdIheImmK3qp72+zbDBsZSBKJ/89RYHmrBmOmi
	KohD0yCrdQqS8wkItvCxlcf3iTKXID2f8lBnhqZQ0DdQEKuS48SqYQY0aFIHHQy2HGj+a/crwQkOA
	U9RQjP8n1k2MZ/Odc3kAdbMr69Ztyz2Gl/a+N7PGkcyHS0P/cURZ5PPB+y7ipM7HDrT9CIq3x6gKU
	wkI+oM5A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56758 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wblGU-0000000BFTl-2Qw7
	for docs@lists.yoctoproject.org;
	Mon, 22 Jun 2026 16:29:08 -0400
Date: Mon, 22 Jun 2026 16:29:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: organize all recipes-* directories under
 subdirectory
Message-ID: <543708dc-e1aa-0798-653b-d8c073dbec50@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 20:29:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9836


It's cumbersome to list all meta/recipes-* directories under the same
level as other meta/ directories, so place them under a recipes-*
higher-level directory.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index ff84b250b..fae0368b9 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -881,10 +881,17 @@ build process. It is enabled via the ``addpylib`` directive in
 ``meta/conf/local.conf``. For more information, see
 :ref:`bitbake-user-manual/bitbake-user-manual-metadata:extending python library code`.

+.. _structure-meta-recipes:
+
+``meta/recipes-*/``
+---------------------
+
+All of the "recipes-*" subdirectories define recipes broken into related sub-categories.
+
 .. _structure-meta-recipes-bsp:

 ``meta/recipes-bsp/``
----------------------
+~~~~~~~~~~~~~~~~~~~~~

 This directory contains anything linking to specific hardware or
 hardware configuration information such as "u-boot" and "grub".
@@ -892,7 +899,7 @@ hardware configuration information such as "u-boot" and "grub".
 .. _structure-meta-recipes-connectivity:

 ``meta/recipes-connectivity/``
-------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 This directory contains libraries and applications related to
 communication with other devices.
@@ -900,7 +907,7 @@ communication with other devices.
 .. _structure-meta-recipes-core:

 ``meta/recipes-core/``
-----------------------
+~~~~~~~~~~~~~~~~~~~~~~

 This directory contains what is needed to build a basic working Linux
 image including commonly used dependencies.
@@ -908,7 +915,7 @@ image including commonly used dependencies.
 .. _structure-meta-recipes-devtools:

 ``meta/recipes-devtools/``
---------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~

 This directory contains tools that are primarily used by the build
 system. The tools, however, can also be used on targets.
@@ -916,7 +923,7 @@ system. The tools, however, can also be used on targets.
 .. _structure-meta-recipes-extended:

 ``meta/recipes-extended/``
---------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~

 This directory contains non-essential applications that add features
 compared to the alternatives in core. You might need this directory for
@@ -925,7 +932,7 @@ full tool functionality.
 .. _structure-meta-recipes-gnome:

 ``meta/recipes-gnome/``
------------------------
+~~~~~~~~~~~~~~~~~~~~~~~

 This directory contains all things related to the GTK+ application
 framework.
@@ -933,7 +940,7 @@ framework.
 .. _structure-meta-recipes-graphics:

 ``meta/recipes-graphics/``
---------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~

 This directory contains X and other graphically related system
 libraries.
@@ -941,7 +948,7 @@ libraries.
 .. _structure-meta-recipes-kernel:

 ``meta/recipes-kernel/``
-------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~

 This directory contains the kernel and generic applications and
 libraries that have strong kernel dependencies.
@@ -949,7 +956,7 @@ libraries that have strong kernel dependencies.
 .. _structure-meta-recipes-multimedia:

 ``meta/recipes-multimedia/``
-----------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 This directory contains codecs and support utilities for audio, images
 and video.
@@ -957,7 +964,7 @@ and video.
 .. _structure-meta-recipes-rt:

 ``meta/recipes-rt/``
---------------------
+~~~~~~~~~~~~~~~~~~~~

 This directory contains package and image recipes for using and testing
 the ``PREEMPT_RT`` kernel.
@@ -965,7 +972,7 @@ the ``PREEMPT_RT`` kernel.
 .. _structure-meta-recipes-sato:

 ``meta/recipes-sato/``
-----------------------
+~~~~~~~~~~~~~~~~~~~~~~

 This directory contains the Sato demo/reference UI/UX and its associated
 applications and configuration data.
@@ -973,7 +980,7 @@ applications and configuration data.
 .. _structure-meta-recipes-support:

 ``meta/recipes-support/``
--------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~

 This directory contains recipes used by other recipes, but that are not
 directly included in images (i.e. dependencies of other recipes).

