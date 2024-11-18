Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D95D43FEF
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 08:38:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.36712.1731919102033861734
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 00:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=npwcFB5V;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 496E0FF803;
	Mon, 18 Nov 2024 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731919099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egqXqo8C5hWxLzFiGCYbrUOui1MyAlT+KA/6QmsZzYk=;
	b=npwcFB5VreeiznH9TI+ICnTcsnN38YBZu0UZvBpbJauV9Fn6Zquc06KZtgdyWX2QM4xGII
	HdCKhAT0tIOOJJesxZYur3yRbktclPJI+8AxPGZeKQpvUXpI9WD6bTgTqvaKFUrO5w1F3n
	z5DEnPK0fMaPnfIZSmDjcdUoEGsdUyQYFl8p7R1j266LaM1QhFZAOLCbImh0vT8+yTTYwm
	uaP3A8Ttc49VpZrXF8RXw6e3eSNVx/P2aTfjwUyvNXl84T2jwEVUaH16xHQU+7XbJ15Ebr
	x1WDLuBFo7KMcwSqhwY/bP7qLqRArFJ//rzdsja3ykMhCdQR0RqQQAFmZrbEuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Nov 2024 09:38:19 +0100
Message-Id: <D5P62Y94U99V.316GUHX2VCQPS@bootlin.com>
To: <guenael.muller@smile.fr>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: use standardized method accross both
 ubuntu and debian for locale install
Cc: "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20241115123327.28081-1-guenael.muller@smile.fr>
In-Reply-To: <20241115123327.28081-1-guenael.muller@smile.fr>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Nov 2024 08:38:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5752

Hi Gu=C3=A9na=C3=ABl,

Thanks for the patch!

On Fri Nov 15, 2024 at 1:33 PM CET, Gu=C3=A9na=C3=ABl Muller via lists.yoct=
oproject.org wrote:
> Modify locale installation method to be standard accross all debian-based=
 distributions.
> Pre-existing method is available only on Ubuntu, locale-gen tool has no p=
arameter in Debian.
>
> Signed-off-by: Gu=C3=A9na=C3=ABl Muller <guenael.muller@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
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
> index 0fc92550a..5b481dd83 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -152,6 +152,14 @@ with a supported Ubuntu or Debian Linux distribution=
::
> =20
>     $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
> =20
> +You also need to ensure you have locale ``en_US.UTF-8`` enabled::

s/you have locale/you have the locale/ would look a bit better IMO :)

> +   $ locale --all-locales | grep en_US.utf8
> +
> +If this is not the case, You can reconfigure ``locales`` package to add =
it::

s/You/you/
s/You can reconfigure ``locales``/you can reconfigure the ``locales``/

> +    $ sudo dpkg-reconfigure locales

Can you fix the indent here? It should be 3 like above.

Otherwise, I could verify this with an Ubuntu docker image and a Debian doc=
ker
image, indeed Debian does not take arguments, I guess it assumes the locale=
s to
generate in a prior step. I was able to use the dpkg-reconfigure method on =
both
Ubuntu/Debian:

Tested-by: Antonin Godard <antonin.godard@bootlin.com>

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

