Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CD7C83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 12:02:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10904.1753185754307235121
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Jul 2025 05:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bsP6AxMJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3D3343B0B;
	Tue, 22 Jul 2025 12:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753185752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dcl6jSBUiWZWA6Jo1I9sa2jxNOy5Fi4CCOgOnpbYxsg=;
	b=bsP6AxMJOQT9iYutV5lM5FDhFrL9/Hf7xNupkpO9N+DGC/86xkVP3BxR+i8e2M0iwmCKJU
	ttSKE6UG9F9rGX6yLh+O/YG2rwaIovlQIsh1ZiyvtdB50HdBqfCamf0Tz6g9DtNF4fZeLY
	qo16nrGwrZLzSeiCgTj7pNqU0zd4m+WHaNpw9Cpefe3c1O3haPmeFNUAcSMnlk2tGMMe2q
	gsvYP5xSFH6xc6HzvxVVhAAHViubdUcoh17DprDrLvJ8TYWMTFl2whA7AgPIKDCEIc0TXy
	PMcEXiEC78xrk/k2rNukn3Y5Po8QR0TU2PHqq2xHn4VLg5Af2bhA6AeTbrW+Sw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Jul 2025 14:02:30 +0200
Message-Id: <DBIKHB3YIO0O.2RQ2BRNX8ESYF@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: document new toolchain classes and
 variables
Cc: "Khem Raj" <raj.khem@gmail.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20250718-new-toolchain-variables-v1-1-28c6b7054f73@bootlin.com>
 <067e7f70-651f-4c71-ace8-1add64d90144@cherry.de>
 <DBF991RS2X9V.243VRULH3AE9K@bootlin.com>
 <827a03ee-26f4-4978-bebc-0b69a4eecf6d@cherry.de>
In-Reply-To: <827a03ee-26f4-4978-bebc-0b69a4eecf6d@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejgeekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfekieeufeeiveekkeevjeetveelkeejiefgfeeihfeghfeghfduvdejuddvvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjv
 ggtthdrohhrghdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Jul 2025 12:02:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7361

On Fri Jul 18, 2025 at 4:50 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 7/18/25 4:36 PM, Antonin Godard wrote:
>> On Fri Jul 18, 2025 at 4:22 PM CEST, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 7/18/25 10:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
> [...]
>>> Should this be set globally in a conf file (distro I assume?)? Can this
>>> be overridden from a recipe if requested (e.g. recipes which can only b=
e
>>> built with gcc or clang?). I see you document how to do this in the
>>> variable glossary, do you think it makes sense to duplicate the info in
>>> the class as well? I typically dislike doing this but I was wondering
>>> while reading the diff and got the info because it's in the same patch,
>>> maybe users won't think of this? /me shrugs
>>=20
>> You're right I should probably duplicate here to avoid confusion. Basica=
lly:
>>=20
>> - Set PREFERRED_TOOLCHAIN_{SDK,TARGET,NATIVE} from distro conf
>> or
>> - Set TOOLCHAIN from recipe (overrides the distro setting)
>>=20
>> Is my understanding and is what Khem told me on IRC.
>>=20
>
> Makes sense to me :)
>
>> Right now, setting PREFERRED_TOOLCHAIN_{SDK,NATIVE} to clang fails for m=
e, even
>> though I believe it should be supported in the future which is why I hav=
en't
>> mentioned it here.
>>=20
>
> I've seen some patches from Khem today related to libcxx and clang,=20
> maybe that would help. Maybe you can give a bit more info here than "it=
=20
> fails for me" so Khem/anyone may be able to help?

I did not dig much into it knowing the implementation is WIP, so I'll build=
ing
again with the recent changes around that.

