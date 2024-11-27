Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CA2D6ACEA
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 15:20:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.74057.1732720823033245229
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 07:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gHs3tZUr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAD854000C;
	Wed, 27 Nov 2024 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732720821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaTXo3AM+SxUzt6wrfUjL6KJpL4orFln/18+Mw8GYks=;
	b=gHs3tZUrNdU50SPNb6I0yNPNv2r92rIO9U7SUbzozlglVFR3M9/BzILu+QqqDhaWR0zpPS
	PYItcXB9Pe7I8T3dTBmhHpq+9GZhwFjoJGMN/Er90Pmks0NJrfWDbu3pkfqzm2rOK3OsJK
	tYGEvldxNYzjAqoY9lr3coz0LkvDzqu7u3w+3pjSplSfPWlXU9AqCHhTF1PSOikS39qx1m
	nSWNz44gdDb3ACzpoCgtmIiRURqM4NhiyNuHlHq/gpR2BJ6WvHrqgKn37FdIIYMqzpn1Nb
	7vJGbvwCE4H0X3SENiGXI4P6yXwH7r+Md1XNZTcoMSJsLjrlf2XI/BByS3Jkag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Nov 2024 16:20:20 +0100
Message-Id: <D5X29O37SXPR.21UIYRGZFKD1W@bootlin.com>
Subject: Re: [docs] [yocto-docs][PATCH v2] Update the documentation for
 SRCPV
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>
X-Mailer: aerc 0.18.2.r100.gc2048ef3
References: <20241125-deprecated-srcpv-v2-1-89bc3afc78db@bootlin.com>
 <a8f7ee5a-0733-409e-a9eb-a5531c6eda23@cherry.de>
 <D5WTAZ2HJTBW.NLAN1YRHN9IE@bootlin.com>
 <f6b6408f-e156-4b24-9930-0335b70f45be@cherry.de>
 <D5WZNUEBWRXT.18H1Q0G3SGRE6@bootlin.com>
 <caceb002-6c62-4acd-87c3-41555e3344fc@cherry.de>
In-Reply-To: <caceb002-6c62-4acd-87c3-41555e3344fc@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 15:20:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5837

Hi Quentin,

On Wed Nov 27, 2024 at 3:08 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
[...]
>>>>> I think we could simplify the example. The point is not necessarily t=
o
>>>>> use % with a git-named recipe but rather that a git-named recipe is n=
ot
>>>>> going to match "git" but the "PV" defined in the recipe. What do you =
think?
>>>>
>>>> Ok, something like:
>>>>
>>>>     If your PV is equal to "a.b.c+git", you can match it with "a.b.c%"=
 in
>>>>     PREFERRED_VERSION?
>>>>
>>>> This makes more sense with the current state of things, and simplifies=
 the
>>>> example a bit.
>>>>
>>>
>>> """
>>> If you want to select a recipe named foo_git.bb which has :term:`PV` se=
t
>>> to `1.2.3+git`, you can do so by setting :term:`PREFERRED_VERSION_foo`
>>> to `1.2.3%` (i.e. using simply `git` will not work as the name of the
>>> recipe isn't used, but rather its :term:`PV`).
>>> """
>>>
>>> or something like that?
>>>
>>> Is PV really extended with the git hash when there's a + in there or is
>>> it only PKGV that gets it? Basically, do you even need % character when
>>> we have a + in PV now?
>>>
>>> Not sure it's clear, lemme know if I need to rephrase my question.
>>=20
>> So yes you got it right: PV will never contain the hash, only PKGV will =
(and
>> only during do_install iirc, so bitbake-getvar PKGV will not show the ha=
sh).
>>=20
>> Which makes me wonder if giving the example above is any useful, since y=
ou could
>> just set PREFERRED_VERSION_foo to "1.2.3+git".
>>=20
>
> It is useful! The point is to highlight the "version" in the filename of=
=20
> the recipe is not the one you should use in PREFERRED_VERSION, but=20
> rather the value of PV. Incidentally, PV =3D version in the filename by=
=20
> default I believe (maybe for the git ones too?) but it is=20
> recommended/required to set PV for git recipes. So in order to pick the=
=20
> git recipe, you need to use the PV set inside the git recipe and not use=
=20
> "git" along. I believe this is what the original author wanted this=20
> example to transpire?

I didn't think of it that way, but yes, maybe the author wanted to transpir=
e
this + the fact that in the hash wasn't predictable hence the "%". Or only =
one
or the other.

In any case, I get what you mean, and I'll update the description in a v3.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

