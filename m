Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B876FD49209
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 11:00:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.38353.1731927622233082327
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 03:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l1AiSdGg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D44A0C0002;
	Mon, 18 Nov 2024 11:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731927621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pcERrFnd9k3IEiz+3SaC1DEDXXry7bsKy5uVUzgSpmI=;
	b=l1AiSdGgU4xSYCxT9na/sJWNB6+fD3S0FraQhsUUHd4X1vXMblCrLXpoPg+CZUNGKQpmFh
	mvRSQdW6JILzMLRnNg4S7F9R+PyK51Sbh7i/bDFz23x0AtvUqJ7H2OiHfB5g5xWocwAEot
	cqM1CJgy3GZ0rYBBZNEXpbS6cLj8xdDznl2w6hkjoko4LKu4vXpmykyoA8QRvKalWeYvri
	Bq+RX4iQD9PlaZj1zrhB+BMo57Y9NE8N+6VMICtXyZBJqvxTcAk7n6z/A3Zq+RiAN5WK4x
	yJ+ZY3h/POcQrI7PezaeoW4AmugSDAsu1JQjaHcnXFvIQ1O9E5IiD1LMFe4hhQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Nov 2024 12:00:20 +0100
Message-Id: <D5P93P1O12UG.NQJAUDP1T6Z8@bootlin.com>
Subject: Re: [PATCH v2] ref-manual: use standardized method accross both
 ubuntu and debian for locale install
Cc: "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Gu=C3=A9na=C3=ABl_Muller?= <guenael.muller@smile.fr>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241118104524.25392-1-guenael.muller@smile.fr>
In-Reply-To: <20241118104524.25392-1-guenael.muller@smile.fr>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Nov 2024 11:00:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5758

Hi Gu=C3=A9na=C3=ABl,

On Mon Nov 18, 2024 at 11:45 AM CET, Gu=C3=A9na=C3=ABl Muller wrote:
> Modify locale installation method to be standard accross all debian-based=
 distributions.
> Pre-existing method is available only on Ubuntu, locale-gen tool has no p=
arameter in Debian.
>
> Signed-off-by: Gu=C3=A9na=C3=ABl Muller <guenael.muller@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> Tested-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/poky.yaml.in                       | 3 +--
>  documentation/ref-manual/system-requirements.rst | 8 ++++++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index c770318f2..66f758fe8 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -13,8 +13,7 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/y=
octo-&DISTRO;"
>  UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo g=
cc \
>       build-essential chrpath socat cpio python3 python3-pip python3-pexp=
ect \
>       xz-utils debianutils iputils-ping python3-git python3-jinja2 \
> -     python3-subunit zstd liblz4-tool file locales libacl1
> -     \n\   $ sudo locale-gen en_US.UTF-8"
> +     python3-subunit zstd liblz4-tool file locales libacl1"
>  FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 =
unzip perl patch \
>       diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath =
\
>       ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl=
-bignum socat \
> diff --git a/documentation/ref-manual/system-requirements.rst b/documenta=
tion/ref-manual/system-requirements.rst
> index 0fc92550a..b33518c7f 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -152,6 +152,14 @@ with a supported Ubuntu or Debian Linux distribution=
::
> =20
>     $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
> =20
> +You also need to ensure you have the locale ``en_US.UTF-8`` enabled::
> +
> +   $ locale --all-locales | grep en_US.utf8
> +
> +If this is not the case, you can reconfigure the ``locales`` package to =
add it::
> +
> +   $ sudo dpkg-reconfigure locales
> +
>  .. note::
> =20
>     -  If your build system has the ``oss4-dev`` package installed, you

Looks good, thanks!

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


