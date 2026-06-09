Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A116CD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 12:12:14 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78438.1781007125276898960
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 05:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=fb7DB4QH;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UHfo+mmEBD8bZJVFbzM5rDBOpsm9wLi4YGrLGaWfkoc=; b=fb7DB4QHrDtw/nspqIwZXpqw+4
	8FR9AyPg0qTpsXe/QeCIRbS5Z3bghfMutvAFEsU/Z4jgUq83YZZXx8vTeTuByYLAZ2v7gglSYl88C
	Q7CohK6XWy6lyyfrdQ0UMmWfZ0W7ljZMGsEPqaPEAJa3EPMlxbTa8lQNoy+4heeei4kO/DJ8DJArH
	aUMayhjSlmoZqo5hvzEvAuvWoQ+Z5oA2KUqzv9rlf2REnLNpkQXZhZdGm1uaFYZmPnWBKHvH4KSAy
	SQVn7OjAAJ+sJpxHtDLTgOMllpIifVkRb03CPgAqOHE0gDfuvMFUyQ3pz/dqtXxfg7Cv6UKrho0iA
	Gi/4xkqA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:58630 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wWvJK-000000063bu-3GQA
	for docs@lists.yoctoproject.org;
	Tue, 09 Jun 2026 08:12:03 -0400
Date: Tue, 9 Jun 2026 08:12:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: replace period with comma in list
Message-ID: <7c04f7ec-cc79-147b-dbbd-bd59f64d82cc@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 12:12:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9662


List of checksums needs a comma, not a period, in middle of list.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 82c7ff4b2..13d5e3e38 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -315,7 +315,7 @@ fetched from a remote server other than a version control system,
 BitBake attempts to verify the files against checksums defined in your
 recipe to ensure they have not been tampered with or otherwise modified
 since the recipe was written. Multiple checksums are supported:
-``SRC_URI[md5sum]``, ``SRC_URI[sha1sum]``, ``SRC_URI[sha256sum]``.
+``SRC_URI[md5sum]``, ``SRC_URI[sha1sum]``, ``SRC_URI[sha256sum]``,
 ``SRC_URI[sha384sum]`` and ``SRC_URI[sha512sum]``, but only
 ``SRC_URI[sha256sum]`` is commonly used.


