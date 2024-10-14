Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7862D16270
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:46:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.55488.1728913580700593045
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 06:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BVacR6SV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30BEC40007;
	Mon, 14 Oct 2024 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728913579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q13XRrkN/8Z6Iur+bBFTJGWA0gIfhTolp+8xIkXyOM0=;
	b=BVacR6SVgA4aM0ftbz+o9O8P2GKKwSg5PN8TCDOfYgPkOGjUvZHAzbSH9xsRLmD4HeD/DH
	aj7CGq+89tu6/+wXQf/VyPDwik82A5LST5+hGPxXlyT1gWbOYDI6BeUpBguPXlCjHxjYFc
	gXl60NbLeGwppaqMNEMkSGNaUTI93AefAqUAOf3wkwP9RA3LuuZI7AI9vJMZ/hEjB+q0+B
	GwEliUEIUhrt/pfUg6bFKRCTuYI4C46Oqgvj/J+nt1imMzYbCtEOcUEjtP1OlIBH0aSgBZ
	A3FtUYgyYPXK+Qclle3qRKZWChugFSqs1pxne4k7Ys1Gvp83lJU8ip58ZQwBqQ==
Date: Mon, 14 Oct 2024 15:46:18 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org, Ross Burton <ross.burton@arm.com>, 
	Paul Eggleton <paul.eggleton@microsoft.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [docs] [PATCH v3 14/16] ref-manual: add mission pep517-backend
 sanity check
Message-ID: <zforfl2r62hvb3fpgawr2ct5aywruhig7iw5z4cixbncwkulco@qgu3y7xu6hbq>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
 <20241010-release-note-5-1-v3-14-2cef1a58f1ab@bootlin.com>
 <f34d2700-ae0f-409b-b4d9-c864de975d57@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f34d2700-ae0f-409b-b4d9-c864de975d57@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 13:46:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5485

On 14/10/2024 14:16:07+0000, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/10/24 2:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
> > New sanity check to check for PEP517-backend compliance.
> >
> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > ---
> >   documentation/ref-manual/classes.rst | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> > index cdfd1f7e3..a715be97d 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -1478,6 +1478,9 @@ The tests you can list with the :term:`WARN_QA` and
> >   -  ``perms:`` Currently, this check is unused but reserved.
> > +-  ``pep517-backend:`` checks that a recipe inheriting
> > +   :ref:`ref-classes-setuptools3` has a PEP517-compliant backend.
> > +
>
> Not sure we follow this for each entry in that list, but this one is not in
> its proper location if we were to alphabetically order the list.

Ha, you're right I got it wrong. Thanks, will fix.

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

