Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79F4D6ACEA
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 15:24:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.74144.1732721048912121855
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 07:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LRJWuO2X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D04151BF20C;
	Wed, 27 Nov 2024 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732721047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLkGxUtWGWzVxalK2+gl4MFtOZm2kTZmSrsO4baAfj4=;
	b=LRJWuO2XwrBlWs4N9XANgvxFtZC1Ugajaj60Jf6vFdAmQ4WKbj5LFDFwDwy35X19CxYow4
	9o/pMtUbjVfqehK5PjE6OEctX3DCLDw5XHKFBo48+MiOB1jVu6XJaRCQ4D+WF3z36MEb21
	Ia/r/J50rd3Nc+h7p8qK0l/1mV1l+2Pe15NIckRENvzO6RPhUYiaIZ5MyUZFv4zkQi9rkT
	MK2odnx+xkg45mvEiUT59Q7ZT9DTSmSZzDkcx5cteK/H/ahZu9p/1rY9QXw91dvfKBG9nh
	UoUYOnzF6BSrjwCvxbcUqylcLceJIsEXBUd0mSW8DrNKJfsP1aq3eh4L0zQpeg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Nov 2024 16:24:06 +0100
Message-Id: <D5X2CJUWAUXK.1WD6S6Z12GTS6@bootlin.com>
Subject: Re: [docs] [yocto-docs][PATCH v3] ref-manual: classes: fix
 bin_package description
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>
X-Mailer: aerc 0.18.2.r100.gc2048ef3
References: <20241127-fix-bin-package-v3-1-ee09055000ac@bootlin.com>
 <0b545655-dfc0-449b-8cdb-5712a0715f87@cherry.de>
 <D5X02UDHCLWS.1H3RX1HY2T7UP@bootlin.com>
 <0cf6ce20-4e81-4f80-8065-01558fffa52f@cherry.de>
In-Reply-To: <0cf6ce20-4e81-4f80-8065-01558fffa52f@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 15:24:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5838

Hi Quentin,

On Wed Nov 27, 2024 at 3:15 PM CET, Quentin Schulz wrote:
[...]
>>>> +``${S}/usr/lib/<library>.so`` to be installed in :term:`D` correctly.
>>>> +
>>>
>>> It'd be nice to encourage people to use versioned shared libraries even
>>> for binary packages but not sure how to word this here.
>>=20
>> Replace by ``${S}/usr/lib/<library>.<version>.so``? and implicitly encou=
rage it.
>> Not sure this is the place to give written advice on that.
>>=20
>
> It's actually ``${S}/usr/lib/<library>.so.<version>`` :) But would work=
=20

Oops, right thanks :)

> for me. Though considering FILES:${PN} =3D "/" once inheriting this class=
,=20
> whether versioned or not doesn't matter to the packaging step (unlike=20
> the default values, where .so goes to -dev package).
>
>>>> +.. note::
>>>>   =20
>>>> -      SRC_URI =3D "git://example.com/downloads/somepackage.rpm;branch=
=3Dmain;subpath=3D${BP}"
>>>> +   The extraction of the package passed in :term:`SRC_URI` is not han=
dled by the
>>>> +   :ref:`ref-classes-bin-package` class, and is done by the appropria=
te
>
> s/, and is done/but rather/ ?

+1

>>>> +   :ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fe=
tchers>`
>>>> +   depending on the nature of the package.
>>>
>>> What do you mean by "depending on the nature of the package"?
>>=20
>> I meant the type, like RPM, tarball, deb=E2=80=A6 I can replace by "type=
", and add a
>> "(RPM, Deb, tarball, =E2=80=A6)" in parenthesis afterwards.
>>=20
>
> I would simply remove "depending on the nature of the package", that's=20
> already implied? Ah, or we can say depending on the file extension which=
=20
> I believe is how the fetcher is actually figuring out how to extract them=
?

Sure! File extension's fine to me.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

