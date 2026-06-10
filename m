Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD1ACD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16362.1781085031557097146
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 02:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ZuPaz/uZ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9T37XINzeJrBGGKanj02/LbbU4KfGcakJHtK5MuziFw=; b=ZuPaz/uZbn1g09yJ68YbbagoIh
	46gRFkIp7Ijx1UPr6qpALvTdwKJnXck3PPmIRXw/e7dSsD7C60Op6wAPXcwLBt0cs0pQeePe7E8UC
	iQEaFRBKUjUgsgxN/zmPo/8r04JxhIy/vAvOkElzVdnHAQEZ1T9RSL7zR2ZOHUbqFNAToXIJzE+pw
	HnWaXC+Z0Zk1uJ4ZK+v2hx55jbG1VrD/M70g+MdHCxd8zFzRZSR6rH8N9Z7Wq87A54evvuqwr8JDj
	pnckWJl3+3PCGmrALm2FNXSlmZcnRZgbAxDlWJ3o4Pp9B547XY7q4lBta/AaRMvizSISdb+DgYbri
	SRJ36lPA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:45386 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXFZs-00000008VhY-2p63;
	Wed, 10 Jun 2026 05:50:29 -0400
Date: Wed, 10 Jun 2026 05:50:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: quentin.schulz@cherry.de
cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: add command to force a recipe
 re-compile
In-Reply-To: <cbe72dde-6eb7-4006-a17c-0268b88458ce@cherry.de>
Message-ID: <7d409dda-1b3b-7d1b-2ab3-a1d34de5d3f8@crashcourse.ca>
References: <06ee4e3f-d477-0b55-be14-ff74aa2383c1@crashcourse.ca> <CANNYZj8OeT0eQADFc1fE7MkGhFeWC-yhb82uBasDBDQkL3w=bQ@mail.gmail.com> <03d3e318-bbc8-4b50-969a-908205b8e5ee@crashcourse.ca> <cbe72dde-6eb7-4006-a17c-0268b88458ce@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 09:50:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9675

On Wed, 10 Jun 2026, Quentin Schulz via lists.yoctoproject.org wrote:

>
>
> On 6/10/26 10:36 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > On Wed, 10 Jun 2026, Alexander Kanavin wrote:
> >
> > > On Tue, 9 Jun 2026 at 21:20, Robert P. J. Day via
> > > lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> > > wrote:
> > > > --- a/documentation/dev-manual/temporary-source-code.rst
> > > > +++ b/documentation/dev-manual/temporary-source-code.rst
> > > > @@ -65,3 +65,11 @@ build system uses to build the package would be as
> > > > follows::
> > > >
> > > >      project/build/tmp/work/qemux86-poky-linux/foo/1.3.0
> > > >
> > > > +Finally, if you make some changes to a recipe's unpacked source code,
> > > > +you can force a re-compile of that recipe with the command::
> > > > +
> > > > +   $ bitbake -c compile -f recipe-name
> > > > +
> > > > +The ``-f`` option in the above forces that task to be re-run
> > > > +(invalidating any existing stamp file).
> > > > +
> > >
> > > While explaining where to find the unpacked source is okay, taking it
> > > further and providing a way to force-build it is not a good advice. If
> > > someone needs to modify and build source like this, they should be
> > > using 'devtool modify'.
> >
> >    i actually thought about adding a link to devtool, along the lines
> > of "while this technique works, devtool modify is now the recommended
> > way" or something like that, at least as a historical reference for
> > people who have been doing it the bitbake way all this time to let
> > them know there's a better way.
> >
>
> Do not modify a recipe's unpacked source code, it's the best way to have your
> changes lost. There are non-negligible chances that it'll end up being deleted
> and unpacked again (e.g. because the cache is outdated via its dependencies or
> the recipe parsing resulted in a rebuild of the recipe).
>
> Using -f also taints the build and you need to clean the sstate-cache for this
> recipe to recover from it last time I checked, which is something we don't
> like recommending to people (if you need to clean the sstate-cache, either
> something's wrong with your recipe or there's a bug we need to fix), so I
> don't think documenting this enormous footgun is a good thing.

  i will point out that that very command is (sort of) recommended in
the section on quilt (see point 6.):

  https://docs.yoctoproject.org/dev-manual/quilt.html

i will ponder further but i think it's important to mention the
"bitbake" variation if only to say, "this is the way it was done
*historically*, but that way is fraught with peril and you are
vigorously encouraged to use the 'devtool' utility." because there are
certainly developers who still use the bitbake technique who should be
warned off of it.

  or is this not worth the trouble?

rday


