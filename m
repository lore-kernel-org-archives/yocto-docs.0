Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5801AD5CC94
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:22:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18325.1765876967582172559
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 01:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wWU9zvfa;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D3A4BC19D30
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 09:22:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D39A6071C;
	Tue, 16 Dec 2025 09:22:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96A7611943273;
	Tue, 16 Dec 2025 10:22:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765876964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SR5wxEyxUYrdJ+nrkhlkcoOMChLxzww0EvyBuD27jjQ=;
	b=wWU9zvfavdE4nc/PmDHKsVI/019BXW+s5+oKyu6+7pIVqSyGr2GdRN1pw7di+mHHRvtvv8
	eECYKCYhlePO5DybRQFNt9Hr02T9FVR3WYgwun6G2/GvDuv1YqisHH+waAG7LtxL7By3xH
	Bx2OeZP4ykqG0XrVRenjzexlMO3nDXSPgGG2Mcm3Tt8psLPOw2c8cP5TOxA4uqONt0B0At
	490s4zkDq/P/8pciDj2KY7DZvZzL7AjvbIRfhoX3M/rBdQtY9akJyGzep3HJ/Maj9GLB4P
	sFdhFO+tliSX24/9iyiiOM2GrVZZs1xz/ycNtbvav+U9D3TacYuTP/+9yO5D2w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 10:22:43 +0100
Message-Id: <DEZJ51MUS01O.1PROZNRHWAVNA@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/2] ref-manual/classes.rst: document the
 image-container class
References: <20251212-image-container-v1-0-fb6586d06813@bootlin.com>
 <20251212-image-container-v1-2-fb6586d06813@bootlin.com>
 <72fe57bb-a025-4816-8337-e3791a300398@cherry.de>
In-Reply-To: <72fe57bb-a025-4816-8337-e3791a300398@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 09:22:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8279

Hi,

On Fri Dec 12, 2025 at 1:07 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/12/25 11:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add documentation for the image-container class, which is a simple class
>> to generate an image suitable for creating a container.
>>=20
>
> Wrong order of patches, patch 1 uses the reflink created in this patch.
>
> EDIT: and this patch depends on patch 1 as well, so just merge both of=20
> them into one patch, they are related anyway.

Yeah, I thought I was being smart by making sure the order was right, turns=
 out
they should be merged together!

>> This answers in part to questions asked in [YOCTO #14368].
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/classes.rst | 51 ++++++++++++++++++++++++++++=
++++++++
>>   1 file changed, 51 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-ma=
nual/classes.rst
>> index a56a2f719..0097b7c46 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -1258,6 +1258,57 @@ The :ref:`ref-classes-image_types` class also han=
dles conversion and compression
>>      :term:`IMAGE_FSTYPES`. This would also be similar for Virtual Box V=
irtual Disk
>>      Image ("vdi") and QEMU Copy On Write Version 2 ("qcow2") images.
>>  =20
>> +.. _ref-classes-image-container:
>> +
>> +``image-container``
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The :ref:`ref-classes-image-container` class is meant to be inherited i=
n
>> +:doc:`image </ref-manual/images>` recipes. It provides relevant setting=
s to
>> +generate an image ready for use with an :wikipedia:`OCI
>> +<Open_Container_Initiative>`-compliant container management tool.
>
> such as....? podman and docker I assume, probably others.
>
>> +
>> +.. note::
>> +
>> +   This class does not build and install container management tools on =
the
>
> s/does not build and install/neither builds nor installs/
>
>> +   target. Support for this is available in the :yocto_git:`meta-virtua=
lization
>
> s/Support for this is/Those tools are/?
>
>> +   </meta-virtualization>` layer.
>> +
>> +An image recipe inheriting this class should also add the ``container``=
 image
>> +type to the :term:`IMAGE_FSTYPES` variable::
>> +
>> +   IMAGE_FSTYPES +=3D "container"
>> +
>
> Isn't that done by image.bbclass already anyway? This class is=20
> automatically inherited when IMAGE_FSTYPES contains "container".
>
> c.f.=20
> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/i=
mage.bbclass#n20=20
> and=20
> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/i=
mage.bbclass#n25=20
> ?
>
>> +This image type does not deploy anything specific in :term:`DEPLOY_DIR_=
IMAGE`,
>> +but will simply add ``tar.bz2`` to the image types.
>> +
>> +You must also set the :term:`PREFERRED_PROVIDER` for the Linux kernel t=
o
>
> No. You *can* (and you typically want).
>
>> +``linux-dummy`` in a :term:`configuration file`::
>> +
>> +   PREFERRED_PROVIDER_virtual/kernel =3D "linux-dummy"
>> +> +The ``linux-dummy`` recipes acts as a Linux kernel recipe but builds=
=20
> nothing. It
>> +is relevant in this case as a container image does not need to include =
a Linux
>> +kernel. Selecting it as the preferred provider for the kernel will also=
 decrease
>> +build time.
>> +
>> +If desired, the :term:`IMAGE_CONTAINER_NO_DUMMY` variable can be set to=
 "1" to
>> +skip the ``PREFERRED_PROVIDER_virtual/kernel`` check.
>> +
>
> Ah scratch that review on patch 1, linux-dummy isn't the default.

I haven't seen your review on patch 1 (locally or on lore.kernel.org), did =
you
forget to send it?

>> +After the image is built, the generated ``tar.bz2`` archive can be used=
 in a
>> +container generation file. For example, to be used with :wikipedia:`Pod=
man
>
> Being curious, where did you see "container generation file" being used?=
=20

Nowhere else, I made that up I guess. I'll reword this and mention
Containerfile/Dockerfile.

> First time I see Containerfile/Dockerfile named this way. You could keep=
=20
> it but maybe specify that it's typically named Containerfile or=20
> Dockerfile so people know what we're talking about?

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


