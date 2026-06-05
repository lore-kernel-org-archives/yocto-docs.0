Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B369ECD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 16:36:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12174.1780677405475864840
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 09:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RCiYxEq+;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qRYOUw5rbqWehXLFBe14CFeqlvuhu50gOIT7Ca10gMA=; b=RCiYxEq+cH8WEOT7QIZgq8pVfy
	SkJ/2SuQBDKm8DyL5ZFZNRkrmzSneo94HNLG33jCx13XRFkr3nDRJ4BFEGUUFXKpn+1mY33Hz9Ftu
	baRUQbD2IUsvO1UGCbdQa5gbQjggF4wJ3o6bDtA4PycReiy4P0TkUPE3D4wbNuzkAs821vZe+l4OX
	C6DDl+vKbsrwL34ov5p87AeDnMScZBz6oPq9BWjKupR4vbDNGuemm2zTf2XtMl/hfSQrwDC4l6drq
	ENOo+hFSjq+Jq9A2WnplUCbAqxQ0k0/iYPqdmGfjSB2fXy6+F0sDuUfRmbSC0U4yd6GtQFrQwYFxl
	HP5THWxg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:33928 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVXXG-0000000E6Ld-23fb
	for docs@lists.yoctoproject.org;
	Fri, 05 Jun 2026 12:36:44 -0400
Date: Fri, 5 Jun 2026 12:36:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] contributor-guide: couple minor typo/grammar fixes
Message-ID: <306cd0d9-8b5e-5f72-b21f-4b1051491c2b@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 16:36:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9617


  - font fix
  - missing word fix

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 704db32ea..e5b77393f 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -28,7 +28,7 @@ file name. It is recommended to use released versions of software as these are
 revisions that upstream are expecting people to use.

 Recipe versions should always compare and sort correctly so that upgrades work
-as expected. With conventional versions such as ``1.4`` upgrading ``to 1.5``
+as expected. With conventional versions such as ``1.4`` upgrading to ``1.5``
 this happens naturally, but some versions don't sort. For example,
 ``1.5 Release Candidate 2`` could be written as ``1.5rc2`` but this sorts after
 ``1.5``, so upgrades from feeds won't happen correctly.
@@ -82,7 +82,7 @@ Recipe formatting
 Variable Formatting
 -------------------

--  Variable assignment should a space around each side of the operator, e.g.
+-  Variable assignment should include a space around each side of the operator, e.g.
    ``FOO = "bar"``, not ``FOO="bar"``.

 -  Double quotes should be used on the right-hand side of the assignment,

