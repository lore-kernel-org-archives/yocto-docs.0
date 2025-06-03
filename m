Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087EDC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 15:58:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.15474.1748966313617844043
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 08:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=aa24rPvE;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lQXtvw7JmuwhkiEZeRR1ArC0IoTHqx/MqErXfnRxFIE=; b=aa24rPvEB49Sw4jjKGzSG0x4dm
	1m6SImJxc4oy/v2AzM771AoZuw5B7xfzrxNVXgMHna3SpklKZXrv/2QYe1cnLgFvkmN/bb6S6FDQB
	Hb6GdSs5luuNyxp6uvc06HWwCaAKLnixiEACR0gQcE7qnU53QgKHlmxB57RPVN5TQUacrXhxy9hls
	kBX5N7FWGjGwLzv8E3v12dnnOLaVfQH9dyN55vNebuOC6tzpXkhoNza3aR9wK3qyz1syHMUmkoUlP
	RiTVCFGns3241hBn9UEk5/6GZLF9Qr/s2+U/q8k/gi+/6CyRPX06So8hNw806Eryuz8KjWtoNW+fY
	vOEbt+mw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56372 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uMU20-00000004907-1epz;
	Tue, 03 Jun 2025 11:58:32 -0400
Date: Tue, 3 Jun 2025 11:58:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] BB manual: DEFAULT_PREFERENCE example does not exist
 anymore
In-Reply-To: <be39614a-235a-4494-86a0-18381f5d4bd9@cherry.de>
Message-ID: <3894aac5-f33d-388d-e15e-28d55177d11d@crashcourse.ca>
References: <9040c30a-c091-f2be-fd62-087fb758ed47@crashcourse.ca> <be39614a-235a-4494-86a0-18381f5d4bd9@cherry.de>
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
 <docs@lists.yoctoproject.org>; Tue, 03 Jun 2025 15:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6992

On Tue, 3 Jun 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/3/25 4:31 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Here:
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#preferences
> >
> > the Note proclaims:
> >
> >    "For example, in the OpenEmbedded codebase, there is a standard,
> >    versioned recipe file for BusyBox, busybox_1.22.1.bb, but there is
> >    also a Git-based version, busybox_git.bb, which explicitly contains
> >    the line
> >
> >      DEFAULT_PREFERENCE = "-1"
> >
> > That version of busybox is long gone and, in fact, in the current
> > OE-Core codebase, there is not a single usage of DEFAULT_PREFERENCE
> > to be seen.
> >
> > The best example of that would seem to be here:
> >
> > https://git.openembedded.org/meta-openembedded/tree/meta-webserver/recipes-httpd/nginx
> >
> > which is actually nicely explained in the .bb file. So should one
> > update that example to use nginx? Or just remove that Note
> > altogether given how infrequently that variable is used?
> >
>
> I would remove the note and provide the context in the first sentence of the
> note somewhere else in the section, e.g. reword "When there are multiple
> "versions"".

  After cogitation, I think I'm going to rewrite both of those
sections:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#providers

with the structure:

  2.3 Providers and preferences
    2.3.1 Providers
    2.3.2 Preferences

simply because those two features can be treated as specific
constructs related to how BitBake selects the appropriate recipe and
version. Even the current structure of those sections has the PROVIDER
stuff bleeding over into the Preferences part, so I think it makes
sense to treat them as two related mechanisms.

rday

