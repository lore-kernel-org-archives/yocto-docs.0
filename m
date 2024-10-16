Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611F1D206B3
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 14:15:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.23948.1729088143369435352
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 07:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mSCgACEr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2B851BF20B;
	Wed, 16 Oct 2024 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729088141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fASVfyRfMrsu8XYkbJ+ELLFy7/X8c6NMTje2b/iC3wk=;
	b=mSCgACErY6S9cjRCuttUQsnivo+KVXVys1s+sbxq5criyFgtTfKPdwnXnXQLWfk88jArfA
	fdRNgB6yWpNrv0iuW15iJmkc1A0Ssiqi7f+sml9FGWlpwjvQt3+j5uVZcnhKGBzy85LRQu
	C13f81KV7fpgUFbCSRBw2nOTNIu3+MQSSwIbmV8EVeyRxENU/bAu8IXcceSoxsGSPepeVz
	G7H9aKIv8rzQRS06FWPf8cpBrIHPNXoOFsN/aNZvTAJl2lrX1FHqX/GmZ3p8ZK6zpj0idS
	BwIAl/F4j9UhihVS/KgOa3xOWrXBkjtFCKho/63AET0IUOV9zKW9wEbfEB0zlw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 16:15:40 +0200
Message-Id: <D4XAL9UZNT9E.1R3KFZFN8VGSM@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Ross Burton"
 <Ross.Burton@arm.com>
Subject: Re: [docs] [PATCH] release-notes-5.1: add beaglebone-yocto
 parselogs test oeqa failure
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241016-5-1-parselogs-beagle-v1-1-ade903beb18a@bootlin.com>
 <b96c8eaf-df55-4276-8ec0-d7e8a7b60f42@cherry.de>
In-Reply-To: <b96c8eaf-df55-4276-8ec0-d7e8a7b60f42@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 14:15:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5518

Hi Quentin,

On Wed Oct 16, 2024 at 3:36 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/16/24 10:33 AM, Antonin Godard via lists.yoctoproject.org wrote:
> > The beaglebone-yocto currently fails the parselogs runtime test. For
> > details see: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15624
> >
> > Reported-by: Ross Burton <Ross.Burton@arm.com>
> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > ---
> >   documentation/migration-guides/release-notes-5.1.rst | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/documentation/migration-guides/release-notes-5.1.rst b/doc=
umentation/migration-guides/release-notes-5.1.rst
> > index 0f1cb5312e1a59fdfff2df57e98b6c4a27bd589d..7ce1ef2299189f7bdc566a8=
e549f4dea105626b5 100644
> > --- a/documentation/migration-guides/release-notes-5.1.rst
> > +++ b/documentation/migration-guides/release-notes-5.1.rst
> > @@ -402,6 +402,12 @@ New Features / Enhancements in 5.1
> >         scripts, fixing some issues seen when :term:`PACKAGECONFIG` wou=
ld
> >         conditionally modify it.
> >
> > +Known Issues in 5.1
> > +~~~~~~~~~~~~~~~~~~~
> > +
> > +-  ``oeqa/runtime``: the ``beaglebone-yocto`` target fails the ``parse=
logs``
> > +   runtime test due to unexpected kernel error messages in the log.
> > +
>
> We have a bugzilla entry, so please mention it so that people can follow
> potential resolution without waiting on the docs to be updated (or us
> forgetting to update it :) ).
>
> I believe something like,
>
> :yocto_bugs:`bug 15624 </show_bug.cgi?id=3D15624>`
>
> should do the trick?

Great suggestion, I didn't know - thanks!

> Interesting that there's a double whitespace after the dash, was that on
> purpose? (Trying to figure out if we should mention this in the
> standard.md or something :) )

Yes, it's part of the standards file actually:

  Though not strictly required by Sphinx, we have also chosen
  to use two space characters after ``-`` to introduce each
  list item

Surprising to me as well and makes my editor act weirdly, but the entire do=
cs
were written that way heh.

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

