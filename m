Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D752FC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 07:21:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.3169.1744874478960848400
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Apr 2025 00:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WJkQEXzp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A75B543B84;
	Thu, 17 Apr 2025 07:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744874477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HeXbk/osJZl9X6uNBkc7uyQbtGFk1mxPeucgSDDEO9k=;
	b=WJkQEXzpkiLBGVHz+BuOtGody+WwKksfo+3tJJ/MbakU8pipjoWeBoGS2jMV9uYLgpzq5+
	00Q14vZqCBYq17iDwp/g5imx5sAPK7IpNOt/KQxzzTK+sN6M/Tdkb/LAl18jHS2YizE51k
	Egf/Qo4CRHsk0Ao/Xqwb6UqR8XfBnt245iEaGJWpdk2wEzQzlz3SRfy+kiiUbzmBT/WxuJ
	vnIzftTb04x6wKYJHNZCK0H/lemXoVT7h9rQpdog/vVrq5uxQmLDnPSvBL9Mwl+PySc3sV
	/abtu7+njLihjxRG4hwd74yMiY1ryLy73Z2Fg0hSyHw76WTrEPscJroPoSDR3w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Apr 2025 09:21:16 +0200
Message-Id: <D98QDOH9EM5M.2LNH55O8DZ8IC@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/2] poky.yaml: introduce DISTRO_LATEST_TAG
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
 <20250409-fix-distro-dead-links-v1-1-616b62185d04@bootlin.com>
 <e2d275ee-5657-4dc5-a831-1edb565f85f3@cherry.de>
 <D97WADVD9D0D.3PPCH5GX3DOL0@bootlin.com>
 <0f03eef3-4de5-4276-b692-0fd18571ddbe@cherry.de>
In-Reply-To: <0f03eef3-4de5-4276-b692-0fd18571ddbe@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdekieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekgfffteeiieejveevueejffegleekfeekveduteehleevkedvteejuefhueekkeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdihrghmlhdrihhnpdhhthhtphhlihhnkhhrvghfvghrrhhinhhgthhothhhvggtuhhrrhgvnhhtughotghsvhgvrhhsihhonhdrihhnpdhinhdrihhtpdhorhhgrdhnohifpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhns
 ggprhgtphhtthhopeefpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Apr 2025 07:21:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6756

Hi Quentin,

