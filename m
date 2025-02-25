Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D64EC021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 08:46:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.3860.1740473179324633410
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 00:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ad+MePGK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8F33442F6;
	Tue, 25 Feb 2025 08:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740473176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/vcsKP8WJxjMcFN5jSC2rn0xgo8WVPHWY3UmpxSJi9U=;
	b=Ad+MePGKAy7UAU8+Zfn0c4RejWvsHgFz0S7iH/JO7VRukvVjYoDVRLB/+NXymrc1qo6w1T
	EaOTzUKEo9QIFSNyDjvAgTH7cm2xZ3j8tXWBsKC2ntBvV+H7Q/90eYKIJAuGonBye+AUpM
	eGxsiwGngotxjmtdwCARpj2R8kMoCIjqgEHZ7/AW2rX0xa4l+wCSoDRkpXc1laTmnE+tGD
	IMRHq8oqCCOlUqAo9lwEa2rP3LJz1xOJz1FD+ioCIW7vX1RxHEJhobytVeTcLE5v7ufQdP
	oUX6fvJAbzASNZnmlFLR/L4xDW5vOCkfE37gDiaK/stmscWEwXtK6jV6iDmEow==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Feb 2025 09:46:16 +0100
Message-Id: <D81E8Z55ENC4.1SGTDTSD71QW7@bootlin.com>
Subject: Re: [docs] [PATCH v2 1/2] ref-manual: cover UBOOT_ENV variables
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Adrian Freihofer" <adrian.freihofer@gmail.com>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250224082729.3325776-1-adrian.freihofer@siemens.com>
 <D80L3KLEZTJ9.T3ONJF2WKEGK@bootlin.com>
 <ddf80337ae8f7d5d3c8fda38bbc48a68c384be1a.camel@gmail.com>
In-Reply-To: <ddf80337ae8f7d5d3c8fda38bbc48a68c384be1a.camel@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekuddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekhfevvdduleehvdekgeduffdthfekfffgvedthfeiudduleejveehgeeuffetgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 08:46:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6446

Hi Adrian,

On Mon Feb 24, 2025 at 11:14 PM CET, Adrian Freihofer wrote:
> Hi Antonin
>
> I will just send a v3 which fixes all your findings, except this one
> needs clarification:
>
> snip
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 Adding a script ``boot.cmd`` a=
s an uImage to ``/boot``::
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UB=
OOT_ENV =3D "boot"
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UB=
OOT_ENV_SUFFIX =3D "scr"
>>=20
>> Or shouldn't you set UBOOT_ENV_SRC_SUFFIX to "cmd" here too? I'm a
>> little
>> confused as why you refer to boot.cmd yet "cmd" is not defined here.
>
> UBOOT_ENV_SRC_SUFFIX ?=3D "cmd" is the default.

Okay so if I recapitulate, what is happening in your example is:

UBOOT_ENV =3D "boot"
UBOOT_ENV_SUFFIX =3D "scr"
UBOOT_ENV_SRC_SUFFIX =3D "cmd"
SRC_URI +=3D "file://${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"

Which makes sense.

I wasn't sure of the default value for UBOOT_ENV_SRC_SUFFIX, which is why I
suggested setting all the variables in the example to avoid confusion.

> I have spent many hours trying to understand the code that handles the
> UBOOT_ENV* variables. It's super complicated. In uboot.inc, there is:
>
> do_compile () {
> if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" =3D "scr" ]; then
> ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script \
> -d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}
> fi
> }
>
> do_install () {
> if [ -n "${UBOOT_ENV}" ]; then
> install -m 644 ${B}/${UBOOT_ENV_BINARY} \
> ${D}/boot/${UBOOT_ENV_IMAGE}
> fi
> }
>
> Depending on the file ending respectively the UBOOT_ENV_SUFFIX
> variable, something different happens: Either
>  * a script which can be loaded by U-Boot's source command
>    or
>  * an image including a script which can be handled by U-Boot's load
>    command
>    ends up in /boot.
>
> In u-boot-config.bbclass there are more variables defined:
>  * Documented variables:
>    UBOOT_ENV_SUFFIX ?=3D "txt"
>    UBOOT_ENV ?=3D ""
>    UBOOT_ENV_SRC_SUFFIX ?=3D "cmd"
>  * Variables which are considered as internal and hence not documented
>    on purpose:
>    UBOOT_ENV_SRC ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
>    UBOOT_ENV_BINARY ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
>    ...two more...
>
> So my patch tries to keep it as simple as possible but still cover the
> 2 relevant use cases. To make it more clear, I added:
> "It defaults to ``cmd``."
> to the UBOOT_ENV_SRC_SUFFIX section.

Thanks, this will make it clearer too.

>
> I hope this makes it more understandable without a need for dropping
> all these details on the users.

I see your point, yes this code is far from intuitive.

> Note: It was even much more complicated when the kernel-
> fitimage.bbclass was in use as well. The kernel-fitimage.bbclass is now
> decoupled which simplifies (or maybe I should say fixes) it quite a
> bit.
>
>>=20
> snip
>
> Thank you for the review!
> Adrian

Thanks for the efforts!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

