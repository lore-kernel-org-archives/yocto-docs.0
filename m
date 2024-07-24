Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40A2C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 12:16:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.9246.1721823387580087081
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jul 2024 05:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=S1PBgRCt;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iIQR/2ps+O07u029cEMTXbGw32f7tV9c39gAFAbLRWM=; b=S1PBgRCtsWJJcEVm74ceRnzPYd
	nJm40XxvCW4rDO6YqD3aG5MaVftwKDRCJoEDfXNH+u0NSPy7PhSPqIHcmnSXN0yWfVbbJ+eSk0BBr
	cizVIyPNoNRAAB6bZiR9EZs0LSjojWNvmQIQX41BZG+/k67VQq8bZdQlXzpnwsW4fnYXtzrxN/JMS
	1AUbRR6HaLU8Syhb77k0xPFXUJw7W2DU/v3QbW8x1VXB9RWdhUGPURkw07TGGt0hS4dTc8BNwXosv
	toE2h5vdCIxLGetYCGAa/dj/IgF15Gtbxt8R09ypWhvFCsku/JJ/y/glS/U6z7DB3SD0ZZ3ewmwpe
	rr4+76lw==;
Received: from [70.29.98.157] (port=55334 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1sWauv-00000000n89-2GJC;
	Wed, 24 Jul 2024 08:16:26 -0400
Date: Wed, 24 Jul 2024 08:15:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] which doc would explain how to generate .debug dir with
 symbol info?
In-Reply-To: <a8b86f23a04cd9480dff334a7b235cf9534bcbbb.camel@linuxfoundation.org>
Message-ID: <3b4de117-1a4b-d780-1145-b5d65c23e9b2@crashcourse.ca>
References: <a9269ac0-aa3d-e961-a76e-dcfe65d2444c@crashcourse.ca> <a8b86f23a04cd9480dff334a7b235cf9534bcbbb.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-31473015-1721823385=:1262540"
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
 <docs@lists.yoctoproject.org>; Wed, 24 Jul 2024 12:16:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5327

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-31473015-1721823385=:1262540
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 24 Jul 2024, Richard Purdie wrote:

> On Wed, 2024-07-24 at 07:49 -0400, Robert P. J. Day via
> lists.yoctoproject.org wrote:
> >
> >   sort of a docs question, but a colleague asked me how to configure
> > a
> > debug build so that the binary files and associated gdb symbol files
> > ended up with the following corresponding pairs of content:
> >
> >   symbols/dir/stripped_binary_file
> >   symbols/dir/.debug/same_filename_but_containing_only_symbols
> >
> > i jumped over to the debugging manual but it's not clear from what is
> > there how i would do this. is there a convenient table somewhere that
> > maps:
> >
> >   various debugging output structures -> options/settings to use?
>
> I thought the builds did that by default, with the debug symbols in the
> -dbg package?

  i'm waiting for muh colleague to arrive to show me exactly what they
say is not doing what they want; in the meantime, i'm perusing:

https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_DEBUG_SPLIT_STYLE

it may be that this person just did something wrong in terms of
configuration. i'm betting on spelling mistake.

rday
--8323328-31473015-1721823385=:1262540--

