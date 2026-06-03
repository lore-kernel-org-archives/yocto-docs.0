Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41055CD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 15:49:01 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23372.1780501734360347212
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 08:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=NvAZqImn;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YaU+5EMrFWU+vIn9+nkeSUU+cKdy06WvpLNlZV3OrP8=; b=NvAZqImnZbNw5M9ow1cu9QWhEO
	35tHbZXqGs9sPgFaWzoBf4KTd0XngAwvSjAs17ChsFQunloBgMmMttTEzfp3lb9Q/YwNrxyfiC/EH
	DSSb5a/ChBfZAFl6tEaUDD+Lzo1v5XRcZx0uWtEGJab9Lld0h9tpuuuLUzrAXqrbu6ahTksPsmHgM
	2GwkLdu+11DMUPZTVb16yK4yzPUeIpUcfeZNY58zkgHdZgn6B0U5IO4l3QFVo21sv0ejiwByJ2N4H
	Oq4OA0Tm7rN7CG7dsBUepRLuU1VQkgfoAoQMpp6rm02f3VQDKnYNqXfxFuehwKJjAXof6cnYoI7Fk
	+u4lGJ0Q==;
Received: from [147.129.179.166] (port=41842 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wUnpo-00000008wwt-1iv9
	for docs@lists.yoctoproject.org;
	Wed, 03 Jun 2026 11:48:51 -0400
Date: Wed, 3 Jun 2026 11:48:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: correct that "conf" is a subdir of build
 dir
Message-ID: <153ac3ae-f1da-cbb5-c476-b96a35960307@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 15:49:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9566


The statement that build/conf is a directory of the build directory is
incorrect since, in this context, build *is* the build directory. So
correct that and use the term "subdirectory" to make it even more
clear.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ec5babe4c..c19138e18 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -210,7 +210,7 @@ figure <overview-manual/concepts:openembedded build system concepts>`:

 BitBake needs some basic configuration files in order to complete a
 build. These files are ``*.conf`` files. The minimally necessary ones
-reside as example files in the ``build/conf`` directory of the
+reside as example files in the ``conf`` subdirectory of the
 :term:`Build Directory`.

 When you :ref:`initialize the build environment <dev-manual/start:Initializing
@@ -219,7 +219,7 @@ the Build Environment>`, you can specify which directory will be the

 Setting up the build environment creates a :term:`Build Directory`
 if one does not already exist. BitBake uses the :term:`Build Directory`
-for all its work during builds. The Build Directory has a ``conf`` directory
+for all its work during builds. The Build Directory has a ``conf`` subdirectory
 that contains default versions of your ``local.conf`` and ``bblayers.conf``
 configuration files. These default :term:`configuration files <Configuration
 File>` are created only if they do not already exist in the :term:`Build

