Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B16C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:20:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.82909.1749547207714824339
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 02:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jdPysYSg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADC0243148;
	Tue, 10 Jun 2025 09:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749547206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wveJPg25JKIlXCjZoMdOZBKX7fz6GHzHd9S3ullttBI=;
	b=jdPysYSgFEKTehuEiGdedvTGZYWNEgNYhEEsqit0Faf+mHk9DKuvowuzcGTVC+wya6Pkpn
	yhGEwDXm+TwKPjz8fxx6N8YJK2WuSS+MBG01toZrKJNlVMA/7m9FSKrJ7zbjyVrL4/Q4iv
	xKylds9xnUe9Mwx+HWaP01zobZu1OFWRR6DVdE6TcWJZaWeFsPpAcR7M9AAfYMPii0nFYy
	D9sO2NkF+nCOuZUXrBcfGigdsrj/6u+qLMWMY+kQcqmLYerbgv3cN/VfMGzgJ8TjzsMARz
	erxowZeJ5DqGi32Y9WOUE3v3MutrgWDzYf6BBeOQBpxpcnRlzKupOUnIYUznUg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 11:20:05 +0200
Message-Id: <DAIQQ2J2C0BT.2USP6INDRV4P6@bootlin.com>
Subject: Re: [docs] [PATCH v2] ref-manual: document KERNEL_SPLIT_MODULES
 variable
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dixitparmar19@gmail.com>, <docs@lists.yoctoproject.org>
References: <20250608104459.1888510-1-dixitparmar19@gmail.com>
 <DAIQ7EZLUNIR.1PRHTL84VV2XG@bootlin.com>
In-Reply-To: <DAIQ7EZLUNIR.1PRHTL84VV2XG@bootlin.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedttddugffgledvjeeihfegvedvuddtgeeggeejfffhtdektddvieeugfevtdeuudenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepughigihithhprghrmhgrrhduleesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 09:20:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7045

On Tue Jun 10, 2025 at 10:55 AM CEST, Antonin Godard wrote:
> On Sun Jun 8, 2025 at 12:44 PM CEST, Dixit Parmar via lists.yoctoproject.=
org wrote:
>> This variable controls the kernel module spliting.
>>
>> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
>> ---
>>  documentation/ref-manual/variables.rst | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index 9768d8f5b..b7dde2604 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -5359,6 +5359,20 @@ system and gives an overview of their function an=
d contents.
>>        the :term:`KERNEL_PATH` variable. Both variables are common varia=
bles
>>        used by external Makefiles to point to the kernel source director=
y.
>> =20
>> +   :term:`KERNEL_SPLIT_MODULES`
>> +      When inheriting the :ref:`ref-classes-kernel-module-split` class,=
 this
>> +      variable controls whether kernel modules are split into separate =
packages
>> +      or bundled into a single package.
>> +
>> +      For some use cases, a monolithic kernel module package
>> +      :ref:`KERNEL_PACKAGE_NAME` (by default named ``kernel``) that con=
tains
>
> This should be :term:`KERNEL_PACKAGE_NAME` (not :ref:). Otherwise fails t=
o
> build.
>
>> +      all modules built from the kernel sources may be preferred. Becau=
se a
>> +      monolithic package can reduce download time and speed up installa=
tion.
>
> I think this can be simplified by "...may be preferred to speed up
> installation". "Download time" is too context specific, probably related =
to
> package management on the target.
>
>> +
>> +      By default, this variable is set to ``1``, resulting in one packa=
ge per
>> +      module. Setting it to any other value will generate a single mono=
lithic
>> +      package containing all kernel modules.
>> +
>>     :term:`KERNEL_SRC`
>>        The location of the kernel sources. This variable is set to the v=
alue
>>        of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-mo=
dule`

Not sure about the "kernel" package name. After building with
KERNEL_SPLIT_MODULES to 0:

$ bitbake-getvar KERNEL_PACKAGE_NAME -r virtual/kernel
#
# $KERNEL_PACKAGE_NAME [2 operations]
#   set /build/../work/openembedded-core/meta/conf/documentation.conf:253
#     [doc] "Name prefix for kernel packages. Defaults to 'kernel'."
#   set /build/../work/openembedded-core/meta/classes-recipe/kernel.bbclass=
:11
#     [_defaultval] "kernel"
# pre-expansion value:
#   "kernel"
KERNEL_PACKAGE_NAME=3D"kernel"

$ oe-pkgdata-util list-pkgs | grep kernel
kernel
kernel-base
kernel-dbg
kernel-dev
kernel-image
kernel-image-image
kernel-modules
kernel-vmlinux

$ oe-pkgdata-util list-pkg-files kernel-modules | head -7
kernel-modules:
        /lib/modules/6.12.30-yocto-standard/kernel/crypto/af_alg.ko
        /lib/modules/6.12.30-yocto-standard/kernel/crypto/algif_aead.ko
        /lib/modules/6.12.30-yocto-standard/kernel/crypto/algif_hash.ko
        /lib/modules/6.12.30-yocto-standard/kernel/crypto/algif_rng.ko
        /lib/modules/6.12.30-yocto-standard/kernel/crypto/algif_skcipher.ko
        /lib/modules/6.12.30-yocto-standard/kernel/crypto/blowfish_common.k=
o
        ...

So it seems to me that the name of the package is "kernel-modules", not
"kernel"?

Another side question: in my experience I never had to set KERNEL_SPLIT_MOD=
ULES
to be able to install *all* kernel modules. Whatever the value of
KERNEL_SPLIT_MODULES, installing the package "kernel-modules" would just in=
stall
the modules. So what is the difference after setting this variable?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


