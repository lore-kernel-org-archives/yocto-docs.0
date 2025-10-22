Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AEFCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 16:34:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.14507.1761150883784103733
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 09:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=lKvYVady;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hg2xrrB3ohl+QJaNTWhhbaLcjvKJmoERxMANcB1szb8=; b=lKvYVadyKjaoBdgkqF/x4a8d2p
	KCprKHyDO/DJXcpuAdQ7AUnChjFLCc1TT16FpKYXmp5p1V0cF1/63ewktttrSjRloL9GlZYPP5vQ/
	2fkwSQXoMAgvX0+/jiZkECJIvBG4IPgooK4SvAHbA2D87urmF3w6Ke5fHhmP9bbzVuub2QtWYeJPk
	s8z6rIGHxJw+sjckrjvbCnqtbdQSDpTJs64rAX4uOp51ayTJ/mHCazch1ExYATEyTVQptLvGERjCU
	t4BKZKlXGB2qxXBtEWgooYpZ4JWKLtFXSDQ+Vjo9rBxbHxYVYtSB5qqtXJalYp2snxML2zR5SBSgu
	TTpLNLMQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:40774 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBbnH-00000009P15-21Ha;
	Wed, 22 Oct 2025 12:34:41 -0400
Date: Wed, 22 Oct 2025 12:36:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] diagram for build hierarchy in overview manual seems
 wrong
In-Reply-To: <dfff1ffb-a7d1-4fa3-8267-a4d7fb5bd115@cherry.de>
Message-ID: <e2ae6f94-687d-1198-99cd-db0ac5731bac@crashcourse.ca>
References: <6647a7d3-3aa0-5e24-edb0-8f9d434672b5@crashcourse.ca> <dfff1ffb-a7d1-4fa3-8267-a4d7fb5bd115@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 16:34:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7773

On Wed, 22 Oct 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 10/22/25 5:13 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    just noticed this as well ... here:
> >
> > https://docs.yoctoproject.org/overview-manual/concepts.html#source-fetching
> >
> > the graphic states that the default name for the UNPACKDIR directory
> > is "sources-unpack", but the setting in bitbake.conf is:
> >
> >    UNPACKDIR ??= "${WORKDIR}/sources"
> >
> > where does that name "sources-unpack" come from?
> >
>
> https://docs.yoctoproject.org/migration-guides/migration-5.1.html#general-notes
>
> It is only sources in 5.3 (not released yet), c.f.
> c8d852ad63219d067e497a77d489a4011b0d0a26.
>
> I'm sure we would welcome a patch for changing every occurrence we forgot to
> update in the docs, including this diagram.
>
> Thanks for the report!
>
> Looking forward to seeing the patches on the ML.

  I've been otherwise occupied for quite a number of weeks ramping up
in a new job, so I have sadly neglected to keep up with all the docs
developments. I'll try to catch up, but I might post the occasional
thing that someone else might have already addressed.

  As for the diagram, someone else can add that to their TODO list as
I don't do diagrams. :-)

  Later.

rday

P.S. The only text references to "sources-unpack" I see in the docs
are in the migration guide and release notes, so I think all of those
have been handled.

