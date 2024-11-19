Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DEFD44173
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 15:31:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.24151.1732030292233254973
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Nov 2024 07:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kejuYFrt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FDDDE000A;
	Tue, 19 Nov 2024 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732030290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=axtIuhfhBh3Ch9vQLF/6OcpEkvCio04lZ1AbBhyB0/I=;
	b=kejuYFrtyOZOTnv81KdlOromb0vEFqfKhSkfgu+MFKtnQ1a1E6tkSfz5bFfMiurayieBcD
	ZhsDaiFQ9SWBnoSRhtNfYN8STCWSnoPYRoRb8g8WZayw9tS71XOT0lzlJysW/3ydTwkSmw
	WlLDEn7cvMTOvJFSjqDSfIc8KNL5R7mO/WVOIXwbjf2rLMsaViztYn6WDh9rkSu5/NtC9N
	ejiLeE3g0LbJe/NoGBoGXkW1nnkqUolhMx2aGu35Bl0L5pYjp2aK6mp1jeBiYZ8fKtESeo
	aL8IUkA0ykRHNeVIlo/gQoMUXrZ3hEQg/tXnF4OglXUuIS/f7eodlP/PlVYiWw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Nov 2024 16:31:29 +0100
Message-Id: <D5Q9HUL65M5N.UKWNSZYA9JNQ@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [yocto-docs PATCH] Update the documentation for SRCPV
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241118-deprecated-srcpv-v1-1-bdab9da44267@bootlin.com>
 <ecb9d274-2380-4f83-880d-629b64e279b9@cherry.de>
In-Reply-To: <ecb9d274-2380-4f83-880d-629b64e279b9@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Nov 2024 15:31:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5770

Hi Quentin,

On Tue Nov 19, 2024 at 10:50 AM CET, Quentin Schulz wrote:
[...]
>>   To enable this behavior, the :term:`PV` of
>> -the recipe needs to reference
>> -:term:`SRCPV`. Here is an example::
>> +the recipe needs to include a ``+`` sign in its assignment.
>> +Here is an example::
>>  =20
>> -   PV =3D "1.2.3+git${SRCPV}"
>> +   PV =3D "1.2.3+git"
>> +
>> +:term:`Bitbake` later include the source control information in :term:`=
PKGV` in
>> +the packaging phase.
>>  =20
>
> s/include/includes/
>
> s/in the packaging phase/during the package phase/ ?

Agreed, looks better thanks.

[...]
>>      -  :term:`PV`: The default :term:`PV`
>> -      assignment is typically adequate. It combines the
>> -      :term:`LINUX_VERSION` with the Source Control Manager (SCM) revis=
ion
>> -      as derived from the :term:`SRCPV`
>> -      variable. The combined results are a string with the following
>> -      form::
>> -
>> -         3.19.11+git1+68a635bf8dfb64b02263c1ac80c948647cc76d5f_1+218bd8=
d2022b9852c60d32f0d770931e3cf343e2
>> -
>> -      While lengthy, the extra verbosity in :term:`PV` helps ensure you=
 are
>> -      using the exact sources from which you intend to build.
>> +      assignment is typically adequate. It uses the value of
>> +      :term:`LINUX_VERSION`.
>>  =20
>
> We can take this opportunity to reindent properly here?

Ah yes, I didn't see that, thanks

> Also, linux-yocto still appends +git to it, so I guess we should mention=
=20
> to add the +git here too.

Indeed, will add that.

>>      -  :term:`COMPATIBLE_MACHINE`:
>>         A list of the machines supported by your new recipe. This variab=
le
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index 43f4d79663bb118f56c2e1b69fb9782357074e65..ef0d0a3c34c2985c587cbbd4=
1ac7df8c24b2a4c4 100644
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
>> +      software, you need to be sure :term:`PV` contains the ``+`` sign =
so
>
> I know we already have this, but maybe s/be/make/?

+1

>> +      :term:`bitbake` includes source control information to :term:`PKG=
V` when
>> +      packaging the recipe. For example::
>> +
>> +        PV =3D "6.10.y+git"
>>  =20
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
> Not sure why we suddenly add this inline python here instead of just=20
> adding "+git" ?

Since the goal is to demonstrate the usage of "%" in PREFERRED_VERSION, I
thought keeping an unpredictable value here made sense. I just took the pre=
vious
definition of SRCPV and replaced it here. Maybe we could replace the exampl=
e
with "6.10.%" to match all 6.10 kernel versions for example, if a layer
providing the kernel gets updated regularly. What do you think?


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

