Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86E1C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 08:04:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10232.1745481863272908572
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Apr 2025 01:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B2ScIaUg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9764943B53;
	Thu, 24 Apr 2025 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745481860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvOk551IU7mpCGXNdESQANUsabIIVWQcJ6jAo72jYfg=;
	b=B2ScIaUgTqvj9vItjiYVFkaYG96M0g6NlbQfFlf2z8PSso8uAQcZF/KlMioHLigjYmg5cC
	lXAQxXD68ylfIvCf21LaqAAoCRU2UWHAF+KYPCOyoKqVv4VTRl2bQPLacCEZlMI7mh5z2y
	JQJwMojDLDkgGBXt6UGfLSKSGO6UOjcoTJEmEEu7patJd2I8ZXmIIQiTZQyOW82tZ8bIws
	1bBAGos8SOfcWKCrd3ZPmL3hHg1/0WFGyQg8YBjkX3YiY9+zK4+QwqU4CmvlTbygy85THZ
	LB0lsuSQ8zw7/Y3srG37t+CjA0NB9HCL45WB05GY+84AxRyuaqUPOCDk81oW6Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 10:04:20 +0200
Message-Id: <D9EPOGRMN3YJ.2KZRPDOFHCRRS@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <gavrosc@yahoo.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <5436.1743603561759061812@lists.yoctoproject.org>
 <28281.1745436284133202831@lists.yoctoproject.org>
In-Reply-To: <28281.1745436284133202831@lists.yoctoproject.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudeivdelgfffteeguefhheektddvleeikeeljeehvddvhefhueetfedvgfdvgeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepghgrvhhrohhstgeshigrhhhoohdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Apr 2025 08:04:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6780

Hi Christos,

On Wed Apr 23, 2025 at 9:24 PM CEST, Christos Gavros via lists.yoctoproject=
.org wrote:
> hi Antonin and Quentin
>
> i had a further look on that.
>
> When initramfs is included in build (INITRAMFS_IMAGE =3D "core-image-mini=
mal-initramfs" in local.conf)
> then the 'IMAGE_ROOTFS' is pointing to build/tmp/work/qemux86_64-poky-lin=
ux/core-image-minimal-initramfs/1.0/rootfs.
> This directory is approximately 115000kb.
> If INITRAMFS_MAXSIZE =3D "1100000" then the error is generated.
> If INITRAMFS_MAXSIZE =3D "1600000" then the build is ok.
> So i think that the INITRAMFS_MAXSIZE refers to the size of the directory=
 and not the final image type.

How were your IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_ALIGNMENT variables se=
t
during your test? I'm pretty sure they affect the final condition when I lo=
oked
at the code a couple of weeks ago.

Could you include how these two variables affect the final condition with
regards to INITRAMFS_MAXSIZE?

> The condition " if image_fstypes =3D=3D initramfs_fstypes !=3D '' =C2=A0a=
nd initramfs_maxsize: ", exists
> because in the recipe "core-image-minimal-initramfs" there is the assignm=
ent IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}".
> So the INITRAMFS_MAXSIZE is evaluated only when one of the initramfs reci=
pes is included.
>
> Shall i submit a v2 ?

I think Quentin had valid comments on your patch:
week -> weak
the size is in kilobytes, not bytes

I'll let you take a second look at their comments.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

