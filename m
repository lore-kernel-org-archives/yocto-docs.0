Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D91CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 20:03:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5715.1782158569608016705
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 13:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=xtrBbC5o;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zj73WGp65ZcT3ea7UgkpCV1s4CVL5bFASpgJmYQbf5g=; b=xtrBbC5oGDoWSx0T7HDMuTIlN7
	HgbfZGkNrF9IlvR+3t051uo1HdOTft9sD3GQlibX8LKnzzVu3pOtaDftRsWh9usG1HdcsDukcpCGe
	JlWFiHz0kiSybcnOhX4Z+AAdOWNTFwG6gPrDaJMbvv3wesybEhf/fOyZOnXdrD1xC2EuD7AuR0t49
	e4JJXs1BcXMYGz2z/DxnhwMZWuVp5fsc0Vv1WHj/s4j6A1FywFbx3RuS1tc43+NH9BQxnt5TnxlAw
	06TsEiZVhSwt7j3k+dYVSTsMwM5X5oV36l8w3IqSSeIw1FUN/13AkydcubQcZUWTk3GBgLH9Mt5Xh
	xRUkb2gQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:52108 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbkr1-0000000BCOg-05xK;
	Mon, 22 Jun 2026 16:02:48 -0400
Date: Mon, 22 Jun 2026 16:02:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Paul Barker <paul@pbarker.dev>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] dev-manual: describe two ways to assign "PV"
 for external SCM
In-Reply-To: <e597a381198b23da3200b20cae3d514337b588a9.camel@pbarker.dev>
Message-ID: <6cf7ef80-8568-5182-9158-03460a4def67@crashcourse.ca>
References: <dca8856e-440c-a905-f11a-34ca6c253281@crashcourse.ca> <e597a381198b23da3200b20cae3d514337b588a9.camel@pbarker.dev>
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
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 20:03:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9835

On Mon, 22 Jun 2026, Paul Barker wrote:

> On Mon, 2026-06-22 at 05:08 -0400, Robert P. J. Day wrote:
> > In addition to hard-coding a PV value in the context of an external
> > SCM, show also the alternative of simply appending the string "+git"
> > to the value already calculated for PV from the recipe file name.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
> > index e7ab8a4c6..adab4370f 100644
> > --- a/documentation/dev-manual/external-scm.rst
> > +++ b/documentation/dev-manual/external-scm.rst
> > @@ -13,9 +13,17 @@ Subversion (SVN) and Git.
> >
> >  To enable this behavior, the :term:`PV` of
> >  the recipe needs to include a ``+`` sign in its assignment.
> > -Here is an example::
> > +You can do this in one of two ways:
> >
> > -   PV = "1.2.3+git"
> > +-  Manually assign a version number and the string "+git"
> > +   in the recipe::
> > +
> > +      PV = "1.2.3+git"
> > +
> > +-  A more elegant way is to simply append the "+git" string to the
> > +   value of :term:`PV` already extracted from the recipe file name::
> > +
> > +      PV .= "+git"
> >
> >  :term:`Bitbake` later includes the source control information in :term:`PKGV`
> >  during the packaging phase.
>
> Hi Robert,
>
> What's the benefit to offering users two ways to accomplish the same
> thing?
>
> IMHO this makes the docs less easy to follow, rather than more.

  Because both approaches are used in the code base, and if you're
going to explain how to do something, it's helpful to point to
examples in the code base.

rday

