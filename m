Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7595C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 14:36:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.271.1752849394071789822
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Jul 2025 07:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mURM8Rvb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9336441CA;
	Fri, 18 Jul 2025 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752849392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFj1laMdWinJZDvOnTD2hXZT1QqQG/yY7rTfmOLJRzk=;
	b=mURM8RvbjVOaR7dGJHBGYAaD/ETKBAQii7v0/4M3LKgkozTOOY6/MPoiikucJUF9Cie3UZ
	ZKzisKiJ/g1BB5m94k0XmfbNQ3AUz66WTb3ju/ahiE/J3hSIwzoa/ciKy00xhFVBZXBrZg
	v4a+SBlm1R4XgeSuNk3qFk4eFbQHzJoungXNC8m+qrgpH8x80iFqG5CpQIYsCPwCD6kEwI
	zcWBj5JN5iUOgOrx+VgUYnwbUra3fXtXlqULYE7irFITbuiFn5OCZVXLJqeVbrkYnbtYf2
	Tf1H62BBksUB1hdKrL4nj1c13VVWYlMUrN/pjaQu3Kxsw7WtcqTs8x6WueGhJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Jul 2025 16:36:31 +0200
Message-Id: <DBF991RS2X9V.243VRULH3AE9K@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: document new toolchain classes and
 variables
Cc: "Khem Raj" <raj.khem@gmail.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
References: <20250718-new-toolchain-variables-v1-1-28c6b7054f73@bootlin.com>
 <067e7f70-651f-4c71-ace8-1add64d90144@cherry.de>
In-Reply-To: <067e7f70-651f-4c71-ace8-1add64d90144@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeifeejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffhvffuvehfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgiefhgeegjedtleehleejvedtffehjeefieevfffhuedvhfeukeeutdduffdvieenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhgnhhurdhorhhgpdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguo
 hgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Jul 2025 14:36:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7352

On Fri Jul 18, 2025 at 4:22 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 7/18/25 10:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Document the new classes under classes/toolchain as well as
>> PREFERRED_TOOLCHAIN* and TOOLCHAIN variables, which allow selecting the
>> toolchain. For now there's "gcc" and "clang" as available toolchain.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/classes.rst   | 43 ++++++++++++++++++++++++
>>   documentation/ref-manual/variables.rst | 60 ++++++++++++++++++++++++++=
++++++++
>>   2 files changed, 103 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-ma=
nual/classes.rst
>> index 4705ca3f4..14f14b742 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -3443,6 +3443,49 @@ This class is not intended to be used directly.
>>   The :ref:`ref-classes-toolchain-scripts` class provides the scripts us=
ed for setting up
>>   the environment for installed SDKs.
>>  =20
>> +.. _ref-classes-toolchain-clang:
>> +
>> +``toolchain/clang``
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The :ref:`ref-classes-toolchain-clang` class defines commands for build=
ing
>> +recipes with Clang and LLVM compiler and utilities. This class is not m=
eant to
>> +be used directly in recipes. Instead, you should specific the
>
> s/specific/set/

Thanks for catching this

> Should this be set globally in a conf file (distro I assume?)? Can this=
=20
> be overridden from a recipe if requested (e.g. recipes which can only be=
=20
> built with gcc or clang?). I see you document how to do this in the=20
> variable glossary, do you think it makes sense to duplicate the info in=
=20
> the class as well? I typically dislike doing this but I was wondering=20
> while reading the diff and got the info because it's in the same patch,=
=20
> maybe users won't think of this? /me shrugs

You're right I should probably duplicate here to avoid confusion. Basically=
:

- Set PREFERRED_TOOLCHAIN_{SDK,TARGET,NATIVE} from distro conf
or
- Set TOOLCHAIN from recipe (overrides the distro setting)

Is my understanding and is what Khem told me on IRC.

Right now, setting PREFERRED_TOOLCHAIN_{SDK,NATIVE} to clang fails for me, =
even
though I believe it should be supported in the future which is why I haven'=
t
mentioned it here.

