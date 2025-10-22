Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EFCCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 21:00:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.5587.1761166827302734069
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 14:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=xUru7nHh;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7xtIjRPBxKm7nGPBLSeQiGqzAdfzlgKjcDquHOWj1NY=; b=xUru7nHhSD5fhm7uXAFgkmCVa5
	Y/fmoMeWn3CNEGUxrmkl0AUffPJziIHgoGE4L94KJyPaGgB1z7XF6WpnGc1vmqTqfpzSV0JQvuzcy
	APkrmU0ZUoN1BUrDkUnX4N/X2C40hu9wgZXTGFwtkQwNR3SpK1Gx6npfNArcjkA9E2G6mBtUKSbBh
	NBI8yJayRfKP6qb1qkjxV4n1YQ7X4Lpdi7n689hkEZN9PhbVi7zhX+oNN43qPfbH69avJzjQg2h0S
	pMUkpeyYRENvDbj1pd6cEjdChOK7TWR//VNhoSWrxal3fe0YOU/bwCtfV/RToqbkyz5BjEgcRXx0X
	vQVw4k+Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:44138 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBfwU-0000000A3zo-3OEq;
	Wed, 22 Oct 2025 17:00:25 -0400
Date: Wed, 22 Oct 2025 17:02:52 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: raj.khem@gmail.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] political question: which vendors should be listed as
 providing support?
In-Reply-To: <CAMKF1srZwLCmPYfMeg_SnNjHYfVV0AHKK6QJWON03AyMbSTy0A@mail.gmail.com>
Message-ID: <cae364e5-12b4-e69a-fa62-dfc37d3c2d4b@crashcourse.ca>
References: <4b7c71ff-0697-b099-0764-3cfdfbee1313@crashcourse.ca> <CAMKF1srZwLCmPYfMeg_SnNjHYfVV0AHKK6QJWON03AyMbSTy0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1031915777-1761166978=:762222"
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
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 21:00:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7778

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1031915777-1761166978=:762222
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Oct 2025, Khem Raj via lists.yoctoproject.org wrote:

> On Wed, Oct 22, 2025 at 1:37 PM Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> >
> >
> >   reading here:
> >
> > file:///home/rpjday/oe/layers/yocto-docs/documentation/_build/html/overview-manual/yp-intro.html
> >
> > and that page states:
> >
> > "commercial Linux vendors such as Wind River, Mentor Graphics,
> > Timesys, and ENEA could take it and provide ongoing support"
> >
> >   well, sure, but there are a *lot* of other sources for support that
> > are not listed there that might deserve a mention. perhaps that
> > sentence should include a link to, perhaps:
> >
> >   https://www.yoctoproject.org/about/participants/
> >
> > or at least a more all-encompassing list of support providers.
>
> I think a link is a good option provided it is kept uptodate.

  I'm sure there is a significant difference between "participants"
and orgs that provide actual support; I'm just saying that the list on
that page is awfully short and it would be useful to have a separate
list/link for support providers. How one gets onto that list is a
whole other issue.

rday
--8323329-1031915777-1761166978=:762222--

