Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2A6CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 21:57:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57917.1781215062928555198
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 14:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=THMOO5xd;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5piI/ydTKpxYJ94Yu7c2nKkkfrFR0CcrWO2E2o3yBvM=; b=THMOO5xdvVlqwGvo/959sFis9b
	JtvX6TG8iqroqNohke6VGTx580Cb+b3w5dkY0Cj724Ra//v69ZUZfVAbhJnqUrnzZY1UclW+s6bfx
	1vKIoS2wKAVqEuBqtv9pf9tN1KY2Og6WTltOqyma71KwYT3NSpvsrCbbd8Q/6Td2k4wzxmN9xipzX
	9kZ0aobwQYd2vYIF3DMAxf2ICZmpMIXC7XbgRA6KlMiUEj5P7xSUaNnZT1yfX3nRKqxV6dkG01idR
	mEP+rTJ1yMi+IYx524opDYBq9i6OGYAdYJUQeh6QX17miiblDzDb0HzF3JYUCVGqibtF+n0gnLgzL
	YHli+BvA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:57452 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXnPA-0000000CftF-0m0d
	for docs@lists.yoctoproject.org;
	Thu, 11 Jun 2026 17:57:40 -0400
Date: Thu, 11 Jun 2026 17:57:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: Emphasize that use of Subversion is uncommon
Message-ID: <4e4b3cbb-27ed-e6b9-7369-2f190cf3969f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 21:57:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9700


At the moment, there does not appear to be a single use of Subversion
in numerous OE layers, so mention that it is effectively deprecated as
an SCM even though it is still supported.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
index 3ca9079b3..c22456aef 100644
--- a/documentation/dev-manual/external-scm.rst
+++ b/documentation/dev-manual/external-scm.rst
@@ -11,6 +11,13 @@ This only works for SCMs from which it is possible to get a sensible
 revision number for changes. Currently, you can do this with Apache
 Subversion (SVN) and Git.

+.. note::
+
+   While OpenEmbedded still actively maintains a Subversion package and
+   its underlying ``svn`` fetcher in Bitbake and you can still use
+   Subversion for custom recipes, its use is no longer common in
+   standard layers.
+
 To enable this behavior, the :term:`PV` of
 the recipe needs to include a ``+`` sign in its assignment.
 Here is an example::

