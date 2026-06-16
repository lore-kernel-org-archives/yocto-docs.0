Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A83CD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 20:32:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.416.1781641961859274869
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 13:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=WCFSoir4;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RSCIglQYZT9yDUBOPEbZQilhPwm38smZeBakaGHU99w=; b=WCFSoir49vHJ3tr5FRafwgmj2H
	wOhL3PwDwsl1h1OE9k8Eb6Rzn/HKhFrDdqw4elXUL52WgGo33Ik3598GcwTjXqBpYCQPzJd+Xlrnv
	5WerGHh9+DaCX+5Y1hUyKcXsCwxXcByZzP5PoWqehhZvp5WFG8td/kMwQRt4YSmTt2fOdgXHjp2Mp
	JS/8GWK7i+bkOr89G8CSbVGGs0TtmAct1N6iv3e63k3N5jslNVo5QPe12Vp7WI0ZW81vSdaVSQZ9B
	tb/PBrQkDMKGkLRH1RmfwB7yeYOPoRDddWSubs+kIK4nsZzsez1L9XiCUkcoac/Sji2OnPq5cEkfq
	h/R3sTQQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:49650 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZaSd-00000007oX9-0Mdp
	for docs@lists.yoctoproject.org;
	Tue, 16 Jun 2026 16:32:39 -0400
Date: Tue, 16 Jun 2026 16:32:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] dev-manual: add second way to assign "PV" for external
 SCM
Message-ID: <c3dc6fcf-3e0e-f788-3308-1fac1fc4ea57@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 20:32:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9763


In addition to hard-coding a PV value in the context of an external
SCM, show also just appending the string "+git" to the value already
calculated for PV.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
index 3ca9079b3..cac23ac1e 100644
--- a/documentation/dev-manual/external-scm.rst
+++ b/documentation/dev-manual/external-scm.rst
@@ -13,9 +13,13 @@ Subversion (SVN) and Git.

 To enable this behavior, the :term:`PV` of
 the recipe needs to include a ``+`` sign in its assignment.
-Here is an example::
+Here are a couple examples of how this can be done --- the first
+hard-coding the value for ``PV``, the second simply appending
+the string "+git" to the value of ``PV`` already extracted from
+the recipe file name::

    PV = "1.2.3+git"
+   PV .= "+git"

 :term:`Bitbake` later includes the source control information in :term:`PKGV`
 during the packaging phase.

