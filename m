Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9092FEB7EA6
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 08:28:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13789.1772612880339225031
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 00:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vNTWBaPm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 335DA4E42532
	for <docs@lists.yoctoproject.org>; Wed,  4 Mar 2026 08:27:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 095475FF5C;
	Wed,  4 Mar 2026 08:27:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A13AD103695DA;
	Wed,  4 Mar 2026 09:27:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772612877; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RjR0GwI/IESsQDrbE7r9tcXHAA675Gr15aoDkSBbuKU=;
	b=vNTWBaPmrpkrnV5hzuiT4crGbZZNmAMUvq10Dyb1/3rnhopjhxwdUGAQIJlgL56kWjxZD4
	0E3jokVCX+3KyTFDor88iz6ccfH5AY8ATEhC3mRD1FvXJOR5GkwuNOP1Uhe75GFHU+xKB3
	Z0TtKE5Lpmq0UCUU0rK+fdTfOnVAGBu7qnybaPAyoszLFJwb1fS/gtd/aaS2OKSYfrh7fk
	HQFKbkHODTSE8o1wl9W1ctAHD579GADIYGMhiChUVvd7JABmyosApryKeEAOym3sCTo7Tc
	Y0x98bQIta/08yLuGDS+S/Vr/fRrnmFXJEsufVf+TQFnyRgoyCBeI4W/X5ggbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 09:27:56 +0100
Message-Id: <DGTUTLCUNI6Q.2QHK43ZSEDNI1@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: document PTEST_RUNNER_TIMEOUT
 variable
Cc: <ticotimo@gmail.com>, <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Tim Orling" <tim.orling@konsulko.com>
References: <20260227200241.66128-1-tim.orling@konsulko.com>
 <DGT3FBURVDJ8.3S9VMOJ2UAY8L@bootlin.com>
 <CAOyo-85AmORchctkDFc9hLZ4L8rUemCbGY-N05zS7b1GkZaVYw@mail.gmail.com>
In-Reply-To: <CAOyo-85AmORchctkDFc9hLZ4L8rUemCbGY-N05zS7b1GkZaVYw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Mar 2026 08:28:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9055

Hi,

On Tue Mar 3, 2026 at 9:17 PM CET, Tim Orling wrote:
> On Tue, Mar 3, 2026 at 2:59=E2=80=AFAM Antonin Godard <antonin.godard@boo=
tlin.com>
> wrote:
>
>> Hi,
>>
>> On Fri Feb 27, 2026 at 9:02 PM CET, Tim Orling via lists.yoctoproject.or=
g
>> wrote:
>> [...]
>> > diff --git a/documentation/ref-manual/variables.rst
>> b/documentation/ref-manual/variables.rst
>> > index 208b5e43d..587f67cc6 100644
>> > --- a/documentation/ref-manual/variables.rst
>> > +++ b/documentation/ref-manual/variables.rst
>> > @@ -7793,6 +7793,20 @@ system and gives an overview of their function
>> and contents.
>> >        For more information, see
>> >        the :ref:`ref-classes-ptest-python-pytest` class documentation.
>> >
>> > +   :term:`PTEST_RUNNER_TIMEOUT`
>> > +      Specifies the timeout in seconds for each ptest suite executed =
by
>> > +      ``ptest-runner`` during :ref:`ref-classes-testimage` runtime
>> testing.
>> > +      The default value is ``"450"`` (7.5 minutes).
>> > +
>> > +      This variable is set in the :ref:`ref-classes-testimage` class
>> and can
>> > +      be overridden in image recipes to adjust the timeout for specif=
ic
>> > +      images or multiconfig variants. For example, in
>> ``core-image-ptest``::
>> > +
>> > +         PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi =3D "60=
0"
>>
>> Could you explain why you're using the :virtclass-mcextend-python3-cffi
>> override
>> here? Seems like a complicated example for this variable's description,
>> but if
>> it is needed, we might want to explain it?
>>
>
> The reason is simple, all the other variables in the "core-image-ptest.bb=
"
> recipe were set with  "virtclass-mcextend-". [1] A prior attempt at setti=
ng
> with "pn-python3-cffi" in "ptest-packelists.inc" had not worked, although
> that was before I caught the need for the "testimage.bbclass" change.
>
> After further experimentation:
>
> 1. PTEST_RUNNER_TIMEOUT:pn-python3-cffi =3D "600" does NOT work [2][3]
> 2. PTEST_RUNNER_TIMEOUT:pn-core-image-ptest-python3-cffi =3D "600" DOES w=
ork
> [4][5]
>
> We also know from Trevor Gamblin experiments that
> PTEST_RUNNER_TIMEOUT:riscv-64 =3D "600" in local.conf works (and similar
> experiments with "conf" changes in "yocto-autobuilder-helper" worked). Th=
e
> goal of the "core-image-ptest.bb" changes were intended to avoid REQUIRIN=
G
> a change in "conf" only, and instead enable the change to happen in recip=
e
> scope.
>
> So the conclusion appears to be that "image recipe" and "conf" scope work=
,
> but an individual ptest enabled recipe doesnot work. The "image" scope
> probably makes sense since PTEST_RUNNER_TIMEOUT is actually enabled by th=
e
> "testimage.bbclass"?
>
> Would it make more sense to use the "more obvious" usage in #2 above (eve=
n
> though it differs from other variable overrides in "core-image-ptest.bb"
> recipe)?

I think we need to write this variable's documentation as a point of view o=
f
someone using the testimage class, not the core-image-ptest recipe. The
core-image-ptest recipe appears to use some niche use-cases of overrides wi=
th
mcextend (which also isn't documented).

So, if I were a user writing an image that inherits the testimage class, an=
d my
image recipe does not contain any mcextend shenanigans, would I really be a=
ble
to use syntax #1 or #2?

I can obviously override the value of PTEST_RUNNER_TIMEOUT for all my under=
lying
ptests, with something like:

my-image.bb:
  IMAGE_CLASSES +=3D "testimage"
  PTEST_RUNNER_TIMEOUT =3D "1000"

But that's it, I guess?

Antonin

