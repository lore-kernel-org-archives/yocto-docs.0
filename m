Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC4AD3C935
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 11:54:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.16427.1729598063423109678
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 04:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bnUQRJ2A;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED62F240004;
	Tue, 22 Oct 2024 11:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729598061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RACePvfoSsdaoGjVuxaExk+JoczhYDcF+V9ICPCVAhI=;
	b=bnUQRJ2A7BRjGJVY+oO+O/nxCCPSUIyOfnf0/Y7tusL43x3vqnfZ5pcbDK1PYv7D1ErpyL
	36ATPnyUigEZTKsVJybZ53VxAKsqqelr6IRctSfWoZSVC8FtlzjGOf9I3VQuOg3orKWG8E
	WyuW8lR4c5mUCaTeOI5VD3SuxbWznmbi8CHviiUsAP4OahA+FADmMDPuo6Df6c6Jegc9rk
	KVFA0HigIWD7T5ZZALNsorYzl9m4yWWM6G8LJKEQaRPxfJeDW26VWqcySpip2n4gsGLWib
	GX3hv+oOzr1ke7J4k8IIgl2e7T+pxEg8DpBJyICws9Cj3QY2S84yC/9tg6iVIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 13:54:19 +0200
Message-Id: <D52BCB7ZEZ14.186PXVDLT2R2J@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] overview-manual: concepts: add details on
 package splitting
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241016-bug-13225-package-split-v1-1-20681130d7eb@bootlin.com>
 <3afd2cfa-cba6-4f6a-8075-698850c703ad@cherry.de>
 <D4XY661A30GQ.3E4DMVXPCZRZ@bootlin.com>
 <a12053eb-d666-4e9b-ab7b-003a3805c25c@cherry.de>
In-Reply-To: <a12053eb-d666-4e9b-ab7b-003a3805c25c@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 11:54:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5556

Hi Quentin,

On Fri Oct 18, 2024 at 2:37 PM CEST, Quentin Schulz wrote:
>>>> +contains development-oriented files only::
>>>> +
>>>> +  FILES:${PN}-dev =3D "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.l=
a \
>>>> +                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgcon=
fig \
>>>> +                  ${datadir}/aclocal ${base_libdir}/*.o \
>>>> +                  ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
>>>> +                  ${libdir}/cmake ${datadir}/cmake"
>>>> +
>>>> +The paths in this list must be *absolute*, and must use the path pref=
ixes
>>>
>>> There is a very important piece of information that needs to be added
>>> here and a source of many newcomers' mistake: these are absolute paths
>>> from the PoV of the root of the filesystem on the target, NOT from bitb=
ake.
>>>
>>> Indeed, in do_install (and do_package, etc.) we need to prefix our path=
s
>>> with $D (and $PKGD/$PKGDEST) when installing/packaging files, however,
>>> FILES doesn't not need those, even more it should NOT have those.
>>
>> You're right, will change to:
>>
>> """
>> The paths must use the path prefixes defined by the
>> :oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bitba=
ke.conf>`
>> configuration file, such as ``${sysconfdir}``, ``${bindir}``, etc.
>>
>> The paths in this list must be *absolute* paths from the point of view o=
f the
>> root filesystem on the target. For example, assuming the following path =
is
>> added to the :term:`FILES` variable::
>>
>>    ${sysconfdir}/foo.conf
>>
>> In a later phase of the build system, the created package will be used t=
o
>> install the file ``/etc/foo.conf`` on the target, since ``${sysconfdir}`=
`
>> equals to ``/etc`` (unless explicitely overwritten).
>> """
>>
>
> Note sure the last paragraph makes a lot of sense in that context, I
> would simply remove it. I realize that I may have mislead you in my
> suggestion, it was intended to be a justification as to why I think this
> mistakes happen often, because we often have an additional variable in
> front of the path as one would see it on the target.
>
> I would add a note to make it extra clear that ${D} should NOT be added
> to it. It's implied here by "omission" but I've seen this happen too
> many times that I would really suggest adding a note for that common
> mistake :)

Something like this?

"""
The paths in this list must be *absolute* paths from the point of view of t=
he
root filesystem on the target, and should make reference to the variable
:term:`D` or any :term:`WORKDIR` related variable. An example would be::

  ${sysconfdir}/foo.conf
"""

> [...]
>
>>>> +file matching a pattern specified in the corresponding :term:`FILES` =
definition
>>>> +will be included in the package and *excluded* for the remaining pack=
ages listed
>>>> +in :term:`PACKAGES`. As a consequence, custom packages should be adde=
d using the
>>>
>>> I could suggest:
>>> """
>>> A given file can only ever be in one package. Therefore, the first (fro=
m
>>> leftmost to rightmost in :term:`PACKAGES`) package for which the given
>>> file matches a path from its :term:`FILES` will contain the given file.
>>> """
>>>
>>> Still a bit too complex of a sentence but couldn't come up with anythin=
g
>>> better for now.
>>
>> How about:
>>
>> """
>> A given file can only ever be in one package. By iterating from the
>> leftmost to rightmost package in :term:`PACKAGES`, each file matching on=
e of the
>> pattern defined in the corresponding :term:`FILES` definition is include=
d in the
>
> s/pattern/patterns/
>
>> package. At the end of package splitting, all the remaining files are st=
ored in
>> the base ``${PN}`` package.
>>
>
> Is that true? I'm pretty sure you get a warning/build failure if a file
> is not in any package. It just happens that most common paths are in
> FILES:${PN} but I don't think there's anything making bitbake have PN a
> catch-all package?
>
> This would also mean it'd make no sense to have a package listed on the
> right side of PN in PACKAGES, but that's a valid use-case for anything
> not matching any prior FILES:. But maybe I'm misremembering :)

You're right. Actually, FILES:$PN matches a lot of files by default, but no=
t all
of them, so my sentence is a bit of a shortcut. I'll simply remove it.

>> The result of package splitting is stored in the :term:`PKGDEST` directo=
ry, and
>> contains one directory per package.
>
> Not sure if that isn't too advanced already for something in the
> overview-manual.
>
> I guess we could tell the user how to find out in which package a file is=
?
>
> oe-pkgdata-util find-path '/etc/foo.conf'
>
> should do that if I remember correctly.

Good suggestion, I'll add that, and link to more in on this utility from th=
e dev
manual.

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

