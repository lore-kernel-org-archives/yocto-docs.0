Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADFECD3427
	for <webhook@archiver.kernel.org>; Sun, 10 May 2026 11:06:28 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28144.1778411181038481491
 for <docs@lists.yoctoproject.org>;
 Sun, 10 May 2026 04:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=UBfmKn3L;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aOqKs/X7qavMANSRMAwXMNEBptyrjj93BhRdeNi82OU=; b=UBfmKn3L9LMf4OtfgYgKQWRXk6
	z17ome0Yl+3OEjt5IsitXi2/X1FYa+GvN9ErPEkXI33s9key8jsMT7fJSpuObD4xhfWLQgpA5xQbu
	DBNnih3mEB/Oq20mvixJ2M20rValnQuPDW6vv4QXE2/3IrjdaQEr8Ii1TWkP3yWhkZ6Yc+ufF/1Cv
	WS3Dspe29ocBs+eticgfDJeYI+UZlOsM5QhsFJqecT5TwVHdJVX+uo52gtERG2JUTm0hYPFYT9Wjh
	k9LOZ0Xo6v9nm/JCxWyrW3nrrjJlEadzeDPHU1Yh6XjJy9kKLfko9OiZafOxeHvSa1W2/2+ITzRea
	yzrRHJsQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34694 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wM1zE-00000001ttg-0TJN
	for docs@lists.yoctoproject.org;
	Sun, 10 May 2026 07:06:19 -0400
Date: Sun, 10 May 2026 07:09:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] index.rst: update "Software Overview" to "Technical
 Overview"
Message-ID: <3697cc94-270c-1950-f801-168877dcd4c6@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 10 May 2026 11:06:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9431


Fix the title and link so it goes directly to the
Technical Overview.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/index.rst b/documentation/index.rst
index 7d933acc0..46b775711 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -17,7 +17,7 @@ Welcome to the Yocto Project Documentation
    Quick Build <brief-yoctoprojectqs/index>
    what-i-wish-id-known
    transitioning-to-a-custom-environment
-   Yocto Project Software Overview <https://www.yoctoproject.org/software-overview/>
+   Yocto Project Technical Overview <https://www.yoctoproject.org/development/technical-overview/>
    Tips and Tricks Wiki <https://wiki.yoctoproject.org/wiki/TipsAndTricks>

 .. toctree::

