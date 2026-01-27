Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD50D2594B
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 07:20:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5207.1769498450657517044
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 23:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dSUVD7jg;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 844EC4E422CA
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 07:20:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45F1E606F5;
	Tue, 27 Jan 2026 07:20:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE818119A8676;
	Tue, 27 Jan 2026 08:20:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769498447; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HijaRvZt5dLywiCU6Jhj3evuJ0K0pLZC1kPBARdUDO0=;
	b=dSUVD7jgJjsNu4OhGQn4RSYMQmSODSwvgAGxCor7HyOS4T2U1uV7E9Aq1vzVV0NB6mWlb3
	BA36rXP0DE54+Bl6paNRF0FoQq1O8NUjDRCvdwNkslREWaweuXI2ajYC8NSwECibB9DRXE
	SPJtlbvQ5VYVb9umTf4kC9DAkJ3R74qMmoXTKC0G8YH+lraw8e1HL3NUlcd3XsQcRE9hCM
	/lzH4RcMXYDbXzcAxo/uimFc4muDvuvAbTLnNBtP9R7qIEXA63B7nMSnhW7KxX92WJCVBT
	K95prBkKUa9vCKawsnFV9PVa/sUnE0QladTJAu3GbMWkfHM33DhqpUCP+PIFHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 08:20:45 +0100
Message-Id: <DFZ6UJW9UHUQ.18C835K9CF52D@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document new FIT image
 variables
References: <20260108222011.2576150-1-adrian.freihofer@siemens.com>
In-Reply-To: <20260108222011.2576150-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 07:20:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8658

Hi,

On Thu Jan 8, 2026 at 11:20 PM CET, Adrian Freihofer via lists.yoctoproject=
.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> - FIT_MKIMAGE_EXTRA_OPTS: new variable to pass extra mkimage options
> - FIT_CONF_MAPPINGS for flexible DTB mappings
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/ref-manual/variables.rst | 44 ++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index ee776c110..734dfcbd4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3383,6 +3383,35 @@ system and gives an overview of their function and=
 contents.
> =20
>        This variable is used in the :ref:`ref-classes-kernel-fit-image` c=
lass.
> =20
> +   :term:`FIT_CONF_MAPPINGS`

Start with

"""
When inheriting the :ref:`ref-classes-kernel-fit-image`, the
:term:`FIT_CONF_MAPPINGS` variable allows ..."
"""

> +      Allows specifying mappings to rename configuration nodes or add ex=
tra
> +      configuration nodes for existing DTBs in FIT images. This provides

For clarity:
s/DTBs/device tree blobs (DTBs)/

Then you can use DTBs below?

> +      flexibility when a 1-1 mapping between DTB names and configuration

For clarity:
s/1-1/1 to 1/

> +      node names does not work.

Could you provide an example of such a scenario?

> +      The variable accepts a space-separated list of mapping commands:
> +
> +      - ``dtb-conf:DTB_NAME:NEW_NAME``

Two spaces after the list "-"

You could say that the ``DTB_NAME`` is the name of the DTB without its ``.d=
tb``
suffix?

> +        Renames the configuration node for a specific DTB.
> +
> +      - ``dtb-extra-conf:DTB_NAME:EXTRA_NAME``
> +        Creates an additional configuration node for an existing DTB.

I wonder why that would be needed? This would duplicate the configuration
without another name, but what's the point?

> +
> +      For example::
> +
> +         FIT_CONF_MAPPINGS =3D "\
> +             dtb-extra-conf:am335x-bonegreen:bonegreen \
> +             dtb-conf:am335x-boneblack:bbblack"
> +
> +      This generates three configuration nodes from two DTBs:
> +
> +      - ``am335x-bonegreen``: a standard configuration node for a DTB

I would rephrase to "the original configuration node for the
``am335x-bonegreen`` device tree".

> +      - ``bonegreen``: an extra configuration node for the same DTB

s/for the same DTB/for the same ``am335x-bonegreen`` DTB/

> +      - ``bbblack``: a renamed configuration node for the ``am335x-boneb=
lack`` DTB
> +
> +      The :ref:`ref-classes-kernel-fit-image` class validates all mappin=
gs
> +      and ensures they match existing DTBs.
> +
>     :term:`FIT_CONF_PREFIX`
>        When using the :ref:`ref-classes-kernel-fit-image`, this is the pr=
efix
>        used for creating FIT configuration nodes. Its default value is "c=
onf-".
> @@ -3473,6 +3502,21 @@ system and gives an overview of their function and=
 contents.
>        The default value is set to "x509" by the
>        :ref:`ref-classes-kernel-fit-image` class.
> =20
> +   :term:`FIT_MKIMAGE_EXTRA_OPTS`

Instead of ending the definition with "The :ref:`ref-classes-kernel-fit-ima=
ge`
class uses this variable.", just start with "When inheriting the
:ref:`ref-classes-kernel-fit-image`, the :term:`FIT_MKIMAGE_EXTRA_OPTS` var=
iable ..."

> +      This variable allows passing extra options to ``mkimage`` during F=
IT
> +      image generation, providing flexibility for platforms that require
> +      additional ``mkimage`` arguments beyond the defaults.
> +
> +      For example::
> +
> +         FIT_MKIMAGE_EXTRA_OPTS =3D "-B 8 -E"
> +
> +      This results in the ``mkimage`` command being invoked as::
> +
> +         mkimage -B 8 -E -f fit-image.its fitImage

Nit:

"""
This results in the ``mkimage`` command being invoked as:

.. parsed-literal::

   mkimage *-B 8 -E* -f fit-image.its fitImage
"""

This will highlight the new options

> +
> +      The :ref:`ref-classes-kernel-fit-image` class uses this variable.
> +
>     :term:`FIT_PAD_ALG`
>        Specifies the padding algorithm used in creating the FIT Image.
>        The default value is set to "pkcs-1.5" by the

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


