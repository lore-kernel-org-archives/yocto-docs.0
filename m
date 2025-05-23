Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7526EC3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 07:33:38 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.43012.1747985608817738163
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 00:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gM6avtyD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8796843A6C;
	Fri, 23 May 2025 07:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747985606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7w/kLc4s1LHSDRU8stThljm2cXRVXxG4xKyye+xrLsc=;
	b=gM6avtyDExvOHp/Xc7E0bkC6hcNkv01WtoFopo9WOQ4kBxyB8E8swILDDlKlUFaaDNJL99
	JESaP8LfluzJMtW+SsszFNA661o5evyyKt2UlHGSJhyAE41Sg8kQvsQM2107zLbl055WvP
	b/rC0wojTi7rqMzTiwUgEDQ1erH7qA1oy+bKG+Dh8ZnnrlsH+sHm4sJZQBI+UeI4iSpfwU
	QHcVQl2e1Gj7bKfogn+bnosLmr0AoEODVikcCIXJfdC/M7/5RrjjknEUhj+854eGO0z9eO
	KmcyaoPS1WFdRJEzLgQZDi8QTTjccFUUC+7/H6tE0TTTllT+w7WZoW5J9J+VoQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 09:33:25 +0200
Message-Id: <DA3D6LHYFO0L.17LFD13QJ62YV@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Jamin Lin" <jamin_lin@aspeedtech.com>, "docs@lists.yoctoproject.org"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v1] ref-manual: uboot-sign: Support firmware
 property in FIT config
Cc: "Troy Lee" <troy_lee@aspeedtech.com>
References: <20250520095457.3642012-1-jamin_lin@aspeedtech.com>
 <DA2L51D2Z4RJ.2MJEUG0QTSSXN@bootlin.com>
 <SEYPR06MB5037376466D185F30EEBA725FC98A@SEYPR06MB5037.apcprd06.prod.outlook.com>
In-Reply-To: <SEYPR06MB5037376466D185F30EEBA725FC98A@SEYPR06MB5037.apcprd06.prod.outlook.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekvdeiucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeevueevvdeiuefhfeeluddvgfevhfdukeelheekvefhgeetudejtdevudekteejnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrh
 ihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 May 2025 07:33:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6884

On Fri May 23, 2025 at 3:40 AM CEST, Jamin Lin wrote:
> Hi Antonin,
>
>> Subject: Re: [docs] [PATCH v1] ref-manual: uboot-sign: Support firmware
>> property in FIT config
>>=20
>> Hi,
>>=20
>> On Tue May 20, 2025 at 11:54 AM CEST, Jamin Lin via lists.yoctoproject.o=
rg
>> wrote:
>> > Add documentation for the UBOOT_FIT_CONF_FIRMWARE variable, which
>> > allows users to specify an image to be assigned to the "firmware"
>> > property of the FIT configuration node. This explicitly defines the
>> > primary image to boot, instead of relying on the first entry in the "l=
oadables"
>> list.
>> >
>> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>> > ---
>> >  documentation/ref-manual/classes.rst   | 2 ++
>> >  documentation/ref-manual/variables.rst | 8 ++++++++
>> >  2 files changed, 10 insertions(+)
>> >
>> > diff --git a/documentation/ref-manual/classes.rst
>> > b/documentation/ref-manual/classes.rst
>> > index 5187033f7..54a98bf24 100644
>> > --- a/documentation/ref-manual/classes.rst
>> > +++ b/documentation/ref-manual/classes.rst
>> > @@ -3426,6 +3426,8 @@ The variables used by this class are:
>> >  -  :term:`UBOOT_FIT_USER_SETTINGS`: adds a user-specific snippet to t=
he
>> U-Boot
>> >     Image Tree Source (ITS). Users can include their custom U-Boot Ima=
ge
>> Tree
>> >     Source (ITS) snippet in this variable.
>> > +-  :term:`UBOOT_FIT_CONF_FIRMWARE`: adds one image to the
>> ``firmware`` property
>> > +   of the configuration node.
>> >  -  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: adds one or more
>> user-defined images
>> >     to the ``loadables`` property of the configuration node.
>> >
>> > diff --git a/documentation/ref-manual/variables.rst
>> > b/documentation/ref-manual/variables.rst
>> > index 643a3e7ae..b430fa51f 100644
>> > --- a/documentation/ref-manual/variables.rst
>> > +++ b/documentation/ref-manual/variables.rst
>> > @@ -10327,6 +10327,14 @@ system and gives an overview of their functio=
n
>> and contents.
>> >
>> >           do_compile[depends] +=3D "trusted-firmware-a:do_deploy"
>> >
>> > +   :term:`UBOOT_FIT_CONF_FIRMWARE`
>> > +      Adds one image to the ``firmware`` property of the configuratio=
n
>> node
>> > +      of the U-Boot Image Tree Source (ITS). Sets the firmware proper=
ty to
>> select
>> > +      the image to boot first. If not set, the first entry in "loadab=
les" is
>> used
>> > +      instead.::
>>=20
>> Extra "." here.
>>=20
>
> Will fix
>
>> When you write:
>>=20
>> """
>> The first entry in "loadables" is used instead """
>>=20
>> It's not really clear to me what it is used for.
>> Used to boot?
>>=20
>
> Example:1
>
> configurations {
>         default =3D "conf";
>         conf {
>             firmware =3D "fwA";
>             loadables =3D "fwB", "fwC", "fwD";
>         };
> };
>
> Boot fwA
>
> Example:2
>
> configurations {
>         default =3D "conf";
>         conf {
>             loadables =3D "fwB", "fwC", "fwD";
>         };
> };
>
> Boot fwB
>
> Example:3
>
> configurations {
>         default =3D "conf";
>         conf {
>             loadables =3D "fwA" "fwB", "fwC", "fwD";
>         };
> };
>
> Boot fwA

Thanks that clears things up! Can you modify the last sentence from:

"""
If not set, the first entry in "loadables" is used instead
"""

to

"""
If not set, the first entry in "loadables" is used to boot instead
"""

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


