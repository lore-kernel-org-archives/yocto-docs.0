Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDE6CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:54:31 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8350.1790852062541448288
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 03:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=v8Df+Y+1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HpTe+xPRaspt+zv2xuJILWTgQna9+qHk7kz7dvWO4f4=; b=v8Df+Y+14cgh/QjPP9iz6KBdFh
	/x8dh3zYmjHwGrLetMb6rVj+ue5lmJrAZNR0hIWmALhE+YGI3O/mGy+qr4EfFUyy3IbufgbaISOzC
	wYdjYUKw7EQRsDJEg/LaxMjSZTQi22heiL08jjC68hd/FGh5haoATawY8EA9jj1JYC4xe2k4LH4D2
	j3jsIjzxOyW9ErBB8pcD1oQUB38t5hSSpMRP2jNZsuKNpLCN1KATORx3DCIWRLqDbS0v2rQc0H47T
	X2BzQJir8mDWOX48/lyyd6MzSYzjEnq7neKEYCUwCI8VKJHuuOkQZRbclcbtrOpjhQWP4UBN+q6Oi
	J2OAPzJg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:33080 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1xCEQc-00000002K1U-3pRO
	for docs@lists.yoctoproject.org;
	Thu, 01 Oct 2026 06:54:20 -0400
Date: Thu, 1 Oct 2026 06:51:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add a terms entry for Wic
Message-ID: <37230285-e554-fadb-1b33-b5748362f710@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 01 Oct 2026 10:54:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10644


Add a short entry for Wic to the reference manual in order to later
refer to it from other places in the docs.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index b0ebb4a40..ed507033d 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -648,3 +648,9 @@ universal, the list includes them just in case:
       controlled by the maintainer of the source code. For example, in
       order for a developer to work on a particular piece of code, they
       need to first get a copy of it from an "upstream" source.
+
+   :term:`Wic`
+      Wic --- the OpenEmbedded Image Creator --- is a standalone utility
+      used in the OpenEmbedded and Yocto Project ecosystems to generate
+      partitioned, bootable images from existing build artifacts. For a
+      comprehensive introduction to Wic, see :doc:`/dev-manual/wic`.

