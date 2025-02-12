Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85336C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 12:49:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.14881.1739364568009425152
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 04:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ke0+GdLw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE16B43420;
	Wed, 12 Feb 2025 12:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739364566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ob5pZCo7/Pgpy/Q6FlewjCc5NLLS3yYBnMNdEn2N/4=;
	b=Ke0+GdLwg5hOLE8XN2CiAReGMHhk5MVjIZDfiLV7QzT77zQUDENB3McTrLrf1OJmNqrvZK
	jgjPyA4f3foz5qm1adcrWfDzvxNiWm6vLfjOha4H7AezF6HZiBZC7owdhKE+dk1lHsxYKY
	rGaCzCHqF9X9+GDyvbY6BDDNqpHL56NIXk7FU4mjZu1R62FeDqnCmJ0C0xzER6XUq8lj6g
	EBOziHM6dl+8bu++fpzodSguHZBoPM+mVfSIFtOPQGsojSHAyba2n7Ti9E0TG1eqLx1UpQ
	fVObwki+XcD/6U22ymHHAXYpS0JsQ4isp3TuetsTdWdwjZQweLQlyEz0YSuFWw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Feb 2025 13:49:24 +0100
Message-Id: <D7QHA1TOHUAV.2OV0D9F0TRDLO@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 6/6] dev-manual/multiconfig: add suggested best
 practices and baremetal sections
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Mark Hatle"
 <mark.hatle@kernel.crashing.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
 <20250207-multiconfig-doc-v1-6-f63cdab1fad9@bootlin.com>
 <5474982a-b6ee-49f5-aff8-47ea3da5c22b@cherry.de>
In-Reply-To: <5474982a-b6ee-49f5-aff8-47ea3da5c22b@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvufevhffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueduffeiueeftedvtedtiedtjeefudelleduleeuhedujeegffevvddthedvhedvnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpshhouhhrtggvfigrrhgvrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghss
 ehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghrkhdrhhgrthhlvgeskhgvrhhnvghlrdgtrhgrshhhihhnghdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Feb 2025 12:49:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6355

Hi Quentin,

