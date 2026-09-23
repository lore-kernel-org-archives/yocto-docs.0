Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FC9C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:46:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3403.1790156752851095552
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 02:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=s5aJO/cb;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=LMs4qC1/pAysaLSIMsqx8T8RtUAiqeQqP4XsJUQAGCc=; b=s
	5aJO/cbX2JsKSmz8lN/LLTehWN0if3Z7d4ChhmBUoSoBmtrUUJ7UgShxQ6n+Z+aojiDbsbZfTXauT
	+Xhg02P0DcdTtTZgzN6w63aXgO8pNOBsZ/lKuXx95D5tgIBXbCJEUTNhKkH3Ub1YxPS6+vwMQWV6g
	KHTF6YRJZ208UROFic3JktdyDUny3cyHOgJ3jxbH8ktKPTDQ7KVDskn1BGtnaHAAQmRnHrOo0uhT2
	pj8/JaqegAWrJLrLU1HsPc/4AGM+0d4VPK8doJxCjapHf8yMUwzOjlloi+Hp8HnIfU2isY8lsuksr
	NWxWRzv7J2HijPl4USHATihR9QzqwrV7w==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:50976 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x9JXx-0000000G8WG-2ase;
	Wed, 23 Sep 2026 05:45:50 -0400
Date: Wed, 23 Sep 2026 05:43:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: update recommendations for build
 system
In-Reply-To: <88c9266d-4b79-47e9-aade-aea184acf13b@cherry.de>
Message-ID: <61050406-328f-f827-2a2e-d55c4f1b808d@crashcourse.ca>
References: <2f13d128-1344-e8b2-9e75-9867224522e4@crashcourse.ca> <88c9266d-4b79-47e9-aade-aea184acf13b@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 09:46:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10600

On Wed, 23 Sep 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 9/14/26 11:07 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Drop the reference to "Xeon" and hard-coded RAM and disk space
> > recommendations and get those values from poky.yaml.in.
> >
>
> Sounds good to me. We actually don't mention the kind of processors you should
> use in documentation/brief-yoctoprojectqs/index.rst.
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/dev-manual/start.rst
> > b/documentation/dev-manual/start.rst
> > index 3b8e2334a..7def242e2 100644
> > --- a/documentation/dev-manual/start.rst
> > +++ b/documentation/dev-manual/start.rst
> > @@ -55,9 +55,9 @@ particular working environment and set of practices.
> >   #.  *Gather the Hardware:* Based on the size and make-up of the team,
> >       get the hardware together. Ideally, any development, build, or test
> >       engineer uses a system that runs a supported Linux distribution.
> > -    These systems, in general, should be high performance (e.g. dual,
> > -    six-core Xeons with 24 Gbytes of RAM and plenty of disk space). You
> > -    can help ensure efficiency by having any machines used for testing
> > +    These systems, in general, should be high performance (e.g. a minimum
> > +    of &MIN_RAM; Gbytes of RAM and at least &MIN_DISK_SPACE; Gbytes of disk
> > space.)
>
> I'm wondering if we shouldn't simply replace the previous two sentences with:
>
> [...] uses :ref:`a system that runs a supported Linux distribution
> <brief-yoctoprojectqs/index:compatible linux distribution Compatible Linux
> Distribution>`.
> You can help ensure [...]
>
> (not tested).
>
> This would avoid the need of keeping them both in sync and would also list
> what those machines need to run as distro and which package they depend on.
>
> What do you think?

  i'll submit something equivalent later today.

rday

