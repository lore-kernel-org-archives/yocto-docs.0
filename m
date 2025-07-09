Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A08C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 16:35:55 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.1610.1752078949938663446
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 09:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=GBfnnjzn;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Zb3CGliuLBUnuE5Ps7H0UXpJCl2aOUBTFLhhGESkeWM=; b=GBfnnjznfbB7QMjMoIgCxdSRCP
	8WyWQhWoYE0bVsrl+40zbBVWdDKptVj35tprwJ3t2ClmNqEksZ4rFV8zf1TPwgfYw7zQbtoUcjoaM
	S2lo1bedmuTdARGqTPCM1+QB+n4XEHKP8auyQiGyofUUuppXfC1JftXsiF+DI6OFYChG8gD6YRIkE
	fmTxx1htz6/x0o7Ah4mYNqFYHWxWtWWJzvs2n66prB05B5LBQjvYuQBNYINaEdexEn7Wu8TpV3T+w
	2Tiof9JYkRd/SlmFhYbYNIqyVoBd+G4PkRKAvCQfy6HbSJq9xEhqbWgfLVxGSU3tCdzNcvTmFRDdN
	MrDx9TtQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:43756 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZXlp-0000000BIZd-3KJ5;
	Wed, 09 Jul 2025 12:35:48 -0400
Date: Wed, 9 Jul 2025 12:35:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] more nitpickery: "include_all" should be described as
 really specialized
In-Reply-To: <8674860c-6276-4e48-b486-0eed9f46d802@gmail.com>
Message-ID: <7765488c-0862-6467-1805-c9f8df14a443@crashcourse.ca>
References: <d0caadc1-6923-4114-8798-89ecf3e8e494@crashcourse.ca> <8674860c-6276-4e48-b486-0eed9f46d802@gmail.com>
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
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 16:35:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7302

On Wed, 9 Jul 2025, Khem Raj wrote:

>
>
> On 7/9/25 8:35 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    (yes, i'm still being pedantic and i'm keeping track of all the
> > previous feedback, i'll get to it at some point.)
> >
> >    here:
> >
> > https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#include-all-directive
> >
> > the explanation for "include_all" correctly describes it, sure, and it
> > also uses maintainers.inc as the perfect example. but it's not clear
> > from the explanation that (at least for now) that is the *only* usage
> > of it in all of the layers i have checked out.
> >
> >    a reader might get the idea that, hey, this is a useful feature, i
> > wonder where i should use it, without truly appreciating that it
> > should be considered a *rarity*, to be used only in well-defined
> > situations. *then* the example of maintainers.inc can be introduced,
> > again emphasizing how this is really infrequent and needs to be used
> > only in clearly appropriate circumstances. or something to that
> > effect.
> >
> >    thoughts?
>
> some guidelines around its usage will certainly help users. Care to cook a
> patch ?

  sure, i'll come up with something that reflects what i wrote above.
part of that will emphasize that "include" stops at the first match,
so that that can be contrasted with "include_all."

  patch coming shortly.

rday

