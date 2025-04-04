Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E696C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 09:34:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.7304.1743759273360043663
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 02:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F3CEQOn7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB14C43280;
	Fri,  4 Apr 2025 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743759271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SwwZEmXFzdHrPYyZ65JsBvORVAVKoxpJeZYk9Fa9VcY=;
	b=F3CEQOn7jFZQvF2VMAxzZVSOuTTNn6W5Q8yAujAjOVAChsw1NGVYu6djNEzr3MGBrMVSqP
	lccNLMRliI2B8X4ddijB4h8aFA1saMrgMBfrJaS5lDp79sCT6wkYZjhaayB7kah+q+lkxY
	f3tilvU1NniJJz9AQNfeVzdIswgCf+ZYc+Sj4dhPpnLzMD+6tBYJSGStKnfdjH97zR9EEU
	jr0yoQdNyb+gUP3ixI3ZXullznQ8TccTDCXgdsB6WHxXZ9GPmVQQrVM+25m9BD+AMKSFBO
	kVNcklfjb4ESAXsvMXrXsLPQi0hUE+HGGL0n1PI+Mgliwo+264rIaqt/QWitcQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Apr 2025 11:34:30 +0200
Message-Id: <D8XR2LY2SEAP.X21J5IT0X61X@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Antonin Godard"
 <antonin.godard@bootlin.com>, <docs@lists.yoctoproject.org>
Subject: Re: [PATCH 2/2] migration-guides/{migration,release-note}-5.2:
 improvements and fixes
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250403-release-note-5-2-updates-fixes-v1-0-13d16361f17c@bootlin.com> <20250403-release-note-5-2-updates-fixes-v1-2-13d16361f17c@bootlin.com> <874b31e6-63df-4d13-b967-3014e6ea8ffb@cherry.de> <D8X3LOMBN1NV.TBIZ0Z7H4CCQ@bootlin.com> <ecd14134-aaa8-4492-93d5-62b24347d816@cherry.de>
In-Reply-To: <ecd14134-aaa8-4492-93d5-62b24347d816@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduledutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhtdekjeeiteejjeeufffhuefgueekieehvefgffffveetieegveeludevtdelfeenucffohhmrghinhepshhomhgvrdhhohhsthdpkhgvrhhnvghlrdhorhhgpdhophgvnhgvmhgsvgguuggvugdrohhrghdptddrsggspdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrt
 ghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 04 Apr 2025 09:34:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6712

Hi Quentin,

On Thu Apr 3, 2025 at 7:37 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 4/3/25 5:10 PM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Thu Apr 3, 2025 at 4:23 PM CEST, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 4/3/25 4:08 PM, Antonin Godard wrote:
>>>> Address some of the reviews received on the release notes and migratio=
n
>>>> guide for 5.2:
>>>>
>>>> - Remove the wget fetcher addition, I misread commit 0a9f90ff658e
>>>>     ("tests/fetch: support setting PV in the wget fetcher") from BitBa=
ke,
>>>>     and it actually affects the tests for the wget fetcher, not the
>>>>     fetcher itself.
>>>> - Add a way to transition from the branch=3DnameX,nameY syntax. From w=
hat
>>>>     I have tested, I achieve the same behavior when using one or the o=
ther
>>>>     syntax.
>>>> - Remove the default value for SPDX_PACKAGE_VERSION in the release not=
e.
>>>> - Fix a couple of typos.
>>>>
>>>> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>> ---
>>>>    documentation/migration-guides/migration-5.2.rst     | 10 +++++++++=
-
>>>>    documentation/migration-guides/release-notes-5.2.rst |  7 ++-----
>>>>    2 files changed, 11 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/documentation/migration-guides/migration-5.2.rst b/docume=
ntation/migration-guides/migration-5.2.rst
>>>> index c54f054c7..59f21ff4c 100644
>>>> --- a/documentation/migration-guides/migration-5.2.rst
>>>> +++ b/documentation/migration-guides/migration-5.2.rst
>>>> @@ -193,6 +193,14 @@ anymore::
>>>>    This was rarely used in the core repositories, and this removal sim=
plifies the
>>>>    code logic in several places.
>>>>   =20
>>>> +If one of your recipes is still using this mechanism, you can split t=
he
>>>> +code source fetching into two separate entries::
>>>> +
>>>> +   SRC_URI =3D "git://some.host/somepath;branch=3DbranchX;name=3Dname=
X \
>>>> +              git://some.host/somepath;branch=3DbranchY;name=3DnameY"
>>>> +   SRCREV_nameX =3D "xxxxxxxxxxxxxxxxxxxx"
>>>> +   SRCREV_nameY =3D "yyyyyyyyyyyyyyyyyyyy"
>>>> +
>
> Just to make sure we don't miss this for the v2, but this "solution" was=
=20
> rejected by Richard as non-working, see=20
> https://lore.kernel.org/yocto-docs/9c3af54f0c74af0b9d0887e0408fd591e936c4=
da.camel@linuxfoundation.org/T/#u

Hm, but there are recipes using this in oe-core like [1]. Does that mean th=
at
these are broken at the moment?

In my testing, I could properly fetch and unpack such recipes with one synt=
ax or
the other. Indeed, after unpacking, only the source code of the first item =
of
SRC_URI is unpacked and present in the WORKDIR, yet BitBake does not compla=
in
about the second one or produce any kind of error. So I'm not sure of what =
to
conclude on this?

I'm not sure what is the best to say in the release notes.

[1]: https://git.openembedded.org/openembedded-core/tree/meta-selftest/reci=
pes-extended/sysdig/sysdig-selftest_0.28.0.bb#n25

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