>> +:term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE` =
or
>> +:term:`PREFERRED_TOOLCHAIN_SDK` variables to "clang". This will make th=
e
>> +:ref:`ref-classes-base` class use the :ref:`ref-classes-toolchain-clang=
`
>> +accordingly.
>> +
>
> No toolchain/clang-native documented here?

Good question, but there is none actually, only gcc-native. Perhaps related=
 to
what I mentioned above or something is missing in OE-Core.

>> +.. _ref-classes-toolchain-gcc:
>> +
>> +``toolchain/gcc``
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The :ref:`ref-classes-toolchain-gcc` class defines commands for buildin=
g
>> +recipes with Gcc/binutils compiler and utilities. This class is not mea=
nt to
>> +be used directly in recipes. Instead, you should specific the
>
> s/specific/set/
>
>> +:term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE` =
or
>> +:term:`PREFERRED_TOOLCHAIN_SDK` variables to "gcc". This will make the
>> +:ref:`ref-classes-base` class use the :ref:`ref-classes-toolchain-gcc`
>> +accordingly.
>> +
>> +.. _ref-classes-toolchain-gcc-native:
>> +
>> +``toolchain/gcc-native``
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> +
>> +The :ref:`ref-classes-toolchain-gcc-native` class defines commands for =
building
>> +:ref:`ref-classes-native` recipes with Gcc/binutils compiler and utilit=
ies
>
> s/Gcc/GCC/
>
> c.f. https://gcc.gnu.org/
>
>> +independently of the build context.
>> +
>> +The :ref:`ref-classes-toolchain-gcc-native` class defines :term:`BUILD_=
CC`,
>> +:term:`BUILD_CXX` and other such variables, which are rarely used in re=
cipes.
>
> Odd comma there, I would remove it.

Yep, agreed

>> +Exception be made in target recipes that need to use the compiler from =
the build
>
> Not native but I would have done s/in/of/ here.

Actually should be "for". that same phrasing is used in the description of
BUILD_CC, and was suggested by you IIRC :)

>> +host at some point during the build.
>> +
>> +This class should not be inherited directly. It is inherited by the
>> +:ref:`ref-classes-base` class by default.
>
> Only when PREFERRED_TOOLCHAIN_NATIVE or TOOLCHAIN_NATIVE is set to gcc?=
=20
> Which is the default yes, but could be changed if a recipe/conf file=20
> changes that value?

Nope, this one is unconditionally inherited. Again, a bit strange, maybe an
error, maybe voluntary (hoping to gets comments here from Khem / Richard :)=
).

>> +
>>   .. _ref-classes-typecheck:
>>  =20
>>   ``typecheck``
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index d079e4b59..2bad5cda0 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -7331,6 +7331,51 @@ system and gives an overview of their function an=
d contents.
>>         ":ref:`dev-manual/new-recipe:using virtual providers`" section i=
n the
>>         Yocto Project Development Tasks Manual.
>>  =20
>> +   :term:`PREFERRED_TOOLCHAIN`
>> +      The :term:`PREFERRED_TOOLCHAIN` variable selects the toolchain to=
 use for
>> +      cross-compiling recipes. This variable is not meant to be overidd=
en
>
> s/overidden/overridden/

Gah, always this one - thanks.

> Are you sure it's only for cross-compiling recipes?=20
> PREFERRED_TOOLCHAIN:class-native exists in=20
> meta/classes-global/base.bbclass and it's not for cross-compiling?

True, you're right, in a native context it's not cross-compiling. Thanks!

>> +      globally. Instead, the values of :term:`PREFERRED_TOOLCHAIN_TARGE=
T`,
>> +      :term:`PREFERRED_TOOLCHAIN_NATIVE` and :term:`PREFERRED_TOOLCHAIN=
_SDK`
>> +      should be overridden independently.
>> +
>
> Not sure what you wanted to convey with "independently" here?

Yeah maybe bad/useless word here, I just wanted to say that these three sho=
uld
be set, not PREFERRED_TOOLCHAIN directly.

>> +      The value of this variable is the value :term:`PREFERRED_TOOLCHAI=
N_TARGET`.
>
> No? It differs depending for what you're building (native, target,=20
> cross, crosssdk, nativesdk) from what I could read.

You're right, my bad.

