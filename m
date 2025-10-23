Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8669CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:48:41 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.16464.1761212912877113193
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 02:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=pG8yCGm1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Unhoy+4OFS8gPeg0AZv448DjhmZjt4EgCSUn8xDAz0U=; b=pG8yCGm1szvloSJS1WWbklQ7pP
	BgeMoz2sAz5Zp7U5PN9R+7tV0MPL/Eqz53ajyFaFzhyj4ZYNtVQN4DOcgG72ZXBbF+25zP7JDCOTj
	ghqBlpbuSS2kZR8ItLkc1waQ3S3Hehy/OZN8JaYeDdFfRMmlbxoKrLmahCwqoKpvj9ns7Rdl5djjq
	S5+5i1pdOq+/p3rtfiLKG27EizY47ozq/w94CYz6ADq4MC5aisSRflx+rFH3wsIrGpso7crumQtdo
	wFMA5BdcrdJSSUgwLL+VDGgZXiR1WP/TD130FiLaUjPAaR6OfYwFmkCyVW3aGIiKjxEs6QE+0XwOP
	i89z1lBQ==;
Received: from [147.129.179.166] (port=40962 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBrvn-0000000Bu9q-2ob0;
	Thu, 23 Oct 2025 05:48:30 -0400
Date: Thu, 23 Oct 2025 05:50:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
cc: raj.khem@gmail.com, YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] political question: which vendors should be listed as
 providing support?
In-Reply-To: <1c03195e-e70c-4523-900c-b6469f7975a7@kernel.crashing.org>
Message-ID: <1fe3bad1-8226-b22d-ece0-d918a193db3e@crashcourse.ca>
References: <4b7c71ff-0697-b099-0764-3cfdfbee1313@crashcourse.ca> <CAMKF1srZwLCmPYfMeg_SnNjHYfVV0AHKK6QJWON03AyMbSTy0A@mail.gmail.com> <cae364e5-12b4-e69a-fa62-dfc37d3c2d4b@crashcourse.ca> <1c03195e-e70c-4523-900c-b6469f7975a7@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-301182117-1761213067=:889010"
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
 <docs@lists.yoctoproject.org>; Thu, 23 Oct 2025 09:48:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7782

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-301182117-1761213067=:889010
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Oct 2025, Mark Hatle wrote:

>
>
> On 10/22/25 4:00 PM, Robert P. J. Day wrote:
> > On Wed, 22 Oct 2025, Khem Raj via lists.yoctoproject.org wrote:
> >
> > > On Wed, Oct 22, 2025 at 1:37 PM Robert P. J. Day via
> > > lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> > > wrote:
> > > >
> > > >
> > > >    reading here:
> > > >
> > > > file:///home/rpjday/oe/layers/yocto-docs/documentation/_build/html/overview-manual/yp-intro.html
> > > >
> > > > and that page states:
> > > >
> > > > "commercial Linux vendors such as Wind River, Mentor Graphics,
> > > > Timesys, and ENEA could take it and provide ongoing support"
> > > >
> > > >    well, sure, but there are a *lot* of other sources for support that
> > > > are not listed there that might deserve a mention. perhaps that
> > > > sentence should include a link to, perhaps:
> > > >
> > > >    https://www.yoctoproject.org/about/participants/
> > > >
> > > > or at least a more all-encompassing list of support providers.
> > >
> > > I think a link is a good option provided it is kept uptodate.
> >
> >    I'm sure there is a significant difference between "participants"
> > and orgs that provide actual support; I'm just saying that the list on
> > that page is awfully short and it would be useful to have a separate
> > list/link for support providers. How one gets onto that list is a
> > whole other issue.
>
> (in the distant past) it was always expected that list would be
> updated or pointing to another page.  The text that is there is
> based on the original membership of the Yocto Project, and I suspect
> does need to be updated.  IMHO members (not participants) should be
> the ones listed.
>
> The original list was based on OSVs specifically, but this can
> absolutely be word-smithed to be more generic then just OSVs.

  Well, this is not something for which I can submit a simple patch,
so I'll leave it for someone higher up the food chain.

rday
--8323329-301182117-1761213067=:889010--

