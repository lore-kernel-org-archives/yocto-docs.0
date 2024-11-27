Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09DAD609AD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 08:18:58 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.67284.1732695535768552645
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 00:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TwwwBj34;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7003C000A;
	Wed, 27 Nov 2024 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732695534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrKL1DulOkxmtU5RYrujHwCHcpR5RlQ5Hd4kCCtOajc=;
	b=TwwwBj34YWhArwX+QHZOFtbnUdjJsMIMEy42lZFkZQBN0mbdxy/+qvLydkPRWcMAgBbQbU
	cuBB+Z+qSiYNdF164eFvxTKdL8cbXUr6dSnOWEgBmUCnOGTg4VvWIaPvynsUQBXf65pSa0
	ygiOLEdARGLzz98u/e+DQT2kI8xbmbrmrXOqZoSFq3TetyoZ0i4dlToJfrHFHCic7rtFKc
	9/TcKVE8JZJHeYf3LZrcNv4hqtDc5R7RrUVCh5/pQRPHXtevTMkXxI9HnlBfME7jHJdFkK
	gkfRC0Gn2zc1Kd9KnyFvI1ssivOJcEqGgzI63H5yl94WV8H6PPxBHpA1aKk3EA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Nov 2024 09:18:52 +0100
Message-Id: <D5WTAZ2HJTBW.NLAN1YRHN9IE@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [yocto-docs][PATCH v2] Update the documentation for SRCPV
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241125-deprecated-srcpv-v2-1-89bc3afc78db@bootlin.com>
 <a8f7ee5a-0733-409e-a9eb-a5531c6eda23@cherry.de>
In-Reply-To: <a8f7ee5a-0733-409e-a9eb-a5531c6eda23@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 08:18:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5819

Hi Quentin,

On Mon Nov 25, 2024 at 4:57 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/25/24 9:17 AM, Antonin Godard wrote:
>> The variable SRCPV is deprecated since 4.3. Instead of including SRCPV
>> in PV, including the sign "+" is enough for bitbake to add the source
>> control information to PKGV during the packaging phase.
>>=20
>> Update the documentation for SRCPV and the places where it was used.
>> When instructions previously referred to SRCPV, replace by mentioning to
>> include "+" in the assignment.
>>=20
>> In most examples, "+git" is added to PV as it is the most popular SCM.
>> Simply adding "+" is also possible, although it is better practice to
>> include the SCM name, so give that example.
>>=20
>> Update the gcompat example with l3afpad as it didn't include "+git" in
>> its PV definition anymore.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
> [...]
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index ec4d7ab73fe3ac1bc64f5378c65d19ae0b749809..f611edae9f37097734234805=
faa34b1850e5cfd1 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -209,12 +209,11 @@ system and gives an overview of their function and=
 contents.
>>            SRCREV =3D "${AUTOREV}"
>>  =20
>>         If you use the previous statement to retrieve the latest version=
 of
>> -      software, you need to be sure :term:`PV` contains
>> -      ``${``\ :term:`SRCPV`\ ``}``. For example, suppose you have a ker=
nel
>> -      recipe that inherits the :ref:`ref-classes-kernel` class and you
>> -      use the previous statement. In this example, ``${SRCPV}`` does no=
t
>> -      automatically get into :term:`PV`. Consequently, you need to chan=
ge
>> -      :term:`PV` in your recipe so that it does contain ``${SRCPV}``.
>> +      software, you need to make sure :term:`PV` contains the ``+`` sig=
n so
>> +      :term:`bitbake` includes source control information to :term:`PKG=
V` when
>> +      packaging the recipe. For example::
>> +
>> +        PV =3D "6.10.y+git"
>>  =20
>
> I believe this is not properly indented? Missing a space here to follow=
=20
> our standards?


Good catch, thank you. Some others below are also not properly indented. It
would be nice if sphinx-lint could report this, but I don't think it is abl=
e to.

>>         For more information see the
>>         ":ref:`dev-manual/packages:automatically incrementing a package =
version number`"
>> @@ -5152,7 +5151,7 @@ system and gives an overview of their function and=
 contents.
>>         The :term:`LINUX_VERSION` variable is used to define :term:`PV`
>>         for the recipe::
>>  =20
>> -         PV =3D "${LINUX_VERSION}+git${SRCPV}"
>> +         PV =3D "${LINUX_VERSION}+git"
>>  =20
>>      :term:`LINUX_VERSION_EXTENSION`
>>         A string extension compiled into the version string of the Linux
>> @@ -6720,9 +6719,10 @@ system and gives an overview of their function an=
d contents.
>>         For example, consider two recipes ``foo_1.2.bb`` and ``foo_git.b=
b``
>>         where ``foo_git.bb`` contains the following assignment::
>>  =20
>> -         PV =3D "1.1+git${SRCPV}"
>> +         PV =3D "1.1+git${@bb.fetch2.get_srcrev(d)}"
>>  =20
>
> Getting back at my original comment in v1 (forgot to answer again there,=
=20
> so doing it here). I'm not sure this makes sense as an example as it is=
=20
> not necessary anymore since + character is enough to include that=20
> information in PKGV (as far as I understood from the patch). I would=20

Exactly, "+" is enough now.

> like to avoid suggesting using something that isn't relevant here (or=20
> discouraged).
>
> I think we could simplify the example. The point is not necessarily to=20
> use % with a git-named recipe but rather that a git-named recipe is not=
=20
> going to match "git" but the "PV" defined in the recipe. What do you thin=
k?

Ok, something like:

  If your PV is equal to "a.b.c+git", you can match it with "a.b.c%" in
  PREFERRED_VERSION?

This makes more sense with the current state of things, and simplifies the
example a bit.

> Otherwise, I don't really know what kind of example we could provide=20
> that would match the state before the + character behavior change.
>
> Looks good otherwise!

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

