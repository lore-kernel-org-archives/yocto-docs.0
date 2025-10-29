Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0996CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:29:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.3497.1761733760541966117
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 03:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=EjxLhvBb;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=itNM61KJcZIMBrpEtT7Xh6sTi7UK8ArQ2vl7H2zb1Pk=; b=EjxLhvBbvwtkyg/l0/RbqeweQg
	XCN96oqoafVIULusaGtC3H5mt4rBkbvF+Svh7KymH7qgIZEiMkzh80/CpxqjvZ/c0gLvMfkBhFM80
	vpQRqdKFZPlA+m9e2yt7JGLCZ6eoXztoYMaolyrXrbDxdnBal8MQH+ct0Nzgjw18NrHmF6t3BxuWD
	dCtiAe2CflO8RA6YittS13wqTSU6mu7Fqk/Omfc65oBYH1Wl0uHBVVaPuh/By6nFaSP2ycGH9l1BO
	Z5mxqO4s6vjphzfOxiNAA1uhW+Uw4pboOrylBCGYhK+4j3wv+M2Zhe14sSh77DUv8p5Su8UGhwdA1
	pWs7Ssog==;
Received: from [147.129.179.166] (port=56130 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vE3Qa-0000000FsYk-0l0v
	for docs@lists.yoctoproject.org;
	Wed, 29 Oct 2025 06:29:19 -0400
Date: Wed, 29 Oct 2025 06:32:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual/new-recipe.rst: replace 'bitbake -e' with
 'bitbake-getvar'
Message-ID: <fa6e98c8-8edb-d7c0-5407-b1f27ce83078@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 10:29:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7895


Replace the legacy call to 'bitbake -e' to get the value of a recipe's
variable with the newer call to 'bitbake-getvar'.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index aa4fb97a4..55099efbb 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -219,9 +219,9 @@ compilation and packaging files, and so forth.

 The path to the per-recipe temporary work directory depends on the
 context in which it is being built. The quickest way to find this path
-is to have BitBake return it by running the following::
+is to use the ``bitbake-getvar`` utility::

-   $ bitbake -e basename | grep ^WORKDIR=
+   $ bitbake-getvar -r basename WORKDIR

 As an example, assume a Source Directory
 top-level folder named ``poky``, a default :term:`Build Directory` at

