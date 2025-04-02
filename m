Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEE6C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 12:25:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6792.1743596693066326097
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 05:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RniQr3YC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4548044252;
	Wed,  2 Apr 2025 12:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743596691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtCDp7ac+b7+rwRS/hRLSDicYLm0g1iz+XPUBTzeU60=;
	b=RniQr3YCgLuAkePsquQz1thKF18ak3JGtFrkDBiBM0lUMInP5mCGXrLjDZP/yQkkl18kYr
	ErFmG30GAqPj2OlvkPfRWH6V6SftDRUfsNDSirHFVeMe+VQfq+HFj8Oe+q5Ag6TMZbJ6ra
	mfj6RXpFmsSC+h1fNh/Bb1FvWyTVrEBl13MKIGlVDkoblp9sE2Aok0B/OtTIAFcw4+wMTD
	RdlZE0h28d42ImhJ4fIupRhtdDAc6woHPeJWNVYeUXYVWfkSxAfL5mkmf8SNE/Lp7lbUsu
	lsvFzGqvHb9OT3FybQ5ZKWDm4eyRFqDVzPN+uFr/CINUi/Op+TIjB6cm/maxGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Apr 2025 14:24:50 +0200
Message-Id: <D8W5FXUH9TEX.2D2J4Y2B5HOME@bootlin.com>
To: "Christos Gavros" <gavrosc@yahoo.com>, <docs@lists.yoctoproject.org>
Subject: Re: [PATCH] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
Cc: "Yoann Congal" <yoann.congal@smile.fr>, "Randy MacLeod"
 <randy.macleod@windriver.com>, "Antonin Godard"
 <antonin.godard@bootlin.com>, "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250328205213.93625-1-gavrosc.ref@yahoo.com>
 <20250328205213.93625-1-gavrosc@yahoo.com>
In-Reply-To: <20250328205213.93625-1-gavrosc@yahoo.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffudetffduheejhedtteegffevvefgudffudeiueevjeffueelleegffefueduheenucffohhmrghinhepuhhtihhlshdrughirhgvtghtohhrhidpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehgrghvrhhoshgtseihrghhohhordgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdpr
 hgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtoheprhgrnhguhidrmhgrtghlvghougesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Apr 2025 12:25:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6698

Hi Christos,

On Fri Mar 28, 2025 at 9:52 PM CET, Christos Gavros wrote:
> This variable specifies the maximum allowed size
> of the initramfs image in bytes.
> Fixes [YOCTO #15797]
>
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> CC: Antonin Godard <antonin.godard@bootlin.com>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
>  documentation/ref-manual/variables.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 62e339ed8..c9c042096 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4474,6 +4474,13 @@ system and gives an overview of their function and=
 contents.
>        See the :term:`MACHINE` variable for additional
>        information.
> =20
> +   :term:`INITRAMFS_MAXSIZE`
> +      Specifies the maximum allowed size of the initramfs image in bytes=
.
> +      The build will fail in case the initramfs image size is bigger tha=
n
> +      the value of this variable.
> +      There is a week default value assignment (INITRAMFS_MAXSIZE ??=3D =
"131072" )

Not sure this was covered by Quentin but either the default value here need=
s to
be enclosed with ticks: (``INITRAMFS_MAXSIZE ??=3D "131072" ``).

Or better I think, we should specify where it is defined without specifying=
 the
default value, which may evolve over time.
Like so: :oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf=
/bitbake.conf>`

> +      in bitbake.conf.
> +
>     :term:`INITRAMFS_MULTICONFIG`
>        Defines the multiconfig to create a multiconfig dependency to be u=
sed by
>        the :ref:`ref-classes-kernel` class.

Looking at the code of image.bbclass, we have:

  size_kb =3D oe.utils.directory_size(d.getVar("IMAGE_ROOTFS")) / 1024

So, it seems that the size is calculated regardless of any compression para=
meter
since it calculates the size of the directory?

Otherwise, there are more considerations to take into account. We have the
overhead_factor and rootfs_alignment.

Actually, INITRAMFS_MAXSIZE is going though the same operations as
IMAGE_ROOTFS_MAXSIZE, from what I read from the code.

It would be nice to include how IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_ALIG=
NMENT
affect this variable too. This is missing in the IMAGE_ROOTFS_MAXSIZE
documentation as well. :/

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

