Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8239CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 09:59:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.22799.1761818342826302581
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 02:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=mnFHWLxy;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=043yOFs3spjVphWCL6tFmYQRb31F5zlRDueO/rOcZ4Q=; b=mnFHWLxy4ES1m9hvBahAr28me/
	xFjYJIA3pKly/lV+IyrPd69FL060OkD2xhjdTHp6nkymcWTdNmNrB9scwQrIAWEPa4UnXlW3LML7k
	dLzBGQldQxZW/kH++glyLKbp+5OnIsxAFK2meR/M24m5SqzxQDDXDgy1FMofk/jAb6R5eIWkkGKrg
	7lc8hC4lnlPTkvVlYDBIP+la1HPu87XLiHPbWx43yTvDG5Ti1psE41L1nC2yCXFvfFjBH1Zs+HhHt
	qgLaV0pnChgMoPJyCu8mHJpe0PHZQwstKju8DTA76UbkrJfUfq1YWf22bfWPihMPUre89N4Ml59te
	9SMMemSQ==;
Received: from [147.129.179.166] (port=40288 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEPQh-00000001hKZ-3bOv;
	Thu, 30 Oct 2025 05:59:00 -0400
Date: Thu, 30 Oct 2025 06:01:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] more pedantry, this involving virtual providers
In-Reply-To: <208e7d2f-7db7-430c-b561-d0f21f288212@cherry.de>
Message-ID: <13f2c551-34b3-9757-cfcf-4d8ce8d8b799@crashcourse.ca>
References: <f7ee02d1-b309-fb49-a629-c6840ad92149@crashcourse.ca> <208e7d2f-7db7-430c-b561-d0f21f288212@cherry.de>
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
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 09:59:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7911

On Thu, 30 Oct 2025, Quentin Schulz wrote:

>
>
> On 10/29/25 7:44 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    (man, this methodical review of the docs is taking longer than i
> > thought. *sigh*.)
> >
> >    here:
> >
> > https://docs.yoctoproject.org/dev-manual/new-recipe.html#using-virtual-providers
> >
> > someone reading that section might come away with the impression that
> > virtual provider references all have the form:
> >
> >    PREFERRED_PROVIDER_virtual/*
> >
> > all of the examples at the end of that section certainly bolster that
> > impression as they all have that form. but what about things like:
> >
> >    PREFERRED_PROVIDER_udev
> >
> > from here:
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/include/default-providers.inc
> >
> > there are quite a number of PREFERRED_PROVIDER examples that do not
> > contain the "virtual/" string, but certainly seem to follow the
> > pattern:
> >
> > PREFERRED_PROVIDER_udev ?=
> >   "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
> >
> > philosophically, it would seem that if one followed the pattern, this
> > would look like:
> >
> > PREFERRED_PROVIDER_virtual/udev
> >
> > but i'm not going to suggest changing that, just wondering if this
> > example qualifies as a "virtual provider" like the rest.
> >
> > rday
> >
> > p.s.
> >
> > what's with:
> >
> >    PREFERRED_PROVIDER_opkg ?= "opkg"
> >
> > what are the alternatives to the opkg command? apk?
> >
>
> https://git.yoctoproject.org/poky/commit/?id=8bd2f3891320628b490c4035124bf8704ef49c45

  wow, that is some serious Wayback Machine stuff, Mr. Peabody.

rday

