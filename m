Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0D0D44167
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 15:05:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.23476.1732028722473591583
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Nov 2024 07:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dFim8G5C;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62D1A4000D;
	Tue, 19 Nov 2024 15:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732028720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkLzZQVOvgcQWME4RaLvi9mWeS4b+5snW1aPspGIlkY=;
	b=dFim8G5COUpNWyGirwnX79uMf80JMVoTLHRv6n/duqSKYHdfyGzvtyS8sAHKTH3H0OsP5q
	fdbI1WocBd9gMv0yGOd5U8P1jsBI+4ldM4DrYIocIr70nM9xGepkG2b3JeqxNi5tS/gSRA
	53gqGsJDUCNk7NazkkW13PQSWDlj66izbcke7hP9n6j3Z1XW+73l9sJvJ7Dp8XL0tk0Mo1
	C56YEWMsHOelmqNf4TB5ojN+lKrnMOdoiZnZJD8wwOd6f8smFzflQ3GiRZO5puc9jZpL9m
	LLaHfez6ZuyPN5lr7Q/nmkezGYBZsybHantzZjs2Tah2+9rvp/tpTGqMVwSF3Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Nov 2024 16:05:20 +0100
Message-Id: <D5Q8XTH54W4A.227VGN0AOS29E@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH] ref-manual: classes: bin_package: fix
 SRC_URI example
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241118-fix-bin-package-v1-1-906f0148fdaa@bootlin.com>
 <5b61d56f-b04f-4fa0-8249-83c605036726@cherry.de>
In-Reply-To: <5b61d56f-b04f-4fa0-8249-83c605036726@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Nov 2024 15:05:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5768

Hi Quentin,

On Tue Nov 19, 2024 at 10:38 AM CET, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 11/18/24 9:46 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> `subdir` is the correct attribute to use for extracting the package in
>> the correct directory.
>>=20
>>  From the bitbake doc:
>>=20
>>    subdir: Places the file (or extracts its contents) into the specified
>>      subdirectory. This option is useful for unusual tarballs or other
>>      archives that do not have their files already in a subdirectory wit=
hin
>>      the archive.
>>    subpath: Limits the checkout to a specific subpath of the tree when
>>      using the Git fetcher is used.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/classes.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-ma=
nual/classes.rst
>> index b92f4e4f20ea8f702c90f4e3d29251b2461d07d0..2ac94630d80386cf613222b7=
0f7bd6323b9948f2 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -176,7 +176,7 @@ example use for this class.
>>      are extracted into the subdirectory expected by the default value o=
f
>>      :term:`S`::
>>  =20
>> -      SRC_URI =3D "git://example.com/downloads/somepackage.rpm;branch=
=3Dmain;subpath=3D${BP}"
>> +      SRC_URI =3D "git://example.com/downloads/somepackage.rpm;branch=
=3Dmain;subdir=3D${BP}"
>>  =20
>
> This is not enough, subpath is mentioned in the note admonition just=20
> above a few times, those need to be fixed as well.
>
> Additionally the wording is weird for the bin_package class.
>
> "class is a helper class for recipes that extract the contents of a=20
> binary package (e.g. an RPM)"
> [...]
> "For RPMs and other packages that do not contain a subdirectory,"
>
> Maybe we should use another example of a binary package (e.g. a .deb=20
> package) in the first sentence?
>
> Also I am not entirely sure what this example is supposed to show.
>
> SRC_URI =3D=20
> "git://example.com/downloads/somepackage.rpm;branch=3Dmain;subpath=3D${BP=
}"
>
> This is very confusing to me, is this really a somepackage.rpm **git**=20
> repo? or was this a mix between fetching via git and unpacking an RPM?
>
> I'm wondering what we were supposed to show with this example. Is it=20
> about fetching an RPM from a git repo and only extracting a part of that=
=20
> RPM? Is that even possible? If so, we probably want a combination of=20
> subpath and subdir? subdir for the path internal to the repo to the RPM=
=20
> and subpath for the path internal to the RPM to extract?

Actually I think I missed the point of the class description at first. It s=
eems
to document how to fetch a subpath of a git repository containing rpm files=
=E2=80=A6
Which makes me wonder: how often do you need to fetch binary from git
repositories? Probably not often.

I would have thought a more common case to be for extracting a local file, =
or
fetching a file over HTTP.

So I guess the description should be updated to give some more examples, ye=
s. I
would even remove the git binary example, as it's bad practice to store bin=
aries
in repos anyway=E2=80=A6=C2=A0What do you think?

> Or, we should provide two examples, one for RPM downloaded from HTTP for=
=20
> example, using subpath, and one for a directory from a git repo, using=20
> subdir?

Actually: you'd use subpath for the git repo (to extract only a specific fi=
le
from the repo), and subdir for e.g. a tarball, to extract it in the right p=
lace.

The current description of the class is really confusing, I'll send a patch=
 to
update it.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

