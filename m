Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B16D0E6CC
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 11:55:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15073.1764071758090380916
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 03:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=qg+e5a7b;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mETDdniY06cbxSVXOrT5CbX5095sYGGaBFVcxQr4dcc=; b=qg+e5a7bwUoTKgrZsgqvW8UDPd
	vfMxeLTzNK0z5ZjrbNS4yyjqvfowFgEsI0EM/HKH4c/9ETu/yhIa5IfDQeCSCLVGuN5j+3SglBFMI
	Qsd8UjsO2az99/kAHKe4A99Tz42LHLzKRiccHm+m9S464SsQMojG9SYNfxUJiih26Bm+NvjOzMfd4
	tyTfXzXZQH67oXy7+F8lCKSisTlYYHRxhND+6dvQJ+mVYubB0g25vcwdUt5OpTiHcQsgm7+eHfg2y
	KNuzyY+pQouTrhryRAdLFP/kybUqK/mKMzAknlb+hzhHjbodMPiXo05fZQpR/wBub4c+hryaO5RVo
	B8uq68EQ==;
Received: from [147.129.179.166] (port=37992 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vNreC-00000007oEw-2J5t;
	Tue, 25 Nov 2025 06:55:55 -0500
Date: Tue, 25 Nov 2025 06:56:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: Antonin Godard <antonin.godard@bootlin.com>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] brief-yoctoprojectqs: shorten and clarify
 required host packages
In-Reply-To: <6394fa7e-af3c-4300-8962-bc82e3c59968@cherry.de>
Message-ID: <f648f1b0-38a3-ddde-3b97-64323b0a9019@crashcourse.ca>
References: <77d4de56-c700-9ae8-f03f-ede89df13e62@crashcourse.ca> <DEH0FJ96MF58.TDE0QZF0AM5A@bootlin.com> <74030727-ae53-4664-8693-34ecb975e557@cherry.de> <DEH1QRTPEDL6.2XESRCG6M8CT5@bootlin.com> <6394fa7e-af3c-4300-8962-bc82e3c59968@cherry.de>
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
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 11:55:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8114

On Tue, 25 Nov 2025, Quentin Schulz wrote:

> Robert, Antonin,
>
> On 11/24/25 4:56 PM, Antonin Godard wrote:
> > Hi,
> >
> > On Mon Nov 24, 2025 at 4:21 PM CET, Quentin Schulz wrote:
> > > Hi Antonin,
> > >
> > > On 11/24/25 3:55 PM, Antonin Godard via lists.yoctoproject.org wrote:
> > > > Hi,
> > > >
> > > > On Wed Nov 19, 2025 at 5:55 PM CET, Robert P. J. Day wrote:
> > > > [...]
> > > > > -Build Host Packages
> > > > > -===================
> > > > > -
> > > > > -You must install essential host packages on your build host. The
> > > > > -following command installs the host packages based on an Ubuntu
> > > > > -distribution:
> > > > > -
> > > > > -.. literalinclude::
> > > > > ../tools/host_packages_scripts/ubuntu_essential.sh
> > > > > -   :language: shell
> > > > > -
> > > > > -.. note::
> > > > > +Supported Linux Distributions and Required Host Packages
> > > > > +========================================================
> > > > >
> > > > > -   For host package requirements on all supported Linux
> > > > > distributions,
> > > > > -   see the :ref:`ref-manual/system-requirements:required packages for
> > > > > the build host`
> > > > > -   section in the Yocto Project Reference Manual.
> > > > > +For host package requirements on all supported Linux distributions,
> > > > > +see the :ref:`ref-manual/system-requirements:required packages for
> > > > > the build host`
> > > > > +section in the Yocto Project Reference Manual.
> > > >
> > > > I think this defeats the purpose of this guide being the "Quick Start
> > > > Guide". I
> > > > _think_ most people run Ubuntu when they run Linux, and I believe this
> > > > is the
> > > > reason why this was written like so in this section.
> > > >
> > >
> > > I have no data on this, so /me shrugs.
> >
> > I know, me neither, but it's a general feeling I get from what I've seen
> > IRL.
> >
> > > > So for the majority of people reading this section will be enough, and
> > > > that's
> > >
> > > The issue is it's not everything that needs to be done according to our
> > > documentation. So it's already outdated and not well maintained. If you
> > > want to keep having it this way (which is fair, avoiding to go back and
> > > forth between the docs when one is reading "quick start" is a good
> > > idea), I believe we can simply have an .rst with only Ubuntu
> > > instructions that we can include in both
> > > ref-manual/system-requirements.rst and brief-yoctoprojectqs/index.rst so
> > > that it never is outdated?
> >
> > Sure, having a single document for Ubuntu requirements would be an
> > improvement!
> >
>
> Will try giving that a shot except if Robert wants to do it?
>
> > > > the point. Also, the previous section "Compatible Linux Distribution"
> > > > does
> > > > mention that not all version are supported. So I think this section is
> > > > fine as
> > >
> > > Not all doesn't specify which ones. "Recent" is relative to time and I
> > > will not be able to build Dunfell on a Ubuntu 25.10 even though that is
> > > a recent distro and the docs said to use that. I would like to have this
> > > "recent" removed or reworded. Something like
> > >
> > > :ref:`supported version of Ubuntu
> > > distribution</ref-manual/system-requirements:supported linux
> > > distributions>`
> >
> > Ack! I agree on removing "recent" too.
> >
>
> Robert, do you want to send a v3 with this or do you mind if I take over the
> patch?

  It's all yours, I'll move on to nitpicking other stuff. Thanks.

rday

