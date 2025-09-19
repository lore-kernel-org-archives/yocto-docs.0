Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89E3CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 11:30:06 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.13814.1758281401797029323
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 04:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Jpwa5A9n;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1FF891A0F15
	for <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 11:30:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E34D5606A8;
	Fri, 19 Sep 2025 11:29:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8837A102F1D03;
	Fri, 19 Sep 2025 13:29:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758281399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mUkirx1UtEq6WmsUAcsAC9dvfxZBdbs95mrPdwBp0d4=;
	b=Jpwa5A9nXPu3fzFZ5QcHZDVHuHIkmH7+iATaIXEfbO6tfZG0Zh+uJJ9oz+Ab9XmV9RX0mS
	lQwBe8DaLGM05X1sfWRnSaNq5G5cmQADi56aauRrNNAUs7GOjaaaqed7HSEuthW8JMTiZ6
	xSUB/CPiwwQK9jEZJCasYjkzJPK02tYIIfqMeYoH1xTeVfPyGY9V+PtWysJyP7ny38S5PN
	bWhKCYuzzoFMd2xLbKcsT8rmsTp9xsPPCplSpI9zbw+mTEtdiSUsGiT2RKyH6zCjOueIlj
	tlJrH6fzoWM1Qy4hFw63B7JYCVC5e9Miz1XAa3CUloBebpaovKeCpFgT3mhVPA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Sep 2025 13:29:56 +0200
Message-Id: <DCWQQIBQN5N6.2ZTD6YC8046AE@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Mark Hatle"
 <mark.hatle@kernel.crashing.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/2] dev-manual/layers.rst: yocto-check-layer:
 mention the --machines argument
References: <20250919-update-compatible-doc-v1-0-f3a343914503@bootlin.com>
 <20250919-update-compatible-doc-v1-1-f3a343914503@bootlin.com>
 <b24eb087-b986-4095-8efb-f4ce1d769155@cherry.de>
In-Reply-To: <b24eb087-b986-4095-8efb-f4ce1d769155@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 11:30:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7560

Hi,

On Fri Sep 19, 2025 at 12:59 PM CEST, Quentin Schulz via lists.yoctoproject=
.org wrote:
> Hi Antonin,
>
> On 9/19/25 12:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> The yocto-check-layer script should be run with the --machines arguments
>> to test the different machines present in a BSP layer. Mention it in the
>> documentation.
>>=20
>> [YOCTO #15974]
>>=20
>> Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/dev-manual/layers.rst | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>=20
>> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-man=
ual/layers.rst
>> index fbf3f1a33..0bcbceb1e 100644
>> --- a/documentation/dev-manual/layers.rst
>> +++ b/documentation/dev-manual/layers.rst
>> @@ -376,6 +376,15 @@ directory::
>>   Be sure to provide the actual directory for your
>>   layer as part of the command.
>>  =20
>> +For :term:`BSP <Board Support Package (BSP)>` layers, the ``--machines`=
`
>> +argument should be passed as part of the command::
>> +
>> +   $ source oe-init-build-env
>> +   $ yocto-check-layer your_layer_directory --machines <machine1> <mach=
ine2> ...
>> +
>
> Considering the help text of the script, we should probably rather have=
=20
> the machines before the layer directory? I assume you may have tried and=
=20
> discovered that it doesn't work by simply swapping both, likely due to=20
> https://github.com/python/cpython/issues/53584?
>
> The answer to that is "--", as in:
>
> yocto-check-layer --machines <machine1> <machine2> ... --=20
> your_layer_directory

I agree, I also prefer separating with --, the command looks cleaner. I'll
send a v2 with that.

> I always wondered what my BSP layer would return to match this and I=20
> just tried from within a kas setup.
>
> First thing... it seems it doesn't detect layer dependencies from=20
> bblayers.conf, so I have to make them explicit them from the command=20
> line via --dependency (which is fine but a bit odd if they already are=20
> in bblayers.conf?). Once that is done, BitBake complains because the=20
> layer is included twice (?????). So I instead sourced the script from=20
> within the kas container to another location, with thus an empty=20
> bblayers.conf and then it started.

On master I get:

  INFO: meta-yocto-bsp already in .../build/conf/bblayers.conf. To capture =
initial signatures, layer under test should not present in BBLAYERS. Please=
 remove meta-yocto-bsp from BBLAYERS.

I had to remove meta-yocto-bsp in the end. There's also a
yocto-check-layer-wrapper script to start from a clean build env FWIW.

So maybe a more recent version of the script would've warned you?

> I ended up calling
>
> yocto-check-layer --machines jaguar puma-haikou ringneck-haikou=20
> tiger-haikou --dependency ../meta-openembedded/meta-python/=20
> ../meta-rockchip/ ../meta-arm/meta-arm ../meta-arm/meta-arm-toolchain/=20
> ../meta-openembedded/meta-oe/ -- ../meta-cherry-es/meta-bsp/
>
> which is what's required to setup a BSP build for me.
>
> The issue is that it seems to test more than just my layer?
>
> [...]
> INFO: Setting up for meta-python(LayerType.SOFTWARE),=20
> /work/meta-openembedded/meta-python
> INFO: Adding layer meta-oe
> INFO: Getting initial bitbake variables ...
> INFO: Getting initial signatures ...
> INFO: Adding layer meta-python
> INFO: Starting to analyze: meta-python
> INFO: Distro: poky
> [...]
> INFO: Setting up for meta-oe(LayerType.SOFTWARE),=20
> /work/meta-openembedded/meta-oe
> INFO: Getting initial bitbake variables ...
> INFO: Getting initial signatures ...
> INFO: Adding layer meta-oe
> INFO: Starting to analyze: meta-oe
> INFO: Distro: poky
> [...]
> INFO: Setting up for meta-rockchip(LayerType.BSP), /work/meta-rockchip
> INFO: Adding layer meta-arm
> INFO: Adding layer meta-arm-toolchain
> INFO: Getting initial bitbake variables ...
> INFO: Getting initial signatures ...
> INFO: Adding layer meta-rockchip
> INFO: Starting to analyze: meta-rockchip
> INFO: Distro: poky
> [...]
> etc....
>
> Which is very surprising to me, why would we want to run the check=20
> against those layers? They are dependencies after all and of course=20
> since my machine only exists in my BSP layer, the test for my machine=20
> won't pass for meta-python without my layer for example.

Maybe it means that a layer can only compatible if its dependencies are als=
o
compatible? I think it's a fair assumption.

> So I'm not sure what is supposed to happen here but I'm not sure what=20
> actually matters as output to this script :/
>
> I would recommend to add a few words maybe on the --dependency argument=
=20
> and that it should be run from a clean build directory (at least it=20
> seems like to me) to work?

Yes, I think that can be part of the v2 as well, thanks - I was testing on
meta-yocto-bsp which didn't have any dependency.

> What do you think? Can be added in a follow-up patch if wanted, so for=20
> the current content:
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

I'll remove it for the v2, but thanks!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


