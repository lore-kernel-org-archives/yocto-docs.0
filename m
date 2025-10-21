Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45E0CCD1AA
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 12:34:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.10628.1761050090678142893
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Oct 2025 05:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IqELWTmL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CB8294E41235
	for <docs@lists.yoctoproject.org>; Tue, 21 Oct 2025 12:34:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B2F9606DC;
	Tue, 21 Oct 2025 12:34:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A9FC102F2404;
	Tue, 21 Oct 2025 14:34:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761050087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LTuynmC4IphnrbGkXnhkjaZIHsU7vHA7eQbgywwNWqo=;
	b=IqELWTmL0Jj1RQtPd7KkwvrOsalyloy03xzvRZ8qrGtoEIOp1rD9QmUjDdUHbTFWXtoxjn
	HIRC9RkrpjMQRqm2EDHJzCyZSBAb94TB0YkZxBxMZGxJBX5Oq7VzfLKVoOoy1OomawLAVZ
	6ipJl9uaONgRNYODX0Jij/gD4VM3CziMxhGlMMXCLoVufh9QhP7yvOmbENhrBvt9qOgzrP
	cK6KZj7E0kH4LMn9wIfO3jbF/tKUlZI1q+op7747P7MPA3Lcc37JaigvfCaKoode57lZW/
	hteYxK5aWmyO5E6A5S3g+o5MbsuhOv6PaJvKmyF/GHntEGirH/D54YPYjFYKHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 14:34:45 +0200
Message-Id: <DDO05KTIOVJP.2OEYNEYGB4SP1@bootlin.com>
Subject: Re: [docs] [PATCH 10/17] ref-manual/variables.rst: document the
 USE_NLS variable
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com> <20251016-release-note-5-3-second-hunk-v1-10-20f21db1f93c@bootlin.com> <ab7f8415-16fd-4abf-8cab-8c3245541f1c@cherry.de> <DDN0T777T36V.3VTU8P3CNGR2P@bootlin.com> <e0f16bec-0d1d-4198-a74c-020c1227d63d@cherry.de>
In-Reply-To: <e0f16bec-0d1d-4198-a74c-020c1227d63d@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Oct 2025 12:34:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7764

On Mon Oct 20, 2025 at 11:34 AM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/20/25 10:52 AM, Antonin Godard wrote:
>> On Thu Oct 16, 2025 at 12:25 PM CEST, Quentin Schulz via lists.yoctoproj=
ect.org wrote:
>>> Hi Antonin,
>>>
>>> On 10/16/25 10:54 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>>> Part of bitbake.conf, this variable allowing to enable or disable
>>>> translation was undocumented. Add a entry to the glossary.
>>>>
>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>> ---
>>>>    documentation/ref-manual/variables.rst | 13 +++++++++++++
>>>>    1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst
>>>> index bb24f2583..f16ef9aae 100644
>>>> --- a/documentation/ref-manual/variables.rst
>>>> +++ b/documentation/ref-manual/variables.rst
>>>> @@ -11117,6 +11117,19 @@ system and gives an overview of their functio=
n and contents.
>>>>          the Yocto Project Development Tasks Manual for information on=
 how to
>>>>          use this variable.
>>>>   =20
>>>> +   :term:`USE_NLS`
>>>> +      Determines if translations should be built for recipes that can=
 build
>>>> +      language translations. This variable can be equal to:
>>>
>>> Suggesting:
>>>
>>> Determine if language translations should be built for recipes that can
>>> build them.
>>>
>>>> +
>>>> +      -  ``yes``: translations are enabled.
>>>> +      -  ``no``: translation are disabled.
>>>> +
>>>> +      The :ref:`ref-classes-gettext` class uses this variable to enab=
le
>>>> +      :wikipedia:`Gettext <Gettext>` in recipes that use this class. =
Recipes can
>>>
>>> Suggesting:
>>>
>>> It is used to enable :wikipedia:`Gettext <Gettext>` in recipes
>>> inheriting the :ref:`ref-classes-gettext`.
>>>
>>>> +      also use the :term:`USE_NLS` variable directly to override the =
default
>>>> +      value of the variable, and configure themselves according to th=
e value of
>>>> +      the variable.
>>>
>>> I mean.... the same can be said about any variable? But the "magic"
>>> documented stuff that happens when setting USE_NLS only happens if you
>>> inherit the class, so I would simply not document using this variable
>>> "manually"?
>>=20
>> You're right, initially I had in mind that some recipes explicitely set =
this to
>> "no" to skip this feature unconditionally, but it doesn't seem to be the=
 case.
>> Misunderstanding on my part. I will correct this to say that this is not
>> supposed to be set from a recipe.
>>=20
>
> I actually understood the sentence as "you can use this variable even if=
=20
> not inheriting gettext to do stuff related to translations" which is of=
=20
> course not something we should encourage (that is, using the same=20
> variable name for different things). But re-reading it with a fresh mind=
=20
> I now understand it like "recipes can override USE_NLS" + "recipes can=20
> use USE_NLS to configure themselves". Not sure what would be the usecase=
=20
> for the first one, but for the second I think the point is "please use=20
> USE_NLS to automatically select building/supporting translations", e.g.=
=20
> with meson build system. gettext bbclass only sets --enable-nls or=20
> --disable-nls to EXTRA_OECONF, so I guess you need to do a similar dance=
=20
> for recipes that expect a different option than=20
> --enable-nls/--disable-nls or other build systems (such as meson for=20
> example, c.f. meta/recipes-support/p11-kit/p11-kit_0.25.5.bb).
>
> Can you tell us a bit more about what you meant with the last sentence?=
=20
> Maybe we can reword it to avoid confusion.

Maybe that is more clear:

"""
Recipes can use the value of this variable to enable language translations =
in
their build, however classes such as :ref:`ref-classes-gettext` already use=
 the
value of this variable.

Direct usage of this variable can be avoided by using such classes when
possible.
"""

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


