Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1D0E77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 08:35:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.18859.1735202135523754852
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Dec 2024 00:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oPvvPy1j;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 742501C0003;
	Thu, 26 Dec 2024 08:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735202133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+xHdsoI1fc4LidB0bNgpPxxAx64fajvv1D+WJoEoaT4=;
	b=oPvvPy1jN9003ApRkCzCFZrA7dJz8M8FeKBfw91CX0P02xH3w73o+Y+cLYpascPHefwt0V
	gGXSpRwQu8t67W7h+fI04XhSNz+mPUwUz4XExAfppxKYpZm+qQrADEafr5AP4Fe5Nqkrr+
	3cv3NoG5GmVCaizF/94e1EsqdgtrM4p8HvYXdQx1ZES4sqN0Zl0BJ+7yVtN5/0lgQ8bcGV
	PkkE8kOnnidL1zU0N3l58GlBBmocd0sVD3q8umqBaiHBnYZ2rcGrKVVJWgge4JjHBJBkTq
	TDaERAVdbl2QBP/z+MI1U4qNPEP8hwFd1ZoksP5v1FjUUBiw5wo4MDVzeLJDYQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Dec 2024 09:35:33 +0100
Message-Id: <D6LHTJ9X8HQN.Z95U1XVX695N@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 3/3] sdk-manual: extensible.rst: remove confusing
 post-install-logging
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241224140251.24389-1-adrian.freihofer@siemens.com>
 <20241224140251.24389-4-adrian.freihofer@siemens.com>
In-Reply-To: <20241224140251.24389-4-adrian.freihofer@siemens.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Dec 2024 08:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6036

On Tue Dec 24, 2024 at 3:02 PM CET, Adrian Freihofer via lists.yoctoproject=
.org wrote:
> This is a fix for 22dc5b3be3b1fbdb9447999b71f79db055271826, which has
> completely replaced debug-tweaks. But in the context of devtool ide-sdk
> and the comment in the example, the post-install-logging-image feature
> doesn't really make much sense. Therefore, remove it.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/sdk-manual/extensible.rst | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-=
manual/extensible.rst
> index 3733997fa..1cb1bb47c 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -658,7 +658,6 @@ The extensible SDK supports two different development=
 modes.
>           allow-empty-password \
>           allow-root-login \
>           empty-root-password \
> -         post-install-logging \
>        "
> =20
>        # Remote debugging needs gdbserver on the target device

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


