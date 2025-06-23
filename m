Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07061C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 16:01:23 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.662.1750694474954578070
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 09:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=t6XZrSoN;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CdwzcOnKc9Ydxhitl3Gy4UU3XZt7DHGCFRrNF6LNDnA=; b=t6XZrSoNOFXgscMMeLWL6BFmUv
	yTJwH89nnoGdQMXn6VBeRTh7pmDpM6v7BcMZZEHNqxpCt8FV/AkUlbondXCvEw7FlzjFfytE6Wb4d
	rsZ5EFoBf5rUczgbWtMSCp5cbdp+vZOVF88KIsiaRxffHMti53U7c2RxeX+uivnuxzXoMHbYiZA8O
	jxbZiR8FL3kaMFrC9vYzsPnNttwAx1piijZLbpJpQehu8TJM4b6mrMe+OE0JqUb9fHpZpvAd0uFYk
	lsuAJLV2bsdLHrfuL4UK7Kuo+JdSSb1yb/e/oTcVGHnQaMxCE0BQpVKJFstmnXV4A8kmX51G5TttS
	6R3K2evg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:33578 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTjbZ-0000000BX5y-03ar
	for docs@lists.yoctoproject.org;
	Mon, 23 Jun 2025 12:01:13 -0400
Date: Mon, 23 Jun 2025 12:01:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: update strace references to current recipe
Message-ID: <67752b40-7e8c-71f9-f1e9-f6aed74126a6@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 16:01:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7169


Update the out-of-date lines referring to strace.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index c49881efe..44a10af23 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -276,11 +276,11 @@ upgrading the recipe to a future version is as simple as renaming the
 recipe to match the new version.

 Here is a simple example from the
-``meta/recipes-devtools/strace/strace_5.5.bb`` recipe where the source
+``meta/recipes-devtools/strace/strace_6.15.bb`` recipe where the source
 comes from a single tarball. Notice the use of the
 :term:`PV` variable::

-   SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
+   SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \

 Files mentioned in :term:`SRC_URI` whose names end in a typical archive
 extension (e.g. ``.tar``, ``.tar.gz``, ``.tar.bz2``, ``.zip``, and so

