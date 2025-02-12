Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E71C021A1
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 12:49:36 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.14882.1739364569505098236
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 04:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cjpD4xUE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A33B43291;
	Wed, 12 Feb 2025 12:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739364567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFGqxxaTNlb+bzj2g/xHwdgFCeud5wGKCs/j4B+rLXs=;
	b=cjpD4xUElH+rlYafJfpG4vo+42LpqcYZtnAar8RJbYIkHcj1IN7mmRH4T/gDjldFDLaKPr
	6UUzVidYjUQT8dPP7GB+Q8+/mJ2L3zIl6n3R2JljRiDCcYldDidzws7AeOz41rIw+dgqMQ
	Q6UmUgoGcrjv6MWyCITl7q6sS1P6C1ISqDOgjfWG/IZUlQPdM6UpPu0ocsFmmOAocKcPZy
	nebWEBlzLKe7JixE7xD74v9FQCZAHOpNk6mvyEPibtqs5i19J8NJxlDigvwIhdGZ2LkLpH
	nn5P0KmtVW02woM6U7sjfAhXzeO9ZbzwWAH2xXD0sJE/UoJBJ1v+5iRGr4DXzQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Feb 2025 13:49:24 +0100
Message-Id: <D7QHA22PDGT2.3PII4KVNFLDEA@bootlin.com>
Subject: Re: [docs] [PATCH 5/6] dev-manual/multiconfig: improve the current
 doc
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Mark Hatle"
 <mark.hatle@kernel.crashing.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
 <20250207-multiconfig-doc-v1-5-f63cdab1fad9@bootlin.com>
 <592b4b1d-990c-454f-a5e5-04aaf780bc1a@cherry.de>
In-Reply-To: <592b4b1d-990c-454f-a5e5-04aaf780bc1a@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedvueetgeektefgjedthfffhfejudfhtedugeffvdetjeehffeiteduhfehffeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhoj
 hgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhhrghtlhgvsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Feb 2025 12:49:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6356

Hi Quentin,

On Tue Feb 11, 2025 at 12:19 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/7/25 5:28 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> After the suggestions from Mark Hatle on the list
>> (https://lists.yoctoproject.org/g/docs/topic/110487932), rewrite the
>> introduction to multiconfig with the following changes:
>>=20
>> - Move the part of overriding TMPDIR or not to a note.
>> - Use BB_CURRENT_MC in the example.
>> - Various additions of references & improved formatting.
>>=20
>> Suggested-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/dev-manual/multiconfig.rst | 65 +++++++++++++++++++-----=
--------
>>   1 file changed, 39 insertions(+), 26 deletions(-)
>>=20
>> diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/de=
v-manual/multiconfig.rst
>> index d8f6470d5..27442a042 100644
>> --- a/documentation/dev-manual/multiconfig.rst
>> +++ b/documentation/dev-manual/multiconfig.rst
>> @@ -17,7 +17,7 @@ Setting Up and Running a Multiple Configuration Build
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>  =20
>>   To accomplish a multiple configuration build, you must define each
>> -target's configuration separately using a parallel configuration file i=
n
>> +target's configuration separately using a parallel :term:`configuration=
 file` in
>>   the :term:`Build Directory` or configuration directory within a layer,=
 and you
>>   must follow a required file hierarchy. Additionally, you must enable t=
he
>>   multiple configuration builds in your ``local.conf`` file.
>> @@ -25,31 +25,27 @@ multiple configuration builds in your ``local.conf``=
 file.
>>   Follow these steps to set up and execute multiple configuration builds=
:
>>  =20
>>   -  *Create Separate Configuration Files*: You need to create a single
>> -   configuration file for each build target (each multiconfig).
>> +   :term:`Configuration File` for each build target (each multiconfig).
>>      The configuration definitions are implementation dependent but ofte=
n
>> -   each configuration file will define the machine and the
>> -   temporary directory BitBake uses for the build. Whether the same
>> -   temporary directory (:term:`TMPDIR`) can be shared will depend on wh=
at is
>> -   similar and what is different between the configurations. Multiple M=
ACHINE
>> -   targets can share the same (:term:`TMPDIR`) as long as the rest of t=
he
>> -   configuration is the same, multiple :term:`DISTRO` settings would ne=
ed separate
>> -   (:term:`TMPDIR`) directories.
>> -
>> -   For example, consider a scenario with two different multiconfigs for=
 the same
>> -   :term:`MACHINE`: "qemux86" built
>> -   for two distributions such as "poky" and "poky-lsb". In this case,
>> -   you would need to use the different :term:`TMPDIR`.
>> +   each configuration file will define the :term:`MACHINE` and the
>> +   temporary directory BitBake uses for the build.
>
> Add that temporary directory =3D :term:`TMPDIR` maybe?

Will do in v2.

>>  =20
>> -   Here is an example showing the minimal statements needed in a
>> -   configuration file for a "qemux86" target whose temporary build
>> -   directory is ``tmpmultix86``::
>> +   .. note::
>>  =20
>> -      MACHINE =3D "qemux86"
>> -      TMPDIR =3D "${TOPDIR}/tmpmultix86"
>> +      Whether the same temporary directory (:term:`TMPDIR`) can be shar=
ed will
>> +      depend on what is similar and what is different between the
>> +      configurations. Multiple :term:`MACHINE` targets can share the sa=
me
>> +      :term:`TMPDIR` as long as the rest of the configuration is the sa=
me,
>> +      multiple :term:`DISTRO` settings would need separate :term:`TMPDI=
R`
>> +      directories.
>> +
>
> I have zero experience with multiconfig, but I think the only case where=
=20
> we should be able to share a TMPDIR is whenever all recipes but the ones=
=20
> whose PACKAGE_ARCH is MACHINE_ARCH are the same for both machines (or do=
=20
> not conflict, e.g. a different TUNE_PKGARCH for each machine). This=20
> includes not overriding anything for a machine (e.g.=20
> do_install:my-machine-a() or SRC_URI:append:my-machine-b, etc..; though=
=20
> I believe this must require adding PACKAGE_ARCH =3D MACHINE_ARCH for thos=
e=20
> recipes?). Overall, I guess this is a VERY niche corner case?

To be fair, I can hardly think of a use-case where you would use the same
TMPDIR, and it doesn't seem to be the general use-case. This is why I moved=
 that
to a note, so the "proper" way is emphasized below.

Maybe someone more experienced can confirm your thoughts on this!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

