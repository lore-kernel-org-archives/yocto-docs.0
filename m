Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8E2CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 12:16:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19673.1779192974064959438
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 05:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=m4rqAnnK;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LiNF0h2XdsMwDD/ufbKl+iX3W4Oz7Ipm8xfxIjyQIfo=; b=m4rqAnnKqMAxweVJ0qk6WVomrd
	V6mVslO0P4bpKaYwKALZFE6mnKVZWu5O4HBSuShCiyiTztv8SqNQcjm5iClmtqY8VKBSxDDC74qKM
	Ko5WLIKi+l9lCjA8sB0CQuuxdZY34tDTfRZ2SGyifcEw3nvrPUxgF41rzZxCFC9Lf9cMaFUWoptW5
	tPYCGOAZdtyPQbrWoScfKuyieU16TCG6jL6Gp9Srjs9ZdV7OpxNi2fi3L8aFeSNfoZJSLvdWES4UH
	dVu65X+Q5mbxHyFldL1ynu5wZH2Cm5fDpPgzzYsrPpk7TC6FewRl3gwRq9HgOrcYhWK982HV7KTc/
	VSCKR6XA==;
Received: from [147.129.179.166] (port=43028 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wPJMo-00000008pgq-44DU
	for docs@lists.yoctoproject.org;
	Tue, 19 May 2026 08:16:12 -0400
Date: Tue, 19 May 2026 08:19:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: contributor-guide: fix typo, "maintainance" to "maintenance"
Message-ID: <68dd7e77-a274-120c-5fd1-9dd4ea2c8fbb@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 12:16:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9484


Correct "maintainance" typo in recipe-style-guide.rst.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index d0cb65295..79bf7c79b 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -315,7 +315,7 @@ following status strings:
    No determination has been made yet, or patch has not yet been submitted to
    upstream.

-   Keep in mind that every patch submitted upstream reduces the maintainance
+   Keep in mind that every patch submitted upstream reduces the maintenance
    burden in OpenEmbedded and Yocto Project in the long run, so this patch
    status should only be used in exceptional cases if there are genuine
    obstacles to submitting a patch upstream; the reason for that should be
@@ -346,7 +346,7 @@ following status strings:
    The patch is not appropriate for upstream, include a brief reason on the
    same line enclosed with ``[]``. In the past, there were several different
    reasons not to submit patches upstream, but we have to consider that every
-   non-upstreamed patch means a maintainance burden for recipe maintainers.
+   non-upstreamed patch means a maintenance burden for recipe maintainers.
    Currently, the only reasons to mark patches as inappropriate for upstream
    submission are:


