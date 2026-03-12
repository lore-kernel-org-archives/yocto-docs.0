Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CF9105A59E
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:29:31 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21348.1773322165354713512
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 06:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=xGX7BrSF;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p7nqHDEZ4d6nXjVdxjzNEh9L7LjFm5mHxki7QGv4x14=; b=xGX7BrSFPeGJYsdPmE1BKpqkOe
	LFtx6j4PMNXAhNsFrffP2Xhro2Bxjt2NYNswLQsf6392V+Jd1MI2lPO5wd6P7SbT7dLw03CGlQkn3
	xoeSAATgwCVfR3BN5DjuHCPCuZRc32YF3NjMfiHcTmqzhTyapXZZgDZ2YWi2+r5f3ya43OJK39ycv
	4uO8PuU5oz86ODIEcGJnOEuDOj94cVKMHapnztpNv7u8I3yX304iG+XhBQRnmN20+gxrtYigKBio4
	NVKwaJAL1mm1GDbwZY1RpSsCE1AkwdTFg/Owk79D+/p93kH4i1maTzPwrsSe56znYfnigwHO7u30G
	RKBxR54A==;
Received: from [147.129.179.166] (port=43480 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1w0g6L-00000004qBF-2hbu
	for docs@lists.yoctoproject.org;
	Thu, 12 Mar 2026 09:29:23 -0400
Date: Thu, 12 Mar 2026 09:29:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: any value in clarifying PROVIDES "=" versus "+="?
Message-ID: <010efd6d-de6d-28b1-b195-e28c3d3a25a7@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 12 Mar 2026 13:29:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9078


  i remember some time ago there was a short discussion about:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#providers

where that section *appears* to suggest that one should use "+=" when
extending a recipe's PROVIDES which, as we all know, is technically
not true since "=" is sufficient, *but* IIRC, richard purdie weighed
in and suggested that, sure, one needs only "=" *but* "+=" is more
visually intuitive, so should that section be reworded in any way, or
left as is? (i think it needs some rewording since that explanation
will not match what people perusing the code will find, and they will
get confused.)

  in addition, this points to an example of what i brought up once
upon a time; that is, "reference material" that is at least as
detailed as the manual content -- see the variable reference for
"PROVIDES" which is at least as detailed as the section from the
manual:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-PROVIDES

  in general, i'm of the opinion that "reference" material should be
short and to the point, and link to whatever longer explanation is
necessary in the manual proper.

rday


