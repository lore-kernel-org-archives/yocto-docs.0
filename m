Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CE1C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:38:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.84222.1749555500940483252
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 04:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HI4fYqAj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C95F742FF4;
	Tue, 10 Jun 2025 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749555499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DBgp2Y8PEzIPzbtXlDx/DqzgOJMtUeWCugR2qmj6nOI=;
	b=HI4fYqAjsMePVdVo+eUWbgMU1ttgCcDT3X2wr04HdQ0IOK5TGwfv+CpNH4q2UT0r50QUTl
	EzOzIOeg037Gwr/yrhpZY0Or7VETyVOacP0iipoSSqM+RPNNsRh4bWaF2+vXbOe3wdolu2
	ztMLwlrs/F9KIZ5uD/NpGaOFzoIPBATcjxBz3bbURa0yB5PH6mngfxArs1F6hFZzAnvD7n
	Ux/1ZD6Ftd0YDnuyRM8rfawo9VwBcYtzr+U0aF/kItMhFvWdzcQdq1FFJGq/CD3dULCFaB
	0r0chnQpFCnVSe64Ayy1wr7rAYnzEGSIfxreDFQ/7YIGdsH81GF+9y9R6wl0cQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 13:38:18 +0200
Message-Id: <DAITNWBR6NXN.2LBDVZFSIHX02@bootlin.com>
Subject: Re: [docs] [PATCH] Add a document to list supported Yocto features
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, "Yocto TSC"
 <tsc@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20250606-supported-architectures-v1-1-5eae2c4a2257@bootlin.com>
 <0cd19563-a1dc-48ed-9924-63a75c5e72f2@cherry.de>
In-Reply-To: <0cd19563-a1dc-48ed-9924-63a75c5e72f2@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetgfeuieetjeegffdttdeikefgiefgudekteejjeevteeftdfgvdeuveegvdehkeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgruhhtohhmohhtihhvvghlihhnuhigrdhorhhgpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihr
 dguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepthhstgeslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 11:38:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7050

Hi Quentin,

Thanks for the suggestions, I'll prepare a v2.

Otherwise I'll answer to what I know the answer to.

On Fri Jun 6, 2025 at 11:25 AM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 6/6/25 9:37 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add a "Yocto Project Supported Architectures And Features" document that
>> aims at:
>>=20
>> - Defining the different levels of support for features
>> - Listing the maintainers for a feature
>> - Listing the existing builders on the Autobuilder for the feature
>>=20
>> Co-developed-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Yocto TSC <tsc@lists.yoctoproject.org>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/index.rst                 |   1 +
>>   .../yocto-project-supported-features.rst           | 264 +++++++++++++=
++++++++
>>   2 files changed, 265 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manu=
al/index.rst
>> index a746dde492..53fa98cc99 100644
>> --- a/documentation/ref-manual/index.rst
>> +++ b/documentation/ref-manual/index.rst
>> @@ -11,6 +11,7 @@ Yocto Project Reference Manual
>>      :numbered:
>>  =20
>>      system-requirements
>> +   yocto-project-supported-features
>>      terms
>>      release-process
>>      structure
>> diff --git a/documentation/ref-manual/yocto-project-supported-features.r=
st b/documentation/ref-manual/yocto-project-supported-features.rst
>> new file mode 100644
>> index 0000000000..8776a1a7eb
>> --- /dev/null
>> +++ b/documentation/ref-manual/yocto-project-supported-features.rst
>> @@ -0,0 +1,264 @@
>> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>> +
>> +**************************************************
>> +Yocto Project Supported Architectures And Features
>> +**************************************************
>> +
>> +The Yocto Project is putting continuous efforts into testing the change=
s made to
>> +the :term:`OpenEmbedded-Core (OE-Core)` metadata and core tools. The de=
tails on
>> +how this test environment functions is described in the
>> +:doc:`/test-manual/index`.
>> +
>> +These tests are also run for stable and Long Term Support versions of t=
he Yocto
>
> Could point Long Term Support to the :term:`LTS` as well since we=20
> already have it :)
>
>> +Project. See the :doc:`/ref-manual/release-process` section of the Yoct=
o Project
>> +Reference Manual for more information on these types of releases.
>> +
>> +The infrastructure behind the test environment is the Yocto Project Aut=
obuilder.
>> +For more information on the Yocto Project Autobuilder, see the
>> +:ref:`test-manual/intro:Yocto Project Autobuilder Overview` section of =
the Yocto
>> +Project Test Manual. The Autobuilder contains a set of Builders that ar=
e
>
> I would squash the first and second sentence with a simple link
>
> :ref:`Yocto Project Autobuilder<test-manual/intro:Yocto Project=20
> Autobuilder Overview>`
>
> for example.
>
>> +associated to an architecture or a feature to test. For example, the
>> +``qemuarm64`` builder corresponds to testing the ARM 64-bit architectur=
e.
>> +
>
> Wondering if this information should be part of=20
> documentation/test-manual/understand-autobuilder.rst as well/only?

