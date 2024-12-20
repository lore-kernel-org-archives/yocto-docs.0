Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1003CE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 11:05:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.149495.1734692714415067797
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 03:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n5dL21kj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5920B40005;
	Fri, 20 Dec 2024 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734692712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9do/WqNety+rf6DheymZAofPD/4oCEwjObu2VxYNHRk=;
	b=n5dL21kj+jLd2bTLS4TABMFQA5IxAlc46TYqnNY+bvoTo6Dt8ZHcZk6tije6q665IVVrlS
	hbAuWsZrmreW5tSFt2uRT7dz+ra38ybOyCq574hrgi4n48R4K/xj6AMNLfSMzguxO3qEt6
	6r5S1iXr7nxAuOghHHBI5oEK86jOwxjvmdoi0nnmcpfXBVvCZJusVK9Rh1Me/jmaZCkzdu
	auOK2DIP1e31ayrHLGO1tFVSDZ1r8JnGtNEn69IBzhiBTYFjw44i3VzhCZKEXxkXHIr1VZ
	1hJYaxzWvfOXFvQ1t3x4JawFW0tmtT1zncFCygIS+FIFFT6VdIIM0FsV68Cd1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 12:05:12 +0100
Message-Id: <D6GH8UJ1665Q.2EJBT7E5O1IKO@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Yoann Congal" <yoann.congal@smile.fr>
Subject: Re: [docs][PATCH] reproducible-builds.rst: show how to build a
 single package
Cc: <tgamblin@baylibre.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241218200630.823299-1-tgamblin@baylibre.com>
 <CAMSfU+7BFDDxD4w7BsH17Gxyrvt+1SGb1QmKZRE3eENg1Fv2zg@mail.gmail.com>
 <D6GDPNGTBDPW.1YXTRR6MY1X0B@bootlin.com>
 <CAMSfU+4-D+vu=yfQGLoU3a9cL8cX=nXOcjXnW=zWNhVgdfzYkw@mail.gmail.com>
In-Reply-To: <CAMSfU+4-D+vu=yfQGLoU3a9cL8cX=nXOcjXnW=zWNhVgdfzYkw@mail.gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 11:05:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5996

Hi Yoann,