On Wed Apr 16, 2025 at 11:58 AM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 4/16/25 9:46 AM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Mon Apr 14, 2025 at 2:18 PM CEST, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 4/9/25 11:55 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>>> Introduce the DISTRO_LATEST_TAG macro, which should always point to th=
e
>>>> latest existing tag in the documentation, unlike DISTRO which may poin=
t
>>>> to A.B.999 to represent the tip of a branch.
>>>>
>>>> This variable is needed to fix dead links in the documentation that
>>>> currently use the DISTRO macro.
>>>>
>>>> Also, make DISTRO_REL_TAG use the DISTRO macro directly, to avoid
>>>> repetition, and add a DISTRO_REL_LATEST_TAG macro that has the same ro=
le
>>>> as DISTRO_LATEST_TAG but with "yocto-" prepended to it.
>>>>
>>>> In set_versions.py, run the "git describe --abbrev=3D0 --tags
>>>> --match=3D'yocto-*'" command to get the latest existing tag on the
>>>> currently checked out commit. Fallback to ourversion in case we didn't
>>>> find any.
>>>>
>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>> ---
>>>>    documentation/poky.yaml.in    | 11 ++++++++++-
>>>>    documentation/set_versions.py | 16 +++++++++++++++-
>>>>    2 files changed, 25 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>>>> index 836f11454..26c21e346 100644
>>>> --- a/documentation/poky.yaml.in
>>>> +++ b/documentation/poky.yaml.in
>>>> @@ -2,13 +2,22 @@
>>>>    # Macros used in the documentation
>>>>    #
>>>>   =20
>>>> +# The DISTRO variable represents the current docs version. It should =
be used
>>>> +# when referring to the current docs version. See also DISTRO_LATEST_=
TAG.
>>>>    DISTRO : "5.1"
>>>> +# The DISTRO_LATEST_TAG represents the latest tag on the current bran=
ch. It
>>>> +# should be used in HTTP link referring to the current docs version. =
In these
>>>> +# cases, the DISTRO may point to A.B.999 which does not exist (just u=
sed to
>>>> +# represent the latest HEAD revision on the branch). DISTRO_LATEST_TA=
G should
>>>> +# always point to an existing tag.
>>>
>>> I don't remember why/where we need A.B.999? I assume most shouldn't
>>> point at .999, ever?
>>=20
>> The default landing page of docs.yoctoproject.org is a 999 version (tip =
of the
>> stable release branch).
>>=20
>
> That essentially should be for the version number in text and in the JS=
=20
> dropdown? We should really check our use of &DISTRO; in the docs.
>
> For example:
>
> documentation/contributor-guide/report-defect.rst, not sure we don't=20
> want to use &DISTRO_LATEST_TAG; (or another variable) instead, as it'll=
=20
> always be wrong on the default landing page of the docs (always x.x.999)?
>
> documentation/dev-manual/multiconfig.rst, I assume we also do not want=20
> to have x.x.999 there? I'm also not entirely sure why we explicitly list=
=20
> the version or if it's still appropriate?
>
> documentation/dev-manual/start.rst:774 we should probably get rid of=20
> &DISTRO; (but we can keep &DISTRO_NAME; as that matches the code block=20
> under?)
>
> documentation/dev-manual/start.rst:843 is plain wrong as the tag does=20
> not exist so we should be using DISTRO_LATEST_TAG. Same for
> documentation/dev-manual/start.rst:854, same for=20
> documentation/overview-manual/development-environment.rst:459.
>
> documentation/ref-manual/release-process.rst:15 should probably use=20
> DISTRO_NAME or DISTRO_LATEST_TAG? (or probably another variable which is=
=20
> only X.Y and not X.Y.Z if there's one, since X.Y.Z is a minor release).
>
> documentation/ref-manual/release-process.rst:59 probably should be using=
=20
> DISTRO_LATEST_TAG too?
>
> documentation/ref-manual/system-requirements.rst:58, could be using=20
> DISTRO_LATEST_TAG but probably not a big deal if we keep DISTRO instead?
>
> documentation/ref-manual/system-requirements.rst:349, I woudl assume is=
=20
> completely wrong and should be DISTRO_LATEST_TAG instead? Same for=20
> documentation/ref-manual/system-requirements.rst:350?
>
> documentation/ref-manual/system-requirements.rst:403,407,411,474,478,482=
=20
> need to use DISTRO_LATEST_TAG to match the name of the buildtools.
>
> documentation/sdk-manual/appendix-obtain.rst:66,72,176 needs to match=20
> the toolchain you can download, so needs to be DISTRO_LATEST_TAG.
>
> documentation/sdk-manual/appendix-obtain.rst:275 probably wants=20
> DISTRO_LATEST_TAG too.
>
> documentation/sdk-manual/extensible.rst:120,124,126 probably wants=20
> DISTRO_LATEST_TAG too.
>
> documentation/sdk-manual/using.rst:74,78,80,101,102,104,105,110,130,141,=
=20
> probably wants DISTRO_LATEST_TAG too.
>
> documentation/sdk-manual/working-projects.rst:85,88,219,223,225,280=20
> probably wants DISTRO_LATEST_TAG too.
>
> documentation/toaster-manual/reference.rst:161,295 DISTRO_LATEST_TAG

Thanks for going through the different usages of DISTRO. You're right, with
DISTRO_LATEST_TAG now I also think it would make more sense to use it rathe=
r
than DISTRO. I will try to work on that a bit later (or feel free to send a
patch :), the initial focus for this series was to fix dead links .

> Nothing uses YOCTO_RELEASE_DL_URL, maybe we can remove it entirely?

Indeed we can remove this variable.

>>> Also, it would be nice to provide an example as to what is supposed to
>>> be stored in each variable based on a specific example.
>>>
>>> e.g.
>>>
>>> """
>>> # If building from master, e.g. commit
>>> 3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef
>>> # DISTRO will be 5.2.999
>>> # DISTRO_LATEST_TAG will be 5.1
>>> #
>>> # If building from a release branch, e.g. styhead (e.g. commit
>>> 85e738e4c0e62f69699fff4bb0482ee3e3121496)
>>> # DISTRO will be 5.1.999
>>> # DISTRO_LATEST_TAG will be 5.1.4
>>> #
>>> # If building from a tag, e.g. yocto-5.1.4
>>> # DISTRO will be 5.1.4
>>> # DISTRO_LATEST_TAG will be 5.1.4
>>> """
>>>
>>> Note that I haven't thoroughly checked the above is correct.
>>=20
>> That's it. Although, as you see from set_versions.py, these variables ar=
e not to
>> be set manually in poky.yaml.in, and are automatically set by the script=
.
>> I could add a comment on that in poky.yaml.in.
>>=20
>
> It's actually been bothering me a lot that we have some parts of=20
> poky.yaml.in that are taken verbatim and some modified before making it=
=20
> to poky.yaml.
>
> I seem to recall we wanted the variables set by set_versions.py to still=
=20
> be able to build the docs from tarballs and not force the use of git=20
> repos? But it seems like we force to fetch git tags at the very=20
> beginning of the Python script.

  $ make html
  ./set_versions.py
  Please run 'git fetch --tags' before building the documentation
  make: *** [Makefile:72: html] Error 1

It is indeed a bug!
Created one here: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15834

> So I'm wondering if we should only have variables that aren't replaced=20
> in poky.yaml.in and eventually have the ones set_versions.py adds in=20
> poky.yaml (instead of replacing for example) documented in comments to=20
> explain what they are and in which context(s) to use them?

That would be a bit cleaner yes.

Maybe standards.md would be a good place? i.e.:
"Use &DISTRO; in the docs when wanting to refer to the latest possible vers=
ion"
"Use &DISTRO_LATEST_TAG; in the docs when wanting to refer to the latest
existing tag"
etc.

>>> If that is correct, do we really want to return 5.1 for LATEST_TAG if
>>> building from master?
>>=20
>> DISTRO_LATEST_TAG is used in URLs and in most cases point to
>> downloads.yoctoproject.org. Now I'm not sure for master we want to point=
 to a
>> dead link, or the latest tag across all possible branches, or just the p=
revious
>> tag on the master branch. For simplicity I'd favor the last option, espe=
cially
>> because master is a dev branch so we don't expect any sort of stable inf=
ormation
>> on there.
>>=20
>
> And the dev/ branch isn't the one accessed by default when going to=20
> docs.yoctoproject.org/ so I think we can afford not linking to the=20
> latest tag in the latest release branch and instead the latest tag in=20
> the master branch (i.e. the last release's first tag).
>
> [...]
>
> Cheers,
> Quentin

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

