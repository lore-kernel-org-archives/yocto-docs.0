Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432B1C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 10:33:38 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.19001.1742985211307177456
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 03:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IeuXEqLK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14E1744360;
	Wed, 26 Mar 2025 10:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742985209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmUHX8mjLg4IcSaB338/WgYGOUE3I+Z7gRRaxeZGcoY=;
	b=IeuXEqLKs13rhUF9QqcS7a0+g2xIq8Jt2AvVQLFCxLOn3kFZKBh65hKXz3qtftQ7OWcKmw
	omUCs3l9MH+wjjpyFilUzdzQvTiIRw3jvlo56CV0a79SpizMOJt8EwyCgBzxGRzCmjH0pz
	nQEzvt1XQjxMr3a9a6vxcP3VT0MXBu3xojLc3zg21Ad/nPi1sgTKZo3lajd5MLKXD0DUlA
	FFGHVEc1QbREdcB6ve1PbGF0lcloYjDMSNyzQ4Txk7hnTObDcd0eTfCth2F2s17w+8RY9O
	EM3HFCr3a/41zveGhl/ZfY5Z9CuKSi2GwYIQMBNzUPX5KV8aB38NDYKxFocelw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Mar 2025 11:33:28 +0100
Message-Id: <D8Q4OUK00NOF.2X7V7MVYQZZTH@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Antonin Godard"
 <antonin.godard@bootlin.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/4] ref-manual/variables.rst: add missing
 documentation for BUILD_* variables
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-42-g7f7db0373f6c
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
 <20250317-cc-vars-v1-1-25edbadfd054@bootlin.com>
 <29a6499d-22ca-44e2-bbda-2148ca6ba8b4@cherry.de>
 <D8Q32WJD5YSK.2036RNP79DLND@bootlin.com>
 <49b57527-5458-45ba-9e3c-524b435e20f5@cherry.de>
In-Reply-To: <49b57527-5458-45ba-9e3c-524b435e20f5@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhveehhefhgeejkeegudeuiefgudeuuddvtdevvdejtdefveeiudeihfehgfdvkeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhot
 hhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 10:33:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6632

Hi Quentin,

On Wed Mar 26, 2025 at 10:49 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 3/26/25 10:17 AM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Fri Mar 21, 2025 at 5:22 PM CET, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 3/17/25 5:03 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>>> These toolchain variables are used in a native context. Some of the
>>>> BUILD_* variables missed documentation. Also, some of the base command=
s
>>>> were also not there so document them (FC and READELF).
>>>>
>>>> Some of existing BUILD_* variable documentation were missing the note
>>>> about their usage in a native context, so add it too so that all BUILD=
_*
>>>> variables are documented the same way.
>>>>
>>>> [YOCTO #15719]
>>>>
>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>> ---
>>>>    documentation/ref-manual/variables.rst | 107 ++++++++++++++++++++++=
+++
>>>>    1 file changed, 107 insertions(+)
>>>>
>>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst
>>>> index 861b04eaa..24b3f7db9 100644
>>>> --- a/documentation/ref-manual/variables.rst
>>>> +++ b/documentation/ref-manual/variables.rst
>>>> @@ -985,6 +985,24 @@ system and gives an overview of their function an=
d contents.
>>>>          variable is a useful pointer in case a bug in the software be=
ing
>>>>          built needs to be manually reported.
>>>>   =20
>>>> +   :term:`BUILD_AR`
>>>> +      Specifies the architecture-specific archiver for the build host=
,
>>>> +      derived in part from :term:`BUILD_PREFIX`::
>>>> +
>>>> +         BUILD_AR =3D "${BUILD_PREFIX}ar"
>>>> +
>>>> +      When building in the ``-native`` context, :term:`AR` is set to =
the value
>>>> +      of this variable by default.
>>>> +
>>>
>>> It's not entirely clear to me from the text, but I believe we should
>>> only be consumer of this variable? Or the toolchain recipe/bbclass need=
s
>>> to set it accordingly, but otherwise nobody should *modify* it, right?
>>=20
>> Actually, users shouldn't even use this variable directly but only AR (s=
ee
>> the explanation below).
>>=20
>
> Then we should make this very clear in the documentation for the=20
> variable. Essentially "treat this as a read-only variable except if=20
> you're adding support for a new toolchain" or something like this.