On Fri Dec 20, 2024 at 10:46 AM CET, Yoann Congal wrote:
> Le ven. 20 d=C3=A9c. 2024 =C3=A0 09:19, Antonin Godard <antonin.godard@bo=
otlin.com> a
> =C3=A9crit :
>
>> Hi Yoann,
>>
>> On Thu Dec 19, 2024 at 1:27 PM CET, Yoann Congal via
>> lists.yoctoproject.org wrote:
>> > Le mer. 18 d=C3=A9c. 2024 =C3=A0 21:06, Trevor Gamblin via lists.yocto=
project.org
>> > <tgamblin=3Dbaylibre.com@lists.yoctoproject.org> a =C3=A9crit :
>> >
>> >> Add a bit to the "Can we prove the project is reproducible?" section =
to
>> >> show how OEQA_REPRODUCIBLE_TEST_TARGET can be used to test a single
>> >> package (rather than the world build), as this may be useful for
>> >> maintainers.
>> >>
>> >> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> >>
>> >
>> > Thank you for doing this.
>> >
>> > That is https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15619 (you=
 may
>> > want to take it and add a [YOCTO #15619] ref in this patch)
>> >
>> > ---
>> >>  .../test-manual/reproducible-builds.rst       | 22 +++++++++++++----=
--
>> >>  1 file changed, 15 insertions(+), 7 deletions(-)
>> >>
>> >> diff --git a/documentation/test-manual/reproducible-builds.rst
>> >> b/documentation/test-manual/reproducible-builds.rst
>> >> index 91f94a5c7..d581155eb 100644
>> >> --- a/documentation/test-manual/reproducible-builds.rst
>> >> +++ b/documentation/test-manual/reproducible-builds.rst
>> >> @@ -91,13 +91,21 @@ run::
>> >>
>> >>     oe-selftest -r
>> reproducible.ReproducibleTests.test_reproducible_builds
>> >>
>> >> -This defaults to including a ``world`` build so, if other layers are
>> >> added, it would
>> >> -also run the tests for recipes in the additional layers. Different
>> build
>> >> targets
>> >> -can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` varia=
ble
>> >> in ``local.conf``.
>> >> -The first build will be run using :ref:`Shared State
>> >> <overview-manual/concepts:Shared State>` if
>> >> -available, the second build explicitly disables
>> >> -:ref:`Shared State <overview-manual/concepts:Shared State>` except f=
or
>> >> recipes defined in
>> >> -the :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and buil=
ds
>> on
>> >> the
>> >> +This defaults to including a ``world`` build so, if other layers are
>> >> added, it
>> >> +would also run the tests for recipes in the additional layers.
>> Different
>> >> build
>> >> +targets can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGE=
T`
>> >> variable
>> >> +in ``local.conf``. For example, running reproducibility tests for on=
ly
>> the
>> >> +``python3-numpy`` recipe can be done by setting::
>> >> +
>> >> +   OEQA_REPRODUCIBLE_TEST_TARGET =3D "python3-numpy"
>> >> +
>> >> +in local.conf before running the ``oe-selftest`` command shown above=
.
>> >> +
>> >> +Reproducibility builds the target list twice. The first build will b=
e
>> run
>> >> using
>> >> +:ref:`Shared State <overview-manual/concepts:Shared State>` if
>> available,
>> >> the
>> >> +second build explicitly disables :ref:`Shared State
>> >> +<overview-manual/concepts:Shared State>` except for recipes defined =
in
>> the
>> >> +:term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds o=
n
>> the
>> >>
>> >
>> > What do you think of adding that a quick way to test the reproducibili=
ty
>> of
>> > a recipe is to do
>> > OEQA_REPRODUCIBLE_TEST_TARGET =3D "recipe"
>> > OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D "DEPENDS of recipe"
>> > ?
>>
>> I have a question on this:
>>
>> What you are trying to say is that you need to set
>> OEQA_REPRODUCIBLE_TEST_TARGET
>> to the recipe you want to test (`python3-numpy` in Trevor's example), an=
d
>> then
>> set OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS to the DEPENDS of the recipe
>> (`bitbake-getvar -r python3-numpy DEPENDS` would be a way to obtain that
>> value?
>> I would put that here as well).
>>
>
> Yes, that is what I usually do to test a single recipe's reproducibility.
>
>
>> My question is: is the reason to set OEQA_REPRODUCIBLE_TEST_SSTATE_TARGE=
TS
>> to
>> avoid rebuilding all the dependencies of OEQA_REPRODUCIBLE_TEST_TARGET
>> without
>> the sstate cache (and therefore save a lot of time)? If that's why, mayb=
e
>> mention it explicitly here too.
>>
>
> I agree. For the global project, it makes sense to rebuild everything. Bu=
t,
> for a single developer focused on only one recipe (and making the
> hypothesis that all of the dependencies are already reproducible), it is
> quicker for them to disable sstate only for the recipe.
>
>
>> Other question: can OEQA_REPRODUCIBLE_TEST_TARGET contain more than 1
>> recipe?
>
>
> Yes.
>
>
>> If so, do you need to concatenate the DEPENDS of each of them? The
>> variable's doc is
>> not really clear on this.
>>
>
> Also yes.
>
> There is something to add here. The DEPENDS list is not enough. Some buil=
d
> dependencies are dynamically computed. For example, I have this to test a=
n
> empty recipe :
> OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D "autoconf-native automake-nativ=
e
> libtool-native libtool-cross gettext-native ncurses bison-native
> texinfo-dummy-native gcc-runtime glibc glibc opkg-utils gcc-cross-x86_64
> linux-yocto"
> I've gathered this list by looking at the build logs, but I always wanted
> to find an automated way to get it.
>
> Final thought, maybe all of this can be fully automated? Something like a
> "OEQA_REPRODUCIBLE_ONLY_TEST_TARGET" that would :
> * compute every dependencies of the recipe (dynamic deps included)
> * build these using sstate
> * build the recipe with and without sstate and compare output (normal
> reproducible test)
>
> I created https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15701 with =
this
> idea.

This seems like a way better implementation for sure!

Thanks a lot for all your answers.

For now, Trevor's patch is already an improvement, I'll take it. Then let's=
 see
if there is movement on this thanks to your new bug, and update the doc or =
not.
:)


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

