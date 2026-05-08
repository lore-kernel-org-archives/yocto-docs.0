Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B0ACD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 18:37:55 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1357.1778265474431679446
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 11:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=NUEPeZ3N;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oVzF6Q2/yH+CcdD1KBcqItCDu6qFugvDwQs+/EFBk6s=; b=NUEPeZ3N7/3ARqco2159Aw6OP0
	1+gfwihWUu/fUhcS8EIpxTGjWFD3jWyfxzZq2UTanUv2MloHvT/KTQG+HGg+yWi5c9QFfUBAObLx2
	rpkOhX/sOudcth8qZcnasxFBb4HYvSPliETmy2d5/5F5upCLpu/WjPb4ek+roKi9hKq1DE2BbKdGu
	gJ4RvxwSSuZhVGWgagNNco1stiiAfdhrIlFT7cLuWphjtNSG950QEBC5mXpnDJeJ7Ni+lvK54yT2e
	OBVe8abd41wQ6ImtgFsmzwqDM1MgTUgYWyQ2egBuHxOVsehYT9p7o06y6VG/K58uHkv93Lcq//OJT
	EZ00v7Yw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:52308 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wLQ5A-00000004Jkw-02RB
	for docs@lists.yoctoproject.org;
	Fri, 08 May 2026 14:37:53 -0400
Date: Fri, 8 May 2026 14:40:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Quick Build using word "naive" sounds a bit condescending
Message-ID: <e9ecc3f8-c93c-caf1-eb73-de73633cda10@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 18:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9417


https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html

"If you are not in an interactive shell, dpkg-reconfigure will not
work as expected. To add the locale you will need to edit
/etc/locale.gen file to add/uncomment the en_US.UTF-8 locale. A naive
                                                                ^^^^^
way to do this as root is:"

  Can we not find a slightly less patronizing word? What is this
trying to say?

rday

