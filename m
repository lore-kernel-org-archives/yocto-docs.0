Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50205D6ACCE
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 13:18:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.71575.1732713470530848884
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 05:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=W31LwLsX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CFC0240002;
	Wed, 27 Nov 2024 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732713468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1n3Abnjy/cH9oddf1/vROoI/cumd4TvKGtMOyD73Vw=;
	b=W31LwLsX+gCg6FSdhOjggFVD7W0YJRxLNH2BK/SqQgjccqkyNUklmrWpMmIIesVKrKdD2d
	luyQmE7N57MRAfhJMsUIUWa20sYbwJ9pRjGZBVRctpGtejxl8M78Bg42mIfHoF9wVS5Dbn
	y53gw5co1/zej/NyWd8eDH2UPPcASbkDTrIkP4Xe5Xw65Pkm6c0MVSbZ3c3EG4p6ei8pUX
	qIDEveq9MuhxehNSkksE/8jZOGcG+AfAq+PMlK71AUXR1iujP/k06AVmE4hjBK3diq8qN4
	nArCtENBrA/hsSi8yKUByvwkWyYYd2hSeu+MKLCGhC2A1UMntBCv9Ue4XLWe/A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Nov 2024 14:17:48 +0100
Message-Id: <D5WZNUEBWRXT.18H1Q0G3SGRE6@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>
Subject: Re: [docs] [yocto-docs][PATCH v2] Update the documentation for
 SRCPV
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241125-deprecated-srcpv-v2-1-89bc3afc78db@bootlin.com>
 <a8f7ee5a-0733-409e-a9eb-a5531c6eda23@cherry.de>
 <D5WTAZ2HJTBW.NLAN1YRHN9IE@bootlin.com>
 <f6b6408f-e156-4b24-9930-0335b70f45be@cherry.de>
In-Reply-To: <f6b6408f-e156-4b24-9930-0335b70f45be@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 13:18:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5829

Hi Quentin,

On Wed Nov 27, 2024 at 1:51 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Antonin,
>
> On 11/27/24 9:18 AM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Mon Nov 25, 2024 at 4:57 PM CET, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 11/25/24 9:17 AM, Antonin Godard wrote:
>>>> The variable SRCPV is deprecated since 4.3. Instead of including SRCPV
>>>> in PV, including the sign "+" is enough for bitbake to add the source
>>>> control information to PKGV during the packaging phase.
>>>>
>>>> Update the documentation for SRCPV and the places where it was used.
>>>> When instructions previously referred to SRCPV, replace by mentioning =
to
>>>> include "+" in the assignment.
>>>>
>>>> In most examples, "+git" is added to PV as it is the most popular SCM.
>>>> Simply adding "+" is also possible, although it is better practice to
>>>> include the SCM name, so give that example.
>>>>
>>>> Update the gcompat example with l3afpad as it didn't include "+git" in
>>>> its PV definition anymore.
>>>>
>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>> ---
>>> [...]
>>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst
>>>> index ec4d7ab73fe3ac1bc64f5378c65d19ae0b749809..f611edae9f370977342348=
05faa34b1850e5cfd1 100644
>>>> --- a/documentation/ref-manual/variables.rst
>>>> +++ b/documentation/ref-manual/variables.rst
>>>> @@ -209,12 +209,11 @@ system and gives an overview of their function a=
nd contents.
>>>>             SRCREV =3D "${AUTOREV}"
>>>>   =20
>>>>          If you use the previous statement to retrieve the latest vers=
ion of
>>>> -      software, you need to be sure :term:`PV` contains
>>>> -      ``${``\ :term:`SRCPV`\ ``}``. For example, suppose you have a k=
ernel
>>>> -      recipe that inherits the :ref:`ref-classes-kernel` class and yo=
u
>>>> -      use the previous statement. In this example, ``${SRCPV}`` does =
not
>>>> -      automatically get into :term:`PV`. Consequently, you need to ch=
ange
>>>> -      :term:`PV` in your recipe so that it does contain ``${SRCPV}``.
>>>> +      software, you need to make sure :term:`PV` contains the ``+`` s=
ign so
>>>> +      :term:`bitbake` includes source control information to :term:`P=
KGV` when
>>>> +      packaging the recipe. For example::
>>>> +
>>>> +        PV =3D "6.10.y+git"
>>>>   =20
>>>
>>> I believe this is not properly indented? Missing a space here to follow
>>> our standards?
>>=20
>>=20
>> Good catch, thank you. Some others below are also not properly indented.=
 It
>> would be nice if sphinx-lint could report this, but I don't think it is =
able to.
>>=20
>
> It's open-source, so maybe something we can contribute :)

For sure. I took a glance at it, and there's no support for any config file=
 at
all so that would be a first step to add, considering 2 or 3 spaces is a
personal choice.

[...]
>>> I think we could simplify the example. The point is not necessarily to
>>> use % with a git-named recipe but rather that a git-named recipe is not
>>> going to match "git" but the "PV" defined in the recipe. What do you th=
ink?
>>=20
>> Ok, something like:
>>=20
>>    If your PV is equal to "a.b.c+git", you can match it with "a.b.c%" in
>>    PREFERRED_VERSION?
>>=20
>> This makes more sense with the current state of things, and simplifies t=
he
>> example a bit.
>>=20
>
> """
> If you want to select a recipe named foo_git.bb which has :term:`PV` set=
=20
> to `1.2.3+git`, you can do so by setting :term:`PREFERRED_VERSION_foo`=20
> to `1.2.3%` (i.e. using simply `git` will not work as the name of the=20
> recipe isn't used, but rather its :term:`PV`).
> """
>
> or something like that?
>
> Is PV really extended with the git hash when there's a + in there or is=
=20
> it only PKGV that gets it? Basically, do you even need % character when=
=20
> we have a + in PV now?
>
> Not sure it's clear, lemme know if I need to rephrase my question.

So yes you got it right: PV will never contain the hash, only PKGV will (an=
d
only during do_install iirc, so bitbake-getvar PKGV will not show the hash)=
.

Which makes me wonder if giving the example above is any useful, since you =
could
just set PREFERRED_VERSION_foo to "1.2.3+git".


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

