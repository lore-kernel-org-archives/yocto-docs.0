Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0906C36010
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 09:17:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.18080.1742980670278938707
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 02:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zcnwu0Kf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85CD142D46;
	Wed, 26 Mar 2025 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742980667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wS8D5yRIuUuGOXwxgrp7TqiSw4P/Z/N42tI9FJeZ8p0=;
	b=Zcnwu0KfEYMk0ndHL5olvu8UXOvyV/FO8kKMDxiN3Tg7LAcH2LlatlkURfwt7aQX1R4RLn
	E0/XAspFcpZxGwo13iyX7IITRPKg3+jnWGeqjVE55vFgifz94OAKzdJAgtvvA4dHnCp8rd
	nDRiMPOnTkNPzfuA2n3T9iK5fFBaQXVdcmxeb3Hl5FOvNTPgewWrZ41YfujzGDR0T9hWAK
	Bbhl+bL5sRE/zHGMNJK0xTolRg13yRpSNcioQ+lOgG0FAgiwqi7DnRprm6FKrdI7bPRrDD
	Q/+MG3YxyLw2B5d9ge7WzNBljY8+CKjJte83No1oEv8rLea1PYceHG1VnMk6Xw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Mar 2025 10:17:47 +0100
Message-Id: <D8Q32WJD5YSK.2036RNP79DLND@bootlin.com>
Subject: Re: [docs] [PATCH 1/4] ref-manual/variables.rst: add missing
 documentation for BUILD_* variables
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <antonin.godard@bootlin.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-42-g7f7db0373f6c
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
 <20250317-cc-vars-v1-1-25edbadfd054@bootlin.com>
 <29a6499d-22ca-44e2-bbda-2148ca6ba8b4@cherry.de>
In-Reply-To: <29a6499d-22ca-44e2-bbda-2148ca6ba8b4@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehvdeuteegkeetgfejtdfhfffhjeduhfetudegffdvteejheffieetudfhheffkeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhot
 hhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 09:17:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6630

Hi Quentin,

On Fri Mar 21, 2025 at 5:22 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 3/17/25 5:03 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> These toolchain variables are used in a native context. Some of the
>> BUILD_* variables missed documentation. Also, some of the base commands
>> were also not there so document them (FC and READELF).
>>=20
>> Some of existing BUILD_* variable documentation were missing the note
>> about their usage in a native context, so add it too so that all BUILD_*
>> variables are documented the same way.
>>=20
>> [YOCTO #15719]
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/variables.rst | 107 +++++++++++++++++++++++++
>>   1 file changed, 107 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index 861b04eaa..24b3f7db9 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -985,6 +985,24 @@ system and gives an overview of their function and =
contents.
>>         variable is a useful pointer in case a bug in the software being
>>         built needs to be manually reported.
>>  =20
>> +   :term:`BUILD_AR`
>> +      Specifies the architecture-specific archiver for the build host,
>> +      derived in part from :term:`BUILD_PREFIX`::
>> +
>> +         BUILD_AR =3D "${BUILD_PREFIX}ar"
>> +
>> +      When building in the ``-native`` context, :term:`AR` is set to th=
e value
>> +      of this variable by default.
>> +
>
> It's not entirely clear to me from the text, but I believe we should=20
> only be consumer of this variable? Or the toolchain recipe/bbclass needs=
=20
> to set it accordingly, but otherwise nobody should *modify* it, right?

Actually, users shouldn't even use this variable directly but only AR (see
the explanation below).

> I don't know what an archiver is, would there be a link we could provide=
=20
> to give hints to people maybe?
>
> Can suggest:
>
> """
> When building a native recipe, :term:`AR` ...
> """
>
> I would love to add a link to what a native recipe is but my grep-fu=20
> failed me today and couldn't find anything satisfying, do you have a=20
> suggestion maybe?

:ref:`ref-classes-native`?

>
> A user question: Should we use BUILD_AR directly? or always AR?

Always AR, to my understanding. The native class takes care of setting AR t=
o the
value of BUILD_AR. In your recipe, you can use the AR variable to do your
things, and its value will change on whether you're building the native rec=
ipe
or not.

You would only redefine BUILD_* variables if you were to add
a new toolchain, basically. See toolchain/build-gcc.inc in OE-Core, for an
example.

> s/build host/:term:`Build Host`/ ?

Yes, thanks.

> Same remarks for other BUILD_ addition in this patch.
>
>> +   :term:`BUILD_AS`
>
> This is not alphabetically ordered though, since the next one is=20
> BUILD_ARCH, which should be before BUILD_AS.

Well spotted, thank you!

>> +      Specifies the architecture-specific assembler for the build host,
>> +      derived in part from from :term:`BUILD_PREFIX`::
>> +
>> +         BUILD_AS =3D "${BUILD_PREFIX}ar"
>> +
>> +      When building in the ``-native`` context, :term:`AS` is set to th=
e value
>> +      of this variable by default.
>> +
>>      :term:`BUILD_ARCH`
>>         Specifies the architecture of the build host (e.g. ``i686``). Th=
e
>>         OpenEmbedded build system sets the value of :term:`BUILD_ARCH` f=
rom the
>> @@ -994,6 +1012,15 @@ system and gives an overview of their function and=
 contents.
>>         Specifies the architecture-specific assembler flags for the buil=
d
>>         host. By default, the value of :term:`BUILD_AS_ARCH` is empty.
>>  =20
>> +   :term:`BUILD_CC`
>> +      Specifies the architecture-specific C compiler for the build host=
,
>> +      derived in part from :term:`BUILD_PREFIX` and :term:`BUILD_CC_ARC=
H`::
>> +
>> +         BUILD_CC =3D "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
>> +
>
> This seems very gcc-specific but I cannot see the same thing for clang,=
=20
> so I guess it's fine?

I will mention that this is the default value. Indeed if you were to use cl=
ang,
the definition would be different from this one. I think there will be
evolutions on that in the future, because the toolchain/ directory was made
to prepare the ground for supporting clang (I think).

> [...]
>
>>      :term:`BUILD_STRIP`
>>         Specifies the command to be used to strip debugging symbols from
>>         binaries produced for the build host. By default, :term:`BUILD_S=
TRIP`
>>         points to
>>         ``${``\ :term:`BUILD_PREFIX`\ ``}strip``.
>>  =20
>
> thought: maybe have consistency with the way you expose the default=20
> value of the variable for the variables added in this patch?
>
> e.g.
>
> """
> derived in part from :term:`BUILD_PREFIX`::
>
>           BUILD_STRIP =3D "${BUILD_PREFIX}strip"
> """

Yes, I was aiming at that, but missed this one - thanks!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

