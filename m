Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65035C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:33:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.52658.1739802818248189093
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X0DNH6uU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C27A44227;
	Mon, 17 Feb 2025 14:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739802816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WLdgJ7ge6N4R32Q3f1O5ErjdbiVHsp4JEnHI7CjkufI=;
	b=X0DNH6uUyFpfd82caVRB2Z155clBDiL2pUEkDb+Vr5OG72PIMqatZEn5zxDzrpSP3AW1rL
	zcG62jzpM7LvVPIqi/rnfkfNFWTqLB3nfHHBmxXBayLKJZevPCXSVvvOqo6bsWlkiTQm/8
	0AzBmuRLtiFcByz7fzWUGt3jZPQBxlw9dyKbqe2g/0TBJizN08zMbrYyXFu/kGSibgUacT
	bE2niGRZK9AMgzCxNvpLZl6fbIlYYZhwdIxv4laH+KKPRwxB1Qn4V+XzCrNtoekvcYL/Zs
	XdAVi4aziZ2PBTHkJ6JevPDGB3W17tXetUB0SxpmnbXN1oBdXl4c9YbV4BSv0Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Feb 2025 15:33:35 +0100
Message-Id: <D7USMJRZRMFU.3RAO64TQ4I57R@bootlin.com>
Subject: Re: [docs] [PATCH v2 6/6] dev-manual/multiconfig: add suggested
 best practices and baremetal sections
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Mark Hatle"
 <mark.hatle@kernel.crashing.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
 <20250213-multiconfig-doc-v2-6-f2bd35115cb7@bootlin.com>
 <094154ae-b6cd-40db-ac06-6357da7c769c@cherry.de>
In-Reply-To: <094154ae-b6cd-40db-ac06-6357da7c769c@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeggeelffefjeejfeeftedvjeelheekkeefkeethffgleevkeevteelgedthefhnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpshhouhhrtggvfigrrhgvrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghss
 ehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghrkhdrhhgrthhlvgeskhgvrhhnvghlrdgtrhgrshhhihhnghdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:33:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6390

Hi Quentin,

On Mon Feb 17, 2025 at 1:42 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/13/25 9:23 AM, Antonin Godard via lists.yoctoproject.org wrote:
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
>>   documentation/dev-manual/multiconfig.rst | 136 +++++++++++++++++++++++=
++++++++
>>   1 file changed, 136 insertions(+)
>>=20
>> diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/de=
v-manual/multiconfig.rst
>> index 49e32b04a..cdf06d2ca 100644
>> --- a/documentation/dev-manual/multiconfig.rst
>> +++ b/documentation/dev-manual/multiconfig.rst
>> @@ -171,3 +171,139 @@ and have separate configuration files, BitBake pla=
ces the artifacts for
>>   each build in the respective temporary build directories (i.e.
>>   :term:`TMPDIR`).
>>  =20
>> +Suggested best practices
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> +
>> +-  :term:`TMPDIR` (other than the default set in bitbake.conf) is only =
set in
>> +   ``local.conf`` by the user. This means that we should **not** manipu=
late
>> +   :term:`TMPDIR` in any way within the Machine or Distro :term:`config=
uration
>> +   file`.
>> +
>> +-  A multiconfig should specify a :term:`TMPDIR`, and should specify it=
 by
