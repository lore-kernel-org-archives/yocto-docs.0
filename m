Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC5ECD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 15:42:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1733.1779205363092991736
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 08:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=T37+5tgU;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mZ+l1crevjg3tY/2wZMEa+rTdBtrA2r3TSuM5kWDwjs=; b=T37+5tgU/D07xa1yocas0fe6hS
	U5xZsF3kd5+bZmciaSC8Wiw8EgJ/8AUCfkticcmFbnHkuDVaTEYEKMhflvKsggoUsMglw/aqYIi/9
	9ow1QiwVlS/+HiPnj7yYh6JYFVUZRLdcdnJXYvLXEuvbAJSw5D/bjepJ3bof/gEU1ZxYpNeeZEaqo
	hZ3b9pc/7WMp/kNpxQzEfFn683JSKfjm7k4pOXwIlK0t/VQEr9gIVrqoIQZ9cX/RrVSlHn0JPhG6g
	nsQd9/fSy2k8Kzme/pN6/VWTptq4VJ+QhFRdYDPT95gLQ2qBAGNu6Lsu8x75qmnNhQZXwWs9JeOOP
	wPvqkC+Q==;
Received: from [147.129.179.166] (port=44008 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wPMae-00000009FIe-02rG
	for docs@lists.yoctoproject.org;
	Tue, 19 May 2026 11:42:41 -0400
Date: Tue, 19 May 2026 11:45:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: fix typo, "semi-colon" -> "colon"
Message-ID: <4ef4fd8c-d455-4382-352f-d8e3c44e73ac@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 15:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9493


Obviously, this sentence should say "colon", not "semi-colon".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ec5babe4c..c4cced2ca 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -910,7 +910,7 @@ root filesystem on the target, and must *not* make a reference to the variable
 .. note::

    The list of files for a package is defined using the override syntax by
-   separating :term:`FILES` and the package name by a semi-colon (``:``).
+   separating :term:`FILES` and the package name by a colon (``:``).

 A given file can only ever be in one package. By iterating from the leftmost to
 rightmost package in :term:`PACKAGES`, each file matching one of the patterns

