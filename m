Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF36CF31B7
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:24:06 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5692.1763555045840593973
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 04:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=QyKDEhqg;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LGK/90n+hRQGWaj53LDkEjsYq/Z/edrQmt7EOLFTbFk=; b=QyKDEhqgZONBnRPPO8GymWXMXm
	Evw8BExbEZ5iiK6/lWoukGX1cP1pSPhCrfABbmhYZRx395o4y9wumW+k23koFC5/HqFUa3hfSrh/0
	CBzmwzdSplsGKECDC3fupv0t4GTQW8yUt9grviA3ECCAiz7JwaTPYcdrT+plcPtgm2J8PIQRBn7ar
	wEaM39qwzayhDXgqwKrFIG5Xkz3agDz5iaWwcp6PZ1RmflZaiNdLOXFfJUA9j5mtxHM3eDPnWv+mp
	jNXEY1XOeAHp69RLDzk+vCaTlcqg7VWT31Po6ar5IQoo5t/tJi7JInYwL4dRWTaa2zniDvt1xeF/9
	tqe5dXLQ==;
Received: from [147.129.179.166] (port=47896 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLhE9-000000030Ec-0jkJ;
	Wed, 19 Nov 2025 07:24:04 -0500
Date: Wed, 19 Nov 2025 07:24:35 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] can the assumption of building on ubuntu be relaxed to
 debian?
In-Reply-To: <6b46cd9b-8e24-4edd-9051-c9c0f03617e8@cherry.de>
Message-ID: <24ed6b79-82e5-43ed-ab11-d95792d04979@crashcourse.ca>
References: <24bb11b9-85c3-9dc8-e655-b630dbbcbe9d@crashcourse.ca> <318bddb4-bd28-4be5-87bb-4262076bd495@cherry.de> <3ae9ad48-13bf-1afc-6ccc-3bff1fddc8a1@crashcourse.ca> <6b46cd9b-8e24-4edd-9051-c9c0f03617e8@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 12:24:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8082

On Wed, 19 Nov 2025, Quentin Schulz wrote:

> On 11/19/25 12:44 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > On Wed, 19 Nov 2025, Quentin Schulz via lists.yoctoproject.org wrote:
> >
> > > Hi Robert,
> > >
> > > On 11/19/25 12:25 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > > >
> > > >     i ask this only because i recently moved off of ubuntu and onto
> > > > generic debian 13 ("trixie").
> > > >
> > > > here:
> > > >
> > > >     https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/
> > > >
> > > > one reads in that initial note:
> > > >
> > > > "The examples in this paper assume you are using a native Linux system
> > > > running a recent Ubuntu Linux distribution."
> > > >
> > >
> > > I think it can be relaxed to "a native Linux system running one of the
> > > officially supported Linux distribution listed under" pointing at
> > > https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#supported-linux-distributions
> > > which is what we test BB/YP/OE with through the autobuilder as far as I
> > > understood.
> >
> >    i wouldn't go that far as the examples in that guide do indeed use
> > debian-based commands ("apt"). i'll give this some thought.
> >
>
> We should probably simply link at
> https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#required-packages-for-the-build-host
> instead of duplicating the instructions and being at risk of having
> conflicting or outdated instructions in one place or the other.

  i like this ... that "Build Host Packages" section could be halved
by just pointing at the "required packages" section. i'll take care of
that shortly.

rday

