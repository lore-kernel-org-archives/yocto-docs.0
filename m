Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A8FD185FE
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 14:05:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6997.1767881149115179190
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 06:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=vASir0dq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MIK5aJ9JhzQjqVz0xxr1wmgNvvVDPVLvR2PtGh1i4eU=; b=vASir0dq95XYzteqZ4lrS2Q02J
	0XFIzVj9CGvODuuz17SULi9DC7ItSzCPdj4bqln4GJDTzObsSKFgcOs6pL42WeayipMPLZMg+JAlK
	MnuR4qj+oQUn5c8OvS8cj4dF8fjyYZsH8CHRb5Z1OP97DgbEee4c9ub1PaceGunldjoG1hQGbdAWX
	2DJW5grDf5vx9lwhOIIKGZOKEaF4rygUttj99B9cCGOlAHvDkL8hZVSaJqpEns8UF/Ipzrao3atbb
	mGf9GQxsh+lFzswrLS8g6QfH3tBiSrRmpTXPXQHbK71D/yx3QmY3C3cJr6ek8mH4IqMNzAupsVFfb
	YHo5gXmA==;
Received: from [147.129.179.166] (port=51258 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdqe3-00000001gMO-0NIk
	for docs@lists.yoctoproject.org;
	Thu, 08 Jan 2026 09:05:47 -0500
Date: Thu, 8 Jan 2026 09:08:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: bitbake user manual oddly does not introduce "bitbake-getvar"
 anywhere
Message-ID: <61953ee3-7cb7-7b00-7d16-3faacc5d4058@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 14:05:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8422


  sort of related to the OVERRIDES discussion from yesterday (on which
i will have more whining in the near future), but was it a conscious
decision for the bitbake user manual to not introduce the
bitbake-getvar utility, especially since it can be used throughout the
manual to verify explanations?

  regarding yesterday, it would be particularly invaluable in the
section on overrides to display the final result of various
operations.

rday

