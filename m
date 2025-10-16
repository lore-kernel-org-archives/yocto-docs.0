Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05B2CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:07:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3179.1760602058109123768
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GbxbGBsp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 62EEE1A1410
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:07:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 396AE6062C;
	Thu, 16 Oct 2025 08:07:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87D18102F22AA;
	Thu, 16 Oct 2025 10:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760602052; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X/mddfmxbq3xo5bD4r47dlOT1knjJs3eaaryU8F5/7g=;
	b=GbxbGBspGzTPteItFP8xokiLYZveswwhPMspwUtK7wVie38WHfLBeqnVSP1RXpCt9bIFXu
	bBrdtXtE15gxPEiO0iOK1a3eNyNYtr7+o+aaco1E8vlJ1EpUOOPXnz4eSIz4LNu4/9daaL
	4RzhnXGaSg7HnYDr9oNAkzGrkmRfV5GfcZ+p6dxDn3DXs4rL6WWKJFfsPod6giNtBgW5rz
	jCxFVw4lGZho8v21qU+x4xHMktX8MWT2oEo0dDJ5f7T8yyDQ3JroB03AAutvOhh2uvwSOw
	92sE/6v3fCe/t/iM2sQoxFcgBqEpXqmvmG4vHpIqES3ZJTchm+pVpsZ0kJSPNw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 10:07:27 +0200
Message-Id: <DDJLC71DQTXH.AHJQMUQJ187H@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document
 IMAGE_EXTRA_PARTITION_FILES
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20251014123019.3321312-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20251014123019.3321312-1-pierre-loup.gosse@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:07:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7708

Hi,

On Tue Oct 14, 2025 at 2:30 PM CEST, Pierre-loup GOSSE via lists.yoctoproje=
ct.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> Added by commit 3892912bd7e0 ("wic: extra partition plugin") in OE-Core.
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> ---
>  documentation/ref-manual/variables.rst | 39 ++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 591c03028..cdcc8b877 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3956,6 +3956,45 @@ system and gives an overview of their function and=
 contents.
>        material for Wic is located in the
>        ":doc:`/ref-manual/kickstart`" chapter.
> =20
> +   :term:`IMAGE_EXTRA_PARTITION_FILES`
> +      A space-separated list of files installed into the extra partition
> +      when preparing an image using the Wic tool with the
> +      ``extra_partition`` source plugin. By default,
> +      the files are
> +      installed under the same name as the source files. To change the
> +      installed name, separate it from the original name with a semi-col=
on
> +      (;). Source files need to be located in
> +      :term:`DEPLOY_DIR_IMAGE`. Here is a
> +      example::
> +
> +         IMAGE_EXTRA_PARTITION_FILES =3D "foo bar.conf;bar"

Here I think you can close this explanation with:

"""
In the above example, the file ``foo`` is installed with its original name
``foo``, while the file ``bar.conf`` is installed and renamed to ``bar``.
"""

> +
> +      Alternatively, source files can be picked up using a glob pattern.=
 In
> +      this case, the destination file must have the same name as the bas=
e
> +      name of the source file path. To install files into a directory
> +      within the target location, pass its name after a semi-colon (;).
> +      Here are two examples::
> +
> +         IMAGE_EXTRA_PARTITION_FILES =3D "foo/*"
> +         IMAGE_EXTRA_PARTITION_FILES =3D "foo/*;bar/"
> +
> +      The first example
> +      installs all files from ``${DEPLOY_DIR_IMAGE}/foo``
> +      into the root of the target partition. The second example installs
> +      the same files into a ``bar`` directory within the target partitio=
n.

Add:

"""
The ``bar/`` directory is automatically created if it does not exist.
"""

?

> +
> +      You can also specify the target by label, UUID or partname if mult=
iple
> +      extra partitions coexist. Here are two examples::
> +
> +         IMAGE_EXTRA_PARTITION_FILES_label-config =3D "foo/*"
> +         IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef531=
2d105d =3D "foo/*;bar/"

I think it would be nice to also show an example for partname.

And for each of these, the corresponding entries in the WKS file could be
listed, with each corresponding parameter. Maybe truncated to highlight the
matching WIC option.

> +
> +      You can find information on how to use the Wic tool in the
> +      ":ref:`dev-manual/wic:creating partitioned images using wic`"
> +      section of the Yocto Project Development Tasks Manual. Reference
> +      material for Wic is located in the
> +      ":doc:`/ref-manual/kickstart`" chapter.
> +
>     :term:`IMAGE_FEATURES`
>        The primary list of features to include in an image. Typically, yo=
u
>        configure this variable in an image recipe. Although you can use t=
his

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


