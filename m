Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4237CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 13:49:10 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21979.1779198542470546653
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 06:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ryDLGWu2;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9Ua8L9BAGNQiiNnOPMyH51Z0raVqv8JKbsQX0GaecFM=; b=ryDLGWu2eG20AEP+JIO8zkRsNp
	0LelraPLBcuzVxpSGaNMBTvb+kw5M3NpKQ2rRqkk8BIj+TM8uy0sq8/5zPbOQePnZuiL0bOaJDiPd
	xAOg9Dn4D0MNTdoB+9icI0UlfaUJ85vDzUdIIwmK7hyMhJyzhYLZHgQa2c5nCp8aLMdFF8lOaE7CN
	1IirPI3TQtPVrfJnukXpv4PZAgrOS85FCE1qO5XOnProDs7apUyHWNPSSold5iB2RZpyRwTvaZxjb
	/GeBWjx0fzktIIq1VN8Ag52vgLi8sKJaI3AswBN4rcQiNDS2nPpIP7K/DCtubGVsZ3O2aI7I2nKg/
	Fhjd9DoQ==;
Received: from [147.129.179.166] (port=37654 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wPKod-000000091up-2Fp2
	for docs@lists.yoctoproject.org;
	Tue, 19 May 2026 09:49:00 -0400
Date: Tue, 19 May 2026 09:52:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: remind reader that meta-poky is a distro
 layer
Message-ID: <6d2c5a08-67b6-58cd-ac67-4cd85805a530@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 13:49:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9486


Even though it's mentioned a little earlier on that same page, when
defining the properties of a "Distro Layer," remind the reader that
"meta-poky" is an example of such a layer.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ec5babe4c..06e888799 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -395,7 +395,8 @@ configurations into their own layer. Settings you provide in
 in your ``conf/local.conf`` file in the :term:`Build Directory`.

 The following list provides some explanation and references for what you
-typically find in a distribution layer:
+typically find in a distribution layer (recall that
+:yocto_git:`meta-poky </meta-yocto/tree/meta-poky>` is such a layer):

 -  *classes*, *classes-global*, *classes-recipe:* Class files (``.bbclass``)
    hold common functionality that

