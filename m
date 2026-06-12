Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92E6CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 07:58:21 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65511.1781251091162102555
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 00:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=YF7G4XQj;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tOrlfYUENMw9gcznfF7MhwRE0uXvdB5xJfMLxbELVjA=; b=YF7G4XQjffCGtvJzDn9bddhPlA
	rK2Eu5jlb0XYt/AyQxp4taMzol29lIqkbFQljmjU91lHBi0t4xMTknCB12plUB7Z+E2SCxd5B8XHR
	t70/y66826c4wxz3/Xo+q13a3JE9qUPGkyjlmUD6Pk/fE7I5TExEqFrx66ccRrWC2VHhn5iICpq9u
	kJo5EJbs2425b43yk4n3LEDB6mmNDwOb5S/709Ac7N/PZmCrZ4QBQuddtvg8stslvBnk8qWjSaJza
	hyY4nVN3wpSsUbZzB+tP6JUrx+cklgKWXv0SwdPXkfS91J6+PfnpaCaqI5/2N1x1xKGT92IqcnK2Y
	GIpODuNQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:59434 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXwmG-0000000DlJ0-1igH
	for docs@lists.yoctoproject.org;
	Fri, 12 Jun 2026 03:58:09 -0400
Date: Fri, 12 Jun 2026 03:58:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: add second way to assign "PV" for external SCM
Message-ID: <f1c6733a-a659-a78d-1b41-474b3103328e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 12 Jun 2026 07:58:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9701


In addition to hard-coding a PV value in the context of an external
SCM, show also just appending the string "+git" to the value already
calculated for PV.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
index 3ca9079b3..4492de9cd 100644
--- a/documentation/dev-manual/external-scm.rst
+++ b/documentation/dev-manual/external-scm.rst
@@ -13,9 +13,12 @@ Subversion (SVN) and Git.

 To enable this behavior, the :term:`PV` of
 the recipe needs to include a ``+`` sign in its assignment.
-Here is an example::
+Here are a couple examples of how this can be done --- the first
+hard-coding the value for ``PV``, the second simply appending
+the string "+git" to the value already assigned to that variable::

    PV = "1.2.3+git"
+   PV .= "+git"

 :term:`Bitbake` later includes the source control information in :term:`PKGV`
 during the packaging phase.