>> +
>> +   :term:`PREFERRED_TOOLCHAIN_NATIVE`
>> +      This variable controls the toolchain used for compiling
>> +      :ref:`ref-classes-native` recipes.
>> +
>> +      This variable should be set globally from a :term:`configuration =
file`.
>> +
>> +      See :term:`PREFERRED_TOOLCHAIN_TARGET` for more details on the po=
ssible
>> +      values for this variable.
>> +
>> +   :term:`PREFERRED_TOOLCHAIN_SDK`
>> +      This variable controls the toolchain used for compiling
>> +      :ref:`ref-classes-nativesdk` recipes.
>> +
>> +      This variable should be set globally from a :term:`configuration =
file`.
>> +
>> +      See :term:`PREFERRED_TOOLCHAIN_TARGET` for more details on the po=
ssible
>> +      values for this variable.
>> +
>> +   :term:`PREFERRED_TOOLCHAIN_TARGET`
>> +      This variable controls the toolchain used for compiling recipes i=
n the
>> +      architecture of the target.
>> +
>
> Maybe add "machine" at the end of the sentence to highlight what a=20
> target is?

Yes, thanks

>> +      There are two possible values for this variable at the moment:
>> +
>> +      -  :ref:`gcc <ref-classes-toolchain-gcc>` (default): the Gcc/Binu=
tils toolchain.
>
> s/Gcc/GCC/
>
>> +      -  :ref:`clang <ref-classes-toolchain-clang>`: the Clang/LLVM too=
lchain.
>> +
>> +      Selecting a value for this class will make the :ref:`ref-classes-=
base`
>
> S/Selecting a value for this class/:term:`PREFERRED_TOOLCHAIN_TARGET`/
>
>> +      class inherit one of the toolchain class defined in
>> +      :oe_git:`meta/classes/toolchain
>> +      </openembedded-core/tree/meta/classes/toolchain>`. As a consequen=
ce, this
>> +      variable should be set globally from a :term:`configuration file`=
.
>> +
>
> What happens for a recipe that only supports one toolchain and not the=20
> other? e.g. trusted-firmware-a for Rockchip RK3399 requires gcc right now=
.
>
>> +      These classes define commands used for cross-compiling such as :t=
erm:`CC`,
>> +      :term:`CXX`, :term:`LD` and so on.
>> +
>>      :term:`PREFERRED_VERSION`
>>         If there are multiple versions of a recipe available, this varia=
ble
>>         determines which version should be given preference. You must al=
ways
>> @@ -10131,6 +10176,21 @@ system and gives an overview of their function =
and contents.
>>         implementations, NFS does not meet this minimum requirement.
>>         Consequently, :term:`TMPDIR` cannot be on NFS.
>>  =20
>> +   :term:`TOOLCHAIN`
>> +      The :term:`TOOLCHAIN` variable can be used to override the toolch=
ain used
>> +      by a recipe.
>> +
>
> Aaaah, this way :) What about adding a small mention to the other=20
> PREFERRED_TOOLCHAIN_* variables so we know what to do if we want to=20
> override it for a recipe?

Sure! Good point.

>> +      The default value for this variable is the value of
>> +      :term:`PREFERRED_TOOLCHAIN`. See the description of
>> +      :term:`PREFERRED_TOOLCHAIN` to know the list of possible values f=
or
>> +      :term:`TOOLCHAIN`.
>> +
>> +      It is possible to override the value of this variable from a reci=
pe if
>> +      this recipe is known to support only a specific toolchain. For ex=
ample,
>> +      the :ref:`ref-classes-kernel-arch` class overrides this variable =
to "gcc",
>> +      because the Linux Kernel does not support toolchains other than
>> +      Gcc/Binutils for compiling.
>> +
>
> s/Gcc/GCC/
>
> I was not convinced this was still true, but=20
> https://www.kernel.org/doc/html/latest/kbuild/llvm.html still says it is=
=20
> "ongoing work" so I guess it's not fully covered right now (and/or our=20
> classes/recipes do not support using clang for the kernel right now).

Maybe not the best example then, I also doubted this a bit.. Will try to fi=
nd
another example.

> Missing a :term:`TOOLCHAIN_NATIVE` entry here (actually probably a few=20
> more lines below) maybe as well?

I can't find any reference to that variable anywhere across OE-Core, not su=
re it
exists?

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


