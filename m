Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE874CD3447
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 18:41:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17245.1778352091058066977
 for <docs@lists.yoctoproject.org>;
 Sat, 09 May 2026 11:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=lWtTyWdL;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BzMI4jWe1thOaO+fq3xWLY4IY3xaag4HLhzcR7OA6SE=; b=lWtTyWdL2pcAaAXhNdC0AYJpji
	sZCqS8zpruBDX0NJFFPhl+U8fHpeg4cIeIVdx9NWeuDwutpQw1INwXvkwQQjlVdq+4KthLgsDLSVK
	lMaZ6H4xIzCYChbo99pHk99vx1krJVcOjfEtmmd0vYBkPgGE5oM64L1uHx/5kmwh26a23A0AYtH3c
	FVWLSBy/4qkRx4XjSnYIePBD5QQeyqrRb2DI9AV2dIED8hEA41MUR+n59S5hSChd8nazv32eW6xQA
	aYk8ry+m/EcA6/NOqYYHes82eZIs43DfOeH3/s9gFC6y1BBMcpwAdAIW36S8E6Mu8EViQVPGWb3rF
	vrwLfK2A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37558 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wLmcC-00000000B05-0Fcg
	for docs@lists.yoctoproject.org;
	Sat, 09 May 2026 14:41:29 -0400
Date: Sat, 9 May 2026 14:44:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] What I Wish I'd KNown: Various pedantic cleanups
Message-ID: <7492d4a6-6194-d081-2266-98f33dc5ae92@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 09 May 2026 18:41:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9427


Tweaks:

  - Update "Software Overview" link to go to "Technical Overview"
  - use proper capitalization for "Git" when referring to the product
  - numerous grammar adjustments to basic skills list

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index bdb9e492e..d89f43304 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -9,7 +9,7 @@ What I wish I'd known about Yocto Project
 .. note::

    Before reading further, make sure you've taken a look at the
-   :yocto_home:`Software Overview</software-overview>` page which presents the
+   :yocto_home:`Technical Overview</development/technical-overview>` page which presents the
    definitions for many of the terms referenced here. Also, know that some of the
    information here won't make sense now, but as you start developing, it is the
    information you'll want to keep close at hand. These are best known methods for
@@ -22,8 +22,8 @@ known before embarking on their first build with Yocto Project. Feel free to
 contact us with other suggestions.

 #. **Use Git, not the tarball download:**
-   If you use git the software will be automatically updated with bug updates
-   because of how git works. If you download the tarball instead, you will need
+   If you use Git, the software will be automatically updated with bug updates
+   because of how Git works. If you download the tarball instead, you will need
    to be responsible for your own updates.

 #. **Get to know the layer index:**
@@ -166,19 +166,19 @@ contact us with other suggestions.

    * deal with corporate proxies
    * add a package to an image
-   * understand the difference between a recipe and package
-   * build a package by itself and why that's useful
+   * understand the difference between a recipe and a package
+   * build a package by itself and understand why that's useful
    * find out what packages are created by a recipe
    * find out what files are in a package
    * find out what files are in an image
-   * add an ssh server to an image (enable transferring of files to target)
+   * add an SSH server to an image (enable transferring of files to target)
    * know the anatomy of a recipe
    * know how to create and use layers
    * find recipes (with the :oe_layerindex:`OpenEmbedded Layer index <>`)
-   * understand difference between machine and distro settings
+   * understand the difference between MACHINE and DISTRO settings
    * find and use the right BSP (machine) for your hardware
-   * find examples of distro features and know where to set them
-   * understanding the task pipeline and executing individual tasks
+   * find examples of DISTRO features and know where to set them
+   * understand the task pipeline and how to execute individual tasks
    * understand devtool and how it simplifies your workflow
    * improve build speeds with shared downloads and shared state cache
    * generate and understand a dependency graph

