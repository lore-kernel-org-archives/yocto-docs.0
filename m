Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFA2D132B4
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 11:31:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.55592.1730719854075847397
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 03:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MKedhLS+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 720AB2000A;
	Mon,  4 Nov 2024 11:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730719851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNaX+9jleyiGp8+my4xgPebV7MeqENnR6Dc6nyW8BIc=;
	b=MKedhLS+qX+u3cUW8sAPXqNWydfaqlT0+ga1WiX7aex4o4Q6q4UY9R5WpgrWUllv1FnoUz
	yPpbw4+KnLlDbG2sw6nnZjGTTBxYMYwvIMYql01jD4dJ68dZjrOJNrBRTf8RVNFe3YA5vu
	QQmeSG+YWjQdDIVC08hmgPPWYmfEDpRVOJuzOdKb3T1dthAKuNdTvIYJgeWJKWoqY99KLq
	P9YUiEzkKb7HT9IZmux62WLcmJiuh5n8WRtP8mxOxu+dfwMhNqUp/F/nRMA+ljMnzjZG9t
	V6qtKlMOiyb0HloX4TstmQhilZ6/du6abfsd6wWIQ96gt6oMOLnK8bmD3RSJtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 12:30:51 +0100
Message-Id: <D5DCZFE9XAQT.T004KMB89MUK@bootlin.com>
Subject: Re: [docs] [PATCH 2/5] documentation: Makefile: add SPHINXLINTDOCS
 to specify subset to sphinx-lint
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Julien Stephan" <jstephan@baylibre.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com> <20241031-add-bblock-documentation-v1-2-32b89093bbda@baylibre.com>
In-Reply-To: <20241031-add-bblock-documentation-v1-2-32b89093bbda@baylibre.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 11:31:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5651

Hi Julien,

On Thu Oct 31, 2024 at 5:56 PM CET, Julien Stephan wrote:
> make sphinx-lint runs sphinx-lint on the whole documentation which can be
> long and reports a lot or errors/warnings. Let's add a new
> SHPINXLINTDOCS variable to allow specifying a subset, just as VALEDOCS
> does. Keep variable assignment aligned and also use $(SOURCEDIR) by
> default for SPHINXLINTDOCS and VALEDOCS variables.
>
> Also update the README file and fix a typo in Link checking section
> title.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  documentation/Makefile | 23 ++++++++++++-----------
>  documentation/README   |  9 ++++++++-
>  2 files changed, 20 insertions(+), 12 deletions(-)
>
> diff --git a/documentation/Makefile b/documentation/Makefile
> index 189bd1dfac69d3b3185aa3a2ff7c212084ae280b..0bd9db5eaeb9122f9f396cda6=
1631c403a1325a0 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -3,17 +3,18 @@
> =20
>  # You can set these variables from the command line, and also
>  # from the environment for the first two.
> -SPHINXOPTS    ?=3D -W --keep-going -j auto
> -SPHINXBUILD   ?=3D sphinx-build
> +SPHINXOPTS     ?=3D -W --keep-going -j auto
> +SPHINXBUILD    ?=3D sphinx-build
>  # Release notes are excluded because they contain contributor names and =
commit messages which can't be modified
> -VALEOPTS      ?=3D --no-wrap --glob '!migration-guides/release-notes-*.r=
st'
> -VALEDOCS      ?=3D .
> -SOURCEDIR     =3D .
> -IMAGEDIRS     =3D */svg
> -BUILDDIR      =3D _build
> -DESTDIR       =3D final
> -SVG2PNG       =3D inkscape
> -SVG2PDF       =3D inkscape
> +VALEOPTS       ?=3D --no-wrap --glob '!migration-guides/release-notes-*.=
rst'
> +SOURCEDIR      =3D .
> +VALEDOCS       ?=3D $(SOURCEDIR)
> +SPHINXLINTDOCS ?=3D $(SOURCEDIR)
> +IMAGEDIRS      =3D */svg
> +BUILDDIR       =3D _build
> +DESTDIR        =3D final
> +SVG2PNG        =3D inkscape
> +SVG2PDF        =3D inkscape
> =20
>  ifeq ($(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else=
 echo 0; fi),0)
>  $(error "The '$(SPHINXBUILD)' command was not found. Make sure you have =
Sphinx installed")
> @@ -54,7 +55,7 @@ stylecheck:
>  	vale $(VALEOPTS) $(VALEDOCS)
> =20
>  sphinx-lint:
> -	sphinx-lint $(SOURCEDIR)
> +	sphinx-lint $(SPHINXLINTDOCS)
> =20
>  epub: $(PNGs)
>  	$(SOURCEDIR)/set_versions.py
> diff --git a/documentation/README b/documentation/README
> index 6a4db97d65b9c23828163d8b548485b2e302bc97..d2676ae2de9cb9c2dbe4191c0=
e38f8847cd8603b 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -149,7 +149,7 @@ lot of warnings/errors, thus one can run Vale on a su=
bset:
>    $ make stylecheck VALEDOCS=3D"<file1> <file2>"
>    $ make stylecheck VALEDOCS=3D<dir>
> =20
> -Link checking the Yocto Project documentation
> +Lint checking the Yocto Project documentation
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  To fix errors which are not reported by Sphinx itself,
> @@ -163,6 +163,13 @@ To run sphinx-lint:
> =20
>   $ make sphinx-lint
> =20
> +Lint checking the whole documentation might take some time and generate =
a
> +lot of warnings/errors, thus one can run sphinx-lint on a specific file:

s/on a specific file:/on a subset of files or directories:/

> +
> +  $ make sphinx-lint SPHINXLINTDOCS=3D<file>
> +  $ make sphinx-lint SPHINXLINTDOCS=3D"<file1> <file2>"
> +  $ make sphinx-lint SPHINXLINTDOCS=3D<dir>
> +
>  Sphinx theme and CSS customization
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


