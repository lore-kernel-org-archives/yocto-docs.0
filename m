Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48862CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 13:19:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6898.1782307153078247018
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 06:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=d5AYRtcv;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ax59f6DZt0oX2PKYMdC32uKkgFtjfm3Ny1zhkTJF08k=; b=d5AYRtcvNmj7mO9CamEFYWJmuY
	dPGNw2eTXNtfVqTw1oPofhr1tr9MlSgg5vXc7ufwWFxcusyYAu5LmRefYiMvM2U0MQUV6xPDcIcdT
	sHXM74fMoqOOlv4SnxnaJPWfotOEt9hh1ZvPAQM+ERYzkcuaXJmT4jXnDRU2SikeqNSZJeihX30B9
	fkPsOZj2y421x/EfUUOZ2wvVxP66dLiYCrdUmNeJ9Bh+UuMo8VObgPDxgyM/6bWkqAPiCu0OkG8my
	wls042BpnCMnkiiyFTjFW5kxkUshoxydbzRDNRk2PxL0An2NhqjCkwrk/YahV5i2SzwjB/dseZm3b
	FNijeSRw==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:52048 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcNVW-0000000FaDA-03DY
	for docs@lists.yoctoproject.org;
	Wed, 24 Jun 2026 09:19:11 -0400
Date: Wed, 24 Jun 2026 09:19:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] ref-manual: under meta/files entry, mention Wic files
Message-ID: <6d348bc4-6069-0544-0e68-80af8d34ad82@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 13:19:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9867


Add a reference to Wic files under meta/files, and add a link to the
section on Wic files in the Development Tasks Manual.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index ff84b250b..6d5017f30 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -868,7 +868,10 @@ layer.
 ---------------

 This directory contains common license files and several text files used
-by the build system. The text files contain minimal device information
+by the build system, as well as
+:ref:`Wic files <dev-manual/wic:creating partitioned images using wic>`
+that define the layouts of the images produced by the build.
+The text files contain minimal device information
 and lists of files and directories with known permissions.

 .. _structure-meta-lib:

