Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8C1CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 17:56:14 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5021.1779213367241302730
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 10:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=tRm25z3u;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GLjoP7EvNMT61wiBGCPF6KO6SFYHmMTLvrGEgLN6rOA=; b=tRm25z3ujomFS4TTtllNU1kSLj
	eISM9tJGOdHXZbzI3A2L0wGVr+5D0kB7pEfl60uJX4VdSpsVOX82gP8mkI5YxoXf5MM3uAYxAHsn/
	AuA4DlCydoCA+A9+FJwvTu3v/Ufh5YPYFOp48SqBTZlmXJBh9wMYAEuuudMPqc0AvZSC9WRsbgNJz
	Jy6WsnaJQPbY472Z4HzNu/EkEjvICC3F8H+jAyATOZxysrLMYW+pW6dIZ0gQxXkbItkHbVZu7mg5w
	9pEVve7ZZRz5JMjZK378MFjd7gwM0NB3O5hjkMbL4oiK2Yq9KoJZDNwniwB9ccz7cdGU8YTQpDvcy
	r3g8+ccw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34368 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wPOfg-00000009Whw-2Cg8
	for docs@lists.yoctoproject.org;
	Tue, 19 May 2026 13:56:05 -0400
Date: Tue, 19 May 2026 13:59:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: hyphens not allowed in file version
Message-ID: <ca4da254-48cf-033e-e548-81604af5135c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 17:56:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9495


The Recipe Style Guide makes it clear that you can't have hyphens in
the version part of a recipe file name.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ec5babe4c..ec3d81b8d 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -63,7 +63,7 @@ following commands::
 The most common usage for BitBake is ``bitbake recipename``, where
 ``recipename`` is the name of the recipe you want to build (referred
 to as the "target"). The target often equates to the first part of a
-recipe's filename (e.g. "foo" for a recipe named ``foo_1.3.0-r0.bb``).
+recipe's filename (e.g. "foo" for a recipe file named ``foo_1.3.0.bb``).
 So, to process the ``matchbox-desktop_1.2.3.bb`` recipe file, you might
 type the following::


