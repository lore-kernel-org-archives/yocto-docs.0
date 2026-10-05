Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E819CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 19:56:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29228.1791230205882029768
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 12:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=CJSyaM2r;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3IOCuVLH2u0vh847qQQn1K6UNgd6UlsuwPX9cAz5q9g=; b=CJSyaM2rCr+fMXOqWbKXIQhP5e
	vBe1+ssmnSv5/zftUB34eIfz4ybAtgUTO6FFOdygsTieYpQpVG2RMbDrz5rNCCun+/Epy4i5psTFx
	vo1115CVvJn96tBCUJMBIwQrHYBe9YVN1OpFy000aB3HGTRHn6AZQ7Z4q9sR8Er+X1VPvrthiXTfc
	cBFpOp7svZGDUOEonYrrge0Z7AUANR27hUh4YxKZYGEpuT8lqPyCzO1JNrgNNLEXoEyymwJ4dfO9M
	m5p4xRWGj8s5ddQfcXFZRt+3lIL1lEJzHqUJbhOTfKoHKHGw76lWitqx77PU2CXqqb7wcuf2F3zPu
	IuszPwKA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:43710 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1xDonj-0000000CsfG-207a
	for docs@lists.yoctoproject.org;
	Mon, 05 Oct 2026 15:56:44 -0400
Date: Mon, 5 Oct 2026 15:54:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: correct directory name for oe-core wic files
Message-ID: <d2b5671c-6a58-530e-608d-5e2cd2d44343@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 05 Oct 2026 19:56:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10656


Directory name for oe-core wic files is missing "meta" component.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index c13655f87..bbdc60f09 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -309,7 +309,7 @@ following two locations:
 .. code-block:: text

    meta-yocto/meta-yocto-bsp/files/wic
-   openembedded-core/files/wic
+   openembedded-core/meta/files/wic

 Use the following command to list the available kickstart files:


