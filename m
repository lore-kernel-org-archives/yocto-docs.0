Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF5FD5E129
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 10:50:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19495.1765882252314060289
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 02:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zhXfJnfo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 485004E41C21
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 10:50:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 190466071C;
	Tue, 16 Dec 2025 10:50:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 781A6119432AD;
	Tue, 16 Dec 2025 11:50:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765882249; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=waaX7CUMRHBtkHnKoJbytD7u3lgrhvfdMI0axJ00HCk=;
	b=zhXfJnfoPyANKBbKAm19wiuoa7datKVzCGMPBg/J3eaT/kPcoIZmjfDxP6jxJh9CVkMPg0
	BkC+hXW5xjyBVGNViKKvRo3Z7K1BiHQ2nPY4+ug44EYFXwjMlNVWQBSRw+tm00mGLve55Y
	gofQKrePYw2uGRFyNLWR7BedgtQJVPk3zmbtytQpOv4QPPZrYqoRcTsVfnazyQWLBbTN1o
	7mkaGW028iaL45CwlSmtCavb6rPvPF+xkex8OO3qvUQ5wVoPVNtld+i6cBEs5omEepFW3S
	a9FxLKZCjBpL6175KdOurObUv/+gNxvG6M7HCqpDmcqEu8R85nHYmoGLs3JXbA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 11:50:47 +0100
Message-Id: <DEZL0HHNAFLA.YE9GBFBU3LZ3@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] ref-manual/variables.rst: document the
 IMAGE_CONTAINER_NO_DUMMY variable
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20251212-image-container-v1-0-fb6586d06813@bootlin.com>
 <20251212-image-container-v1-1-fb6586d06813@bootlin.com>
 <1f26c158-7fdc-4b2a-b841-8a66d0344b25@cherry.de>
In-Reply-To: <1f26c158-7fdc-4b2a-b841-8a66d0344b25@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 10:50:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8284

Hi,

On Tue Dec 16, 2025 at 11:04 AM CET, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> Seems like the SMTP server only sent the mail to myself and not other=20
> recipients. I've got to stop using this corporate setup, it's only=20
> bringing me pain.
>
> I've already removed what I told in patch 2 was to be scratched in patch=
=20
> 1 ;)
>
> On 12/12/25 11:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Added in OE-Core with commit f0645e172bb8 ("image-container.bbclass:
>> Error if not using linux-dummy").
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/variables.rst | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index 71fe11b83..ac7b85992 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -3955,6 +3955,13 @@ system and gives an overview of their function an=
d contents.
>>         variable, see the :ref:`ref-classes-image_types`
>>         class file, which is ``meta/classes-recipe/image_types.bbclass``=
.
>>  =20
>> +   :term:`IMAGE_CONTAINER_NO_DUMMY`
>> +      When inheriting the :ref:`ref-classes-image-container` class, thi=
s variable
>> +      can be set to "1" to allow a :term:`PREFERRED_PROVIDER` for the L=
inux kernel
>> +      (``virtual/kernel``) different than ``linux-dummy``.
>> +
>
> This seems to imply to me the default is "linux-dummy" but that isn't=20
> the case. Why would anyone select linux-dummy? A few words or=20
> cross-referencing another part of the doc where this would be explained=
=20
> would be nice.
>
> This also *could* imply that setting IMAGE_CONTAINER_NO_DUMMY to 0 is=20
> going to do automagic stuff for PREFERRED_PROVIDER but it isn't. I would=
=20
> add something like:
>
> :term:`PREFERRED_PROVIDER` also needs to be explicitly specified for=20
> ``virtual/kernel`` (e.g. ``linux-dummy``, ``linux-yocto``, ...).

When building an image that inherits the image-container class, it's prefer=
red
that PREFERRED_PROVIDER_virtual/kernel is set to "linux-dummy" globally.

>> +      This variable should be set from a :term:`Configuration File`.
>> +
>
> Are you sure about that? This variable is handled from a recipe class,=20
> itself inherited only when the IMAGE_FSTYPES contains "container". The=20
> examples in meta-virtualization all have it set in an image recipe.

Indeed, setting this from the image recipe should be enough.

Rephrased to:

"""
When an image recipe inherits the :ref:`ref-classes-image-container`
class, it expects the :term:`PREFERRED_PROVIDER` for the Linux kernel
(``virtual/kernel``) to be set to ``linux-dummy`` from a
:term:`configuration file`. Otherwise, an error is triggered.

The :term:`IMAGE_CONTAINER_NO_DUMMY` variable allows the
:term:`PREFERRED_PROVIDER` variable to be set to another value, thus skippi=
ng
the check and not triggering the build error.

This variable should be set from the image recipe inheriting the
:ref:`ref-classes-image-container` class.

See the documentation of the :ref:`ref-classes-image-container` class for m=
ore
information on why setting the :term:`PREFERRED_PROVIDER` to ``linux-dummy`=
` is
advised with this class.
"""

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


