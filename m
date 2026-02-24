Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1222DE9B262
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 12:56:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19554.1771937753692841720
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 04:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=v9r0FObE;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fBDdZ9yCWQMHHC81Z1iR+p2SG/7fckVf49ipawrHdrI=; b=v9r0FObEiJb1OovDgkSKMPoaeJ
	kR978c5KRshZPviXxD6Er5yBn8O1RoF7NpoZ2XkmuNzd0O8ZWSHj3acxMemtDHndMxT1nD0kEbwVZ
	bKcz/VavWtdYZBWP7la1Mch55KLfV0/YSaaBo//vjQ+9wgUuZZV6OBIrZeNYODfe5LZOjfLZLgpZv
	8C/pDphIPzWgCzIz92PSH5e1XUOmVUTl6Jeb97D/EZxQXS34Jbd50CWWz5mOzT6R4dZ0ufRi+4gFV
	cL52KlsS2PLB62pkc8wsqhg3eIHqwag5gSmncV5YaghtGL+yzW0y/TrcPs2VKmQ+FhQXXIns8jEjA
	Z24yCsfA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:39972 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vurx9-00000003Kx9-3lem;
	Tue, 24 Feb 2026 07:55:52 -0500
Date: Tue, 24 Feb 2026 07:58:07 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] variables.rst: expand explanation of RSUGGESTS
In-Reply-To: <DGN78E65FUWN.2BTR1KCHXV2VN@bootlin.com>
Message-ID: <1b69d976-4159-354d-a283-bd06bedef3b7@crashcourse.ca>
References: <1ee12fbd-a5c7-7b14-a558-cd6dda9e539e@crashcourse.ca> <DGN78E65FUWN.2BTR1KCHXV2VN@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 12:56:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8969

On Tue, 24 Feb 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Tue Feb 24, 2026 at 1:15 PM CET, Robert P. J. Day wrote:
> >
> > Add that the RSUGGESTS variable would be processed only by a
> > supporting package manager when installing packages from a
> > package feed.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/variables.rst
> > b/documentation/ref-manual/variables.rst
> > index 208b5e43d..92476d509 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -8361,7 +8361,9 @@ system and gives an overview of their function and contents.
> >     :term:`RSUGGESTS`
> >        A list of additional packages that you can suggest for installation
> >        by the package manager at the time a package is installed. Not all
> > -      package managers support this functionality.
> > +      package managers support this functionality. This feature takes effect
> > +      only when the package manager is being used to install packages on
> > +      the target system from a package feed.
>
> Could you add a link to the section explaining how to enable this?
>
> """
> See the :ref:`dev-manual/packages:Using Runtime Package Management` section of
> the Yocto Project Development Tasks Manual for more information on the
> package management feature.
> """

  oh, man, did this just open up a can of worms. if you check that
section:

https://docs.yoctoproject.org/dev-manual/packages.html#using-runtime-package-management

it has no reference to RSUGGESTS, so sending readers there might be
less than useful. so should some explanation of RSUGGESTS be added
there to provide context?

  and when i scroll to the top of that chapter:

https://docs.yoctoproject.org/dev-manual/packages.html#

the first section, "Excluding Package from an Image", mentions
PACKAGE_EXCLUDE, but does not mention using IMAGE_INSTALL:remove,
which is definitely used in places i've run across. should that also
be mentioned as a way to exclude packages?

  and if so, then that operation should also be mentioned in the
explanation for IMAGE_INSTALL:

https://docs.yoctoproject.org/ref-manual/variables.html#term-IMAGE_INSTALL

  thoughts?

rday


