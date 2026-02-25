Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F72CFD3771
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 15:55:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48452.1772034900212363902
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 07:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mXZXxBsu;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1AAD7C143FD
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 15:55:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F3BC5FDE6
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 15:54:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A5981036924B;
	Wed, 25 Feb 2026 16:54:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772034897; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=CJjw76ibf08y7p0Jg0nigungYqEkQe5EeaTrdK9sxsw=;
	b=mXZXxBsuDP0jbeYeQnvwMxcfgTCkj8JTy9SkYypfeI53GevQc/jVSgdlME9mzcFL3b7+AX
	1TDkVZrwJ25NsUjenndlAXgL+bMYDrDKo58p5Iu9/bcSrK1rhSCGImqyUd4HvMJLhd3Nek
	TFaZh77fLfxnHtI/+++ak21SYiGHf6TcuMnbD8lj0GgarCEfSik9hT0VfyK01nOBqhaUHe
	PGim1Xex8vyiBGilAe4sYrAuRNpU7ooN1vo11Ho2c0w5ipElsjfKrAPJgB9cEO284uBvyz
	DOlnehzif9WbuJIWo4ho/BVKkAyoTalasAcVCjIXyMvQa0SFUimYwFJ+XAnCww==
Date: Wed, 25 Feb 2026 16:54:54 +0100
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: add SPDX_INCLUDE_KERNEL_CONFIG and
 SPDX_INCLUDE_PACKAGECONFIG
Message-ID: <aZ8bChlnuFVgvily@tpx1.home>
References: <20260225110800.126491-1-kamel.bouhara@bootlin.com>
 <DGO3PZFM5WDO.3C92IW83D5RXA@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGO3PZFM5WDO.3C92IW83D5RXA@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 15:55:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8992

On Wed, Feb 25, 2026 at 03:10:23PM +0100, Antonin Godard wrote:
> Hi,
>
> Thanks! This looks good to me.
>
> I've just fixed the alphabetical order in variables.rst locally:
>

Sorry for that and thanks !

> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 2e812d02d..45073d8a0 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9096,31 +9096,6 @@ system and gives an overview of their function and contents.
>        ``qemux86-64``, the uncompressed SBOM file can grow from hundreds
>        of megabytes to several gigabytes.
>
> -   :term:`SPDX_INCLUDE_SOURCES`
> -      This option allows to add a description of the source files used to build
> -      the host tools and the target packages, to the ``spdx.json`` files in
> -      ``tmp/deploy/spdx/MACHINE/recipes/`` under the :term:`Build Directory`.
> -      As a consequence, the ``spdx.json`` files under the ``by-namespace`` and
> -      ``packages`` subdirectories in ``tmp/deploy/spdx/MACHINE`` are also
> -      modified to include references to such source file descriptions.
> -
> -      Enable this option as follows::
> -
> -         SPDX_INCLUDE_SOURCES = "1"
> -
> -      For SPDX 2.2 format (release 4.1 "langdale"), building
> -      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
> -      this option multiplied the total size of the ``tmp/deploy/spdx``
> -      directory by a factor of 3  (+291 MiB for this image),
> -      and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
> -      ``tmp/deploy/images/MACHINE`` by a factor of 130 (+15 MiB for this
> -      image), compared to just using the :ref:`ref-classes-create-spdx` class
> -      with no option.
> -
> -      With SPDX 3.0.1 JSON format, including source files significantly
> -      increases the SBOM size (potentially by several gigabytes for typical
> -      images).
> -
>     :term:`SPDX_INCLUDE_KERNEL_CONFIG`
>        This option allows exporting the Linux kernel configuration
>        (the contents of the ``.config`` file) into the recipe's SPDX
> @@ -9164,6 +9139,31 @@ system and gives an overview of their function and contents.
>        the SPDX SBOM to determine which optional features were
>        enabled or disabled in a given build.
>
> +   :term:`SPDX_INCLUDE_SOURCES`
> +      This option allows to add a description of the source files used to build
> +      the host tools and the target packages, to the ``spdx.json`` files in
> +      ``tmp/deploy/spdx/MACHINE/recipes/`` under the :term:`Build Directory`.
> +      As a consequence, the ``spdx.json`` files under the ``by-namespace`` and
> +      ``packages`` subdirectories in ``tmp/deploy/spdx/MACHINE`` are also
> +      modified to include references to such source file descriptions.
> +
> +      Enable this option as follows::
> +
> +         SPDX_INCLUDE_SOURCES = "1"
> +
> +      For SPDX 2.2 format (release 4.1 "langdale"), building
> +      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
> +      this option multiplied the total size of the ``tmp/deploy/spdx``
> +      directory by a factor of 3  (+291 MiB for this image),
> +      and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
> +      ``tmp/deploy/images/MACHINE`` by a factor of 130 (+15 MiB for this
> +      image), compared to just using the :ref:`ref-classes-create-spdx` class
> +      with no option.
> +
> +      With SPDX 3.0.1 JSON format, including source files significantly
> +      increases the SBOM size (potentially by several gigabytes for typical
> +      images).
> +
>     :term:`SPDX_LICENSES`
>        Path to the JSON file containing SPDX license identifier mappings.
>        This file maps common license names to official SPDX license
>
> Antonin

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

