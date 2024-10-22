Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE67FD1CDAD
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 08:01:53 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.13256.1729584107236914447
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 01:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cU1GyuHW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D7BA1BF209;
	Tue, 22 Oct 2024 08:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729584105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVRQRTHW6dDYXGFZlQ4uCTf27y6jibr78djPiJEfuQY=;
	b=cU1GyuHWsuST+l+mcDNrz6xSuyRBc8GPdX4YVNa/XW/XnhlD6wW1r7YCbNteylRMN0e3XZ
	BWAheo4E8xWRpKujzZBHCzbD5zCgvXj18BrFrZ3VfvxWeLexV3jy2LyzlwQAfo5rHSaGET
	nsvb/qdONOeeIp8qj8kUreNF31/NgATNhj2sV7q3K3XJNYSUhC2PKy5npBPGbsif2FNMZl
	PplSiy5Rjv6ITMhtNPsvwGYTDwTjlOYaTSzVHFv+gnMvMZW1KAJULn25XoMgwoOvW+uDYh
	R2RY4T6bMxpWIZGNNheuENPkaIyjK13LNgfALGjiVZYX6MtrglzqiZZj94zq6g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 10:01:44 +0200
Message-Id: <D526E8MHBD6R.2Y9P283WRSLVY@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs
 docs
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <chris.laplante@agilent.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241021152254.1745411-1-chris.laplante@agilent.com>
In-Reply-To: <20241021152254.1745411-1-chris.laplante@agilent.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 08:01:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5544

Hi Chris,

On Mon Oct 21, 2024 at 5:22 PM CEST, Chris Laplante via lists.yoctoproject.=
org wrote:
> From: Chris Laplante <chris.laplante@agilent.com>
>
> 1. Make it clear that IMAGE_FSTYPES has to contain tar.bz2
> 2. Fix the 'cp -a packages-split/bash-dbg/* path/debugfs' step to not
>    literally try to copy a file called '*'
>
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
>  documentation/dev-manual/debugging.rst | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-m=
anual/debugging.rst
> index 92458a0c37..6b5d2dd820 100644
> --- a/documentation/dev-manual/debugging.rst
> +++ b/documentation/dev-manual/debugging.rst
> @@ -1006,8 +1006,9 @@ debugger.
>
>        IMAGE_GEN_DEBUGFS =3D "1"
>        IMAGE_FSTYPES_DEBUGFS =3D "tar.bz2"
> +      IMAGE_FSTYPES:append =3D " tar.bz2"
>
> -   These options cause the
> +   The first two lines cause the
>     OpenEmbedded build system to generate a special companion filesystem
>     fragment, which contains the matching source and debug symbols to
>     your deployable filesystem. The build system does this by looking at
> @@ -1016,8 +1017,9 @@ debugger.
>
>     The companion debug filesystem is not a complete filesystem, but only
>     contains the debug fragments. This filesystem must be combined with
> -   the full filesystem for debugging. Subsequent steps in this procedure
> -   show how to combine the partial filesystem with the full filesystem.
> +   the full filesystem for debugging. The third line ensures that the
> +   build system generates a tar.bz2-formatted copy of the full filesyste=
m,
> +   which will be used in subsequent steps in this procedure.
>
>  #. *Configure the system to include gdbserver in the target filesystem:*
>
> @@ -1142,7 +1144,7 @@ debugger.
>        $ bitbake -c devshell bash
>        $ cd ..
>        $ scp packages-split/bash/bin/bash target:/bin/bash
> -      $ cp -a packages-split/bash-dbg/\* path/debugfs
> +      $ cp -a packages-split/bash-dbg/* path/debugfs
>
>  Debugging with the GNU Project Debugger (GDB) on the Target
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Thanks, I verified and indeed, we do need this addition for subsequent step=
s.

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

