Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA502C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 08:59:28 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16196.1789376361272582167
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 01:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hXtOHYRJ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kZExGEGkI1ld+wgj7nhbdbeO0aZhPZYShdY41YA6sfQ=; b=hXtOHYRJCwCtH1Xccy7ohv8AI0
	AgMQrVWzODFV7OgpPzHOAqClx+kEk3udr1iVjmc52ep7EoUsjzAkGL8dDyCkzwOmQzMw5u/7NrOXV
	ImEcJDPI0LZCn8uJvxZQ5FKMTVNzR5e0ANQmyjd7okW4gEW15Zq46iD+/Zlf3HxFbC9HjfBnGG3pt
	SMwC+Qo9u8sfVAomyWQON5IysjcgoL8YUfBuaZe2hoGYFv6FpWAbcn0DYwWIa1RthaYY4x4/1yrAo
	ochWlmECTW3mGInfaiU6UzEvVix8u12j7rfYMx7cb94tCfqTtzPHGIClnOM/kC5xaYMdrRyFgneQN
	vnqfmKtg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:40276 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x62X1-0000000AWxH-01JK
	for docs@lists.yoctoproject.org;
	Mon, 14 Sep 2026 04:59:19 -0400
Date: Mon, 14 Sep 2026 04:57:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: drop link to out-of-date wiki page
Message-ID: <cf76dd2f-7c9f-54b8-ed2f-78d38b629e97@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 08:59:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10487


The "Distribution Support" wiki page is noticeably out of date, so
stop referring to it.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 3b8e2334a..c7d0fe3da 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -299,8 +299,7 @@ Project Build Host:
    officially supported. For a list of the distributions under
    validation and their status, see the ":ref:`Supported Linux
    Distributions <system-requirements-supported-distros>`"
-   section in the Yocto Project Reference Manual and the wiki page at
-   :yocto_wiki:`Distribution Support </Distribution_Support>`.
+   section in the Yocto Project Reference Manual.

 #. *Have Enough Free Memory:* Your system should have at least 50 Gbytes
    of free disk space for building images.

