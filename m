Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E26C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 13:08:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.18358.1738328874884668956
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 05:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o4mY1/Pg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92DF043396;
	Fri, 31 Jan 2025 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738328873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M5wZTd+kviEePjIbrlmZREO9rTc0a2kjZq0VPpqkKwU=;
	b=o4mY1/Pgz46GKQEET/x/Dyq6AF3X55C4WO6NakTo9A7nIfEtRwwIU7X+ExQM+l2RaQTJWB
	28IMNgV7poioNN8U4o6KzClHlOOlBCcUc7GMjcJjNLR7IWbJPNbLA2BOYfM9PgJwDYbwMb
	uiJxA7in3Ybiv682whqv8ntqosTa/pjH0sut23y38kHQLzrjo8BLuoNz3TlrzzeqNF+2F6
	Eik3AZB3JG++dOXkoMuDSkMAI/qzEcnORCjYzqUuxmcCwJp+bp5yrMqlq3OtvW2+8m++u8
	Lu0GV6fmdpZ26qHzXBK8g33PuKIv+h5mZYccvAQak4Q99tUmEWIpAWAoAn4/vA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jan 2025 14:07:52 +0100
Message-Id: <D7GA5NFGNWXK.22TNU3A37YW4I@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [yocto-docs][PATCH v2 2/2] migration-5.2: add virtual
 provider change
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250131-migration-5-2-updates-v2-0-4ce688a74bfd@bootlin.com>
 <20250131-migration-5-2-updates-v2-2-4ce688a74bfd@bootlin.com>
 <ef83770e-6502-4f74-8ae4-89954666780b@cherry.de>
In-Reply-To: <ef83770e-6502-4f74-8ae4-89954666780b@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetteeiudethfettdejfeeugeekheehvefgtedutdduudehfffftedufefhuddtueenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjv
 ggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 13:08:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6231

Hi Quentin,

On Fri Jan 31, 2025 at 1:18 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 1/31/25 12:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> The commit 4ccc3bc8266c ("classes/recipes: Switch virtual/XXX-gcc to
>> virtual/cross-cc (and c++/binutils)") in OE-Core changes the
>> virtual/XXX-gcc to virtual/cross-cc (and c++/binutils) syntax. Add it to
>> the migration manual.
>>=20
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/migration-guides/migration-5.2.rst | 29 ++++++++++++++++=
++++++++
>>   1 file changed, 29 insertions(+)
>>=20
>> diff --git a/documentation/migration-guides/migration-5.2.rst b/document=
ation/migration-guides/migration-5.2.rst
>> index a60e3e9a8..b29cb2052 100644
>> --- a/documentation/migration-guides/migration-5.2.rst
>> +++ b/documentation/migration-guides/migration-5.2.rst
>> @@ -105,6 +105,35 @@ some obscure bugs.
>>   Any logic based on ``BB_CURRENT_MC`` equalling to ``default`` by defau=
lt should
>>   be changed to be equal to an empty string.
>>  =20
>> +Virtual toolchain provider changes
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +Support was added for virtual providers on a per-recipe basis for speci=
fic
>> +key toolchain providers listed in ``BB_VIRTUAL_RECIPE_PROVIDERS``. As p=
art of
>> +that support, the ``cross`` providers were simplified to remove the tri=
plet
>> +prefix (:term:`TARGET_PREFIX`, :term:`SDK_PREFIX` and :term:`HOST_PREFI=
X`) and
>> +generalise the naming. Here are example of how references to these vari=
ables
>> +should be changed to use the new ``cross`` syntax::
>> +
>> +   virtual/${HOST_PREFIX}binutils -> virtual/cross-binutils
>> +   virtual/${TARGET_PREFIX}binutils -> virtual/cross-binutils
>> +
>> +   virtual/${HOST_PREFIX}gcc -> virtual/cross-cc
>> +   virtual/${TARGET_PREFIX}gcc -> virtual/cross-cc
>> +   virtual/${SDK_PREFIX}gcc -> virtual/nativesdk-cross-cc
>> +
>> +   virtual/${HOST_PREFIX}compilerlibs -> virtual/compilerlibs
>> +   virtual/${TARGET_PREFIX}compilerlibs -> virtual/compilerlibs
>> +   virtual/nativesdk-${SDK_PREFIX}compilerlibs -> virtual/nativesdk-com=
pilerlibs
>> +
>> +   virtual/${TARGET_PREFIX}g++ -> virtual/cross-c++
>> +
>
> I am not sure this rule applies everywhere looking at the commit that=20
> makes the change? (see below for related comment)
>
>> +A :term:`PREFERRED_PROVIDER` assignment should be transformed as follow=
s::
>> +
>> +   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils -> PREFERRED_PRO=
VIDER_virtual/cross-binutils
>> +   PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils -> PREFERRED_PROVID=
ER_virtual/cross-binutils:class-nativesdk
>> +   PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ -> PREFERRED_PROVIDER_vi=
rtual/nativesdk-cross-c++
>> +
>
> I believe all PREFERRED_PROVIDER would replace TARGET_PREFIX with cross-=
=20
> (and rename gcc to cc, g++ to c++).
>
> SDK_PREFIX would be replace following the same pattern as TARGET_PREFIX=
=20
> except that an override with :class-nativesdk should be provided. Though=
=20
> it seems there's now a second variable for each PREFERRED_PROVIDER which=
=20
> had an SDK_PREFIX, it'll also need nativesdk- prefix added to the same=20
> pattern used for TARGET_PREFIX. Except for compilerlibs which only gets=
=20
> the one with the nativesdk- prefix.
>
> c.f. from 90e0a0f7f4536e1aeb311ab2b061be71b4129e4e in poky:
>
> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}binutils ?=3D=20
> "binutils-crosssdk-${SDK_SYS}"
> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}gcc =3D "gcc-crosssdk-${SDK_SYS}=
"
> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ =3D "gcc-crosssdk-${SDK_SYS}=
"
> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs =3D=20
> "nativesdk-gcc-runtime"
> +PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?=3D=20
> "binutils-crosssdk-${SDK_SYS}"
> +PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk =3D=20
> "gcc-crosssdk-${SDK_SYS}"
> +PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk =3D=20
> "gcc-crosssdk-${SDK_SYS}"
> +
> +PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D=20
> "binutils-crosssdk-${SDK_SYS}"
> +PREFERRED_PROVIDER_virtual/nativesdk-cross-cc =3D "gcc-crosssdk-${SDK_SY=
S}"
> +PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ =3D "gcc-crosssdk-${SDK_S=
YS}"
> +PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs =3D "nativesdk-gcc-run=
time"
>
> Now looking a bit more into the changes made in this commit, there isn't=
=20
> a simple search and replace that can be used, sometimes it's replacing a=
=20
> variable with one value, sometimes with another. Depends on the recipe=20
> the change is made in I guess?

I guess so. It's probably going to be different based on the recipe, but I
wouldn't know how to phrase it here. I just gave some more examples to
illustrate the changes. Any idea on a better way to explain this?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

