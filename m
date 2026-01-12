Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA6ACF45B0
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 17:18:15 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38444.1768238293421387015
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 09:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=eg2qqqr1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yzsvjNylMK0IaBZ/ugKUxhx67uEvhp/Sr3emFlzssoI=; b=eg2qqqr16OTPfmG7NYsobu8i6S
	AkYnchCY+Vwj7OUqdZQusE0tqkAcBxdZnBOoar12j3P4Rd+wk8YQt4I+pV4CmnkwgcXU2ZQm+CizK
	Qaa6fqv4S+Bnor0G9D6Ndl3obE9fRZ5OeXOIDectTz+x/E4tCd343mByT73baiN89ZXLipIHHfdMQ
	xv+1Syx5nJsXLyHJWRalk4N7i2zazC5aHPb0XyGGPSQ8I/wv2syuGYOLzmG0qoS3hIE7sr6KLQJJu
	q6NAwBW7p5pcVJMdQBgBFXv+wTraUHY13W557cc5uawo/v70eIjT6bmoDNAnaF/9FqyaKA+ruYDrb
	N+hyQqjg==;
Received: from [147.129.179.166] (port=44422 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vfLYQ-0000000Gddw-43jP;
	Mon, 12 Jan 2026 12:18:11 -0500
Date: Mon, 12 Jan 2026 12:21:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: quentin.schulz@cherry.de
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] why is "configuration fragments" in monospaced font?
In-Reply-To: <e118a38e-0e45-49f2-9010-01c1a4d7d1ad@cherry.de>
Message-ID: <21105206-6e15-da26-2da0-de604fc4c905@crashcourse.ca>
References: <7dbf2502-1403-3451-ea27-45aeae758032@crashcourse.ca> <4c7492bc-177f-4bb4-a8f4-cc19323fd242@cherry.de> <d59faeb3-8e61-7023-cc26-3918de5f0ab0@crashcourse.ca> <e118a38e-0e45-49f2-9010-01c1a4d7d1ad@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 17:18:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8470

On Mon, 12 Jan 2026, Quentin Schulz via lists.yoctoproject.org wrote:

> Hi Robert,
>
> On 1/12/26 5:50 PM, Robert P. J. Day wrote:
> > On Mon, 12 Jan 2026, Quentin Schulz wrote:
> >
> > > Hi Robert,
> > >
> > > On 1/9/26 12:45 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > > >
> > > >     more nitpick ... here:
> > > >
> > > > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#sharing-functionality
> > > >
> > > > last line in that opening section, why is the phrase "configuration
> > > > fragments" rendered in monospaced? is that meant to be an actual
> > >
> > > So it doesn't feel left out with addfragments right after being monospaced
> > > too? More seriously, I don't know, but I wager the intent was to make the
> > > text
> > > italic as to highlight that it's a two-word term?
> > >
> > > Would you mind sending a patch for it?
> > >
> > > While at it, I think it makes sense to modify the "``addfragments``
> > > directive"
> > > part with a link to the section in the docs. Maybe another patch to send?
> > >
> > > Also, this pertains to bitbake user manual, so I think it'd make sense to
> > > add
> > > the bitbake ML when asking about bitbake-specific docs (both BB and
> > > YP-docs ML
> > > that is).
> >
> >    I notice you just posted a set of patches to fix a bunch of the
> > references, but it also seems that there are different syntaxes being
> > used for some of those references. What is the blessed way to name and
> > set references across the YP docs, and the proper way to then access
> > them? There seems to be a lack of consistency.
> >
>
> Can you write down those inconsistencies so we can discuss them?

  let me check if i didn't just misunderstand. it might be that i was
confusing how one refers to am implicit ref associated with any
section/subsection, and the longer form associated with an explicit
ref definition.

rday

