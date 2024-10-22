Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B90D2C54D
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 13:08:55 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.17783.1729602527366297358
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 06:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ekGt2sRm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50A8A1BF208;
	Tue, 22 Oct 2024 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729602525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4PXtd4AqKRtomgHk2C71+ZX1WQTCmdmVKhm+A6Y2os=;
	b=ekGt2sRm9b7qyCL8MeDYT1y0VLTCHPRJqaAlr7SAbCYBeP2hJaSeR8Ec+ZEDhVEUXTvFDv
	9fmPZ2xd9Q3ppFtIZ7Gtbj6BIOHOjA9j9iuaImMWJgNwC4zYj4VOxQO3x+p1NuOVJzqCw6
	BNFIMovTE9/uhdxbSIrUcX0RFO+9T/sqEkKOyB6RMB8NGcaerKi3lWY3sy9Vh39GQM5EzP
	IS/9A3exQ/sMyE/oRBwL32zRfv0vxEaxTctrjHiUt0G3WaP8q8F441KNgdVq/IkGuH7H20
	I1Xioz3aa6Ogw8YtJj+XoxyBT006Z8bEP9cSlqiigcdfJJyx6k8U3pKKlVkDCQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 15:08:45 +0200
Message-Id: <D52CXAWI2PTS.SC7QTYIWELCH@bootlin.com>
Subject: Re: [docs] [PATCH] overview-manual: concepts: add details on
 package splitting
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241016-bug-13225-package-split-v1-1-20681130d7eb@bootlin.com>
 <3afd2cfa-cba6-4f6a-8075-698850c703ad@cherry.de>
 <D4XY661A30GQ.3E4DMVXPCZRZ@bootlin.com>
 <a12053eb-d666-4e9b-ab7b-003a3805c25c@cherry.de>
 <D52BCB7ZEZ14.186PXVDLT2R2J@bootlin.com>
 <0f4f1727-ffa9-41c1-8981-352e3d8f7468@cherry.de>
In-Reply-To: <0f4f1727-ffa9-41c1-8981-352e3d8f7468@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 13:08:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5562

Hi Quentin,

On Tue Oct 22, 2024 at 2:02 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/22/24 1:54 PM, Antonin Godard wrote:
>> Hi Quentin,
>>
>> On Fri Oct 18, 2024 at 2:37 PM CEST, Quentin Schulz wrote:
>>>>>> +contains development-oriented files only::
>>>>>> +
>>>>>> +  FILES:${PN}-dev =3D "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*=
.la \
>>>>>> +                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgc=
onfig \
>>>>>> +                  ${datadir}/aclocal ${base_libdir}/*.o \
>>>>>> +                  ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
>>>>>> +                  ${libdir}/cmake ${datadir}/cmake"
>>>>>> +
>>>>>> +The paths in this list must be *absolute*, and must use the path pr=
efixes
>>>>>
>>>>> There is a very important piece of information that needs to be added
>>>>> here and a source of many newcomers' mistake: these are absolute path=
s
>>>>> from the PoV of the root of the filesystem on the target, NOT from bi=
tbake.
>>>>>
>>>>> Indeed, in do_install (and do_package, etc.) we need to prefix our pa=
ths
>>>>> with $D (and $PKGD/$PKGDEST) when installing/packaging files, however=
,
>>>>> FILES doesn't not need those, even more it should NOT have those.
>>>>
>>>> You're right, will change to:
>>>>
>>>> """
>>>> The paths must use the path prefixes defined by the
>>>> :oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bit=
bake.conf>`
>>>> configuration file, such as ``${sysconfdir}``, ``${bindir}``, etc.
>>>>
>>>> The paths in this list must be *absolute* paths from the point of view=
 of the
>>>> root filesystem on the target. For example, assuming the following pat=
h is
>>>> added to the :term:`FILES` variable::
>>>>
>>>>     ${sysconfdir}/foo.conf
>>>>
>>>> In a later phase of the build system, the created package will be used=
 to
>>>> install the file ``/etc/foo.conf`` on the target, since ``${sysconfdir=
}``
>>>> equals to ``/etc`` (unless explicitely overwritten).
>>>> """
>>>>
>>>
>>> Note sure the last paragraph makes a lot of sense in that context, I
>>> would simply remove it. I realize that I may have mislead you in my
>>> suggestion, it was intended to be a justification as to why I think thi=
s
>>> mistakes happen often, because we often have an additional variable in
>>> front of the path as one would see it on the target.
>>>
>>> I would add a note to make it extra clear that ${D} should NOT be added
>>> to it. It's implied here by "omission" but I've seen this happen too
>>> many times that I would really suggest adding a note for that common
>>> mistake :)
>>
>> Something like this?
>>
>> """
>> The paths in this list must be *absolute* paths from the point of view o=
f the
>> root filesystem on the target, and should make reference to the variable
>> :term:`D` or any :term:`WORKDIR` related variable. An example would be::
>>
>>    ${sysconfdir}/foo.conf
>> """
>>
>
> should NOT, but otherwise yes.

Ouch, thanks for noticing this!

> I would also states that ${sysconfdir}/foo.conf is a **correct**
> example, because we finish the last sentence with something to NOT do
> and then provide an example, so it can be a bit confusing.

+1, will add that.

Sending a v2 in a couple of minutes=E2=80=A6

Thanks!
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

