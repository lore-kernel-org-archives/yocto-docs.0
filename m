Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841DEC5B549
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 18:20:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.12121.1748715615096700320
 for <docs@lists.yoctoproject.org>;
 Sat, 31 May 2025 11:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=YQphgAUI;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GgslLX4yiXxtmyjN6lmoyfTm8TXbszY9wIjOsAw5yt4=; b=YQphgAUI/KNNsvSehjyTYqR3rG
	52pK9VgTF3BJi4lHeAZIeWtycC6aejn/qI7U2R6h6VbcYfw6Y/7qJDwre2yJLxdyyktjY4Q95sUyB
	6INsnpNE0jGbad2t2Lo9TBb/pT3xXd2RxkXFDl7AmRCDGRps7sixrLCGBYTJcBdYLNQXJMfigeNyo
	TdNt3hO9JaeTsuIQHRcCT8rwtzIc2X///+rsAuDIi+yZAqXEubUyNUjHftjI688yZGiHarKjmKAIN
	m8NZTEqxZhZZahG7pZuvyAgHtcC3/ZpIlxEbHJC3IBx5a1VrUhW8NQYfd6SzwlkIAD2Q8YuRVT7Gy
	Q+HA8QTw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:47074 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uLQoW-0000000AsZy-0GWT
	for docs@lists.yoctoproject.org;
	Sat, 31 May 2025 14:20:13 -0400
Date: Sat, 31 May 2025 14:20:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Quick Build: Should "liblz4-tool" say simply "lz4"?
Message-ID: <b02ae2d8-3b30-91aa-f71a-6d0101b5c033@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 31 May 2025 18:20:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6952


  Just noticed that in YP Quick Build guide, the alleged list of
essential host packages includes "liblz4-tool". It seems that, at this
point, that should read simply "lz4", no? At least on my 24.10 system,
there is no liblz4-tool.

rday

