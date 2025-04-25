Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D631AC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 07:34:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.1955.1745566457851018213
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Apr 2025 00:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Npl2DqqF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C158442AB;
	Fri, 25 Apr 2025 07:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745566455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R76EmPgAZSnmDLoS8Np9iOubbh/MftSVYnxKcux6PXE=;
	b=Npl2DqqFPKlkaS/YHkCiXg6KV8VKbJp76UcbUSe868sbYzNtr0T2N7ouEXBRaiMhkB4CAM
	8y7Fhd0ACRZ7NAs8gkwEpGcJC+Iux8kJnNbY2+WLu5nbW9y25h4t8TEmmDHYWxQPzbCu/+
	IJsuVupxOjZQoJbM/kOulR73EzRAHPj2gQ/9iJHrQispEN5bb9Zi39zTqgAWtQ4EHI/oko
	fDZrShBYf5JE/ktEUUFgrkWqEF9f9SJo+vX+dpzU+clFFsFtI7PG6FlTvFYckSTMBOTGQi
	Y6/JRJXvTZOLXpLOlXiZUL93d3Z11G7lfEjIy91W5GwbBxx7kl+E9hu5TCpgIA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 09:34:14 +0200
Message-Id: <D9FJNYVUOSIS.3L24M8EQ0J697@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <gavrosc@yahoo.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <D9EPOGRMN3YJ.2KZRPDOFHCRRS@bootlin.com>
 <24329.1745507914289060157@lists.yoctoproject.org>
In-Reply-To: <24329.1745507914289060157@lists.yoctoproject.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedujeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefffdvheegjeeijeelgeekvdeufeefleeufeelvdekheetvefhueegveekgfehleenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhuthhilhhsrdguihhrvggtthhorhihpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepghgrvhhrohhstgeshigrhhhoohdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Apr 2025 07:34:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6783

Hi Christos,

On Thu Apr 24, 2025 at 5:18 PM CEST, Christos Gavros via lists.yoctoproject=
.org wrote:
> hi Antonin
>
> my plan was to include text for all the comments from you and Quentin.
> I didnt mention the others because are small changes.
>
> Regarding the 2 variables. The values are:
> IMAGE_OVERHEAD_FACTOR =3D 1.3
> IMAGE_ROOTFS_ALIGNMENT =3D 1
> size (initial size of IMAGE_ROOTFS) =3D 120840kb
> size (after applying IMAGE_OVERHEAD_FACTOR ) =3D 157092kb
> size (after applying IMAGE_ROOTFS_ALIGNMENT ) =3D 157092kb
>
> There are more variables involved in the final calculation like 'IMAGE_RO=
OTFS_SIZE', 'IMAGE_ROOTFS_EXTRA_SPACE' (calc of base_size2).
>
> My suggestion related to variables is to add a sentence like " The variab=
les IMAGE_OVERHEAD_FACTOR, IMAGE_ROOTFS_ALIGNMENT , IMAGE_ROOTFS_SIZE, IMAG=
E_ROOTFS_EXTRA_SPACE
> are applied in the final calculation of initramfs size."

Right, so it would be great if your v2 includes these details. I would even=
 go
further and detail every calculation steps, before `base_size` is compared
against INITRAMFS_MAXSIZE.

I am talking about this part of the code:

    size_kb =3D oe.utils.directory_size(d.getVar("IMAGE_ROOTFS")) / 1024

    base_size =3D size_kb * overhead_factor
    bb.debug(1, '%f =3D %d * %f' % (base_size, size_kb, overhead_factor))
    base_size2 =3D max(base_size, rootfs_req_size) + rootfs_extra_space
    bb.debug(1, '%f =3D max(%f, %d)[%f] + %d' % (base_size2, base_size, roo=
tfs_req_size, max(base_size, rootfs_req_size), rootfs_extra_space))

    base_size =3D base_size2
    if base_size !=3D int(base_size):
        base_size =3D int(base_size + 1)
    else:
        base_size =3D int(base_size)
    bb.debug(1, '%f =3D int(%f)' % (base_size, base_size2))

    base_size_saved =3D base_size
    base_size +=3D rootfs_alignment - 1
    base_size -=3D base_size % rootfs_alignment
    bb.debug(1, '%d =3D aligned(%d)' % (base_size, base_size_saved))

That way, a user knows exactly what to expect when they fill in the
INITRAMFS_MAXSIZE variable for their need.

And as you can see, IMAGE_ROOTFS_MAXSIZE and INITRAMFS_MAXSIZE follow the s=
ame
rules:

        if base_size > rootfs_maxsize_int:
            bb.fatal("The rootfs size %d(K) exceeds IMAGE_ROOTFS_MAXSIZE: %=
d(K)" % \
                (base_size, rootfs_maxsize_int))

and

        if base_size > initramfs_maxsize_int:
            bb.error("The initramfs size %d(K) exceeds INITRAMFS_MAXSIZE: %=
d(K)" % \
                (base_size, initramfs_maxsize_int))

So that means that your patch could also be applied to the definition of
IMAGE_ROOTFS_MAXSIZE, which currently lacks any of these details.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

