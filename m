Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FFED5E12E
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 10:55:05 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19543.1765882496308725231
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 02:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pYhe6N3r;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B963E4E41C21
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 10:54:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 864276071C;
	Tue, 16 Dec 2025 10:54:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D64F3119433C5;
	Tue, 16 Dec 2025 11:54:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765882490; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vzg7GkNVdYTnjS55gGnbKVpr3L7Kvl7Ar5mRSkg5EiQ=;
	b=pYhe6N3rgfXfSIqKTB8uZOxnjMYdEaIReCMgHuDghVhGWNRnQk59uP1bgXnq98UA4z0xBA
	P8cEPXs/yQoqEkwTUFBgIGepkQv/ygtx+I75j0reiZ4WTwnHQlmjrjHLm2WYx4V9ZNW1ec
	+qF2IjRRHBc43YvzdYeaIQunnqBvwt0uFGjJpERMnNLLMX9vagjtuY5otHiLwRtO7orMlp
	hzyvAulieC9Xh0GBSc/3zMVPtA1WA7IJ1ur4ct9LBCVSNGMOr9HKe1ESBo/MgNvKZ4Qo4z
	XNGn1ciJKKrZmKYi06v2itOWhg/JHSNCvmNglz6V0Ef9WFAPYhvYMfU3ZsbMaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 11:54:49 +0100
Message-Id: <DEZL3KHLGAA1.29V7ZVU4ZVV44@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 10:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8285

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
>
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

Ah, so actually you're supposed to just add "container" to IMAGE_FSTYPES ra=
ther
than inheriting the class. I wonder why this was designed like this rather =
than
just a class inherit, it's not obvious/usual.

I will instruct to only set IMAGE_FSTYPES then.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


