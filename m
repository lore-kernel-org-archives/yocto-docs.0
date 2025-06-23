Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2352C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 15:19:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.1471.1750691968988132933
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 08:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=icV3Lk72;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LuvmHFPTabTB3xn+2u0miCMEis3/zNm8PHy9A/0hmvk=; b=icV3Lk72frFoGa5uDBVM0oVP98
	3VP666aGnuZHtmvMMGGTvQYNOasasBzeS4VDzJUWZs5XMDoVY/2GQfjgY9coe4FXU0mRzUGetWm6F
	4pGPxeo0uPXwJgeN7NecQ0hotqKxchtfDoGQ5wnzTF0725jjHaF+MnLQFN3ZCKIZjgEUf2sGtrfbd
	DTJmHcZENSPKoZD6DQ1arBLWbGQW1ZT63KWyCmxWV7Y7bqadT1ndNrARhoismxMW/f09UjSy7lF3R
	mBYyuzQnNI1kLRwwD9qrrjgPdZzwzxLwT3uTzAd2Sr21vW9ObddOaLdFC9Ees0mNzK1/qPYPYNJOq
	NEudQjWw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56658 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTixB-0000000BQA4-0SPl;
	Mon, 23 Jun 2025 11:19:27 -0400
Date: Mon, 23 Jun 2025 11:19:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: some minor cleanups to "Pre-Built
 Libraries"
In-Reply-To: <790f4b6e-7176-4b2e-abdc-d26243aa0db1@cherry.de>
Message-ID: <3dfd9bca-ebea-9b71-6f9c-8b85ef699550@crashcourse.ca>
References: <b88499e3-e0d1-5aff-490c-ae13c2dbfb31@crashcourse.ca> <790f4b6e-7176-4b2e-abdc-d26243aa0db1@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 15:19:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7163

On Mon, 23 Jun 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/22/25 12:59 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    * Add note about new URL for FHS 3.0.
> >    * Add wildcard for "INHIBIT_" variable.
> >    * Fix font for ${PN}.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/dev-manual/prebuilt-libraries.rst
> > b/documentation/dev-manual/prebuilt-libraries.rst
> > index a05f39ca1..077184657 100644
> > --- a/documentation/dev-manual/prebuilt-libraries.rst
> > +++ b/documentation/dev-manual/prebuilt-libraries.rst
> > @@ -22,6 +22,13 @@ To summarize, a versioned library must meet two
> > conditions:
> >   This section shows how to deal with both versioned and unversioned
> >   pre-built libraries.
> >
> > +.. note::
> > +
> > +   In the shared library article referenced above, the link to the current
> > +   version of the Filesystem Hierarchy Standard (FHS) is out of date;
> > +   the current FHS 3.0 release can be found
> > +   `here <https://refspecs.linuxfoundation.org/FHS_3.0/index.html>`__.
> > +
>
> Considering FHS 2.3 was released Jan 2004 and FHS 3.0 on Jun 2015, will we
> have another FHS version end of 2026?
>
> We can simply link to https://refspecs.linuxfoundation.org/fhs.shtml so we
> hopefully aren't outdated ourselves later on as well?
>
> Looks good to me otherwise!

  there is no discernible timeline for anything beyond FHS 3.0 that i
know of.

rday

