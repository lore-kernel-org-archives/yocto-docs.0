Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC02FCD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 11:06:19 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42957.1781175975721833962
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 04:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Qhv0GuHH;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5sqWKM+CKzCnwfXcTAPurKXhfs0/GQRqcMaFQi9g9so=; b=Qhv0GuHHWs4SbA/YYxQYl3OgL/
	RRj7A9a12+ejiStBxiV4GgLqzSdCrPVOIpFszrp8bGX/uCkNTNh+PIUzC7qPqkIoU+4fUVC4iD4VL
	ErRj0vP5suqMKAFSysCwn2BMBfmYWhJyGP/UH4OoZNUENX8RXqSaJ0CvsFOL2D3uxB2lNEvA4KH7i
	mlxKaR8NCWBUFVKE2RexarweC/Ru1I2IB0q72fcFHJwGB1I6DUySDKqhVLpY3Y02OsmxV1pv8tGpg
	J9FCmUSkB8gemEZV7mKyh6BkDjJc2osUXb6o7GXqd9RT6Xfg92voCmjplCHQz9tgcCZon3MUpZqXS
	TJDAfRNA==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:38370 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXdEj-0000000BPyv-1yW4
	for docs@lists.yoctoproject.org;
	Thu, 11 Jun 2026 07:06:13 -0400
Date: Thu, 11 Jun 2026 07:06:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: fix broken grammar in "Libraries" section
Message-ID: <e9b3258b-c745-860c-0da8-7e3ed1f1389a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 11:06:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9692


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/libraries.rst b/documentation/dev-manual/libraries.rst
index 697ea48e4..160734729 100644
--- a/documentation/dev-manual/libraries.rst
+++ b/documentation/dev-manual/libraries.rst
@@ -202,7 +202,7 @@ Here are the implementation details for the IPK Package Management System:
 Installing Multiple Versions of the Same Library
 ================================================

-There are be situations where you need to install and use multiple versions
+There might be situations where you need to install and use multiple versions
 of the same library on the same system at the same time. This
 almost always happens when a library API changes and you have
 multiple pieces of software that depend on the separate versions of the

