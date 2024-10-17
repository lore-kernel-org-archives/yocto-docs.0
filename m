Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AC3D2F7FB
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 07:40:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.43261.1729150800140831293
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 00:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xj3bQ0KN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A617C0004;
	Thu, 17 Oct 2024 07:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729150798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNjxu/uDFCLKrJ8BU4OdixMe1zFpZb7ZJ+gurJ44+zY=;
	b=Xj3bQ0KNDPqKUpzII26u6M0kwVjR+24ZsmSGRqho0fUIHm8UJHgjbSI1QAl6AgYx6lOxHn
	C3CqrRpbfuRNeKc1ZGkeys9eLhA1K860ah0sJsif9Eq+yELrW6AzzdxCgaW0iTSQYBlEll
	1y7F20CqZgR9DCc9vR80U8+A2ZOQwM8yBmDd4bQQ/3Y/vMbTleEFWVV1gRz0b5g/mzkcrg
	vohTtGhVMcBXIQ3bEj0XZoUzspoQZd0ICpy4RsfTEy2Lsa8JVbXp8Y6mCLUo8ye0zJES0M
	OmOMS1rY6Sqg/m+9DzqGNVwhCBEn2BLoMSaY5toTheJnLJNaNSB8hURaFOoKbA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Oct 2024 09:39:57 +0200
Message-Id: <D4XWSU9PE9S7.27ZKXJ5Q2NP7V@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Robert P. J. Day"
 <rpjday@crashcourse.ca>
Subject: Re: [PATCH v3] ref-manual: structure.rst: document missing tmp/
 dirs
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241016-bug-14543-v3-1-35ff2724e662@bootlin.com>
 <a468864b-3ab6-4d29-baf5-8d56bae8e68d@cherry.de>
In-Reply-To: <a468864b-3ab6-4d29-baf5-8d56bae8e68d@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Oct 2024 07:40:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5525

Hi Quentin,

On Wed Oct 16, 2024 at 5:34 PM CEST, Quentin Schulz wrote:
> >   For efficiency, the OpenEmbedded build system creates and uses this
> >   directory to hold recipes that share a work directory with other
> > -recipes. In practice, this is only used for ``gcc`` and its variants
> > -(e.g. ``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth).
> > +recipes. This is for example used for ``gcc`` and its variants (e.g.
> > +``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth), or by the
> > +:ref:`ref-classes-kernel` class to make the kernel source code and ker=
nel build
> > +artifacts available to out-of-tree kernel modules or other kernel-depe=
ndent
> > +recipes.
> > +
> > +In practice, only a few recipes make use of the ``work-shared`` direct=
ory. This
> > +directory is especially useful for recipes that would induce a lot of =
storage
> > +space if they were to be shared with the standard :term:`Sysroot` mech=
anism.
> >
>
> Provided that's a legit justification for using work-shared (I really do
> not know :) ),

I chose the above wording to express that it is _one_ of the things it is u=
sed
for, it doesn't really imply that it's the _only_ thing it's used for=E2=80=
=A6=C2=A0so it's
not set in stone. :)

> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Thanks!
> Quentin

Thank you,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

