Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DCAE6C61E
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 09:04:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.15165.1733216641747276331
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 01:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XqWD86Zz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AB58FF80A;
	Tue,  3 Dec 2024 09:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733216639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPaOaoaqrKUFLTaRH4JBRo1pd50O0nst84eE9Adk94o=;
	b=XqWD86ZzOzNPvInXOL/1h4lBVEFzldhVYjCPbwB9JCkWL7yg7tnmQxAifPezrz86XBuKGN
	7GcEBurxl6oObNA3XZqjH/egrT8QOZjhbW3G5dnCpn8tOxMDzYneXPEiXsNodDfgf03t8S
	3qwopqslx+ykXFy6z+RfOR1Upc3Pu1Q1vgc3ZtrTRrIhBNIP2VXqw7gcLqd4yxp+hgfc9K
	ZTzBVnmJFegNeCkYeB8XB+19i6BN1yqWIVWGbaf9ioIfX7+fW3gjOVKlqC1Ow6Axq598Of
	OSkmUh8KYriiPd0gAwhMY82I6go/xmIIi9WM0CnjqsxYAUecwmaXwxPYAzLBQg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Dec 2024 10:03:58 +0100
Message-Id: <D61Y0RTA6HN8.H1BGL8IQXGZA@bootlin.com>
Subject: Re: [PATCH v4] ref-manual: use standardized method accross both
 ubuntu and debian for locale install
Cc: "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Gu=C3=A9na=C3=ABl_Muller?= <guenael.muller@smile.fr>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241202110128.27711-1-guenael.muller@smile.fr>
In-Reply-To: <20241202110128.27711-1-guenael.muller@smile.fr>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Dec 2024 09:04:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5865

Hi Gu=C3=A9na=C3=ABl,

On Mon Dec 2, 2024 at 12:01 PM CET, Gu=C3=A9na=C3=ABl Muller wrote:
> Modify locale installation method to be standard accross all debian-based=
 distributions.
> Pre-existing method is available only on Ubuntu, locale-gen tool has no p=
arameter in Debian.
>
> Signed-off-by: Gu=C3=A9na=C3=ABl Muller <guenael.muller@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
> Tested-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/poky.yaml.in                      |  3 +--
>  .../ref-manual/system-requirements.rst          | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
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
> index 0fc92550a..43c3c5834 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -152,8 +152,25 @@ with a supported Ubuntu or Debian Linux distribution=
::
> =20
>     $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
> =20
> +You also need to ensure you have the ``en_US.UTF-8`` locale enabled::
> +
> +   $ locale --all-locales | grep en_US.utf8
> +
> +If this is not the case, you can reconfigure the ``locales`` package to =
add it
> +(requires an interactive shell)::
> +
> +   $ sudo dpkg-reconfigure locales
> +
>  .. note::
> =20
> +   -  If you are not in an interactive shell, ``dpkg-reconfigure`` will
> +      not work as expected. To add the locale you will need to edit
> +      ``/etc/locale.gen`` file to add/uncomment the ``en_US.UTF-8`` loca=
le.
> +      A naive way to do this as root is::
> +
> +         $ echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
> +         $ locale-gen
> +
>     -  If your build system has the ``oss4-dev`` package installed, you
>        might experience QEMU build failures due to the package installing
>        its own custom ``/usr/include/linux/soundcard.h`` on the Debian

This looks good to me

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

