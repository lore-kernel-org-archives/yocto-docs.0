Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948DDC52D1F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 10:09:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.39689.1722420558334735232
 for <docs@lists.yoctoproject.org>;
 Wed, 31 Jul 2024 03:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=x0Cc2Mpv;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yMjCY3VWGJTZ6V907Ey4zymsXL8r/XH3myyBHxD+XVc=; b=x0Cc2MpvyNibyCJOWLYMvn4FCC
	lI4hwLHmD3xgyqpgiUVC3TlLIBuEDr9dyj0jUqpE2yMjNi/aEv0oAcUApPpXe/Vy0tO0uprLBg0JR
	DavJXLw/ngGbl9I6RzYFu/qrO0qj1kz628uM+sDTtqHBxEqxT5B3nGCRtwaOXbMJRe5CGoi6CTX9v
	IgIm42XKQFrIE0l1qqTWBfyQ8Dn8bLtv7HiyHQOQwxb6Da0aCpgIUpCtVSCuQQp2JEJjtYbbgZifP
	FEVgHt3u91ru3W3wASowG3E+FmImdFkFcZFJOYv4BH3BnUCTRjpDdRty3BBcz3har4WgQY83ralDN
	qLo96vsA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:55950 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1sZ6Ge-0000000EWFB-0dp3
	for docs@lists.yoctoproject.org;
	Wed, 31 Jul 2024 06:09:17 -0400
Date: Wed, 31 Jul 2024 06:09:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: no mention of SSTATE_SKIP_CREATION in variable glossary
Message-ID: <8cc9eab4-8419-188b-1f2c-89ec78af5550@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 31 Jul 2024 10:09:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5331


  i see no mention of the variable SSTATE_SKIP_CREATION in:

https://docs.yoctoproject.org/ref-manual/variables.html#term-S

should it be there?

rday

