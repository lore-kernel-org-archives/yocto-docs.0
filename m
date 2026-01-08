Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E36D1D47E
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 15:37:43 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9228.1767886662483277955
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 07:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=xmiNnkQC;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FY86Gc0GDrkh8Ny6fSYM0buwwsb1+YYounOGkCwNx/4=; b=xmiNnkQCUNvnjVb5OTUSrGWOZC
	H1RzhEyXoW9T6vtJgPWnArHLe0A/blFONrEigI0dsm41G8Nx/gqc6fF55qxiX7Zf0DFNZR37+Jw9e
	U/MoJx4/0YBnXoadD1JLHQzu7AD+mJvzgACaEUYJ1su9B1xKogulwTNsv2iIsrAbLda0iwdEd2nWN
	vlq6DXBFmMnwaTIL4vqjYMK5zQlmg96dO7YXLITvI6RYrN5s7XCsD7agqvQHPN6+kEpurwm0mvOWh
	uBMKD2VqSitdrHTgAZnLTFsVlztbUnEqrfBTZplgxLm8H0tAuV3JBvg3rMwxgzKHhKCtdyvuP1E1/
	/l2cnlRw==;
Received: from [147.129.179.166] (port=43190 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vds4x-00000001v91-32Tm;
	Thu, 08 Jan 2026 10:37:40 -0500
Date: Thu, 8 Jan 2026 10:40:34 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Paul Barker <paul@pbarker.dev>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] how to properly render option double dashes without
 monospaced font?
In-Reply-To: <d6abdea85e90b852c59b2f79960c6399f2f60f51.camel@pbarker.dev>
Message-ID: <68abdca9-f5c8-abdf-7670-63adcdabbdb5@crashcourse.ca>
References: <3a81c9ef-61a4-7ceb-5eed-55d3b1637c2d@crashcourse.ca> <d6abdea85e90b852c59b2f79960c6399f2f60f51.camel@pbarker.dev>
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
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 15:37:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8427

On Thu, 8 Jan 2026, Paul Barker wrote:

> On Thu, 2026-01-08 at 07:23 -0800, Robert P. J. Day wrote:
> >   more nitpickitude ... here:
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-intro.html#executing-tasks-against-a-set-of-recipe-files
> >
> > it's hard to tell that there are double dashes in "--buildfile" since
> > it's in the regular font. however, it seems that they will be rendered
> > more clearly if one uses "\-\-buildfile". i'm going to submit a patch
> > to clean up a couple minor things in chapter 1, is it appropriate to
> > add that change as well?  (and anywhere else similar?)
>
> I think it'd be better to use a monospace font for command line
> arguments.

  i agree, i can make that change while working on chapter 1. would
that change in rendering still include double quotes? that is, which
of these?

  ``--buildfile``
  "``--buildfile``"

preferences?

rday