On Tue Feb 11, 2025 at 1:08 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/7/25 5:28 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> After the suggestions from Mark Hatle on the list
>> (https://lists.yoctoproject.org/g/docs/topic/110487932), add two
>> sections to the multiconfig doc:
>>=20
>> - Suggested best practices: suggestion for better design of multiconfig
>>    builds.
>>=20
>> - Common use case: baremetal build.
>>=20
>>    This section applies the guidelines from the first sections and apply
>>    it to a real-life example of how to use multiconfig. This one to buil=
d
>>    some baremetal firmware alongside a regular Linux build.
>>=20
>> Suggested-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/dev-manual/multiconfig.rst | 106 +++++++++++++++++++++++=
++++++++
>>   1 file changed, 106 insertions(+)
>>=20
>> diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/de=
v-manual/multiconfig.rst
>> index 27442a042..9560ce5a0 100644
>> --- a/documentation/dev-manual/multiconfig.rst
>> +++ b/documentation/dev-manual/multiconfig.rst
>> @@ -171,3 +171,109 @@ and have separate configuration files, BitBake pla=
ces the artifacts for
>>   each build in the respective temporary build directories (i.e.
>>   :term:`TMPDIR`).
>>  =20
>> +Suggested best practices
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> +
>> +-  :term:`TMPDIR` (other then the default set in bitbake.conf) is only =
set in
>
> s/then/than/
>
> and tick quote bitbake.conf
>
>> +   ``local.conf`` by the user. This means that we should **not** manipu=
late
>> +   :term:`TMPDIR` in any way within the Machine or Distro :term:`config=
uration
>> +   file`.
>> +
>> +-  A multiconfig should specify a :term:`TMPDIR`, and should specify it=
 by
>> +   appending the multiconfig name via :term:`BB_CURRENT_MC`.
>> +
>
> Provide the example you gave in the previous patch.
>
>> +-  Recipes that are used to transfer the output from a multiconfig buil=
d should
>
> +to another
>
> i.e.
>
> from a multiconfig build to another
>
> ?
>
>> +   use ``task[mcdepends]`` to trigger the build of the component, and t=
hen
>
> maybe use do_task[mcdepends] here?
>
>> +   transfer the item to the current configuration in :ref:`ref-tasks-in=
stall`
>> +   :ref:`ref-tasks-deploy`, assuming the value of the deployed item bas=
ed on
>> +   :term:`TMPDIR`.
>> +
>
> Please provide an example with fictitious recipes and tasks?
>
> There's also a missing word between the install and deploy task refs.

Will be part of v2.

>> +-  Firmware recipes can set the :term:`INHIBIT_DEFAULT_DEPS` variable t=
o ``1``
>> +   if they don't rely on default dependencies such as the standard C li=
brary.
>> +
>> +Common use case: building baremetal firmware alongside a Linux build
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +A common use for multiconfig is to use the default configuration as the=
 regular
>> +Linux build, while one or more multiconfigs can be used to build specia=
l
>> +components, such as baremetal firmware. This section details how one ca=
n achieve
>> +this scenario.
>> +
>> +Adding a multiconfig configuration file and recipe for a baremetal firm=
ware
>> +-----------------------------------------------------------------------=
----
>> +
>> +As described in :ref:`dev-manual/multiconfig:Setting Up and Running a M=
ultiple
>> +Configuration Build`, each multiconfig will require a separate
>> +:term:`Configuration File`. In our case, we will make a separate tempor=
ary
>> +directory for our baremetal firmware build configuration.
>> +
>> +For example, we will define a new ``conf/multiconfig/baremetal-firmware=
.conf``
>> +as follows::
>> +
>> +   TMPDIR .=3D "-${BB_CURRENT_MC}"
>> +   TCLIBC =3D "newlib"
>> +
>> +The ``baremetal-firmware.conf`` configure a separate :term:`TMPDIR` for=
 holding
>> +binaries compiled with the `newlib <https://sourceware.org/newlib/>`__ =
toolchain
>> +(see :term:`TCLIBC`).
>> +
>> +We then create a recipe ``my-firmware.bb`` that defines how the baremet=
al
>> +firmware is built. The recipe should contain enough information for the
>> +:term:`OpenEmbedded build system` to properly compile the firmware with=
 our
>> +toolchain. The building tasks may vary depending on the nature of the f=
irmware.
>> +However, the recipe should define a :ref:`ref-classes-deploy` task that=
 deploys
>> +the output into the :term:`DEPLOYDIR` directory. We will consider in th=
e
>> +following that the file is named ``my-firmware.elf``.
>> +
>> +Building the firmware
>> +---------------------
>> +
>> +The firmware can be built with BitBake with the following command::
>> +
>> +   $ bitbake mc:baremetal-firmware:my-firmware
>> +
>> +However, we would prefer for ``my-firmware`` to be automatically built =
when
>> +triggering a normal Linux build.
>> +
>> +Using an ``mcdepend``, a recipe belonging to the Linux build can trigge=
r the
>> +build of ``my-firmware``. For example, let's consider that our Linux bu=
ild needs
>> +to assemble a "special" firmware that uses the output of our ``my-firmw=
are``
>> +recipe - let's call it ``my-parent-firmware.bb``. Then, we should speci=
fy this
>> +dependency in ``my-parent-firmware.bb`` with::
>> +
>> +   do_compile[mcdepends] =3D "mc::baremetal-firmware:my-firmware:do_dep=
loy"
>> +
>> +The above will ensure that when the :ref:`ref-tasks-compile` task of
>> +``my-parent-firmware`` is triggered, the :ref:`ref-tasks-deploy` task o=
f
>> +``my-firmware`` will already have run successfully.
>> +
>> +Using the output of ``my-firmware``
>> +-----------------------------------
>> +
>> +After we have deployed ``my-firmware`` by using ``mcdepends``, we need =
to use
>> +the output in some way. We can make a series of assumptions, based on t=
he
>> +default Yocto Project variables in order to get the binary for packagin=
g.
>> +
>> +First, we can set the following in ``my-parent-firmware.bb``::
>> +
>> +   FIRMWARE_FILE ??=3D "${TMPDIR}-baremetal-firmware/deploy/images/<mac=
hine>/my-firmware.elf"
>> +   FIRMWARE_FILE[vardepsexclude] +=3D "TMPDIR"
>> +
>> +The first assignment stores the value of the path to the firmware built=
 and
>> +deployed by the ``my-firmware.bb`` recipe. The second assignment exclud=
es the
>> +:term:`TMPDIR` variable from being part of ``FIRMWARE_FILE``'s dependen=
cies -
>> +meaning that changing the value of :term:`TMPDIR` (for example, changin=
g the
>> +host on which the firmware is built) will not invalidate the :ref:`shar=
ed state
>> +cache <overview-manual/concepts:shared state cache>`.
>> +
>> +Additionally, ``<machine>`` should be replaced by the machine for which=
 we are
>
> s/machine/:term:`MACHINE`/ ?

Here ``<machine>`` refers to the example, where it is written like so. Howe=
ver I
think I'll replace "by the machine" by "by the :term:`MACHINE`".

>> +building in the Linux context.
>> +
>
> In the baremetal-firmware context rather?

Yes, thanks for pointing that out!

>> +We can add an :ref:`ref-tasks-install` task to the ``my-parent-firmware=
``::
>
> We can +then ?
>
> s/an/a/ ?
>
> Coming from the embedded industry, I find an example using "main SoC" vs=
=20
> "companion microcontroller" on the same board drawing a better picture=20
> than "baremetal firmware" vs "Linux build" especially since we don't=20
> specify here they could be for different architectures (so implied they=
=20
> are for the same).

I will try mentioning that this section is not limited to the baremetal fir=
mware
running under the same architecture. Specifically, that the MACHINE variabl=
e may
be overridden in the multiconfig conf, if one wants to do so.

> Other use cases I've seen for multiconfig is rootfs within another=20
> rootfs, or building a recovery image for a system and putting in on the=
=20
> same disk image as the normal rootfs, or building an initramfs with=20
> another init system than the one used for the main rootfs. We don't have=
=20
> to list them all, just sharing here for reference :)

Yes, those are really good examples, hopefully this document can be used in=
 the
future to add and document these! I think this was initially the intent of
Mark's original message.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

