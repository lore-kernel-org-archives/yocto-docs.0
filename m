Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C989BC7EE31
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:50:26 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.3215.1750751420673678468
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eN9Ung1C;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A645844A43;
	Tue, 24 Jun 2025 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750751418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xhXTS/OCfbGU8VCsEHYLzOqz0b489uf9AKCZj8fQhrs=;
	b=eN9Ung1CgNuGuC9N1vWrWwhJUVgQGX9br7k3bTDiM6oYPVKcKkGdLnOQmzfKSosc4fm6y6
	UZodJrhH5gABlgD5b9rUKdwt29AeTqvIzqsa43rM7fzY1CNhWjYg5YLP0KR/c8qx1/+cuQ
	DBj5ZR2of+2Txc42PtZjx8/fJnNcLgW1q11nCO9b6dqB/+yqUvozd2tQ1Di+7OE57wJkrn
	uPiEExRCnzveh3FKLn5vwazyPIB/XfF1ho9F+Vba01Hi9uCCI5HEs1aRFiNl34RNHtI2M7
	FT1cvPtniK1UGon7Q23+qdjAdcZ19Yhdpj/Dx6szjBx5T63dvVHSPpYnBuxQ0A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 09:50:18 +0200
Message-Id: <DAULKYBT3POY.38V8CSIV0F8K0@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual: some minor cleanups to "Pre-Built
 Libraries"
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <b88499e3-e0d1-5aff-490c-ae13c2dbfb31@crashcourse.ca>
In-Reply-To: <b88499e3-e0d1-5aff-490c-ae13c2dbfb31@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdvfffffeetleegudeihfejhefggeetteehfeefudelfeffgedtheeuteefhfeunecuffhomhgrihhnpehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvt
 ghtrdhorhhg
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:50:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7186

On Sun Jun 22, 2025 at 12:59 PM CEST, Robert P. J. Day wrote:
>
>   * Add note about new URL for FHS 3.0.
>   * Add wildcard for "INHIBIT_" variable.
>   * Fix font for ${PN}.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentat=
ion/dev-manual/prebuilt-libraries.rst
> index a05f39ca1..077184657 100644
> --- a/documentation/dev-manual/prebuilt-libraries.rst
> +++ b/documentation/dev-manual/prebuilt-libraries.rst
> @@ -22,6 +22,13 @@ To summarize, a versioned library must meet two condit=
ions:
>  This section shows how to deal with both versioned and unversioned
>  pre-built libraries.
>
> +.. note::
> +
> +   In the shared library article referenced above, the link to the curre=
nt
> +   version of the Filesystem Hierarchy Standard (FHS) is out of date;
> +   the current FHS 3.0 release can be found
> +   `here <https://refspecs.linuxfoundation.org/FHS_3.0/index.html>`__.

Not sure adding a note to say a link is outdated is the good approach.
Instead update the link above?

>  Versioned Libraries
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> @@ -79,7 +86,7 @@ To write a recipe to use such a library in your system:
>  -  The vendor will typically ship release builds without debugging symbo=
ls.
>     Avoid errors by preventing the packaging task from stripping out the =
symbols
>     and adding them to a separate debug package. This is done by setting =
the
> -   ``INHIBIT_`` flags shown below.
> +   ``INHIBIT_*`` flags shown below.
>
>  The complete recipe would look like this::
>
> @@ -170,7 +177,7 @@ as follows::
>  The modifications cause the ``.so`` file to be the real library
>  and unset :term:`FILES_SOLIBSDEV` so that no libraries get packaged into
>  ``${PN}-dev``. The changes are required because unless :term:`PACKAGES` =
is changed,
> -``${PN}-dev`` collects files before `${PN}`. ``${PN}-dev`` must not coll=
ect any of
> +``${PN}-dev`` collects files before ``${PN}``. ``${PN}-dev`` must not co=
llect any of

Can you send this in a separate patch?

>  the files you want in ``${PN}``.
>
>  Finally, loadable modules, essentially unversioned libraries that are li=
nked


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