I've found the following wording:

"""
When building a :ref:`ref-classes-native` recipe, :term:`AR` is set to the
value of this variable by default, so there is no need to use
:term:`BUILD_AR` directly.
"""

"No need" is less strict than "never", because there might be some niche ca=
ses
where you would use that. What do you think?

Take meta/recipes-devtools/meson/meson_1.7.0.bb: it uses it in
install_templates() which is called from do_install:append:class-nativesdk(=
), so
here since we know we will always run in a native context, we can use BUILD=
_*
variables. Although I would assume using regular AR, STRIP, etc. would work=
 as
well.

[...]
>>>
>>> A user question: Should we use BUILD_AR directly? or always AR?
>>=20
>> Always AR, to my understanding. The native class takes care of setting A=
R to the
>> value of BUILD_AR. In your recipe, you can use the AR variable to do you=
r
>> things, and its value will change on whether you're building the native =
recipe
>> or not.
>>=20
>> You would only redefine BUILD_* variables if you were to add
>> a new toolchain, basically. See toolchain/build-gcc.inc in OE-Core, for =
an
>> example.
>>=20
>
> I think we should make this very clear. Essentially:
>
> """
> This is only relevant when adding support for a new toolchain. Users are=
=20
> strongly encouraged to use :term:`AR` when wanting to use the archiver=20
> in recipes.
> """
>
> or something along those lines?

See the wording I proposed above (which I will propagate to every BUILD_*
definitions).

> (same remark for all other BUILD_ variables).
>
>>>> +      Specifies the architecture-specific assembler for the build hos=
t,
>>>> +      derived in part from from :term:`BUILD_PREFIX`::
>>>> +
>>>> +         BUILD_AS =3D "${BUILD_PREFIX}ar"
>>>> +
>>>> +      When building in the ``-native`` context, :term:`AS` is set to =
the value
>>>> +      of this variable by default.
>>>> +
>>>>       :term:`BUILD_ARCH`
>>>>          Specifies the architecture of the build host (e.g. ``i686``).=
 The
>>>>          OpenEmbedded build system sets the value of :term:`BUILD_ARCH=
` from the
>>>> @@ -994,6 +1012,15 @@ system and gives an overview of their function a=
nd contents.
>>>>          Specifies the architecture-specific assembler flags for the b=
uild
>>>>          host. By default, the value of :term:`BUILD_AS_ARCH` is empty=
.
>>>>   =20
>>>> +   :term:`BUILD_CC`
>>>> +      Specifies the architecture-specific C compiler for the build ho=
st,
>>>> +      derived in part from :term:`BUILD_PREFIX` and :term:`BUILD_CC_A=
RCH`::
>>>> +
>>>> +         BUILD_CC =3D "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
>>>> +
>>>
>>> This seems very gcc-specific but I cannot see the same thing for clang,
>>> so I guess it's fine?
>>=20
>> I will mention that this is the default value. Indeed if you were to use=
 clang,
>> the definition would be different from this one. I think there will be
>> evolutions on that in the future, because the toolchain/ directory was m=
ade
>> to prepare the ground for supporting clang (I think).
>>=20
>
> This is actually not the default. It's set by the gcc toolchain, which I=
=20
> assume is the default (and only?) toolchain.

For now, yes, I think it is the only one.

So, saying that this value is the default is not wrong since bitbake.conf d=
oes:

require toolchain/gcc.inc
require toolchain/build-gcc.inc

?

> I assume we want to state that you should not modify this variable,=20
> except if you are adding support for a new toolchain, but you can use it=
=20
> wherever the CC (for native recipes) or HOSTCC (for target recipes)=20
> variables are expected to be set?

I feel like there should even be a separate guide/section to explain how to=
 add
support for a new toolchain at some point? (how common of a task would that=
 be,
though?)

I'm not sure we should in length on adding a new toolchain in the BUILD_*
variable definitions.

But let's see if we can agree on a wording that I'll propagate to every BUI=
LD_*
variable. :)

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

