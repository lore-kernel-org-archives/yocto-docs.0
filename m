Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4ABD10DD5
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 09:02:58 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.170369.1733130173773065897
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Dec 2024 01:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SwXa0WW2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCDA81C000C;
	Mon,  2 Dec 2024 09:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733130172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQI/hoXiydxc+md8KQLMNAVAyHfg9q8ybPrdwYl+dqg=;
	b=SwXa0WW2lNkcNApBcONwxQThkalN2Yrcjr+YraWE39OLkHEnMAMfxOLn4lfeP0qdyFPFod
	jKEVlBfG28UKNPxSOOre6gU82pXIlTSxkunteO403gwSLuoRO+GZ5K1ZuACwcULgjXi15x
	UyBWnED/q3kySnmyijZ3PHVGz6md6W1LbYKD5LyzivFXba7/Vhiokd25NgQvcS2wuh8t0K
	dra6QyHW3kg4JGJsgrZQoNXXmHNWJQ8K0jUyps15unKmxcpt30IIJUQJqcG+N3CrJ5826K
	mdsfX8YIaslket3vwWEiuJs2QCGNgDnEqol7MLx3wNmXUVsUMva9YMpQSjMSdQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Dec 2024 10:02:51 +0100
Message-Id: <D613DDACPBYI.1YDZEEN2GB07L@bootlin.com>
To: <michael.opdenacker@rootcommit.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/3] dev-manual/bmaptool.rst: add missing command
 for bmaptool-native
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
 <20241201173801.3290796-2-michael.opdenacker@rootcommit.com>
In-Reply-To: <20241201173801.3290796-2-michael.opdenacker@rootcommit.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Dec 2024 09:02:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5862

Hi Michael,

On Sun Dec 1, 2024 at 6:38 PM CET, Michael Opdenacker via lists.yoctoprojec=
t.org wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> Otherwise, running "oe-run-native bmaptool-native bmaptool ..."
> fails as follows:
>
> Error: Have you run 'bitbake bmaptool-native -caddto_recipe_sysroot'?
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  documentation/dev-manual/bmaptool.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
> index 493abf7607..5fc46c7792 100644
> --- a/documentation/dev-manual/bmaptool.rst
> +++ b/documentation/dev-manual/bmaptool.rst
> @@ -23,6 +23,7 @@ system image files much faster.
>        need to build `bmaptool` before using it. Use the following comman=
d::

s/command/commands/ or see comment below

> =20
>           $ bitbake bmaptool-native
> +         $ bitbake bmaptool-native -caddto_recipe_sysroot

Isn't running `bitbake bmaptool-native -caddto_recipe_sysroot` enough? I
would say addto_recipe_sysroot implies building the recipe, but I might be
wrong!

Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