I took a note of that, thanks

>> +Below is a comprehensive list of target architectures and features that=
 are
>> +supported, as well as their level of support. For each architecture or =
feature,
>> +their corresponding builders are also listed.
>> +
>> +Primary Supported
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The term "primary" means that dedicated builds for these architecture o=
r
>
> s/architecture/architectures/
>
>> +features are being run on a daily basis on the Yocto Project Autobuilde=
r and
>> +also tested with incoming changes before they merge.
>> +
>
> Should we mention this is typically the -next branches? E.g.=20
> master-next, walnascar-next, etc...?

Sure, I can briefly mention that, it can help people locating their "under-=
test"
patches.

>> +Below is a list of primary tested features, their maintainer(s) and bui=
lder(s):
>> +
>> +.. list-table::
>> +   :widths: 20 20 20 40
>> +   :header-rows: 1
>> +
>> +   * - Feature
>> +     - Description
>> +     - Maintainer(s)
>
> What are we trying to achieve with this column?
>
> What am I supposed to derive as information as a user of YP/OE/BB based=
=20
> on that?
>
> Is this some kind of public recognition from the project of efforts from=
=20
> some people?
>
> Are we supposed to be able to contact those people maybe? Should there=20
> be some mail address there or some pointers to some document on what to=
=20
> do if we want to contact them?

I did not want to display the email adresses of the people there without th=
eir
consent, although it would be nice to include, for sure. I guess I can ment=
ion
that layer READMEs should contain more information, including the email add=
ress.

>> +     - Builder(s)
>> +   * - :wikipedia:`ARM <ARM_architecture_family>`
>> +     - ARM architecture testing
>> +     - Collective effort
>> +     - genericarm64,
>> +       genericarm64-alt,
>> +       meta-arm,
>
> This stood out compared to other entries in this column as I recognized=
=20
> most others as machines, but this is a layer.
>
> So this then prompted me to look it up on the autobuilder and I see that=
=20
> we have tags for builders.
>
> Some are "layers" like meta-arm, "qemu", "toolchain", "qemu-alt", "ltp",=
=20
> "ptest", etc.
>
> I'm guessing they have a purpose and things are tested differently in=20
> the autobuilder based on this tag? Is this something we want to document?
>
>> +       musl-qemuarm64,
>> +       qemuarm,
>> +       qemuarm-alt,
>> +       qemuarm-oecore,
>> +       qemuarm-tc,
>> +       qemuarm64,
>> +       qemuarm64-alt,
>> +       qemuarm64-armhost,
>> +       qemuarm64-ltp,
>> +       qemuarm64-ptest,
>> +       qemuarm64-tc,
>> +       qemuarmv5
>> +   * - :yocto_git:`Beaglebone </poky/tree/meta-yocto-bsp/conf/machine/b=
eaglebone-yocto.conf>`
>> +     - Beaglebone image and SDK build testing
>> +     - Collective effort
>> +     - beaglebone,
>> +       beaglebone-alt
>> +   * - :doc:`Reproducible </test-manual/reproducible-builds>`
>> +     - reproducibility testing
>> +     - Collective effort
>> +     - reproducible
>> +   * - :term:`Buildtools`
>> +     - Buildtools generation
>> +     - Collective effort
>> +     - buildtools
>> +   * - `meta-agl-core <https://gerrit.automotivelinux.org/gerrit/AGL/me=
ta-agl>`__
>> +     - meta-agl-core layer testing
>> +     - Jan-Simon M=C3=B6ller
>> +     - meta-agl-core
>> +   * - `meta-arm <https://git.yoctoproject.org/meta-arm>`__
>> +     - meta-arm layer testing
>> +     - Jon Mason,
>> +       Ross Burton
>> +     - meta-arm
>
> Ahah, should meta-arm be removed from the first row?

Indeed this was a mistake, thanks!

>> +   * - `meta-aws <https://github.com/aws4embeddedlinux/meta-aws>`__
>> +     - meta-aws layer testing
>> +     - Thomas Roos
>> +     - meta-aws
>> +   * - `meta-intel <https://git.yoctoproject.org/meta-intel>`__
>> +     - meta-intel layer testing
>> +     - Anuj Mittal
>> +     - meta-intel
>> +   * - `meta-virtualization <https://git.yoctoproject.org/meta-virtuali=
zation/>`__
>> +     - meta-virtualization layer testing
>> +     - Bruce Ashfield
>> +     - meta-virt
>> +   * - :ref:`Multilib <dev-manual/libraries:Combining Multiple Versions=
 of Library Files into One Image>`
