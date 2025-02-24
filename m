Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26963C021A6
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 10:53:46 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.86183.1740394419374898548
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 02:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ba6vaiIa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 637E844295;
	Mon, 24 Feb 2025 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740394417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3TTJoOKzWxagCtWHZShIBJ64n4tn3P87lO+4gUhwh0=;
	b=Ba6vaiIaOPlH2QXpbRgfdbx3WXzhcICMwy3H1gpV7L7KmuJvVixy0XbOfkMSA57Vcpv7xg
	2zuZfFO4e5e6XwTNKvxG/FZR2ZJ4V5S/pohJPBAUz+SwP1EWj08TbmQn+XtiOi3H6sGz6g
	VYrLfKEZfQY8n0/KyuPRfB0d5/oJ2Z1/3PBJ8MTAG/EfKGqJjznJ8WwUv9IFShCk4BpoV1
	/lQku1XjuWjtOB40nJgCZbN71GVB/F1n74xXgrXTvAHJBa1DoSryEwFlyhTJHPFVQ1Y+Qh
	NpMxloki98qiNaHG/RYaDQvpjlxGToJyXPIDhtvd8nQ0Ikg+si7o06bEo9gtvQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Feb 2025 11:53:37 +0100
Message-Id: <D80MBXN4BSZF.2OK87WROBFBJP@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 6/6] ref-manual/variables: improve the UNPACKDIR
 documentation
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-6-75d23b5e7a88@bootlin.com>
 <f4db28cd-1701-49ba-8c90-938128fe61df@cherry.de>
In-Reply-To: <f4db28cd-1701-49ba-8c90-938128fe61df@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheplefgueeihfejvedtteeviefgvedvvdeijedttefhueejjeejffehhfeftddtvdfgnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughot
 ghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 10:53:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6440

Hi Quentin,

On Thu Feb 20, 2025 at 5:41 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/18/25 10:12 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> It was clear why UNPACKDIR was introduced at first, and what is the
>> recommended way of setting S and UNPACKDIR for a clean separation of the
>> source code and WORKDIR. Add documentation for this in the reference
>> manual.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/variables.rst | 39 ++++++++++++++++++++++++++=
+++++++-
>>   1 file changed, 38 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index adbef69d8f39d33be87c5db6688a807156540410..d970fc21f69fe35830a9d6b5=
a28da7cb257c0709 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -10035,9 +10035,46 @@ system and gives an overview of their function =
and contents.
>>  =20
>>      :term:`UNPACKDIR`
>>         This variable, used by the :ref:`ref-classes-base` class,
>> -      specifies where fetches sources should be unpacked by the
>> +      specifies where fetched sources should be unpacked by the
>>         :ref:`ref-tasks-unpack` task.
>>  =20
>> +      Although the default value of this directory is
>> +      ``${WORKDIR}/sources-unpack``, the recommended way of setting
>> +      :term:`UNPACKDIR` and :term:`S` is::
>> +
>> +         S =3D "${WORKDIR}/sources"
>> +         UNPACKDIR =3D "${S}"
>> +
>
> Mmmm I think this is an issue, because we then show a non-recommended=20
> configuration in the SVG in the previous patches where UNPACKDIR !=3D S.

I'd rather show the default definitions in the figures, because there's no
guarantee that a recipe will define UNPACKDIR and S that way.

It also feels weird to me that a recommended approach is not the default, b=
ut it
is probably related to backward compatiblity, that would be my guess.

>> +      This allows the source code to be safely unpacked and patched in =
a
>> +      separate directory.
>> +
>
> I think I know where you want to go with this, but the first time I read=
=20
> this I didn't understand it. UNPACKDIR =3D S in the example above, why=20
> does this say the source code is unpacked and patched (implying two=20
> steps/stages) in a separate directory then?

I wanted to say that the code is unpacked and patched in the same directory=
, but
separate from the WORKDIR. I should probably rephrase or remove this senten=
ce to
avoid adding confusion.

> I think this is because we used to put everything from the fetcher into
> WORKDIR and there were unexpected leftovers between builds and UNPACKDIR=
=20
> now is a separate directory for the fetcher to put everything it does=20
> in, instead of WORKDIR?

Yes, I think that's it.

> I'm not sure we need to document how messed up it was in the past rather=
=20
> just what this does now?

So I guess we can go with the sentence removal. However I think we'd probab=
ly
want to keep the recommended assignment.

>> +      .. note::
>> +
>> +         In some cases, the :term:`UNPACKDIR` directory only holds the =
sources
>> +         temporarily. When the first directory after :term:`WORKDIR` in=
 the
>> +         :term:`S` variable is matched in :term:`UNPACKDIR`, the direct=
ory
>> +         in :term:`UNPACKDIR` is moved to the :term:`WORKDIR` directory=
.
>> +
>> +         For example, let's represent the :term:`UNPACKDIR` directory
>> +         for the ``foobar`` recipe after extraction as follows::
>> +
>> +            ${WORKDIR}/sources-unpack/foobar-1.0.0/...
>> +
>> +         And the variable :term:`S` for this recipe defined as::
>> +
>> +            S =3D "${WORKDIR}/${BP}"
>> +
>> +         Where :term:`BP` expands to ``foobar-1.0.0``.
>> +
>> +         Since the first directory of :term:`S` after :term:`WORKDIR`
>> +         (``foobar-1.0.0``) matches the directory ``foobar-1.0.0`` unde=
r
>> +         ``sources-unpack``, the latter is moved to the :term:`WORKDIR`
>> +         directory. The final location of the source code will then be
>> +         ``${WORKDIR}/foobar-1.0.0``.
>> +
>> +         This behavior was added for compatibility for recipes that do =
not set
>> +         the :term:`UNPACKDIR` and :term:`S` variable in the recommende=
d way.
>> +
>
> I've read this 5 times now, it may be too late for my brain today but I=
=20
> am not sure I got it :)
>
> Let me try to reword it just to make sure I understood/got it right?
>
> If UNPACKDIR differs from S, but the name of the directory (dirA) where=
=20
> sources are unpacked in UNPACKDIR matches the basename of the directory=
=20
> used for S, then the content of UNPACKDIR/dirA is moved into S?

That's it. And it is a pain to describe textually. I'd take any recommendat=
ions
for improving it.

> If that's right, what really happens? Is UNPACKDIR variable modified to=
=20
> point to S once the move is done? When is this happening?

No, UNPACKDIR isn't modified. This move is repeated at the end of the do_un=
pack
task, each time. See:
https://git.openembedded.org/openembedded-core/tree/meta/classes-global/bas=
e.bbclass#n158

I may consider removing that note entirely depending on how useful it is to
document a backwards-compatibility behavior.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

