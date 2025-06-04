Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A23C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 06:34:07 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.10006.1749018839297359300
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 23:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ut2OJbym;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E85B4392B;
	Wed,  4 Jun 2025 06:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749018837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOIbf27r0AkDzQsCAPJoHGvmDjl05TdYG0EJy9ST1Gk=;
	b=Ut2OJbymh45Za4GG3WdOHMNtv/QiMvlq0YQx19QhjvZXjvoA1td/VPex2LyYSlzPB1HnqG
	UZUcI3cfuo3fIUUDem96cWIyBOJG7XPKnEN2ISN57aed7Px/bIxEwzTXGTMREp6pBabZfk
	Tvt6H2bsqTGYsof+FDvLpPvMD0bYrqecbGDWTGOMRZHhS6QYvIY1x0C1zRKnMAUSeK4vwD
	YlwncqJPMQTurkRtRRDYt+S7a20YaqZel/XYuY9SGDFpNXbrroK5EwIlpdDMIc7zlAgMrf
	vcHnOjzBUr4U6tIfoAdabMgCvLccVWLDYoItLqk32hPpoJOJniaqqAekXm50GQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 08:33:54 +0200
Message-Id: <DADJFKGJ4XZ5.19V8LUYOXBG4S@bootlin.com>
Subject: Re: [docs] [PATCH 1/1] documentation: add doc for
 KERNEL_SPLIT_MODULES
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dixitparmar19@gmail.com>, <docs@lists.yoctoproject.org>
References: <20250529032252.340015-1-dixitparmar19@gmail.com>
In-Reply-To: <20250529032252.340015-1-dixitparmar19@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtudfggfelvdejiefhgeevvddutdeggeegjeffhfdtkedtvdeiuefgvedtuedunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeguihigihhtphgrrhhmrghrudelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Jun 2025 06:34:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6993

On Thu May 29, 2025 at 5:22 AM CEST, Dixit Parmar via lists.yoctoproject.or=
g wrote:
> Add the missing documentation for the KERNEL_SPLIT_MODULES variable.
>
> [ YOCTO #15771 ]
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>  meta/conf/documentation.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 3dd7bce515..4c8becbdc2 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -252,6 +252,7 @@ KERNEL_MODULE_AUTOLOAD[doc] =3D "Lists kernel modules=
 that need to be auto-loaded
>  KERNEL_MODULE_PROBECONF[doc] =3D "Lists kernel modules for which the bui=
ld system expects to find module_conf_* values that specify configuration f=
or each of the modules"
>  KERNEL_PACKAGE_NAME[doc] =3D "Name prefix for kernel packages. Defaults =
to 'kernel'."
>  KERNEL_PATH[doc] =3D "The location of the kernel sources. This variable =
is set to the value of the STAGING_KERNEL_DIR within the module class (modu=
le.bbclass)."
> +KERNEL_SPLIT_MODULES[doc] =3D "Allow opt-out of split kernel modules. De=
fault set to 1, one subpackage per module. Setting it 0 will generate a mon=
olithic kernel-modules package containing all modules built from the source=
."
>  KERNEL_SRC[doc] =3D "The location of the kernel sources. This variable i=
s set to the value of the STAGING_KERNEL_DIR within the module class (modul=
e.bbclass)."
>  KERNEL_LOCALVERSION[doc] =3D "Appends a string to the name of the local =
version of the kernel image."
>  KFEATURE_DESCRIPTION[doc] =3D "Provides a short description of a configu=
ration fragment. You use this variable in the .scc file that describes a co=
nfiguration fragment file."

Hi,

This should be sent to the openembedded-core mailing list, as it modifies t=
he
openembedded-core layer, not the yocto-docs repository. As Quentin suggeste=
d, a
patch modifying yocto-docs/documentation/ref-manual/variables.rst would be
appreciated!

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

