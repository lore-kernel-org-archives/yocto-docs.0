Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A679C369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 07:46:32 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13620.1744789587969157443
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Apr 2025 00:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nGuE1kqt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41129439D2;
	Wed, 16 Apr 2025 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744789585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4GcT15fROTcO8Sfb2llKMW658VGm84IAwViSjgZIgEc=;
	b=nGuE1kqtuPbwOzAZiir+p/lR7keGyZ+RSIgQdmdRhcdkLc5dv8us/WFpypIBJPBlemdokg
	HL4ZpzIzZiPSDRuTeKbpSCGn6meri3OWG3dXFhca/Lu6b5NR66ekSmBkIbqbHe1/WFmqyu
	oAYi31mkMXLPE4vEYVqpy0HdeCEIIPNGivS3qGhNAmJGNhgqoFbDOXK/H56TeYtXz/psw0
	1N/lxmRGd+ebaoLZIqEJ0Fyknxua7BLFenHAurQcAMXLD7EOl+GUS9uFYKcXIOL/MDa4Uo
	68adPCmpxMvjkI0szIpjtxaJubDX11x6d/Ru3UoUULpiu2NHe7B4q/kmiTk9dA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Apr 2025 09:46:24 +0200
Message-Id: <D97WADVD9D0D.3PPCH5GX3DOL0@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/2] poky.yaml: introduce DISTRO_LATEST_TAG
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
 <20250409-fix-distro-dead-links-v1-1-616b62185d04@bootlin.com>
 <e2d275ee-5657-4dc5-a831-1edb565f85f3@cherry.de>
In-Reply-To: <e2d275ee-5657-4dc5-a831-1edb565f85f3@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdehkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduudeuleetudetveegjeejgfegveegudeftdffhfdtuddugfeiheffgfevkedvvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdihrghmlhdrihhnpdhhthhtphhlihhnkhhrvghfvghrrhhinhhgthhothhhvggtuhhrrhgvnhhtughotghsvhgvrhhsihhonhdrihhnpdhorhhgrdhnohifpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhop
 eefpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Apr 2025 07:46:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6753

Hi Quentin,

On Mon Apr 14, 2025 at 2:18 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 4/9/25 11:55 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Introduce the DISTRO_LATEST_TAG macro, which should always point to the
>> latest existing tag in the documentation, unlike DISTRO which may point
>> to A.B.999 to represent the tip of a branch.
>>=20
>> This variable is needed to fix dead links in the documentation that
>> currently use the DISTRO macro.
>>=20
>> Also, make DISTRO_REL_TAG use the DISTRO macro directly, to avoid
>> repetition, and add a DISTRO_REL_LATEST_TAG macro that has the same role
>> as DISTRO_LATEST_TAG but with "yocto-" prepended to it.
>>=20
>> In set_versions.py, run the "git describe --abbrev=3D0 --tags
>> --match=3D'yocto-*'" command to get the latest existing tag on the
>> currently checked out commit. Fallback to ourversion in case we didn't
>> find any.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/poky.yaml.in    | 11 ++++++++++-
>>   documentation/set_versions.py | 16 +++++++++++++++-
>>   2 files changed, 25 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>> index 836f11454..26c21e346 100644
>> --- a/documentation/poky.yaml.in
>> +++ b/documentation/poky.yaml.in
>> @@ -2,13 +2,22 @@
>>   # Macros used in the documentation
>>   #
>>  =20
>> +# The DISTRO variable represents the current docs version. It should be=
 used
>> +# when referring to the current docs version. See also DISTRO_LATEST_TA=
G.
>>   DISTRO : "5.1"
>> +# The DISTRO_LATEST_TAG represents the latest tag on the current branch=
. It
>> +# should be used in HTTP link referring to the current docs version. In=
 these
>> +# cases, the DISTRO may point to A.B.999 which does not exist (just use=
d to
>> +# represent the latest HEAD revision on the branch). DISTRO_LATEST_TAG =
should
>> +# always point to an existing tag.
>
> I don't remember why/where we need A.B.999? I assume most shouldn't=20
> point at .999, ever?

The default landing page of docs.yoctoproject.org is a 999 version (tip of =
the
stable release branch).

> Also, it would be nice to provide an example as to what is supposed to
> be stored in each variable based on a specific example.
>
> e.g.
>
> """
> # If building from master, e.g. commit=20
> 3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef
> # DISTRO will be 5.2.999
> # DISTRO_LATEST_TAG will be 5.1
> #
> # If building from a release branch, e.g. styhead (e.g. commit=20
> 85e738e4c0e62f69699fff4bb0482ee3e3121496)
> # DISTRO will be 5.1.999
> # DISTRO_LATEST_TAG will be 5.1.4
> #
> # If building from a tag, e.g. yocto-5.1.4
> # DISTRO will be 5.1.4
> # DISTRO_LATEST_TAG will be 5.1.4
> """
>
> Note that I haven't thoroughly checked the above is correct.

That's it. Although, as you see from set_versions.py, these variables are n=
ot to
be set manually in poky.yaml.in, and are automatically set by the script.
I could add a comment on that in poky.yaml.in.

> If that is correct, do we really want to return 5.1 for LATEST_TAG if=20
> building from master?

