Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64779C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:03:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23859.1789480975139379154
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 07:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=c70fbcLy;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TWUoObtZSor7msmRePmDLa0L9Nt+6spoEnb4a1fMrNs=; b=c70fbcLyiJ1s11+CTNz/p8+sPT
	/iX+Roj8YqT5nGYcEI6xK5aQdzGDoOhbTxQ3myACvgWFj8u5MEdZ7LGrPY8R/Uw9iQx6QBkBP+JkC
	JvjVo8s6tBQ9of6ONGjiwT9Y61SiXIboyrds3m23wIVffxZcKLCRKMcu8JXrJFSXYMkO/UefiPj8z
	NebHSkXSNntlKIEw/c9sLKTvxxate7VNQ+ST+82lw3XuzJejR9ydVwGc4eQ8Kv4VeWBBEwMivHlLM
	aGDRphiLHFCGltznx5HeYOB4fglIRWPyr39cJmQMvWuEOZBzYGYwrXboMBrhLspeOk6uliUuaTHHO
	edn456wA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:44764 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x6TkL-0000000Dj32-0Pb9
	for docs@lists.yoctoproject.org;
	Tue, 15 Sep 2026 10:02:53 -0400
Date: Tue, 15 Sep 2026 10:00:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: correct OVERRIDES to FILESOVERRIDES for
 FILESPATH
Message-ID: <d673601a-4878-eda8-d649-b5a29490025d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 15 Sep 2026 14:03:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10514


It's "FILESOVERRIDES" that defines how OE uses FILESPATH, not
"OVERRIDES".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 49dc7a6e9..9fa255907 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -607,7 +607,7 @@ important as it ensures that items in the list remain colon-separated.
    append file would not even use the :term:`FILESEXTRAPATHS` statement.

 The end result of this ``.bbappend`` file is that on a Raspberry Pi, where
-``rpi`` will exist in the list of :term:`OVERRIDES`, the file
+``rpi`` will exist in the list of :term:`FILESOVERRIDES`, the file
 ``meta-raspberrypi/recipes-bsp/formfactor/formfactor/rpi/machconfig`` will be
 used during :ref:`ref-tasks-fetch` and the test for a non-zero file size in
 :ref:`ref-tasks-install` will return true, and the file will be installed.
@@ -667,7 +667,7 @@ file is in the layer at ``recipes-graphics/xorg-xserver``::
 Building off of the previous example, we once again are setting the
 :term:`FILESEXTRAPATHS` variable.  In this case we are also using
 :term:`SRC_URI` to list additional source files to use when ``rpi`` is found in
-the list of :term:`OVERRIDES`.  The :ref:`ref-tasks-install` task will then perform a
+the list of :term:`FILESOVERRIDES`.  The :ref:`ref-tasks-install` task will then perform a
 check for an additional :term:`MACHINE_FEATURES` that if set will cause these
 additional files to be installed.  These additional files are listed in
 :term:`FILES` so that they will be packaged.

