Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB8ECDB466
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:50:31 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39025.1782118224020810824
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 01:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=a0PzKcW7;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yPLjvSTwD43r0pbRd2tTb4iMC/BUAk0BvkaIIACxAUI=; b=a0PzKcW7F6vsMK1b1c+KoPn5XM
	+sSfFBjKLubEPm4E9kBa0XvnFFoMKSy4OfuUJ5NU1OlrKKvr20P13AagAf+5OUvQjoW63dRtrYZUZ
	P38hXwNgWBgnI5OTOt+7N3LYpll9ty/OkW7I+70+UFHoLt3SWV1DLOsWT4IMVezeSirxjTN4yO9Xs
	OIR88oV3yiQOTl8fPSOAS3i0Q0OTihytCiExqYQIARufDCNel6m/8Cvgi3GHF5cGYcw9jhKN9oy+B
	kGqqhBN0vyoXLeZr93RbC/W8cRlKpTv/8lRrmBzai2BAMhrLBVDLkWIigvCs93NDgVeCBN2Djr2cQ
	+PLd76oQ==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:32874 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbaMF-00000009zEL-19ZF;
	Mon, 22 Jun 2026 04:50:21 -0400
Date: Mon, 22 Jun 2026 04:50:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: Quentin Schulz <quentin.schulz@cherry.de>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] dev-manual: add second way to assign "PV" for
 external SCM
In-Reply-To: <DJFF4MO9VPEF.1Q1LX7KBQEIU8@bootlin.com>
Message-ID: <406ad1d1-eeaf-16bf-84ad-b762c03bf5fd@crashcourse.ca>
References: <c3dc6fcf-3e0e-f788-3308-1fac1fc4ea57@crashcourse.ca> <cb699e59-1d5a-4e32-9c31-1bae48f660cc@cherry.de> <5c45e703-6140-019a-3aff-2b11c3a93b6f@crashcourse.ca> <DJFF4MO9VPEF.1Q1LX7KBQEIU8@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:50:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9825

On Mon, 22 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Fri Jun 19, 2026 at 5:56 PM CEST, Robert P. J. Day wrote:
> > On Fri, 19 Jun 2026, Quentin Schulz wrote:
> >
> >> Hi Robert,
> >>
> >> On 6/16/26 10:32 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >> >
> >> > In addition to hard-coding a PV value in the context of an external
> >> > SCM, show also just appending the string "+git" to the value already
> >> > calculated for PV.
> >> >
> >> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >> >
> >> > ---
> >> >
> >> > diff --git a/documentation/dev-manual/external-scm.rst
> >> > b/documentation/dev-manual/external-scm.rst
> >> > index 3ca9079b3..cac23ac1e 100644
> >> > --- a/documentation/dev-manual/external-scm.rst
> >> > +++ b/documentation/dev-manual/external-scm.rst
> >> > @@ -13,9 +13,13 @@ Subversion (SVN) and Git.
> >> >
> >> >   To enable this behavior, the :term:`PV` of
> >> >   the recipe needs to include a ``+`` sign in its assignment.
> >> > -Here is an example::
> >> > +Here are a couple examples of how this can be done --- the first
> >> > +hard-coding the value for ``PV``, the second simply appending
> >> > +the string "+git" to the value of ``PV`` already extracted from
> >> > +the recipe file name::
> >> >
> >> >      PV = "1.2.3+git"
> >> > +   PV .= "+git"
> >> >
> >>
> >> This is confusing. Do you mean that
> >>
> >> PV = "1.2.3+git+git"
> >>
> >> will end up being
> >>
> >> PV = "1.2.3-gbebedada+git"
> >> ?
> >
> >   no, the text mentions that those are a couple possibilities for
> > setting that variable -- you'd use one or the other, not both.
>
> I think I see what Quentin is saying, that you can misinterpret this and add the
> two lines to your recipe, while only one of the two is needed.
>
> I think this would clearer if you split the two examples and precede them with
> what they stand for.

  will do shortly.

rday

