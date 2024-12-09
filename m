Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7013EE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 16:37:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.106190.1733762255224900709
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 08:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XCUQyteU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ECFA40002;
	Mon,  9 Dec 2024 16:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733762253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zXJ0GaiVBLr4c8aEW/dw04ls9doIRXMgrkjs9MEXIVs=;
	b=XCUQyteU+gjgaeQTLB9+9JdQEIdBKodZz4gq/BUpbihurDm82qCZy9sRaSmSpCQZ/klGbc
	fCGPthU5xTFRXLny2o3rSPDyMASS7hUwj1mo7eoFlO1KdIsI6bNQswumUtQKjKf5Dx53RO
	CR/C+EJLGjUjYuHPczwj5lB249oBcJLbVo9YgkwvfjxoBwZA5rKJp01FAi8pPJvH72iuoy
	r0otCMVUJkq/620BDIj+6FbZTYqY+AADjM2LJz+sDHNwe9Ldm9zD9OlGV+MRJWYMYVui12
	GsBV5waCWAwQVolDbdDeXz3O4u0NN9dStrF2XSyPeujedveFAn0MG1YADWJUNg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Dec 2024 17:37:32 +0100
Message-Id: <D67BFBHMHKJY.H9OY5KXNMEJ1@bootlin.com>
Subject: Re: [yocto-docs][PATCH v3] Update the documentation for SRCPV
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241127-deprecated-srcpv-v3-1-4eb17c564c29@bootlin.com>
 <caf9df48-3ae4-4136-a359-eefc42339fe4@cherry.de>
In-Reply-To: <caf9df48-3ae4-4136-a359-eefc42339fe4@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 16:37:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5901

Hi Quentin,

On Fri Dec 6, 2024 at 3:45 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/27/24 5:23 PM, Antonin Godard wrote:
> [...]
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index ec4d7ab73fe3ac1bc64f5378c65d19ae0b749809..9bc07336a750beaf5c1cda82=
72f39803eb53901e 100644
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
>> +         PV =3D "6.10.y+git"
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
>> @@ -6702,9 +6701,7 @@ system and gives an overview of their function and=
 contents.
>>  =20
>>         The :term:`PREFERRED_VERSION` variable supports limited wildcard=
 use
>>         through the "``%``" character. You can use the character to matc=
h any
>> -      number of characters, which can be useful when specifying version=
s
>> -      that contain long revision numbers that potentially change. Here =
are
>
> I would keep some of this in. This is actually a good tip on how to=20
> properly support bbappending in layers. E.g. gstreamer1.0 often gets its=
=20
> minor version changed in the same release branch. If you want your layer=
=20
> to be compatible with all previous, current and future minor versions of=
=20
> the recipe, you can simply use e.g.=20
> gstreamer1.0-plugins-base_1.24.%.bbappend!

You're right, I will add that back in a v4.

>> -      two examples::
>> +      number of characters. Here are two examples::
>>  =20
>>            PREFERRED_VERSION_python =3D "3.4.0"
>>            PREFERRED_VERSION_linux-yocto =3D "5.0%"
>> @@ -6715,22 +6712,13 @@ system and gives an overview of their function a=
nd contents.
>>            string. You cannot use the wildcard character in any other
>>            location of the string.
>>  =20
>> -      The specified version is matched against :term:`PV`, which
>> -      does not necessarily match the version part of the recipe's filen=
ame.
>> -      For example, consider two recipes ``foo_1.2.bb`` and ``foo_git.bb=
``
>> -      where ``foo_git.bb`` contains the following assignment::
>> -
>> -         PV =3D "1.1+git${SRCPV}"
>> -
>> -      In this case, the correct way to select
>> -      ``foo_git.bb`` is by using an assignment such as the following::
>> -
>> -         PREFERRED_VERSION_foo =3D "1.1+git%"
>> +      The specified version is matched against :term:`PV`, which does n=
ot
>> +      necessarily match the version part of the recipe's filename.
>>  =20
>> -      Compare that previous example
>> -      against the following incorrect example, which does not work::
>> -
>> -         PREFERRED_VERSION_foo =3D "git"
>> +      If you want to select a recipe named ``foo_git.bb`` which has :te=
rm:`PV`
>> +      set to ``1.2.3+git``, you can do so by setting ```PREFERRED_VERSI=
ON_foo``
>> +      to ``1.2.3%`` (i.e. simply using ``git`` will not work as the nam=
e of the
>
> s/simply using/simply setting ``PREFERRED_VERSION_foo`` to/
>
> The fact we remove git entirely from PREFERRED_VERSION_foo and say=20
> "simply using git will not work" may be a bit confusing, so making=20
> explicit what exactly won't work is better?

Yes, it's a bit more clear that way, I'll update

>> +      recipe isn't used, but rather its :term:`PV` definition).
>>  =20
>>         Sometimes the :term:`PREFERRED_VERSION` variable can be set by
>>         configuration files in a way that is hard to change. You can use
>> @@ -8316,21 +8304,23 @@ system and gives an overview of their function a=
nd contents.
>>         (SCM).
>>  =20
>>      :term:`SRCPV`
>> -      Returns the version string of the current package. This string is
>> -      used to help define the value of :term:`PV`.
>> +      The variable :term:`SRCPV` is deprecated. It was previously used =
to
>> +      include source control information in :term:`PV` for :term:`bitba=
ke` to
>> +      work correctly but this is no longer a requirement. Source contro=
l
>> +      information will be automatically included by :term:`bitbake` in =
the
>> +      variable :term:`PKGV` during packaging if the ``+`` sign is prese=
nt in
>> +      ``PV``.
>
> :term:`PV` ?

Will update

> Looking good otherwise!

Thanks for the review!
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

