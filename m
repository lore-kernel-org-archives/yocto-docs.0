Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BECD2A528
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 15:22:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.25678.1729092117798400149
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 08:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=omoa/cXE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67FF4E0005;
	Wed, 16 Oct 2024 15:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729092116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOAtBqRBJkhWbk7gHEZNM8Zn+PB0dPhwgzeyVPEbOhY=;
	b=omoa/cXE64uZeRvd2wIGv6FhEn1dnG8z2Nzq2//dtJ03aL6KHMKSrnnXuI0O7ojZelc2Dj
	LySJAm7/qwm7FDgp0BCRih0Gr9jbQhscyjuimQACiSUADn6IYL2R6TjW51uVcM5dDlpxoe
	cmxsn8Ius5ZEfL8wBerxlrUhd8uPN/5YARZuRiVKwCqbP5RVVztv92oORlR12YKjvR97UE
	G4bn3n3fGH64Eln7A6BSiURy6EzbEZtxREAmb/OKLQHy7ydxHc0EuCxL3bsl2yq3S1d/MR
	oWBQ4Cl8fjtwAWxDKD2rCP01vgtxjUctzX/pGh+MpG/jBKkQbauyNS2vfMwl7A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 17:21:55 +0200
Message-Id: <D4XBZZRW9BXN.1KNMZEHMOV0JW@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Robert P. J. Day"
 <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH v2] ref-manual: structure.rst: document missing
 tmp/ dirs
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241016-bug-14543-v2-1-df3038344377@bootlin.com>
 <023f8e3f-2dfd-4f99-a3c0-f3205ebf9e6e@cherry.de>
In-Reply-To: <023f8e3f-2dfd-4f99-a3c0-f3205ebf9e6e@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 15:22:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5522

Hi Quentin,

On Wed Oct 16, 2024 at 3:30 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> >   For efficiency, the OpenEmbedded build system creates and uses this
> >   directory to hold recipes that share a work directory with other
> > -recipes. In practice, this is only used for ``gcc`` and its variants
> > -(e.g. ``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth).
> > +recipes. This is for example used for ``gcc`` and its variants (e.g.
> > +``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth), or by the
> > +:ref:`ref-classes-kernel` class to store the kernel source code and ke=
rnel build
> > +artifacts to make it available to out-of-tree kernel modules or other
>
> s/it/them/
>
> I would also try to avoid one of the three "to" we have in the same
> sentence, so maybe:
>
> """
> or by the :ref:`ref-classes-kernel` class to make the kernel source code
> and kernel build artifacts available to...
> """

Better phrasing, agreed :)

> Also, I'm wondering if we shouldn't expand a bit more on the
> "efficiency" part or what makes a recipe a candidate for using
> work-shared? I assume this is mostly because if we were to use the
> normal sysroot mechanism, it would be overgrown and take even more
> storage space than currently? I honestly do not know. Also, this doesn't
> need to be done in this commit, incremental changes are fine here :)

Makes sense expanding to me too. I think reducing storage usage is one of t=
he
reasons, another would be to share a workdir like gcc... But mentioning it'=
s
rarity is a good thing IMO.

Since I'd rather not forget to add this, I will try to add a note on this i=
t in
my v3.

> With the it/them swap or the second suggestion:
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Thanks!
> Quentin

Thank you!
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

