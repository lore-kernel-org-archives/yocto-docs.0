Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61720D462C0
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 15:27:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.14098.1731511632960059881
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 07:27:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gteS94hK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2D0E1C0003;
	Wed, 13 Nov 2024 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731511631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfzZk0h4rkdedIcnlwhFI48K1pgQBoiFRClQmvSmQL8=;
	b=gteS94hKAbSgok6mMVrUg37QOebJ9csC304heN4I/jCJ+M3/LCRE9hjO15oPa4fBHFfFqR
	kj55lkKD63PlOFV5dplITN5DnuEWDXc1tJakmHQv71d1eln1cJc8ZgQOn4AYUODyaOSdDZ
	SgP2Y2jp6LnISZONsv3/rXRJAtY8No4eSm7tuzOqsl35hlXj/6fcbmcI9D5tvyC74a+ii4
	RM9tpOIXhhVuIfZ2sBTjXHue4v2qXSrc1IMPr1233ixZOZZUQMjaIJBrGRmQdkw8TonejG
	qMau5GBxSY/ZhIzn+rG0GDZ0MWBOup7t4sraVXdE9k9W4zxzyoWC7Glsb349Hw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Nov 2024 16:27:10 +0100
Message-Id: <D5L5N9RJHC8Q.EHZ288R9PXP1@bootlin.com>
Subject: Re: [yocto-docs PATCH v3 2/2] dev-manual: document how to provide
 confs from layer.conf
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241113-layer-confs-v3-0-3a84b0eb2750@bootlin.com>
 <20241113-layer-confs-v3-2-3a84b0eb2750@bootlin.com>
 <61655cbc-00c6-48f8-8a68-c40edbce0512@cherry.de>
In-Reply-To: <61655cbc-00c6-48f8-8a68-c40edbce0512@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 15:27:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5737

Hi Quentin,

On Wed Nov 13, 2024 at 3:36 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/13/24 3:30 PM, Antonin Godard wrote:
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
>>   documentation/dev-manual/layers.rst | 90 +++++++++++++++++++++++++++++=
++++++++
>>   1 file changed, 90 insertions(+)
>>=20
>> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-man=
ual/layers.rst
>> index 91889bd0ae391c7b6e62068778ae5c180c840762..ac18321b04d08bceae63672c=
f6da26660646fc59 100644
>> --- a/documentation/dev-manual/layers.rst
>> +++ b/documentation/dev-manual/layers.rst
>> @@ -644,6 +644,96 @@ variable and append the layer's root name::
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
>> +.. warning::
>> +
>> +   Providing unconditional global level configuration from the ``layer.=
conf``
>> +   file is *not* a good practice, and should be avoided. For this reaso=
n, the
>> +   section :ref:`ref-conditional-layer-confs` below shows how the ``lay=
er.conf``
>> +   file can be used to provide configurations only if a certain conditi=
on is
>> +   met.
>> +
>> +For example, if your layer provides a Linux kernel recipe named
>> +``linux-custom``, you may want to make :term:`PREFERRED_PROVIDER_virtua=
l/kernel
>> +<PREFERRED_PROVIDER>` point to ``linux-custom``::
>> +
>> +  PREFERRED_PROVIDER_virtual/kernel =3D "linux-custom"
>> +
>> +This can be defined in the ``layer.conf`` file. If your layer is at the=
 last
>> +position in the :term:`BBLAYERS` list, it will take precedence over pre=
vious
>> +``PREFERRED_PROVIDER_virtual/kernel`` assignments (unless it is set fro=
m a
>
> s/unless it/unless one/
>
> The issue is we have two "it" in that sentence, one for representing the=
=20
> layer and the other the PREFERRED_PROVIDER_virtual/kernel assignment.=20
> What's a bit confusing is that "it" should be understood as *an*=20
> assignment whereas the word is in its plural form before.

+1, thanks!

>> +:term:`configuration file` that is parsed later, such as machine or dis=
tro
>> +configuration files).
>> +
>> +.. _ref-conditional-layer-confs:
>> +
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
>
> s/include/require/
>
> We changed include for require in v2 I believe, we probably forgot to=20
> update that one as well :)

Yes, I forgot to update them, I will send a v3.

>> +   ``meta-mylayer-cfg.bbclass``, even though inherited the class will h=
ave no
>> +   effect until the feature ``mylayer-kernel`` is enabled through
>
> s/until/unless/ ?

Yes, thanks!

> With the s/include/require/:
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Thanks!
> Quentin

Thanks a lot!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


