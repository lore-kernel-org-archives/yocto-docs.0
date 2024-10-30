Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D88ED5CCB5
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 14:32:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.16430.1730298756665272272
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 07:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gV7M25pR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A3D91BF20C;
	Wed, 30 Oct 2024 14:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730298755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vRXHP5bx297RwaZ4DcOGhzMhtHMSwPyCI4bEKPCO8kA=;
	b=gV7M25pR8t24q64FmeBLEfVaMvTEHPZr7+4QfmLHSCbESUsjfKWUQwQs59LFHGYdHI13zX
	QbocnFkeG3+dNB4/j08t90+XApJfm+MBbRzWNNMGzHG+/wdA5g/GXKRqGxR9Pk43bPawFv
	+0g0PkB4UaxwBj7jBD+3xEDypOSdp3Od9Jv+SEThf+VqnzXiNxxeTx4MUvJo0KEFUkV3Gs
	r0Atsyd/6q0mW+IYL2ugYegwagJVXsce7L8dGFyLduPhusSfzxVTzFx6C7SD1vQf/A5pQC
	0jS31ku6P2cQoKF+9Y8A+vbc1LxTkuobHs+qNnKBmsIOKONiVXKA0QJDB/aeQA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Oct 2024 15:32:34 +0100
Message-Id: <D597PUBREPC3.3UL7RTF5HBN0X@bootlin.com>
Subject: Re: [docs] [PATCH 2/2] dev-manual: document how to provide confs
 from layer.conf
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241030-layer-confs-v1-0-0f7dcf460e27@bootlin.com>
 <20241030-layer-confs-v1-2-0f7dcf460e27@bootlin.com>
 <4fa6fe53-13a1-41e3-9604-ffb9698b78ca@cherry.de>
In-Reply-To: <4fa6fe53-13a1-41e3-9604-ffb9698b78ca@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 14:32:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5621

Hi Quentin,

On Wed Oct 30, 2024 at 11:18 AM CET, Quentin Schulz wrote:
[...]
>> +Providing Global-level Configurations With Your Layer
>> +-----------------------------------------------------
>> +
>> +When creating a layer, you may need to define configurations that shoul=
d take
>> +effect globally in your build environment when it is part of the
>> +:term:`BBLAYERS` variable. The ``layer.conf`` file is a :term:`configur=
ation
>
> "when it is part of the BBLAYERS variable" is a complicated way of=20
> saying "when it is used"/"when it is part of the build setup". Maybe we=
=20
> can find something more explicit?
>
> I would also suggest adding "in the new layer" after ``layer.conf`` to=20
> explicit the location of layer.conf (maybe we should even add it's in=20
> conf/?). We have many different possible locations for configuration=20
> files so I feel like we should tell people where exactly to expect=20
> files. (e.g. local.conf, distro conf file, machine conf file,=20
> (multiconfig?), bblayers.conf, are all expected in different locations).
>
>> +file` that affects the build system globally, so it is a candidate for =
this
>> +use-case.
>> +
>> +For example, if your layer provides an alternative to the linux kernel =
named
>
> s/provides an alternative to the Linux kernel/provides a Linux kernel=20
> recipe/
>
> s/linux/Linux/

+1, thanks.

>> +``linux-custom``, you may want to define the :term:`PREFERRED_PROVIDER`=
 for the
