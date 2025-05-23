Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3254C54F2E
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 13:51:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.48504.1748008292560963617
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 06:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PFFPSN4/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22B6543295;
	Fri, 23 May 2025 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748008290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDIWHP64CiO8GJt8T2x978O+ZshWP92lXFI1IOI/tnA=;
	b=PFFPSN4/9xBg9Ovk0wgV4k/MrTq5Dr+2xTSVPvFQZH6zDi4CQVp5GsY6F++pGzj/SuAr+m
	FwGuRQFDRQBD/79pruQOTFXevGvJTiAU/ObgseTTCsZ9Cr5ZMQr5c8NsShsX396II467k0
	7K5p5GXAc358nxzTH/obKvxL6DUAJOIqPn022i35owZMXlIfOfa1F6q1rUdMndKf/r/3Kd
	sN4o0Og5dYrFreL+1WIn+GGLtmnuOGfE9O2Yv/CJzK4CJfaZJLCZNKAtfpwQJ1h+mu0SaL
	dJTGugs20wcZ3PNyzp6hGJKaFJRPPg/rdBOLdz0hZIi0a31ejDI94IMOlTav2A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 15:51:29 +0200
Message-Id: <DA3L82GEDRV4.1D8323CWHRPSD@bootlin.com>
Subject: Re: [docs][PATCH v2] ref-manual/variables.rst: document
 SSTATE_SKIP_CREATION
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <ecordonnier@snap.com>, <docs@lists.yoctoproject.org>
References: <20250523112428.278675-1-ecordonnier@snap.com>
In-Reply-To: <20250523112428.278675-1-ecordonnier@snap.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeltddvucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtudfggfelvdejiefhgeevvddutdeggeegjeffhfdtkedtvdeiuefgvedtuedunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegvtghorhguohhnnhhivghrsehsnhgrphdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 May 2025 13:51:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6889

On Fri May 23, 2025 at 1:24 PM CEST, Etienne Cordonnier via lists.yoctoproj=
ect.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  documentation/ref-manual/variables.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 643a3e7ae8f..dc6dd2f1ba4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9049,6 +9049,26 @@ system and gives an overview of their function and=
 contents.
> =20
>        For details on the process, see the :ref:`ref-classes-staging` cla=
ss.
> =20
> +   :term:`SSTATE_SKIP_CREATION`
> +      The :term:`SSTATE_SKIP_CREATION` variable can be used to skip the =
creation of
> +      :ref:`shared state <overview-manual/concepts:shared state cache>` =
tarball files. It makes sense e.g. for image creation tasks as

Please wrap the lines to 80 chars when possible.

> +      tarring images and keeping them in sstate would consume a lot of
> +      disk space.
> +
> +      In general it is not recommended to use this variable as missing s=
state
> +      artefacts adversely impact the build, particularly for entries in =
the
> +      middle of dependency chains. The case it can make sense is where t=
he
> +      size and time costs of the artefact are similar to just running th=
e
> +      tasks. This generally only applies to end artefact output like ima=
ges.
> +
> +      The syntax to disable it for one task is:

This does not render properly, you need to use two ":"

"""
The syntax to disable it for one task is::
"""

> +
> +          SSTATE_SKIP_CREATION:task-image-complete =3D "1"

We indent the code blocks with 3 spaces, not 4.

> +
> +      The syntax to disable it for the whole recipe is:
> +
> +          SSTATE_SKIP_CREATION =3D "1"
> +
>     :term:`STAGING_BASE_LIBDIR_NATIVE`
>        Specifies the path to the ``/lib`` subdirectory of the sysroot
>        directory for the build host.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


