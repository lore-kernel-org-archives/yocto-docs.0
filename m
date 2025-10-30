Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3F0CCF9E3
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 12:10:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.24183.1761826239255924820
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 05:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=qYWkbYMZ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z5wTXb26ArIBVpPGztE6nwRyii07GsirFeo39ht9Ntc=; b=qYWkbYMZtA58tGMf5T5y+1iazU
	vTLVXkqhSh7N5J9SPrfmA43HlatwslYsIsStC8D79lcaP7bHrWH8LniKeBjSphGOxUy4SMh5AWZma
	FAlNW7Ny29zs4MdrAAV4wuZA2eNaCgWjyAXO7MtTrc86prhfQdac7/pp+enFX3Vnb6RT3wGeqOP9d
	y4yikKTeaegdaXL6xvBZTD2BGLTrALA8sRbLrvINH935zrMZDtrNOVzfsDoMttqXGn5fjoeVj//1r
	h1mqDO9sx6TUvcWvGqNo31NmVDE7SaN8k8j7bwEF4AaM3agWpFry4EWF9T9XT0IU+TyqcUyPq+fqK
	rKYbVy1w==;
Received: from [147.129.179.166] (port=48800 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vERUA-000000020kF-2Iuf
	for docs@lists.yoctoproject.org;
	Thu, 30 Oct 2025 08:10:37 -0400
Date: Thu, 30 Oct 2025 08:13:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual/new-recipe.rst: typo, "whith" -> "which"
Message-ID: <f5c9043d-4e1d-426b-58a3-ebf485c74871@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 12:10:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7917


Fix typo "whith", should be "which".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index aa4fb97a4..56a50efbe 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -439,7 +439,7 @@ Licensing
 =========

 Your recipe needs to define variables related to the license
-under whith the software is distributed. See the
+under which the software is distributed. See the
 :ref:`contributor-guide/recipe-style-guide:recipe license fields`
 section in the Contributor Guide for details.



