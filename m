Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D3AD206A7
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 07:28:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.17879.1729063679852560842
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 00:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nq9oebD9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BF9E1BF20E;
	Wed, 16 Oct 2024 07:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729063678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oU5VjPO6N4fKMw/yffCV1tJC7O1zQ6jnrdeLduG10O8=;
	b=nq9oebD9/b7TCTvDEPpWRn3qnWS09ZpU67lHV0wGX4Uw6cGfOKJHf0qfiZLjtV3EeH24BS
	9RQDx/MKtHAQIwoaN4lrYIn35fOMdvkarPSWugeTyVKIQdbmjlceI9SSJPB0Luekq4wv6D
	5KB+hzHht+TLSzm2A3wO5WV26sWOd7bgIf4sLld2LhcxBO5JuRtjuWwBTOHfHMzkMV6wy/
	YopVwzKPYDvH6HQ97ez0XmNXRBu0V+wbCmO6dpIoITBYR1UCyFJ+rC3U5co7fll4pEZC+B
	qugxqTLWIdkGJ5M0ap5JMq+xBmO/68N+bSoRut316MddwgpcWKeRMvqIjqJCmQ==
Date: Wed, 16 Oct 2024 09:27:56 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] ref-manual: structure.rst: document missing tmp/
 dirs
Message-ID: <joc6s7y3bcw3nkif2hgaeghtjrzz4kj6nj6wkd5jegzluqsvid@x5ftns4qazij>
References: <20241014-bug-14543-v1-1-7c8519be9c9c@bootlin.com>
 <8eb61ec2-4f53-45f4-ac08-af5aec1c997e@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eb61ec2-4f53-45f4-ac08-af5aec1c997e@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 07:28:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5494

Hi Quentin,

Thanks for the reviews again.

On 15/10/2024 13:20:19+0000, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Antonin,
>
> On 10/14/24 3:44 PM, Antonin Godard via lists.yoctoproject.org wrote:
> > Document `hosttools/`, `pkgdata/` and add some more information on
> > `work-shared/`.
> >
> > Adresses [YOCTO #14543].
> >
> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > ---
> >   documentation/ref-manual/structure.rst | 31 +++++++++++++++++++++++++++++--
> >   1 file changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> > index e4d8b54bb9e39ffe344d2db1798e4fe76c742f4e..d13743cc285420b4d24f022ff6134a7ca33edcb2 100644
> > --- a/documentation/ref-manual/structure.rst
> > +++ b/documentation/ref-manual/structure.rst
> > @@ -484,6 +484,30 @@ the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
> >   section in the Yocto Project Application Development and the Extensible
> >   Software Development Kit (eSDK) manual.
> > +.. _structure-build-tmp-hosttools:
> > +
> > +``build/tmp/hosttools/``
> > +~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The OpenEmbedded build system uses this directory to create symbolic links to
> > +some of host components that are allowed to be called within tasks. These are
>
> some of the? I think we're missing a "the" here?

Ha, you're right good catch.

> > +basic components usually pre-installed on the :ref:`supported Linux
> > +distributions <system-requirements-supported-distros>`. These components are
>
> I think this is a bit misleading as they are not necessarily preinstalled (I
> believe?) but rather part of the minimal setup required to get Yocto
> working, as documented in the link you provide there.

I agree, iirc git is not installed by default on every distro for example. I
will change to "basic components listed in the
:ref:`ref-manual/system-requirements:required packages for the build host`
section".

> In any case, s/pre-installed/preinstalled/ if it were to stay.

There are multiple instances of "post-installation". "pre-installation",
"pre-intall" in the docs, so I think we keep it that way (or we don't after the
rephrasing anyway :) ).

> > +listed in the :term:`HOSTTOOLS` variable and are limited to this list to prevent
> > +host contamination.
> > +
> > +.. _structure-build-tmp-pkgdata:
> > +
> > +``build/tmp/pkgdata/``
> > +~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The OpenEmbedded build system uses this directory to store package metadata
> > +generated during the :ref:`ref-tasks-packagedata` task. The files stored in this
> > +directory contain information about each output package produced by the
> > +OpenEmbedded build system, and are used in different ways by the build system
> > +such as ":ref:`dev-manual/debugging:viewing package information with
> > +\`\`oe-pkgdata-util\`\``".
> > +
> >   .. _structure-build-tmp-sstate-control:
> >   ``build/tmp/sstate-control/``
> > @@ -657,8 +681,11 @@ Here are key subdirectories within each recipe work directory:
> >   For efficiency, the OpenEmbedded build system creates and uses this
> >   directory to hold recipes that share a work directory with other
> > -recipes. In practice, this is only used for ``gcc`` and its variants
> > -(e.g. ``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth).
> > +recipes. This is for example used for ``gcc`` and its variants (e.g.
> > +``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth), or by the
> > +:ref:`ref-classes-kernel` class to store the kernel source code and kernel build
> > +artifacts as a way to make it common to out-of-tree kernel modules or other
>
> Can suggest:
> s/as a way to make it common to/to make it available to/
> or
> so it's common between
>
> But not necessarily a better wording :) Up to you!

Agreed on the better wording, thanks!

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