>> +     - Multilib feature testing
>> +     - Collective effort
>> +     - multilib
>> +   * - :term:`OpenEmbedded-Core selftest<OpenEmbedded-Core (OE-Core)>`
>> +     - OpenEmbedded-Core layers selftests
>> +     - Collective effort
>> +     - oe-selftest-fedora,
>> +       oe-selftest-debian,
>> +       oe-selftest-armhost
>> +   * - Package managers> +     - Package managers (RPM, DEB and IPK for=
mats) testing in the
>> +       :term:`OpenEmbedded Build System` (different from the
>> +       ``package-management`` :term:`image feature <IMAGE_FEATURES>`)
>
> Would that then be :term:`PACKAGE_CLASSES`?

Yes, this builder is testing package types from PACKAGE_CLASSES.

> We can keep the disambiguation though.
>
>> +     - Collective effort
>> +     - pkgman-non-rpm (other builders use RPM by default)
>> +   * - :ref:`Patchtest <contributor-guide/submit-changes:Validating Pat=
ches with Patchtest>`
>> +     - Patchtest tool selftests
>> +     - Trevor Gamblin
>> +     - patchtest-selftest
>> +   * - :wikipedia:`RISC-V (64-bit) <RISC-V>`
>> +     - RISC-V architecture testing (64-bit)
>> +     - Collective effort
>> +     - qemuriscv64,
>> +       qemuriscv64-ptest,
>> +       qemuriscv64-tc
>> +   * - :wikipedia:`systemd <Systemd>`
>> +     - Systemd init manager testing
>> +     - Collective effort
>> +     - no-x11, qa-extras2
>> +   * - :term:`Toaster`
>> +     - Toaster web interface testing
>> +     - Collective effort
>> +     - toaster
>> +   * - :ref:`Wic <dev-manual/wic:creating partitioned images using wic>=
`
>> +     - WIC image creation testing
>> +     - Collective effort
>> +     - wic
>> +   * - :wikipedia:`X86 <X86>`
>> +     - X86 architecture testing
>> +     - Collective effort
>> +     - genericx86,
>> +       genericx86-64,
>> +       genericx86-64-alt,
>> +       genericx86-alt,
>> +       musl-qemux86,
>> +       musl-qemux86-64,
>> +       qemux86,
>> +       qemux86-64,
>> +       qemux86-64-alt,
>> +       qemux86-64-ltp,
>> +       qemux86-64-ptest,
>> +       qemux86-64-tc,
>> +       qemux86-64-x32,
>> +       qemux86-alt,
>> +       qemux86-tc,
>> +       qemux86-world,
>> +       qemux86-world-alt
>> +
>> +Secondary Supported
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The term "secondary" means that in some cases there is code/feature/sup=
port
>> +which is desired by people using the project and is in the project's in=
terests
>> +to support, however there isn't wide enough interest and support to jus=
tify
>> +testing all incoming changes on it. There are however project member
>> +organisations and maintainers willing to run tests and review fixes.
>> +
>> +This category may be applicable=C2=A0as support/usage in an area develo=
ps and grows,
>> +or as support/usage fades but we continue to have tests. It can also ap=
ply where
>> +resourcing isn't available for full primary support but there is
>> +member/maintainer support for running tests.
>> +
>> +We therefore have the following criteria and policies for such items:
>> +
>> +-  It can be clearly isolated and defined by specific configuration.
>> +
>> +-  There is a clear documented group of maintainers agreeing to maintai=
n=C2=A0it.
>> +
>> +-  Those maintainers are active and responsive.
>> +
>> +-  It is being actively and publicly tested (potentially using
>> +   the=C2=A0:ref:`Autobuilder <test-manual/intro:Yocto Project Autobuil=
der Overview>`
>> +   by agreement, or otherwise).
>> +
>> +-  Testing would not be part of standard incoming change testing and=C2=
=A0regressions
>> +   would not block incoming patches.
>> +
>> +-  The :yocto_wiki:`SWAT </Yocto_Build_Failure_Swat_Team>` team would n=
ot handle
>> +   any test builds on the autobuilder.
>> +
>
> Autobuilder has always been capitalized in this patch until here, so...
>
> s/autobuilder/Autobuilder/
>
> ?
>
>> +-  Test results can be submitted as part of the release process if=C2=
=A0desired.
>> +
>
> Submitted where? Can we see the test results somewhere?
>
> Cheers,
> Quentin

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


