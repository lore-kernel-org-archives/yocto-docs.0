Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E9AD2A523
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 14:29:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.24689.1729088975680510208
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 07:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LyQ7mPqe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DF2C1C000A;
	Wed, 16 Oct 2024 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729088973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fk1ofddfRvIZMGaZvUv7EZxKWAVfiZ8no48Va2M6fBk=;
	b=LyQ7mPqe9UwCDetAE53051lmvzEXgWuKHH/FJ594Vd8R/YNLMscBBJN1J6G1CeCZEdiXCA
	LEk1lwcBJThr41Au47u/pCcDiLUqsPttgBkdep1n2lagCQO1pC3GRnJ4SFdsjZfMT+JqQu
	WQxXquJz9UsDpyYDUejGajtm0HorIdnSYuE1nVAr4bc8ELqXfHbMGuuUHqKw7QEFvRq+je
	eBiCZdq/QKvEsE4IfIDwE4JVVJm8wYKkaWGhTT6nHOVCzznyvGJsw/RpUKP6o29AIfO1t1
	ZYimAfOkCGNx0eNNpTxNffna9Pv/ODFmNJi97bfUJ1qP/PLo3IdvWUaBZz/Jfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 16:29:33 +0200
Message-Id: <D4XAVWDIAFOA.1S7GZQ18K19BA@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Ross Burton"
 <Ross.Burton@arm.com>
Subject: Re: [docs] [PATCH v2] release-notes-5.1: add beaglebone-yocto
 parselogs test oeqa failure
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241016-5-1-parselogs-beagle-v2-1-9568ac00907f@bootlin.com>
 <00a6a241-b146-4de1-b091-9bce7cc01091@cherry.de>
In-Reply-To: <00a6a241-b146-4de1-b091-9bce7cc01091@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 14:29:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5521

On Wed Oct 16, 2024 at 4:20 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 10/16/24 4:18 PM, Antonin Godard wrote:
> > The beaglebone-yocto currently fails the parselogs runtime test. For
> > details see: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15624
> >
> > Reported-by: Ross Burton <Ross.Burton@arm.com>
> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > ---
> > Changes in v2:
> > - Add link to Bugzilla with `:yocto_bugs:`.
> > - Link to v1: https://lore.kernel.org/r/20241016-5-1-parselogs-beagle-v=
1-1-ade903beb18a@bootlin.com
> > ---
> >   documentation/migration-guides/release-notes-5.1.rst | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/documentation/migration-guides/release-notes-5.1.rst b/doc=
umentation/migration-guides/release-notes-5.1.rst
> > index 0f1cb5312e1a59fdfff2df57e98b6c4a27bd589d..d6e284c1e8fef2c7dada3f1=
5ffe3c0cecf21a981 100644
> > --- a/documentation/migration-guides/release-notes-5.1.rst
> > +++ b/documentation/migration-guides/release-notes-5.1.rst
> > @@ -402,6 +402,13 @@ New Features / Enhancements in 5.1
> >         scripts, fixing some issues seen when :term:`PACKAGECONFIG` wou=
ld
> >         conditionally modify it.
> >
> > +Known Issues in 5.1
> > +~~~~~~~~~~~~~~~~~~~
> > +
> > +-  ``oeqa/runtime``: the ``beaglebone-yocto`` target fails the ``parse=
logs``
> > +   runtime test due to unexpected kernel error messages in the log (se=
e
> > +   :yocto_bugs:`bug 15624 </show_bug.cgi?id=3D15624>` on Bugzilla).
> > +
>
> Provided you tested what I wrote before sending the patch ( :) ),

Of course, works flawlessly :)

> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

