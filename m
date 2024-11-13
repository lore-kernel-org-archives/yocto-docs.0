Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8113D462A9
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:16:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.12707.1731507399914699482
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 06:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UP0CKL5k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB0331BF206;
	Wed, 13 Nov 2024 14:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731507398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w5Q7G004MYrD4jman6q9fO0psiL471KeM/3+Ikl0zC8=;
	b=UP0CKL5kjVhGaUFYjOncAInraYLpR+rkntrygas3A2qGM9cslidHb5ZF7nNoG5NLoCYDqC
	E0yKbd7zMMoXjRZtu+rtol0cQrrGoVnSWz2/rAcD7A1FSr2Tyi5cBy7hNrXf06u8MFUgOt
	2O3K8oF+5EBqWyHxZIL06D1YoBimF3RW3TSZ4rnZ06EsyOtUeqf0ScYoIHLDRG/5+fgs+L
	BL0RVoFB03HD9no4v5tcqQQN0Y9kEp2FPuifUZ0q2a5Hl/3OcpNNSp3NT0R77aR+urbidZ
	m1gAb5wCN/PaQ5rHAu4kvxYHSduD/CyGRasEoKEBQTPrtqzopglJzRH1g0XHfQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Nov 2024 15:16:37 +0100
Message-Id: <D5L4597JFNEO.3GX30FCK1IUNZ@bootlin.com>
Subject: Re: [PATCH v2 2/2] dev-manual: document how to provide confs from
 layer.conf
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241112-layer-confs-v2-0-22a09f1a0a8e@bootlin.com>
 <20241112-layer-confs-v2-2-22a09f1a0a8e@bootlin.com>
 <e5dde215-3310-4a3f-bd10-c02137d5c1b7@cherry.de>
In-Reply-To: <e5dde215-3310-4a3f-bd10-c02137d5c1b7@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 14:16:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5727

Hi Quentin,

