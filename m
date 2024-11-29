Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E6BD6EC09
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 13:28:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.115074.1732886891653924886
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 05:28:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S4c5EzzN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B42811BF209;
	Fri, 29 Nov 2024 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732886890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7v/9PEwloG+ZiHnNYB272ya90hLa8LaaybIX1Ns3lg=;
	b=S4c5EzzNp0BlDQ7wQRPDttPIH87jRHGIvrI4LlUA75zdFpRn0eJwqpd+WB2AiSm7183Suo
	oFzWorq0RwSYA2Y8B9xdZq0/VEsbDUgU7LF1gZ/6WIyzFEM6WF0sflIYApYjobKNqQ8+Ii
	IEbRhbq0MbEug4WS37U/8WZk86pmgRuaMRhptkaGDP3pUjGtmyM6QK605OcdSXsKTCvM5Z
	d+vGIlkd9TtN2DqsDpaLSJXqHzePapqRFVGLQ9GieVRbPUkBHjU1YQzHnDoWc3NafJEhaD
	1YmjA8bublfuAY5Eu87rlRFMt0x4AeXsaHvtluhKQyIH5C06Xaig32aBNIw07w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 14:28:09 +0100
Message-Id: <D5YP4V10LETS.111OFUJJIA8KT@bootlin.com>
To: =?utf-8?q?Gu=C3=A9na=C3=ABl_Muller?= <guenael.muller@smile.fr>,
 <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v3] ref-manual: use standardized method accross both
 ubuntu and debian for locale install
Cc: "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241129103644.33021-1-guenael.muller@smile.fr>
In-Reply-To: <20241129103644.33021-1-guenael.muller@smile.fr>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 13:28:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5849

Hi Gu=C3=A9na=C3=ABl,

On Fri Nov 29, 2024 at 11:36 AM CET, Gu=C3=A9na=C3=ABl Muller wrote:
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
>  documentation/poky.yaml.in                       |  3 +--
>  documentation/ref-manual/system-requirements.rst | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
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
> index 0fc92550a..f53b9fdbd 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -152,8 +152,22 @@ with a supported Ubuntu or Debian Linux distribution=
::
> =20
>     $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
> =20
> +You also need to ensure you have the ``en_US.UTF-8`` locale enabled::
> +
> +   $ locale --all-locales | grep en_US.utf8
> +
> +If this is not the case, you can reconfigure the ``locales`` package to =
add it (interactive mode only)::

s/interactive mode only/requires an interactive shell/?

Nitpick, but our documentation/standards.md file recommends a line length o=
f 80
characters, we try to stick to it. Could you format the lines to this lengt=
h,
please?

> +
> +   $ sudo dpkg-reconfigure locales
> +
>  .. note::
> =20
> +   -  If your are not using the interactive mode, ``dpkg-reconfigure`` w=
ill not work as expected. To add the locale

s/your/you/
s/are not using the interactive mode/are not in an interactive shell/?

> +      you will need to edit ``/etc/locale.gen`` file to add/uncomment th=
e ``en_US.UTF-8`` locale. A naive way to do this as root is::
> +
> +         $ echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
> +         $ locale-gen
> +
>     -  If your build system has the ``oss4-dev`` package installed, you
>        might experience QEMU build failures due to the package installing
>        its own custom ``/usr/include/linux/soundcard.h`` on the Debian

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

