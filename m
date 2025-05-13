Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D56C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 09:02:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.72027.1747126926445779890
 for <docs@lists.yoctoproject.org>;
 Tue, 13 May 2025 02:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gVZkpjbD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 544E342E7E;
	Tue, 13 May 2025 09:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747126924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqCnP/So33COpWo362IGvQv2NRPI5F1PvqR/Mv9tK6o=;
	b=gVZkpjbDFMKGg5aEp5PuEFGjSJ8cBqDM56PFoFUUMMtNp7LyA+0D5Wlx9jhFCuZopFOyT/
	v5CiPzsQLfkiogn27J+01/zgr5wpafWPGRkPo3LhHWuqQrlW/TTDBa5NLgUUWj/V3yBwly
	WcUFXcGLrLXv/q4ef7AHak305Cm2lhYDA35i25kxl/49uLY25VIFHvkPPHGl4LI8M1d8Qk
	NEmkmsVy4EdmIojUtGZMF1ksx9kNwps96K/+zCmEpOyqBQDsU5+w8JPRNPlaQnn1bmbqoF
	CsaHaAY23GD5u8PZ6gdhLzPG0qN7zpMnx1AawUmbO8Pu8tlD0j/ALqh2frEHuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 May 2025 11:02:04 +0200
Message-Id: <D9UWT0MHK7VY.TMVHYR7ZUTUX@bootlin.com>
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <gavrosc@yahoo.com>, <docs@lists.yoctoproject.org>
References: <D9U1JLD1015R.24479GHMULBH7@bootlin.com>
 <1013.1747081006592263512@lists.yoctoproject.org>
In-Reply-To: <1013.1747081006592263512@lists.yoctoproject.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdefjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtudfggfelvdejiefhgeevvddutdeggeegjeffhfdtkedtvdeiuefgvedtuedunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehgrghvrhhoshgtseihrghhohhordgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 May 2025 09:02:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6816

On Mon May 12, 2025 at 10:16 PM CEST, Christos Gavros via lists.yoctoprojec=
t.org wrote:
> hi Antonin,
>
> I guess it makes sense what you are suggesting.
> I will make all the fixes based on your comments.
>
> You mean a new patch for IMAGE_ROOTFS_MAXSIZE ( and not for IMAGE_ROOTFS_=
SIZE), right?

Yes exactly, IMAGE_ROOTFS_MAXSIZE not IMAGE_ROOTFS_SIZE.

>
> Also I will prepare a v3 for INITRAMFS_MAXSIZE.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