On Wed Nov 13, 2024 at 10:58 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/12/24 12:32 PM, Antonin Godard wrote:
>> Add a section on providing global level configuration from the
>> layer.conf file. Since this file is parsed at an earlier stage in the
>> parsing process, it's not possible to combine bb.utils.contains and
>> {DISTRO,MACHINE}_FEATURES to conditionally set some configurations.
>>=20
>> This patch documents:
>>=20
>> - First that this file can be used for providing such configuration.
>> - Then demonstrate how to conditionally provide them, using a technique
>>    that is currently used in meta-virtualization
>>    (https://git.yoctoproject.org/meta-virtualization/tree/conf/layer.con=
f#n50).
>>=20
>> Fixes [YOCTO #12688].
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/dev-manual/layers.rst | 86 +++++++++++++++++++++++++++++=
++++++++
>>   1 file changed, 86 insertions(+)
>>=20
>> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-man=
ual/layers.rst
>> index 91889bd0ae391c7b6e62068778ae5c180c840762..e449fd43ad86c9a027e317e4=
9b6e2f2f340a08d4 100644
>> --- a/documentation/dev-manual/layers.rst
>> +++ b/documentation/dev-manual/layers.rst
>> @@ -644,6 +644,92 @@ variable and append the layer's root name::
>>      order of ``.conf`` or ``.bbclass`` files. Future versions of BitBak=
e
>>      might address this.
>>  =20
>> +Providing Global-level Configurations With Your Layer
>> +-----------------------------------------------------
>> +
>> +When creating a layer, you may need to define configurations that shoul=
d take
>> +effect globally in your build environment when the layer is part of the=
 build.
>> +The ``layer.conf`` file is a :term:`configuration file` that affects th=
e build
>> +system globally, so it is a candidate for this use-case.
>> +
>> +.. attention::
>
> I would recommend using .. note or .. warning admonitions over other ones=
.
>
> Right now it seems we have mainly .. note, but also a handful of ..=20
> admonition and a couple of .. tip so maybe that's not the best advice.
>
> Anyway, why this suggestion?
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#d=
irectives
> """
> Admonitions: attention, caution, danger, error, hint, important, note,=20
> tip, warning and the generic admonition. (Most themes style only =E2=80=
=9Cnote=E2=80=9D=20
> and =E2=80=9Cwarning=E2=80=9D specially.)
> """

Thanks for the tip to the doc. I'll replace that with a warning instead.
Also there was a usage of `.. attention` for the bblock patches, I'll send =
a
patch to replace that.

>> +
>> +   Providing unconditional global level configuration from the ``layer.=
conf``
>> +   file is *not* a good practice, and should be avoided. For this reaso=
n, the
>> +   section :ref:`Conditionally Provide Global-level Configurations With=
 Your
>> +   Layer` below shows how the ``layer.conf`` file can be used to provid=
e
>> +   configurations only if a certain condition is met.
>> +
>> +For example, if your layer provides a Linux kernel recipe named
>> +``linux-custom``, you may want to define the :term:`PREFERRED_PROVIDER`=
 for the
>> +``linux-custom`` recipe::
>
> """
> you may want to make :term:`PREFERRED_PROVIDER` for the Linux kernel=20
> virtual provider point to the ``linux-custom`` recipe.
> """
>
> Because we are not setting PREFERRED_PROVIDER **for** the linux-custom=20
> recipe, we want to have virtual/kernel point at linux-custom (and it's=20
> set outside of that recipe). Moreover, the content of PREFERRED_PROVIDER=
=20
> for the linux-custom recipe isn't really of importance, it's more for=20
> other recipes depending on *a* kernel (e.g. kernel-modules, image=20
> recipes, etc...).

That's correct, I get exactly what you mean and re-reading my sentence with=
 that
in mind does bother me too. :)

> Not happy about the way I phrased it so maybe you can suggest something=
=20
> better here?

How about simply:

"""
you may want to make :term:`PREFERRED_PROVIDER_virtual/kernel
<PREFERRED_PROVIDER>` point to ``linux-custom``:
"""

>> +
>> +  PREFERRED_PROVIDER_virtual/kernel =3D "linux-custom"
>> +
>> +This can be defined in the ``layer.conf`` file. If your layer is at the=
 last
>> +position in the :term:`BBLAYERS` list, it will take precedence over pre=
vious
>> +``PREFERRED_PROVIDER_virtual/kernel`` assignments.
>> +
>
> Mmmmm, except if the machine configuration file sets it too with "=3D"?

Also from local.conf, etc. I guess so what about:

"""
it will take precedence over previous ``PREFERRED_PROVIDER_virtual/kernel``
assignments (unless it is set from another :term:`configuration file` such =
as
machine configuration files).
"""

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
>> +following technique shows a way to bypass this limitation by using the
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
>> +      PREFERRED_PROVIDER_virtual/kernel =3D "linux-custom"
>> +
>> +#. Provide a path to this include file in your ``layer.conf``::
>> +
>> +      META_MYLAYER_KERNEL_PROVIDER_PATH =3D "${LAYERDIR}/conf/distro/in=
clude/mylayer-kernel-provider.inc"
>> +
>> +#. Create a new class in ``meta-mylayer/classes-global/``, for example =
a class
>> +   ``meta-mylayer-cfg.bbclass``. Make it conditionally include the file
>> +   ``mylayer-kernel-provider.inc`` defined above, using the variable
>> +   ``META_MYLAYER_KERNEL_PROVIDER_PATH`` defined in ``layer.conf``::
>> +
>> +      require ${@bb.utils.contains('DISTRO_FEATURES', 'mylayer-kernel',=
 '${META_MYLAYER_KERNEL_PROVIDER_PATH}', '', d)}
>> +
>> +   For details on the ``bb.utils.contains`` function, see its definitio=
n in
>> +   :bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`.
>> +
>> +   .. note::
>> +
>> +      The ``require`` command is designed to not fail if the function
>> +      ``bb.utils.contains`` returns an empty string.
>> +
>> +#. Back to your ``layer.conf`` file, add the class ``meta-mylayer-cfg``=
 class to
>> +   the :term:`USER_CLASSES` variable::
>> +
>> +      USER_CLASSES:append =3D " meta-mylayer-cfg"
>> +
>> +   This will add the class ``meta-mylayer-cfg`` to the list of classes =
to
>> +   globally inherit. Since the ``include`` command is conditional in
>> +   ``meta-mylayer-cfg.bbclass``, even though inherited the class will h=
ave no
>> +   effect until the feature ``mylayer-kernel`` is enabled through
>> +   :term:`DISTRO_FEATURES`.
>> +
>
> Since you go to such great lengths to explain how to create the bbclass,=
=20
> require it conditionally, etc... Maybe provide how to "enable through=20
> DISTRO_FEATURES" so we have the complete picture?

Good idea!

>> +This technique can also be used for :ref:`Machine features
>
> s/for/with/ ?

+1, thanks :)

> Looks good otherwise :)
>
> Cheers,
> Quentin

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


