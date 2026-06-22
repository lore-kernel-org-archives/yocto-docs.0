Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4DBCDB466
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 19:44:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5361.1782157464591874001
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 12:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=NCj8Dk6m;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=auKEfpHnNgZ4SWIywO8lgRibdvfL9A04efGvPvqBJI4=; b=NCj8Dk6mRGsWDoe7B5Zc/iecAT
	5ZTjKk6S2nk4Qck9WQ6CZBqtOfKOQvpm1ElTLDouIG1ANGgAhH0NFdyY53sJFk3SA0L5nq9ASFnz5
	JuYgbTf1SO8hvdqiJXA9wAWygb4t0Mn5G8dEyoxkdM2yPn6Rr2b2hGCkNaNFsMAVt1SOAARVWyhvR
	mMUd+oV+rvU4WapdAF5Psfo0xXRlBDdO8dTdFHsNZ2wZA8+Am3agrFhJhS6bgl1SFG8URRg6OWHlG
	MgtXp8oEjhURqfLILmbH/NTJkYj4k9psbsSLPGpJ1pb0e8sTGhsTbPnkOjKa1clb3hi6nQ9YpMeUj
	22QYaxaQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:54628 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbkZB-0000000BACT-2hua
	for docs@lists.yoctoproject.org;
	Mon, 22 Jun 2026 15:44:23 -0400
Date: Mon, 22 Jun 2026 15:44:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: under meta/files, mention Wic files
Message-ID: <97f6205e-b80d-d845-717b-8a71bfca415f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 19:44:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9833


Add a reference to image Wic files under meta/files.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index ff84b250b..a55b3ba56 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -868,7 +868,8 @@ layer.
 ---------------

 This directory contains common license files and several text files used
-by the build system. The text files contain minimal device information
+by the build system, as well as Wic files that define generated image layouts.
+The text files contain minimal device information
 and lists of files and directories with known permissions.

 .. _structure-meta-lib:

