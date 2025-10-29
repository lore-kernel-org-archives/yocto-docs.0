Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FC8CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:04:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.3175.1761732256222705943
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 03:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=M6YRuJBq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TEoRo28NAg2oHxdNCGm2s1B5dLe70NK0tVVBgnfMYAI=; b=M6YRuJBqRJDCJrMNP7hslOOnjB
	eaNOvxWt74DWxf9tIZB0EBaxZ6OptNHA4WZ8FwDoGUHQT5LoVnqfWcJA0ftdpsQx5lBLdMVQ2slwE
	oDlsUAQetZkrK4UglZFolJU3Wl3H/jzOJsvN/F466oSAeaxCJFzmjhR6JZ4y9rMDDaRTQpJlPFg+M
	Egz7YAkzzaJf7jyDcIhXlo+DM1t8dsm5ZzWZ2mWRUboUBkMobZOrPXiBIICmo+h05j+/nIz57zsC5
	VzdpVnqri91ay2A6qDI32VwnSvfaqxZ0HWSc/0wVjAXZPat59/0MwstkflCeRMd7JJSQJJiVA9ZQ6
	BYIZdGJA==;
Received: from [147.129.179.166] (port=55706 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vE32I-0000000Foud-31av;
	Wed, 29 Oct 2025 06:04:14 -0400
Date: Wed, 29 Oct 2025 06:07:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] whether "bitbake -e" examples should be updated
In-Reply-To: <DDUPNCN1D5IW.24XQI86ABYQAZ@bootlin.com>
Message-ID: <b62c5bdb-6357-706c-18d2-3bab842d5fa7@crashcourse.ca>
References: <a21a032d-3f13-03fa-a7d2-69112eafa2fa@crashcourse.ca> <DDUPNCN1D5IW.24XQI86ABYQAZ@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 10:04:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7893

On Wed, 29 Oct 2025, Antonin Godard wrote:

> On Tue Oct 28, 2025 at 7:37 PM CET, Robert P. J. Day wrote:
> >
> >   more nitpicky pedantry ... here:
> >
> > https://docs.yoctoproject.org/dev-manual/new-recipe.html#running-a-build-on-the-recipe
> >
> > the reader is advised to display the value of a variable relative to a
> > recipe basename with:
> >
> >   $ bitbake -e basename | grep ^WORKDIR=
> >
> > well, sure, but as we all know, there's the newer:
> >
> >   $ bitbake-getvar -r basename WORKDIR
> >
> > which inspires the question -- should that second variation be *added*
> > to that page, or should it *replace* the older command because there's
> > little point in explaining the earlier command?
>
> I think it's worth showing the bitbake-getvar here and I would replace it (also
> in other places if you find any other).
>
> >   more globally, how complete are the docs in terms of explaining all
> > the cool debugging scripts provided in oe-core/scripts? i know the dev
> > manual has an entire section on debugging, so i'll get to that later.
>
> The debugging document has a "Viewing Variable Values" section. It would be
> great to add `bitbake-getvar` there, if you have some time a patch would be
> appreciated.

  i can't guarantee that i'll have time to submit patches for all
these observations/questions -- i'm keeping track of all of it but i'm
concentrating on getting through all the docs first.

  regarding this issue, it seems that the cleanest approach is, in the
general documentation, to focus on the newer debugging utilities like
bitbake-getvar.

  then, in the debugging chapter, to open with something like, "once
upon a time, one would use 'bitbake -e' to examine the properties of a
build such as its variables, and while that approach still works,
there are a bunch of newer utilities that are more convenient and
should be used instead."

  so i would minimize any explanation involving 'bitbake -e' other
than to mention that that was the original way and it still works, but
there are newer, better ways.

rday

p.s. this assumes that that debugging chapter better be really
complete and comprehensive.

