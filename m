Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D967CCDE000
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 07:47:22 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1897.1782287239965709493
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 00:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=KwzXEMbZ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hV6ijSmmFoNebE+4DvavzoG6nICKz+8e25mvo1OEl2g=; b=KwzXEMbZfqvPyhlKFORHMWdmJJ
	UxXScEORqEgXSJ4wiqpA8wzsC3vOUlHa3OoFtZWELzAH0fcpJZOrallMmMfswDYAX+0h4bIhrT/cg
	x5jtBrqjeSx1AQLzp3st5gH1kLLCS2yLTa+wMCqrHkgPClEZ6UNOi3FzsxF/V96GHcQQFPC0OcUe6
	I5ba9fWc94uq1M1f5hm05DNb1etzegmpq0j7VAik/2ANv6AYA0bBXFHZcFVApTxzx2moq06vY9iX+
	+czIiepCo9y0q1h1g62nHqDA14zqUF04UmBNkv1rLrXCdXSXKpn1cS6Fp9xIQ+hAgXTCFf6PjGVn/
	bmp+Cvnw==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:35966 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcIKI-0000000F0Dx-0vSK;
	Wed, 24 Jun 2026 03:47:18 -0400
Date: Wed, 24 Jun 2026 03:47:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Paul Barker <paul@pbarker.dev>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Zaurus? Really?
In-Reply-To: <ff53860cb34e588fb2f3d6ecb46cbb33f9a3b13d.camel@pbarker.dev>
Message-ID: <4313ad65-0b32-cac4-8baa-6ae82a12c6c1@crashcourse.ca>
References: <023dcad6-da72-e084-4c4d-5149ebaf0e79@crashcourse.ca> <ff53860cb34e588fb2f3d6ecb46cbb33f9a3b13d.camel@pbarker.dev>
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
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 07:47:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9848

On Wed, 24 Jun 2026, Paul Barker wrote:

> On Tue, 2026-06-23 at 14:29 -0400, Robert P. J. Day wrote:
> > here:
> >
> > https://docs.yoctoproject.org/dev-manual/debugging.html#other-debugging-tips
> >
> > there is actually a reference to a Zaurus. how many readers are going
> > to recognize that? :-)
>
> Perhaps for those who do recognize it, it's a nice little easter
> egg. It's harmless, and it's good to keep some character of where
> the project came from.

  the irony is that i used to own one.

rday