>>>> +:term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE=
` or
>>>> +:term:`PREFERRED_TOOLCHAIN_SDK` variables to "clang". This will make =
the
>>>> +:ref:`ref-classes-base` class use the :ref:`ref-classes-toolchain-cla=
ng`
>>>> +accordingly.
>>>> +
>>>
>>> No toolchain/clang-native documented here?
>>=20
>> Good question, but there is none actually, only gcc-native. Perhaps rela=
ted to
>> what I mentioned above or something is missing in OE-Core.
>>=20
>
> Isn't there?
>
> $ git show-ref HEAD
> f209f127e654df7424adf41de07f88714d7952ab refs/remotes/origin/HEAD
>
> $ ls -l meta/classes/toolchain/clang-native.bbclass
> -rw-r--r--. 1 qschulz qschulz 789 Jul 15 14:28=20
> meta/classes/toolchain/clang-native.bbclass
>
> Triple check you pulled OE-Core recently and/or you don't have a dirty re=
po?

Yeah, my bad, my repository was slightly updated and I missed that.

> [...]
>>>> +Exception be made in target recipes that need to use the compiler fro=
m the build
>>>
>>> Not native but I would have done s/in/of/ here.
>>=20
>> Actually should be "for". that same phrasing is used in the description =
of
>> BUILD_CC, and was suggested by you IIRC :)
>>=20
>
> Oh well, the joy of trusting your intuition and not being native,=20
> there's sometimes different outcomes when I'm not too sure :D
>
>>>> +host at some point during the build.
>>>> +
>>>> +This class should not be inherited directly. It is inherited by the
>>>> +:ref:`ref-classes-base` class by default.
>>>
>>> Only when PREFERRED_TOOLCHAIN_NATIVE or TOOLCHAIN_NATIVE is set to gcc?
>>> Which is the default yes, but could be changed if a recipe/conf file
>>> changes that value?
>>=20
>> Nope, this one is unconditionally inherited. Again, a bit strange, maybe=
 an
>> error, maybe voluntary (hoping to gets comments here from Khem / Richard=
 :)).
>>=20
>
> This seems fine now?
>
> meta/classes-global/base.bbclass
>
> has
>
> inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
> inherit_defer toolchain/${TOOLCHAIN}
>
>>>> +
>>>>    .. _ref-classes-typecheck:
>>>>   =20
>>>>    ``typecheck``
>>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst
>>>> index d079e4b59..2bad5cda0 100644
>>>> --- a/documentation/ref-manual/variables.rst
>>>> +++ b/documentation/ref-manual/variables.rst
>>>> @@ -7331,6 +7331,51 @@ system and gives an overview of their function =
and contents.
>>>>          ":ref:`dev-manual/new-recipe:using virtual providers`" sectio=
n in the
>>>>          Yocto Project Development Tasks Manual.
>>>>   =20
>>>> +   :term:`PREFERRED_TOOLCHAIN`
>>>> +      The :term:`PREFERRED_TOOLCHAIN` variable selects the toolchain =
to use for
>>>> +      cross-compiling recipes. This variable is not meant to be overi=
dden
>>>
>>> s/overidden/overridden/
>>=20
>> Gah, always this one - thanks.
>>=20
>
> If you use vim/nvim for writing this, you can use :set spell=20
> spelllang=3Den_us for example :)

I do have spelllang enabled though, just missed that :/

> [...]
>>>> +      globally. Instead, the values of :term:`PREFERRED_TOOLCHAIN_TAR=
GET`,
>>>> +      :term:`PREFERRED_TOOLCHAIN_NATIVE` and :term:`PREFERRED_TOOLCHA=
IN_SDK`
>>>> +      should be overridden independently.
>>>> +
>>>
>>> Not sure what you wanted to convey with "independently" here?
>>=20
>> Yeah maybe bad/useless word here, I just wanted to say that these three =
should
>> be set, not PREFERRED_TOOLCHAIN directly.
>>=20
>
> "instead" would be enough I believe, and that's how you start your=20
> sentence so I would just remove "independently"?

Agreed

> [...]
>
>>> Missing a :term:`TOOLCHAIN_NATIVE` entry here (actually probably a few
>>> more lines below) maybe as well?
>>=20
>> I can't find any reference to that variable anywhere across OE-Core, not=
 sure it
>> exists?
>>=20
>
> Added a week ago via ef31bc3074fa in poky, so I think your OE-Core/poky=
=20
> master branch is a bit behind :)

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


