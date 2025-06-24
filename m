Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DFFC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:02:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.4776.1750759334317925543
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 03:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=OGba8rws;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Umsxap1ek0OwmsqCY9Olk+P9nppdu2e7AyOiD2NIG7M=; b=OGba8rws0t00cCA0/TRJFw/EOu
	y3cxOsKYf/DNUGnlIUwXONqHE6kpl43tyLvtf7fmjiL/eAbndHFmye64clb0RerSnyZ90Fr36z5Zx
	yMc3Fi7Z80xUzJMNoJVfZdrN26Yib9TBGNS5f7rZLvNEFQvur+XUK328WQO6HHEENe8SCFNp9SmFZ
	dXX9YUOTbV4SuIsEfJ6BtbeVIw2ZsYFHoUxhIsJKpVVtYD+l9hmKDI3yiLh3Z4DhUeo21s3O/KIaA
	Va+T4z0IKelQVX0/bEdetGjUkwZ9J1C1cACbr6bGx1+B7jKz1eP89T1dyLcnVaE6ait38z2vkWULE
	grMSWFsw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:53658 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uU0Ti-0000000EBWp-1paQ;
	Tue, 24 Jun 2025 06:02:12 -0400
Date: Tue, 24 Jun 2025 06:02:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] should replicating offline build use "--runonly" or
 "--runall"?
In-Reply-To: <DAULQE8WNN68.2YBA6IQ3BBCO1@bootlin.com>
Message-ID: <e1795e43-5f17-6d44-8f52-aa9c15df3c24@crashcourse.ca>
References: <184B5224024A6359.12316@lists.yoctoproject.org> <92dee52f-385b-9134-1364-c1f6e673b37a@crashcourse.ca> <DAULQE8WNN68.2YBA6IQ3BBCO1@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 10:02:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7208

On Tue, 24 Jun 2025, Antonin Godard wrote:

> On Sun Jun 22, 2025 at 4:45 PM CEST, Robert P. J. Day wrote:
> > On Sun, 22 Jun 2025, Robert P. J. Day wrote:
> >
> >>
> >>   this section:
> >>
> >> https://docs.yoctoproject.org/dev-manual/building.html#replicating-a-build-offline
> >>
> >> advises to fetch the sources with:
> >>
> >>   $ bitbake target --runonly=fetch
> >>
> >> for the longest time now, i've used:
> >>
> >>   $ bitbake target --runall=fetch
> >>
> >> although i do recall that those behaviours changed once upon a time.
> >> so is that still the appropriate command to use? is it worth adding an
> >> explanation at that point as to the difference for people who might be
> >> curious?
> >
> >   as a followup, this section:
> >
> > https://docs.yoctoproject.org/dev-manual/efficiently-fetching-sources.html
> >
> > refers only to "--runall=fetch". so it seems inconsistent with the
> > earlier section. or, at the very least, it has the potential for
> > confusion.
>
> Yes, I also --runall should be used. I'd take a patch.

  and i would gleefully offer a patch if i actually understood the
distinction, and whether the developer needs to understand that
distinction and when those two choices should be used.

rday

