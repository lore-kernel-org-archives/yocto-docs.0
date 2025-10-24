Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EF7CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 19:13:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.1702.1761333214432772475
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 12:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=yyoZ1eb/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PyZVLcTAynlZOQhTWftLNMVEX4HW7EH3e6g22y1cCl0=; b=yyoZ1eb/By4LGrMFdljm0wIP1V
	YwdOLE8jeFB8hZ5IaskfyR66xRNGJp1GDT3Ow6XWqWr4Xj5jyEtDC4lUnRhSRB4mTvYoVli8e4KeS
	zbH7KhXVfsG6ThOj+N7oRzUbFfJ9R1JLFhO9JapCgUPYMCbBP3kf9E0xCojX3tF3vlNDcCz33mQPX
	LSdocppLvBfTSDJJ3rbhAUO+OMXBQDvY+eBZkJ+bkKN81inX2uPXM/5ZuKty4/Jr7Oh8y/dWS/uR1
	HlnrjWW+D0Iw6AcBrz3X6xSvfywANyfjJ4iSrR5vVgdQD9lhalw6PvPIGgFdVWrGl+/dgqXJr0mxQ
	tBCT8NbQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:33560 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCNE4-0000000HIfy-3sKN
	for docs@lists.yoctoproject.org;
	Fri, 24 Oct 2025 15:13:32 -0400
Date: Fri, 24 Oct 2025 15:16:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "https://git.yoctoproject.org/" versus
 "git://git.yoctoproject.org/"
Message-ID: <7a10e529-305d-5974-6ba6-5694b8555608@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 19:13:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7838


  it seems that the docs bounce around between those two URLs for
git cloning YP source ... should the docs standardize on one versus
the other?

rday

