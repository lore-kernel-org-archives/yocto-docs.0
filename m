Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80487C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 09:39:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.20256.1747906784233482167
 for <docs@lists.yoctoproject.org>;
 Thu, 22 May 2025 02:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eBhK/vIx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE84243229;
	Thu, 22 May 2025 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747906782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63/JanNzLwotTbyyg1DKetzqUWLRdihjQj65V06XfWU=;
	b=eBhK/vIxc4qL7d8yi+p216GRQWnUzJ4K4odLS8pgFdXBy2XW3aXy/9tR2bjq6HG5EZiQCJ
	CF3YBSjHE++D1gJFfj+KcygkAKmo/YKC7zRi/hhlHgV3AgwXJ4O6QAsuSzg7rIyg4KsCRC
	tncVbrMOKXHFRooX486sOQgWDLx/z6j1g2lp/BZl+IkdrATnfSrcjUWsARBpk+77L/cgg9
	BaOTxZH0AtqM6+Xb/n+RreX84X23fyaljHWDLwECf/liLXVx62OW0SfC+c7CzfW8eQi+Xm
	wHDK5r/KQnH2uwxvqb/4T+rEmBKJ2A0TGWy4I0Unqyx3GE1MgZZi2jzRKfZhAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 11:39:42 +0200
Message-Id: <DA2L8QNZB47I.27YDS1YIT9KMZ@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document
 SSTATE_SKIP_CREATION
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <ecordonnier@snap.com>, <docs@lists.yoctoproject.org>
References: <20250520123955.2341427-1-ecordonnier@snap.com>
In-Reply-To: <20250520123955.2341427-1-ecordonnier@snap.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehieefucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtudfggfelvdejiefhgeevvddutdeggeegjeffhfdtkedtvdeiuefgvedtuedunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegvtghorhguohhnnhhivghrsehsnhgrphdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 May 2025 09:39:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6874

Hi,

Some suggestions and formatting related suggestions below.

On Tue May 20, 2025 at 2:39 PM CEST, Etienne Cordonnier via lists.yoctoproj=
ect.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  documentation/ref-manual/variables.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 643a3e7ae..7d8e257b9 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9049,6 +9049,12 @@ system and gives an overview of their function and=
 contents.
> =20
>        For details on the process, see the :ref:`ref-classes-staging` cla=
ss.
> =20
> +   :term:`SSTATE_SKIP_CREATION`
> +      SSTATE_SKIP_CREATION variable will be used to skip creation of

s/SSTATE_SKIP_CREATION/The :term:`SSTATE_SKIP_CREATION` variable/
s/will be/can be/
s/to skip creation/to skip the creation/

> +      sstate tarball files. It makes sense e.g. for image creation tasks=
 as

s/sstate/:ref:`shared state <overview-manual/concepts:shared state cache>`/

> +      tarring images and keeping them in sstate would consume a lot of
> +      disk space.

An example would be nice, such as:

   SSTATE_SKIP_CREATION:task-image-complete =3D "1"

>     :term:`STAGING_BASE_LIBDIR_NATIVE`
>        Specifies the path to the ``/lib`` subdirectory of the sysroot
>        directory for the build host.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