>> +``linux-custom`` recipe::
>> +
>> +  PREFERRED_PROVIDER_virtual/kernel =3D "linux-custom"
>> +
>> +This can be defined in the ``layer.conf`` file. If your layer has a hig=
her
>> +:term:`BBFILE_PRIORITY` value, it will take precedence over previous de=
finitions
>> +of the same ``PREFERRED_PROVIDER_virtual/kernel`` assignments.
>> +
>
> I seem to recall this is the perfect example of what we do NOT want in a=
=20
> layer.conf though (might be bad recollection though :) ). I actually do=
=20
> not even know what'd be a valid reason to have variables directly=20
> defined in layer.conf (I see you're providing an example in the next=20
> section, but do we really need this section to provide an example of=20
> something the user shouldn't be doing?).
>
> I would add a very big note/warning at the end of this section saying=20
> that this is almost always wrong as it is mostly expected that adding a=
=20
> layer should only minimally change the build output. And that for this=20
> very example, it should be in a machine or distro configuration file=20
> instead.

You're right, it's not a good practice. Initially, I wanted to document onl=
y the
conditional case below, but it felt strange introducing it without a note o=
n the
role of layers.conf & setting things from there. What about the following
changes instead:

* Remove the first section that shows how to set configurations uncondition=
ally.
* Instead, introduce the next section by saying something like "Since it's =
not
  good practice to unconditionally set global configurations from the layer=
.conf
  file, we can use the following technique...".
* Simply rename the section "Providing Global-level Configurations With You=
r
  Layer" instead of "Conditionally Provide Global-level Configurations With=
 Your
  Layer". This way we only show the "good" way to make changes from layer.c=
onf.

> I am not sure that BBFILE_PRIORITY is applicable for this as what=20
> matters is the parsing order of all layer.conf files from entries in=20
> BBLAYERS. I believe it's just parsed in the order it appears in=20
> BBLAYERS? Last one has priority (because we use =3D and not ?=3D). If tha=
t=20
> is actually working, we should then expand=20
> https://docs.yoctoproject.org/ref-manual/variables.html#term-BBFILE_PRIOR=
ITY=20
> as well because it clearly only defines priority for recipes.

My bad you're right, it's only the order in BBLAYERS that matters, I'll rem=
ove
this sentence.

>> +Conditionally Provide Global-level Configurations With Your Layer
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +In some cases, your layer may provide global configurations only if som=
e
>> +features it provides are enabled. Since the ``layer.conf`` file is pars=
ed at an
>> +earlier stage in the parsing process, the :term:`DISTRO_FEATURES` and
>> +:term:`MACHINE_FEATURES` variables are not yet available to ``layer.con=
f``, and
>> +declaring conditional assignments based on these variables is not possi=
ble. The
>> +following technique shows a way to leverage this limitation by using th=
e
>> +:term:`USER_CLASSES` variable and a conditional ``include`` command.
>> +
>> +In the following steps, let's assume our layer is named ``meta-mylayer`=
` and
>> +that this layer defines a custom :ref:`distro feature <ref-features-dis=
tro>`
>> +named ``mylayer-kernel``. We will set the :term:`PREFERRED_PROVIDER` va=
riable
>> +for the kernel only if our feature ``mylayer-kernel`` is part of the
>> +:term:`DISTRO_FEATURES`:
>> +
>> +#. Create an include file in the directory
>> +   ``meta-mylayer/conf/distro/include/``, for example a file named
>> +   ``mylayer-kernel-provider.inc`` that sets the kernel provider to
>> +   ``linux-custom``::
>> +
>> +     PREFERRED_PROVIDER_virtual/kernel =3D "linux-custom"
>
> Random thought but maybe we should have align this with three=20
> whitespaces starting from the first character in the list. Here it is=20
> only one and difficult to notice at first sight. Actually, it's two=20
> whitespaces, I think that proves my point :D

Yes, it should be 3 actually, missed that!

>> +
>> +#. Provide a path to this include file in your ``layer.conf``::
>> +
>> +     META_MYLAYER_KERNEL_PROVIDER_PATH =3D "${LAYERDIR}/conf/distro/inc=
lude/mylayer-kernel-provider.inc"
>> +
>> +#. Create a new class in ``meta-mylayer/classes-global/``, for example =
a class
>> +   ``meta-mylayer-cfg.bbclass``. It Conditionally includes the file
>
> s/Conditionally/conditionally/
>
> Maybe say "Make it conditionally include the file" instead, as the way=20
> it's phrased could mean that because it's named this way or/and in that=
=20
> special directory that it magically includes the file, instead of=20
> telling the user what to put in that file.

+1, better that way :)

>> +   ``mylayer-kernel-provider.inc`` defined above, using the variable
>> +   ``META_MYLAYER_KERNEL_PROVIDER_PATH`` defined in ``layer.conf``::
>> +
>> +     include ${@bb.utils.contains('DISTRO_FEATURES', 'mylayer-kernel', =
'${META_MYLAYER_KERNEL_PROVIDER_PATH}', '', d)}
>> +
>> +   For details on the ``bb.utils.contains`` function, see its definitio=
n in
>> +   :bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`.
>> +
>> +   .. note::
>> +
>> +      The ``include`` command is designed to not fail if the function
>> +      ``bb.utils.contains`` returns an empty string.
>
> I believe `require` too and we very likely want to use require here to=20
> make sure the path doesn't have a typo :)

Correct, I thought `require` would've failed if contains returned an empty
string (and that it was for that reason they used include in meta-virt) but
apparently not, the parser is smart enough. :) Will change, thanks

> Also, I'm wondering if this isn't actually "breaking" the sstate cache=20
> as this META_MYLAYER_KERNEL_PROVIDER_PATH would be different on each=20
> machine so people wouldn't be able to reuse the sstate cache.
>
> Building with the exact same setup - and a shared SSTATE_DIR - in two=20
> different directories on the same machine should answer that question :)

I've tested it and no, it doesn't affect the sstate-cache.
I've done the following:

1) Build core-image-minimal with virtual/kernel set to linux-yocto-rt (set =
with
   a custom layer + technique detailed above, through a distro feature).
2) Same directory, rm -r tmp/, rebuild -> setscene tasks are executed as
   expected, so no rebuild, just the rootfs being created.
3) Different directory (to make LAYERDIR change for my custom layer), rm -r
   tmp/, rebuild -> same result as 2).

>> +
>> +#. Back to your ``layer.conf`` file, add the class ``meta-mylayer-cfg``=
 class to
>> +   the :term:`USER_CLASSES` variable::
>> +
>> +     USER_CLASSES:append =3D " meta-mylayer-cfg"
>> +
>> +   This will add the class ``meta-mylayer-cfg`` to the list of classes =
to
>> +   globally inherit. Since the ``include`` command is conditional in
>> +   ``meta-mylayer-cfg.bbclass``, even though inherited the class will h=
ave no
>> +   effect until the feature ``mylayer-kernel`` is enabled through
>> +   :term:`DISTRO_FEATURES`.
>> +
>> +This technique can also be used for :ref:`Machine features
>> +<ref-features-machine>` by following the same steps, the only differenc=
e being
>> +to place the include file in ``meta-mylayer/conf/machine/include/`` ins=
tead.
>> +
>
> I don't think the path needs to be specific?

Not really, but I'd rather advise here to place it in a conventionally used
directories (since we generally use this directory for machine include file=
s)
rather than giving a random example. What do you think?

>>   Managing Layers
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  =20
>> @@ -916,4 +993,3 @@ above:
>>   .. note::
>>      Both the ``create-layers-setup`` and the ``setup-layers`` provided =
several additional options
>>      that customize their behavior - you are welcome to study them via `=
`--help`` command line parameter.
>> -
>
> Not sure this line deletion makes sense in this patch?

Oops, will remove.

> Cheers,
> Quentin

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


