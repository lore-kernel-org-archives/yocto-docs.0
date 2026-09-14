Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE03C88E6A
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 09:09:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16132.1789376957217386934
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 02:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=dqhIwO4r;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NC85Rg6OeLM7+LTr0thFCGbSqaniW0RrPlKZX4KwSqc=; b=dqhIwO4re6yUdGujXqBCJziiCp
	MP7uzhYKAjsVF44zIBRcdy3Ri3WvRORh6m3kEAxqDgqwMBtBMTu5gbFNumGfOA4qyCvwyTPXUtU5m
	GYwmPEQdzqmDk0bJy0dO41YSiTblTt/JWMcJlY8E/yQksLeowyjQW7QWvyDc6xFN+98QNC2xvBiVr
	CwVobCz+alGCpO6zQnok6cY8j4IYBu1PSUt8UHY4pi8luJv1zbrES2+JXhlPfMufpyYBtVQPDUb4w
	POjIu+mFFWBtUuVoUQMtHqGK0qBoqoLZKL0Kh417Z3rXoMKZWCRG5Lq3LJKoraSI4xmH72oZVJ89F
	3OlJxkAg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:49718 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x62gY-0000000AY4m-48B1
	for docs@lists.yoctoproject.org;
	Mon, 14 Sep 2026 05:09:16 -0400
Date: Mon, 14 Sep 2026 05:07:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: update recommendations for build system
Message-ID: <2f13d128-1344-e8b2-9e75-9867224522e4@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 09:09:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10488


Drop the reference to "Xeon" and hard-coded RAM and disk space
recommendations and get those values from poky.yaml.in.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 3b8e2334a..7def242e2 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -55,9 +55,9 @@ particular working environment and set of practices.
 #.  *Gather the Hardware:* Based on the size and make-up of the team,
     get the hardware together. Ideally, any development, build, or test
     engineer uses a system that runs a supported Linux distribution.
-    These systems, in general, should be high performance (e.g. dual,
-    six-core Xeons with 24 Gbytes of RAM and plenty of disk space). You
-    can help ensure efficiency by having any machines used for testing
+    These systems, in general, should be high performance (e.g. a minimum
+    of &MIN_RAM; Gbytes of RAM and at least &MIN_DISK_SPACE; Gbytes of disk space.)
+    You can help ensure efficiency by having any machines used for testing
     or that run Autobuilders be as high performance as possible.

     .. note::

