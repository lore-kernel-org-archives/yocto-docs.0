Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4E8CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 10:44:48 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.40443.1760352284120898140
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 03:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PYvpQK9F;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D4991A1334;
	Mon, 13 Oct 2025 10:44:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34904606C6;
	Mon, 13 Oct 2025 10:44:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3D64102F2250;
	Mon, 13 Oct 2025 12:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760352281; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RMcNRcKykKcaLiTglx1ivx8CVRR6t3wHNGVj+pSEgds=;
	b=PYvpQK9FsMZnM9pmD94JscX6EP9rdE/+L9QU7t1qerIMCTYritkLm3s9N9ipYH49GEGyMV
	BVK7F+gIv0K/BrIp3P2VQLlMKpB9SAHjcIlY4UzqtC06JKw/JphkfLCVcVKvz3o2cr9uHv
	NwFJ5aqQfWB18lSfR8zwhOiaHfMbkzGoJN8+Pj1WJErQo1dDukGWFJoxGqUhkiStLr6C2o
	FuyvHlX0IPJSCIh+xYId5PjmAv6ANoLH+2+0s50DHVkedKWXqEPSQDFLu1hLwyt21a8jZw
	hJmjQdLqSZmYhZQgFe2wp+04ohpXnkeA4iwiPXYUN0hwXNDTZ3Sx1+1vAkPnFw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 12:44:38 +0200
Message-Id: <DDH4SWMDF96V.357XHVKSKC1HA@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: add note about PSEUDO
 ignore/include precedence
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <skandigraun@gmail.com>, <docs@lists.yoctoproject.org>
References: <20251010142311.3509374-1-skandigraun@gmail.com>
In-Reply-To: <20251010142311.3509374-1-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 10:44:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7691

On Fri Oct 10, 2025 at 4:23 PM CEST, Gyorgy Sarvari via lists.yoctoproject.=
org wrote:
> This commit[1] in pseudo introduced the PSEUDO_INCLUDE_PATHS variable, ho=
wever
> the previous PSEUDO_IGNORE_PATHS variable is still present also. Add a cl=
arifying
> note about the order of precedence of the two.
>
> [1]: https://git.yoctoproject.org/pseudo/commit/?id=3D2c43381180f9cfef4c0=
a8bb0c1658a86c3fcc876
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 1d4ec413ca..d180341079 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7567,7 +7567,9 @@ system and gives an overview of their function and =
contents.
>        by pseudo when monitoring and recording file operations, in order =
to avoid
>        problems with files being written to outside of the pseudo context=
 and
>        reduce pseudo's overhead. A path is ignored if it matches any pref=
ix in the list
> -      and can include partial directory (or file) names.
> +      and can include partial directory (or file) names. In case a path =
prefix is
> +      present in both this, and in :term:`PSEUDO_INCLUDE_PATHS` variable=
, then
> +      the latter takes precedence.
> =20
>     :term:`PSEUDO_INCLUDE_PATHS`
>        A comma-separated (without spaces) list of path prefixes that shou=
ld be included

In these kind of situations, I think a good way of being extra clear is:

"""
In case a path prefix is present in both :term:`PSEUDO_IGNORE_PATHS` and in
:term:`PSEUDO_INCLUDE_PATHS`, :term:`PSEUDO_INCLUDE_PATHS` takes precedence=
.
"""

What do you think?

Also, we could probably add the same sentence to PSEUDO_INCLUDE_PATHS's
description?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


