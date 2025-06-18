Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BB6C7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 13:43:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.7755.1750254177708488650
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 06:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VjTfuyBo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC4BE43122;
	Wed, 18 Jun 2025 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750254176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ShMHsYjjityvvVLylupILiUfr9uAix38sfkIPB+uxdw=;
	b=VjTfuyBoIkyZ1dpGtU4peTkUfZFA8wtxMr24xT+UPe+bTjpzbC/3Uggxfj3qLFrc5cEvsN
	7FZ+QV1Fznq/4tMB3ligFg22vvKoHIBgh7I8UvsRnMdli79W16yLiclEh7wr8FEVXMtmM5
	XdGRq3VYwzeWskPIIZ9qqj24wGXsmpAxOM/olwHjxEeD+9KPfFIza9yiokuzN2yJKy6jmw
	Uy/xUYO3MeuPINsTOEaTOQShnTjWmC06nXWHHTEFP2rGiVhb/RMZ+xhXKqG91j5IClwMvP
	r2LdQeoNpATDlYprSMNdbM9Bu1Yd4R+aBgUtj9pbJS+V2sDt/6m5XjWPCWJc2g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 15:42:55 +0200
Message-Id: <DAPPBO0JXU6C.38BKO55VAYW0G@bootlin.com>
Subject: Re: [docs] [PATCH v2] ref-manual: document KERNEL_SPLIT_MODULES
 variable
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dixitparmar19@gmail.com>, <docs@lists.yoctoproject.org>
References: <DAPOERTPGVZQ.1S2ZZBVVMS1N6@bootlin.com>
 <26140.1750252773043231023@lists.yoctoproject.org>
In-Reply-To: <26140.1750252773043231023@lists.yoctoproject.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeekheeiveeltddvgefhvefguddthffhfeehkeeijeeiledtleevtdetjeduffdunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpkhhordhtohdpohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepughigihithhprghrmhgrrhduleesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhoj
 hgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 13:43:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7100

On Wed Jun 18, 2025 at 3:19 PM CEST, Dixit Parmar via lists.yoctoproject.or=
g wrote:
> On Wed, Jun 18, 2025 at 06:30 PM, Antonin Godard wrote:
>
>>=20
>> On Wed Jun 18, 2025 at 2:14 PM CEST, Dixit Parmar via
>> lists.yoctoproject.org wrote:
>>=20
>>> Will fix the ref->term typo and the take your suggestion on rewording.
>>>=20
>>> There seem to be confusion related to the kernel package name, however =
I
>>> feel
>>> it was additional information. I shall remove the mention of the kernel
>>> package name (keep the variable reference only) for simplicity in next
>>> version.
>>=20
>> Looking forward to it!
>>=20
>>=20
>>> Yes, you would be able to install "all" the kernel-modules without
>>> bothering
>>> about KERNEL_SPLIT_MODULES. The issue is having autoload .conf file bei=
ng
>>> installed or not when KERNEL_MODULE_AUTOLOAD is having your modules lis=
ted
>>> to
>>> be autoloader. When KERNEL_SPLIT_MODULES =3D 0 the .conf files for driv=
er
>>> autoload and probeconf is not getting generated.
>>=20
>> This sounds like a bug to me, no? Why would someone expect setting
>> KERNEL_SPLIT_MODULES to 0 have the autoload files missing?
>>=20
>> I ran a some tests. So when I set KERNEL_SPLIT_MODULES to 1, and
>> KERNEL_MODULE_AUTOLOAD to "xt_limit", a kernel-module-xt-limit.ipk packa=
ge
>> is
>> generated like so:
>>=20
>> =E2=94=9C=E2=94=80=E2=94=80 etc
>> =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 modules-load.d
>> =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 xt_limit.conf
>> =E2=94=94=E2=94=80=E2=94=80 lib
>> =E2=94=94=E2=94=80=E2=94=80 modules
>> =E2=94=94=E2=94=80=E2=94=80 6.12.30-yocto-standard
>> =E2=94=94=E2=94=80=E2=94=80 kernel
>> =E2=94=94=E2=94=80=E2=94=80 net
>> =E2=94=94=E2=94=80=E2=94=80 netfilter
>> =E2=94=94=E2=94=80=E2=94=80 xt_limit.ko
>>=20
>> When KERNEL_SPLIT_MODULES is set to 0, only one kernel-modules.ipk packa=
ge
>> is
>> generated, and does _not_ contain xt_limit.conf, but only xt_limit.ko. T=
o
>> me
>> this sounds like a bug, what do you think?
>
> Exactly, that's the issue reported https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D15145 ( https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1=
5145 ) and I am fixing it here with this solution https://lists.openembedde=
d.org/g/openembedded-core/message/218290.
>
>>=20
>> I would _not_ describe that behavior in the documentation for the
>> KERNEL_SPLIT_MODULES variables.
>
> True, that's why the documentation does not mention anything about the co=
nf files.
>
>>=20
>> The fact that "kernel-modules" is still available when
>> KERNEL_SPLIT_MODULES =3D 1
>> is simply because a "fake" kernel-modules.ipk package is generated, and
>> depends
>> on the other kernel-module-* packages - so you can ignore my remark in m=
y
>> previous message.
>
> Which remark exactly??

About the possibility to install "kernel-modules" both when KERNEL_SPLIT_MO=
DULES
is 0 or 1. I guess it doesn't hurt to add a note about that at the end of t=
he
definition:

"""
.. note::

   If :term:`KERNEL_SPLIT_MODULES` is set to 0, it is still possible to ins=
tall
   all kernel modules at once by adding ``kernel-modules`` to
   :term:`IMAGE_INSTALL`. The way it works is that a placeholder
   "kernel-modules" package will be created and will depend on every other
   individual kernel module packages.
"""

So there's no confusion. What do you think?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