DISTRO_LATEST_TAG is used in URLs and in most cases point to
downloads.yoctoproject.org. Now I'm not sure for master we want to point to=
 a
dead link, or the latest tag across all possible branches, or just the prev=
ious
tag on the master branch. For simplicity I'd favor the last option, especia=
lly
because master is a dev branch so we don't expect any sort of stable inform=
ation
on there.

> If you always want to return the latest tag for a release, it's a bit=20
> more involved. For example, I did the following for finding out the=20
> latest tag in TF-A, including lts branches:

DISTRO_LATEST_TAG only represents the current branch, and I don't think it'=
s
worth trying to find the latest tag accross all branches, considering the m=
aster
branch is not a release branch (development branch) and so we don't expect =
URLs
to point to a valid link anyway.

> """
> # Use most recent release, the latest annotated tag reachable from master
> LAST_V_TAG=3D$(git describe --abbrev=3D0 --match "v?*.?*.?*")
> # Find all tags from different branches that contain that latest tag=20
> reachable from master.
> # This will return lts tags, of which we want to take the latest availabl=
e.
> # If no LTS tag, take the latest non-rc tag reachable from master.
> LAST_LTS_TAG=3D$(git tag --sort -version:refname --contains "$LAST_V_TAG"=
=20
> 'lts-v?*.?*.?*' | head -1)
> TAG=3D${LAST_LTS_TAG:-$LAST_V_TAG}
> """
>
> I assume we could something similar here.
>
>> +DISTRO_LATEST_TAG : "5.1"
>>   DISTRO_NAME_NO_CAP : "styhead"
>>   DISTRO_NAME : "Styhead"
>>   DISTRO_NAME_NO_CAP_MINUS_ONE : "scarthgap"
>>   DISTRO_NAME_NO_CAP_LTS : "scarthgap"
>>   YOCTO_DOC_VERSION : "5.1"
>> -DISTRO_REL_TAG : "yocto-5.1"
>> +DISTRO_REL_TAG : "yocto-$DISTRO;"
>
> Separate patch for doing that (with the removal of it in the=20
> replacements dict in the python script).
>
>> +DISTRO_REL_LATEST_TAG : "yocto-&DISTRO_LATEST_TAG;">   DOCCONF_VERSION =
: "dev"
>>   BITBAKE_SERIES : ""
>>   YOCTO_DL_URL : "https://downloads.yoctoproject.org/"
>> diff --git a/documentation/set_versions.py b/documentation/set_versions.=
py
>> index 5c55f470d..b94a7daad 100755
>> --- a/documentation/set_versions.py
>> +++ b/documentation/set_versions.py
>> @@ -170,17 +170,29 @@ series =3D [k for k in release_series]
>>   previousseries =3D series[series.index(ourseries)+1:] or [""]
>>   lastlts =3D [k for k in previousseries if k in ltsseries] or "dunfell"
>>  =20
>> +latestreltag =3D subprocess.run(["git", "describe", "--abbrev=3D0", "--=
tags", "--match", "yocto-*"], capture_output=3DTrue, text=3DTrue).stdout
>> +latestreltag =3D latestreltag.strip()
>> +if latestreltag:
>> +    if latestreltag.startswith("yocto-"):
>
> This is guaranteed, because of how git describe --match works, no?
>
> """
>         --match <pattern>
>             Only consider tags matching the given glob(7) pattern
> """
>
> So we can avoid the check.

True, I think I just felt off not checking. :)

>> +        latesttag =3D latestreltag[6:]
>
> You could use len("yocto-") instead of 6 to be more explicit then.
>
>> +else:
>> +    # fallback on the calculated version
>> +    print("Did not find a tag with 'git describe', falling back to %s" =
% ourversion)
>> +    latestreltag =3D "yocto-" + ourversion
>> +    latesttag =3D ourversion
>> +
>>   print("Version calculated to be %s" % ourversion)
>> +print("Latest release tag found is %s" % latestreltag)
>>   print("Release series calculated to be %s" % ourseries)
>>  =20
>>   replacements =3D {
>>       "DISTRO" : ourversion,
>> +    "DISTRO_LATEST_TAG": latesttag,
>>       "DISTRO_NAME_NO_CAP" : ourseries,
>>       "DISTRO_NAME" : ourseries.capitalize(),
>>       "DISTRO_NAME_NO_CAP_MINUS_ONE" : previousseries[0],
>>       "DISTRO_NAME_NO_CAP_LTS" : lastlts[0],
>>       "YOCTO_DOC_VERSION" : ourversion,
>> -    "DISTRO_REL_TAG" : "yocto-" + ourversion,
>>       "DOCCONF_VERSION" : docconfver,
>>       "BITBAKE_SERIES" : bitbakeversion,
>>   }
>> @@ -318,3 +330,5 @@ with open('releases.rst', 'w') as f:
>>               if tag =3D=3D release_series[series] or tag.startswith('%s=
.' % release_series[series]):
>>                   f.write('- :yocto_docs:`%s Documentation </%s>`\n' % (=
tag, tag))
>>           f.write('\n')
>> +
>> +
>>=20
>
> Not sure we need those two additional new lines?

My bad, a mistake that slipped in.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

