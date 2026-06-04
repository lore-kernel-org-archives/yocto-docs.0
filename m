Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6CCCD6E57
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 09:34:31 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7442.1780565662239126392
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 02:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=YoQ4mUly;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3YgUm8bX7z+gDpTgUtlSiogKX4gmWsIyXASb1DsXGmU=; b=YoQ4mUlycKjwToDrPjhN+wjj+N
	0ptJyjO9UoXYgTf5V4aQv97rmlGx2jzGn17Ybi8fSFbc7zBRPp6OVsmeRJ7fyKeLPtxJQNB9mTm8q
	WtlEHQF+A9sm454aEpX5Gg4moPw9yyKk0JotfR5f2rXOXl7TH4MEuk/sCSORnV58LexCWZMf1/oNV
	f8bTu6E8Q9Me/XEzdahxkOePjnmNHOZp+UeaVHvhkKYgCWBU6jPYIqZKT09uLJgf+hRfMjCl2Ori4
	6w+MO3ZgjWBBkPepA8LBCwrMQr35tpS9mJ7qIQJPpUOAxUDGUIa4grCAnZI05yJURQFjLXy09HeXv
	v1sXovUA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:45368 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wV4Sw-0000000AqXA-3Q9w
	for docs@lists.yoctoproject.org;
	Thu, 04 Jun 2026 05:34:21 -0400
Date: Thu, 4 Jun 2026 05:34:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Overview Manual graphic still uses old "BLACKLIST" terminology
Message-ID: <5d34a080-f180-aca6-45b4-98b399f4e69c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 04 Jun 2026 09:34:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9577


here:

https://docs.yoctoproject.org/overview-manual/concepts.html#application-development-sdk

on the LHS, you can see the old "WHITELIST/BLACKLIST" variable names,
since replaced by (i believe) ESDK_LOCALCONF_{REMOVE,ALLOW}".

rday

