Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C62DE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 08:19:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.148167.1734682747522423265
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 00:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jB5mSZvX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9A271C0002;
	Fri, 20 Dec 2024 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734682745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POXAYJE40fWufPcVayYx3JVrNFfyyRA5K92KHiV9TUM=;
	b=jB5mSZvXqjlid1CwHAaNiQv9ZT0i5ZFEOOBDvFp1qD9pGUXv83NqYmmuyzjYJGFcGe8OsB
	VjoL6gPTT6ANcqGHX0Y4nBvjlPgO7QNxq9G/mQ2bCYlqHezLj8KhLcoxZ7kO4VcaA0AABr
	MfMo/9bnjHT1Z+xvxBQj8yoyM6wHZkkJ2WIBupgCM72RffAWR3AT0kKvcMJ20mLvwin5hA
	xKlTMOcZVOSwdj0dyL7PK6x13DDaysHaDrJV33yB5R1ShvOJeun+gvUDNPD+PcZEoeJNba
	LVVc7/GMhqOJFuBliQ/Qa8s1/fU9tPXTjlf2ycF8NnSNiJU1oPh6oC269dYc1g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 09:19:04 +0100
Message-Id: <D6GDPNGTBDPW.1YXTRR6MY1X0B@bootlin.com>
To: <yoann.congal@smile.fr>, <tgamblin@baylibre.com>
Subject: Re: [docs][PATCH] reproducible-builds.rst: show how to build a
 single package
Cc: <docs@lists.yoctoproject.org>, <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241218200630.823299-1-tgamblin@baylibre.com>
 <CAMSfU+7BFDDxD4w7BsH17Gxyrvt+1SGb1QmKZRE3eENg1Fv2zg@mail.gmail.com>
In-Reply-To: <CAMSfU+7BFDDxD4w7BsH17Gxyrvt+1SGb1QmKZRE3eENg1Fv2zg@mail.gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 08:19:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5988

Hi Yoann,

On Thu Dec 19, 2024 at 1:27 PM CET, Yoann Congal via lists.yoctoproject.org=
 wrote:
> Le mer. 18 d=C3=A9c. 2024 =C3=A0 21:06, Trevor Gamblin via lists.yoctopro=
ject.org
> <tgamblin=3Dbaylibre.com@lists.yoctoproject.org> a =C3=A9crit :
>
>> Add a bit to the "Can we prove the project is reproducible?" section to
>> show how OEQA_REPRODUCIBLE_TEST_TARGET can be used to test a single
>> package (rather than the world build), as this may be useful for
>> maintainers.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>
>
> Thank you for doing this.
>
> That is https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15619 (you ma=
y
> want to take it and add a [YOCTO #15619] ref in this patch)
>
> ---
>>  .../test-manual/reproducible-builds.rst       | 22 +++++++++++++------
>>  1 file changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/documentation/test-manual/reproducible-builds.rst
>> b/documentation/test-manual/reproducible-builds.rst
>> index 91f94a5c7..d581155eb 100644
>> --- a/documentation/test-manual/reproducible-builds.rst
>> +++ b/documentation/test-manual/reproducible-builds.rst
>> @@ -91,13 +91,21 @@ run::
>>
>>     oe-selftest -r reproducible.ReproducibleTests.test_reproducible_buil=
ds
>>
>> -This defaults to including a ``world`` build so, if other layers are
>> added, it would
>> -also run the tests for recipes in the additional layers. Different buil=
d
>> targets
>> -can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` variable
>> in ``local.conf``.
>> -The first build will be run using :ref:`Shared State
>> <overview-manual/concepts:Shared State>` if
>> -available, the second build explicitly disables
>> -:ref:`Shared State <overview-manual/concepts:Shared State>` except for
>> recipes defined in
>> -the :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds =
on
>> the
>> +This defaults to including a ``world`` build so, if other layers are
>> added, it
>> +would also run the tests for recipes in the additional layers. Differen=
t
>> build
>> +targets can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET`
>> variable
>> +in ``local.conf``. For example, running reproducibility tests for only =
the
>> +``python3-numpy`` recipe can be done by setting::
>> +
>> +   OEQA_REPRODUCIBLE_TEST_TARGET =3D "python3-numpy"
>> +
>> +in local.conf before running the ``oe-selftest`` command shown above.
>> +
>> +Reproducibility builds the target list twice. The first build will be r=
un
>> using
>> +:ref:`Shared State <overview-manual/concepts:Shared State>` if availabl=
e,
>> the
>> +second build explicitly disables :ref:`Shared State
>> +<overview-manual/concepts:Shared State>` except for recipes defined in =
the
>> +:term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds on t=
he
>>
>
> What do you think of adding that a quick way to test the reproducibility =
of
> a recipe is to do
> OEQA_REPRODUCIBLE_TEST_TARGET =3D "recipe"
> OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D "DEPENDS of recipe"
> ?

I have a question on this:

What you are trying to say is that you need to set OEQA_REPRODUCIBLE_TEST_T=
ARGET
to the recipe you want to test (`python3-numpy` in Trevor's example), and t=
hen
set OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS to the DEPENDS of the recipe
(`bitbake-getvar -r python3-numpy DEPENDS` would be a way to obtain that va=
lue?
I would put that here as well).

My question is: is the reason to set OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =
to
avoid rebuilding all the dependencies of OEQA_REPRODUCIBLE_TEST_TARGET with=
out
the sstate cache (and therefore save a lot of time)? If that's why, maybe
mention it explicitly here too.

Other question: can OEQA_REPRODUCIBLE_TEST_TARGET contain more than 1 recip=
e? If
so, do you need to concatenate the DEPENDS of each of them? The variable's =
doc is
not really clear on this.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

