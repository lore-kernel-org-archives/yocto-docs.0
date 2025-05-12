Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9609FC3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 08:32:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.45441.1747038734217145803
 for <docs@lists.yoctoproject.org>;
 Mon, 12 May 2025 01:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hVkjBJG9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8816E43280;
	Mon, 12 May 2025 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747038732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVOX8+spPGQAG8iH0yMPmsV7zRw9G15U/QcgYkVIN5M=;
	b=hVkjBJG9iYZaEgoj7ZAFOs2B0dHDttU1I8t8dBpIHvLPzpjXcV46/oBrZ0imzu3NKX92Ir
	RGEp63FtSdCFjzYn8/V+dotWacxFztpL6xTmJ74UTLIIVUexqwKvUYA9ve9rocHnHGOEYi
	kpHA9GkqW2lZ9cBedBEoutcBsKjRPAx8f2BXAJ+LCKPUtAK5RBY5+kgwYtVxVztpQ5T8p3
	O55zyvdv6FweqKY+lZuJlOC4ZpGdKzwgjUt34WzdxdLJNL/2DixBelLvfqq6zwd8TiMSa6
	K/wq2V6eU4poXu2Xh6vXRvtv2wMS05O3ZkgDhTXJtgKhci0XEZdnlkf/9zvSZg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 May 2025 10:32:11 +0200
Message-Id: <D9U1JLD1015R.24479GHMULBH7@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <gavrosc@yahoo.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
Cc: "Yoann Congal" <yoann.congal@smile.fr>, "Randy MacLeod"
 <randy.macleod@windriver.com>, "Quentin Schulz" <quentin.schulz@cherry.de>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250428154103.5792-1-gavrosc.ref@yahoo.com>
 <20250428154103.5792-1-gavrosc@yahoo.com>
In-Reply-To: <20250428154103.5792-1-gavrosc@yahoo.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffvdeffedvtdeghfekhefgteeuvdfglefgudehveejgedtgfevtdelfeehhffggfenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgtohhnfhdrhihouhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehgrghvrhhoshgtseihrghhohhordgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhro
 hhjvggtthdrohhrghdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtoheprhgrnhguhidrmhgrtghlvghougesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 May 2025 08:32:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6807

Hi Christos,

Thanks for working on the second version, it looks good. I've got some comm=
ents
below.

On Mon Apr 28, 2025 at 5:41 PM CEST, Christos Gavros via lists.yoctoproject=
.org wrote:
> This variable specifies the maximum allowed size
> of the initramfs image in kilobytes.
> Fixes [YOCTO #15797]
>
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> CC: Antonin Godard <antonin.godard@bootlin.com>
> CC: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
> v1->v2
> * any reference to bytes changed to kilobytes
> * description regarding default value is changed
> * add text to clarify that limit applies to the directory
> * add text to describe the calculation steps for directory size
> * add text to clarify the role of other variables in calculation steps
> ---
>  documentation/ref-manual/variables.rst | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index d17f81036..3ab9d72f3 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4708,6 +4708,27 @@ system and gives an overview of their function and=
 contents.
>        See the :term:`MACHINE` variable for additional
>        information.
> =20
> +   :term:`INITRAMFS_MAXSIZE`
> +      Defines the maximum allowed size of the initramfs image in kilobyt=
es.
> +      The build will fail if the initramfs image size is larger than the=
 value of this variable.

If possible please try to wrap the text to 80 chars, we try to do that as p=
er
our standards.md document.

> +
> +      The initramfs image size undergoes several calculation steps befor=
e it is compared with ``INITRAMFS_MAXSIZE``.

For INITRAMFS_MAXSIZE and all the other yocto variables below, please use
the :term: role, e.g.: ":term:`INITRAMFS_MAXSIZE`" instead of
"``INITRAMFS_MAXSIZE``".

This will create a hyperlink to the other variables (they need to be docume=
nted
too of course, if not you can try adding documentation for them or leave th=
e ``
syntax).

> +      In the first step, the size of the directory pointed to by ``IMAGE=
_ROOTFS`` is calculated.
> +      In the second step, the result from the first step is multiplied b=
y ``IMAGE_OVERHEAD_FACTOR``.
> +      In the third step, the result from the second step is compared wit=
h ``IMAGE_ROOTFS_SIZE``.
> +      The larger value of these is added to ``IMAGE_ROOTFS_EXTRA_SPACE``=
.
> +      In the fourth step, the result from the third step is checked for =
a decimal part. If it has one,
> +      it is rounded up to the next integer. If it does not, it is simply=
 converted into an integer.
> +      In the fifth step, the ``IMAGE_ROOTFS_ALIGNMENT`` is added to the =
result from the fourth step
> +      and the value "-1" is subtracted.
> +      In the sixth step, the remainder of the division between the resul=
t from the fifth step
> +      and ``IMAGE_ROOTFS_ALIGNMENT`` is subtracted from the result of th=
e fifth step.
> +      In this way, the result from the fourth step is rounded up to the =
nearest multiple of ``IMAGE_ROOTFS_ALIGNMENT``.
> +
> +      Thus, ``INITRAMFS_MAXSIZE`` is compared with the result of the abo=
ve calculations
> +      and is independent of the final image type.
> +      A default value for ``INITRAMFS_MAXSIZE`` is set in ``meta/conf/bi=
tbake.conf``.

You can use:

:oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bitbake.=
conf>`

To create a link to that file in OE-Core.

> +
>     :term:`INITRAMFS_MULTICONFIG`
>        Defines the multiconfig to create a multiconfig dependency to be u=
sed by
>        the :ref:`ref-classes-kernel` class.

Do you think you could port this documentation to the definition of
IMAGE_ROOTFS_MAXSIZE, to my understanding they're calculated the same way.

I would maybe do it that way:

- A first patch rewrites the documentation for IMAGE_ROOTFS_SIZE with what =
you
  described above (all the details above).
- A second patch documents the INITRAMFS_MAXSIZE variable but does not
  duplicate the content of IMAGE_ROOTFS_MAXSIZE's description, but rather c=
reate
  a link to the IMAGE_ROOTFS_MAXSIZE definition.

What do you think?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

