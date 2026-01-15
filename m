Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE243D46628
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 21:16:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1001.1768511792963836063
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 13:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=LqyWIpny;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C4agqSlkdg0PFoII4oY1kB5Q4AQU0uKTSiXmeJMYsso=; b=LqyWIpny1czTqSx5BQvT/XzP/a
	cQcmFD7FzEug63W6TxGCIXN4Pn+Ua3OIAou1OxAZflv25aHpnh6bJ0alqA9a0Ho8nEM4U7U4xbPbw
	kSMXJq0VtJpTwYnKT5SBUucUEAQypdC2UMq9eAYV1uWtnDg5EN8H2WnZNDr87Dvf4k8zO5Eb3/VX3
	/lcgJYv9CspwCI1saAIlHtXbDtIHnfT2TMU5gTZxPP4QSLyoTnz2D3f0f06+BBEPVVwA+DU1zEw58
	YIesEZgQsGc0jkLkJVtHanGXX5o6xUpBZNah/dKB9zLoZcDO7HqB0WckAaWJ9abEz057TG+vEkL/r
	j7xu6pOQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53768 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vgUhg-0000000AdPE-3468;
	Thu, 15 Jan 2026 16:16:31 -0500
Date: Thu, 15 Jan 2026 16:19:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] is there any way to render content in italics in a code
 block?
In-Reply-To: <4bcdc409-cbc5-4cc6-855f-42b48a0766df@cherry.de>
Message-ID: <c2c59323-1832-0159-a5f3-0164e6c4bc2b@crashcourse.ca>
References: <5eef4c2b-95ae-cc22-b44c-a03e29982c79@crashcourse.ca> <78dfab73-8d58-4cbd-b452-d34c1cc14ae4@cherry.de> <38b9c8b4-84d7-ad15-5bcd-ca16d06b5c20@crashcourse.ca> <4bcdc409-cbc5-4cc6-855f-42b48a0766df@cherry.de>
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
 <docs@lists.yoctoproject.org>; Thu, 15 Jan 2026 21:16:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8580

On Thu, 15 Jan 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 1/15/26 4:55 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > On Thu, 15 Jan 2026, Quentin Schulz wrote:
> >
> > > Hi Robert,
> > >
> > > On 1/8/26 10:33 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > > >
> > > >     one aspect of sphinx that gripes my wagger is that there does not
> > > > seem to be any easy way to tag something in italics in a code block.
> > > >
> > > > here:
> > > >
> > > > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html
> > > >
> > > > the code line:
> > > >
> > > >    $ bitbake target
> > > >
> > > > really needs the word "target" in italics to show that it's meant to
> > > > be replaced. and, no, this isn't minor nitpicking -- the whole section
> > > > on overrides desperately needs to be able to show what things a
> > > > developer is meant to replace.
> > > >
> > > >     is there any way to do this?
> > > >
> > >
> > > Not that I know of.
> > >
> > > Another option is to follow conventions from manpages for example or
> > > something
> > > people are most familiar with.
> > >
> > > bitbake [target]...
> > >
> > > maybe? I'm not versed in manpages.
> > >
> > > Also, you can simply specify after the code-block what must be changed by
> > > the
> > > user. It doesn't *have* to be a technical solution.
> > >
> > > code-blocks have :emphasize-lines: maybe there's room for adding
> > > emphasize-columns or something like that such that we can specify what to
> > > highlight in a line.
> >
> >    there is (sort of) a way to do this, it's with a "parsed-literal"
> > block, not a "code-block"
> >
> > .. parsed-literal::
> >     ... stuff ...
> >
>
> This could be an option but only for BitBake snippets where we cannot have
> syntax highlighting anyway.
>
> I *guess* we could afford this for shell/console snippets too, provided
> there's no console output. How does this work with the copybutton if we have a
> prompt in a parsed-literal? Maybe we'll need to get rid of prompts as well.
>
> Also, maybe we want to have a look at how sphinxawesome-theme implemented
> emphasize-text for code-blocks, maybe something we can implement on our side
> as well (and have multiple entries for emphasize-text?). (MIT licensed, don't
> know if it's compatible with what we have in yocto-docs). c.f.
> https://sphinxawesome.xyz/demo/code-blocks/#highlight-placeholders-in-code-blocks

  it's not a high priority, it would just have been handy if it were
easy.

rday

