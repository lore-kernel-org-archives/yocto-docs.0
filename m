Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D4DCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 10:56:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17147.1780484166990973919
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 03:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=p3eTO56s;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gGfUS/7lge/t8vt9rgQTYjyJ7tQeOgCsXQ12quL/i7U=; b=p3eTO56sa91W6N+Dltx8DiG1Sr
	/CxrVw17ue55PM8hwH6ZSy9flUI5zmXMe9obxrEyZU6WOh6tEkaD43MTE5CeRRHRFgaK3QbvHgF1T
	R1EMZ+MPxYNjDjryRvZs0r6bi7gG6QSIhIxq5YXBh3eYJk8/kTgcxpTuJWYr0sggll1IeWHrAkWMz
	zYZVQahtFAWKi+TwIH0R0gJTCzp4xGHbvNKFThFJ/nCREMI2cGXsbelT0PfoixHIX4kX8CujrJmTH
	1mavlCM6VTB0jN3bPmywb6uYN5jb84nRKTZ4sSbRYW61X2O4uvWb3WFFziZ4meLFq3HbXacusiuYF
	QDbWuDqg==;
Received: from [147.129.179.166] (port=52440 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wUjGV-00000008Q8r-3Wah
	for docs@lists.yoctoproject.org;
	Wed, 03 Jun 2026 06:56:05 -0400
Date: Wed, 3 Jun 2026 06:56:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: add ":term:" for OE Build System
Message-ID: <648eea28-9d38-0be7-9971-f57f0a49a863@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 10:56:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9556


Add a ":term:" reference for the phrase "Openembedded Build System",
to be consistent with the earlier reference for "Poky".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/intro.rst b/documentation/overview-manual/intro.rst
index 80446b381..ffdbd3f83 100644
--- a/documentation/overview-manual/intro.rst
+++ b/documentation/overview-manual/intro.rst
@@ -19,7 +19,7 @@ Here is what you can get from this manual:
    about features and challenges of the Yocto Project, the layer model,
    components and tools, development methods, the
    :term:`Poky` reference distribution, the
-   OpenEmbedded build system workflow, and some basic Yocto terms.
+   :term:`OpenEmbedded Build System` workflow, and some basic Yocto terms.

 -  :ref:`overview-manual/development-environment:the yocto project development environment`\ *:*
    This chapter helps you get started understanding the Yocto Project