>> +   appending the multiconfig name via :term:`BB_CURRENT_MC`.
>
> s/via/with/
>
>> +
>> +-  Recipes that are used to transfer the output from a multiconfig buil=
d to
>> +   another should use ``do_task[mcdepends]`` to trigger the build of th=
e
>> +   component, and then transfer the item to the current configuration i=
n
>> +   :ref:`ref-tasks-install` and :ref:`ref-tasks-deploy`, assuming the v=
alue of
>> +   the deployed item based on :term:`TMPDIR`.
>> +
>> +   The :ref:`ref-tasks-install` and :ref:`ref-tasks-deploy` tasks shoul=
d look
>> +   like this::
>> +
>> +      do_install() {
>> +          install -m 0644 ${TMPDIR}-<multiconfig>/tmp/deploy/images/<ma=
chine>/somefile ${D}/some/path
>> +      }
>> +
>> +      do_deploy() {
>> +          install -m 0644 ${TMPDIR}-<multiconfig>/tmp/deploy/images/<ma=
chine>/somefile ${DEPLOYDIR}/somefile
>> +      }
>> +
>> +   In the examples above:
>> +
>
> s/examples/example/
>
>> +   -  ``<multiconfig>`` is the multiconfig name as set by the multiconf=
ig
>> +      :term:`configuration file` (see the :ref:`dev-manual/multiconfig:=
Setting
>> +      Up and Running a Multiple Configuration Build` section above).
>> +
>> +   -  ``<machine>`` must be the :term:`MACHINE` for which ``somefile`` =
was built
>> +      and deployed. This value depends on whether the multiconfig
>> +      :term:`configuration file` is overriding the :term:`MACHINE` valu=
e or not.
>> +
>
> I can suggest:
>
> """
> This value may differ from the current :term:`MACHINE` if the=20
> multiconfig :term:`configuration file` overrides it.
> """
>
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
>
> s/use/use case/ ?
>
>> +Linux build, while one or more multiconfigs can be used to build specia=
l
>> +components, such as baremetal firmware. It would also apply to a scenar=
io where
>> +a microcontroller, for example, is companion to a main processor where =
Linux is
>> +running. This section details how one can achieve these kinds of scenar=
ios with
>> +a multiconfig build.
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
>
> Mmmm not sure what "separate temporary directory" should mean here? Are=
=20
> you talking about the conf/multiconfig/ directory or TMPDIR?

Yes, that wasn't clear. I was talking about the TMPDIR. Will rephrase to:

"""
In addition, we will define a separate :term:`TMPDIR` for our baremetal fir=
mware
build configuration.
"""

>> +For example, we will define a new ``conf/multiconfig/baremetal-firmware=
.conf``
>> +as follows::
>> +
>> +   TMPDIR .=3D "-${BB_CURRENT_MC}"
>> +   TCLIBC =3D "newlib"
>> +
>> +The ``baremetal-firmware.conf`` configure a separate :term:`TMPDIR` for=
 holding
>
> s/configure/configures/
>
>> +binaries compiled with the `newlib <https://sourceware.org/newlib/>`__ =
toolchain
>> +(see :term:`TCLIBC`).
>> +
>> +.. note::
>> +
>> +   Here, the default :term:`MACHINE` is not overriden by the multiconfi=
g
>
> s/overriden/overridden/
>
>> +   configuration file. As a consequence, the architecture of the built =
baremetal
>> +   binaries will be the same. In other cases, where the firmware runs o=
n a
>
> s/the same/the same as the one for the Linux build/
>
>> +   completely different architecture, the :term:`MACHINE` may be overri=
den.
>
> s/may/must/
>
> s/overriden/overridden/
>
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
>
> I read mcdepend as multiconfigdepend or macdepend, and not=20
> em-see-depend. So I would use "a" and not "an" but no strong opinion.

Ha, that's right, I read it as em-see-depend. It's probably multiconfigdepe=
nds
tbh, so I'll swap to "a".

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
>
> I can suggest:
>
> """
> After ``my-firmware`` recipe has deployed `my-firmware.elf`, we need to u=
se
> """
>
> otherwise it may imply that mcdepends it what deployed my-firmware which=
=20
> isn't the case, it just made sure my-firmware:do_deploy is finished=20
> before my-parent-firmware:do_compile starts.

+1, I agree

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
>
> Michael really wanted to use em-dashes, so maybe use it here?
>
> i.e.
>
> ---
>
> c.f. c29a1bf4dd52 ("profile-manual: usage.rst: formatting fixes")

Will do

Thanks a lot!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

