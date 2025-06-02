Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91152C5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 13:42:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.50149.1748871730381038303
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 06:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=PutjxuNB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fyG0eTVE2sUhqOmKP8gP6qsRzF2kWu9DgChzx9pAeg8=; b=PutjxuNBFTnC5tsEAmRbwfSxyn
	QQv9nkvmcJCgzzgY6dg0AtdTeG32RtjtZGDN3zIxeHLr+1J+y10drxlfNgHPC7//zcw/I4Le1Zb6M
	9xkcSndaCwxm6LhwZAMcOBPQK3VrD7eSuMf/HNcfqf74JGk83/5WQpQ/aibPVfUK7z6URaoHAloMj
	hiCxMNd3Fri1YyOpiLDEgLl65CGMAvFL5pdEVeajyuZnIZdZiQTXRoJUU4UFechgDKtuo1XIm0exF
	8Wq6u1YZW7JwvXrhYZpHQ94OwzYgz1AKdNZTCSrk1aOhjjOjlFDLHkNI3eZwNvBXEr0mS383zjKOM
	sis6VkQg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:55316 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uM5QT-0000000HHDs-40XC;
	Mon, 02 Jun 2025 09:42:07 -0400
Date: Mon, 2 Jun 2025 09:42:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Any objection to discouraging the use of "PROVIDES +="
 in reference manual?
In-Reply-To: <83a0be71c4f60e239433414463972ee89bbc6f29.camel@linuxfoundation.org>
Message-ID: <7f98aab7-1117-1452-a36b-8957d6510bd7@crashcourse.ca>
References: <0ed60e64-5e7b-1d7e-4d9b-eb5e8ede5341@crashcourse.ca> <83a0be71c4f60e239433414463972ee89bbc6f29.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-768105210-1748871727=:254868"
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
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 13:42:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6978

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-768105210-1748871727=:254868
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 2 Jun 2025, Richard Purdie wrote:

> On Mon, 2025-06-02 at 06:05 -0400, Robert P. J. Day via lists.yoctoproject.org wrote:
> > Given the explanation of "PROVIDES" here:
> >
> > https://docs.yoctoproject.org/ref-manual/variables.html#term-PROVIDES
> >
> > I'd like to rewrite that to really discourage the use of the "+="
> > operator with that variable.
> >
> > First, the example given:
> >
> >   PROVIDES += "udev"
> >
> > is not even correct as the current eudev recipe correctly uses only
> > "=".
> >
> > In addition, I dislike this Note:
> >
> > "A recipe’s own recipe name (PN) is always implicitly prepended to
> > PROVIDES, so while using “+=” in the above example may not be
> > strictly
> > necessary it is recommended to avoid confusion."
> >
> > That makes no sense -- to use an unnecessary language construct "to
> > avoid confusion." If that's true, then *all* uses of PROVIDES should
> > use that. One cannot encourage readers to use a particular syntax
> > if the recipes themselves don't use it.
> >
> > P.S. There are about a couple dozen recipes in OE-Core that still use
> > "PROVIDES +="; I see no special cases that need that so another patch
> > could be to clean all that up.
> >
> > Thoughts?
>
> In many ways I'd personally say += is more correct. If recipes actually
> did that, we could set the default using =. Since most recipes don't do
> that and trample anything the base config does, that has to use :append
> and we end up escalating. I also say this partly as I'd prefer DEPENDS
> were changed using += too and this brings symmetry. I suspect that
> previous discussions about defaults is why the manual is the way it is.
> That isn't to say the wording can't be improved though.

  I'll ponder how to phrase this and submit a patch.

rday
--8323329-768105210-1748871727=:254868--

