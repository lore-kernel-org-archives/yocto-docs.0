Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F42D1AD24
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 08:12:15 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.17964.1729066328867202603
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 01:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mmdoK0Hn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 511F560004;
	Wed, 16 Oct 2024 08:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729066326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bgItrFihT1HYx+9eppikjEv0UfbeQDTlBmCwUkrWxOU=;
	b=mmdoK0HnzNhLlo8TVzcSAw6MHzRpTYaUItcddz25Q9qSpzRpQ9ME4MGd4BkrDXKa4Pju7u
	euIKh1s+FfHoTt2GZ2cFpmRWbg+7tSxYJPcSRtuIfDuiKb+r6Wfw0pD/C/k/sYwokP+Wxi
	K8445wsggOFM8LRYTznkv2HNWJ6/FZUP1ifIPfqJCIG3Js0/AXMsFqBqxK4qEdTwIKYf8r
	sNW5aqaJpruHwx9EiY6wo4kQ3a0hpsfQltzuMM+Y6SSqDQ9bQMjFN3tfYWoC3bb6rRI8GQ
	eQCZtTqtRkDXqa0uirknsjvOYxZFSInq8aXm7loj1/RCBYDK2QOWySz8WzRz8A==
Date: Wed, 16 Oct 2024 10:12:05 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: niko.mauno@vaisala.com
Cc: docs@lists.yoctoproject.org, quentin.schulz@cherry.de
Subject: Re: [docs] [PATCHv2 2/2] docs: Replace VOLATILE_TMP_DIR with
 FILESYSTEM_PERMS_TABLES
Message-ID: <txudacpuo4gp6kgmxvmdlbwpl26n5uwubbo7jhwudharzyu6i7@jtqtnmowzsjt>
References: <20241015160735.3066914-1-niko.mauno@vaisala.com>
 <20241015160735.3066914-2-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241015160735.3066914-2-niko.mauno@vaisala.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 08:12:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5496

Hi Niko,

Thanks for the patches!

On 15/10/2024 16:07:35+0000, Niko Mauno via lists.yoctoproject.org wrote:
> The VOLATILE_TMP_DIR variable was removed and it's functionality
> replaced with a FILESYSTEM_PERMS_TABLES entry in
> https://git.yoctoproject.org/poky/commit/?id=2f46b6f27dfa3a9d5ad177900fcecfe64c3536f1
> ("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead")
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  .../migration-guides/migration-5.1.rst        |  5 ++++
>  .../migration-guides/release-notes-4.2.rst    |  2 +-
>  documentation/ref-manual/variables.rst        | 29 ++++++-------------
>  3 files changed, 15 insertions(+), 21 deletions(-)
>
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
> index f58de3156d..64944b99cd 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -122,6 +122,11 @@ The following variables have been removed:
>     ``files/fs-perms-volatile-log.txt``, which means that volatile log is
>     enabled. Users can disable the volatile log by removing the value
>     ``files/fs-perms-volatile-log.txt`` from ``FILESYSTEM_PERMS_TABLES``.
> +-  ``VOLATILE_TMP_DIR``: :term:`FILESYSTEM_PERMS_TABLES` is now used instead.
> +   By default, ``FILESYSTEM_PERMS_TABLES`` now contains the value
> +   ``files/fs-perms-volatile-tmp.txt``, which means that volatile tmp is
> +   enabled. Users can disable the volatile tmp by removing the value
> +   ``files/fs-perms-volatile-tmp.txt`` from ``FILESYSTEM_PERMS_TABLES``.

Nit: can you add an extra space between the first and the second bullet point?
To align with the rest of the doc.

>  .. _migration-5.1-removed-recipes:
>
> diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
> index 30049b89f6..ac3bb9cebe 100644
> --- a/documentation/migration-guides/release-notes-4.2.rst
> +++ b/documentation/migration-guides/release-notes-4.2.rst
> @@ -38,7 +38,7 @@ New Features / Enhancements in 4.2
>
>  -  New variables:
>
> -   -  :term:`VOLATILE_TMP_DIR` allows to specify
> +   -  VOLATILE_TMP_DIR allows to specify
>        whether ``/tmp`` should be on persistent storage
>        or in RAM.
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 62a225ed1b..59ecfaf016 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2994,11 +2994,11 @@ system and gives an overview of their function and contents.
>        and users across an entire work project. It is best to do this in the
>        packages themselves but this is not always possible.
>
> -      By default, the OpenEmbedded build system uses the ``fs-perms.txt`` and
> -      ``fs-perms-volatile-log.txt`` which are located in the ``meta/files``
> -      folder in the :term:`Source Directory`. If you create your own file
> -      permission setting tables, you should place those in your layer or the
> -      distro's layer.
> +      By default, the OpenEmbedded build system uses the ``fs-perms.txt``,
> +      ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt`` which are
> +      located in the ``meta/files`` folder in the :term:`Source Directory`. If
> +      you create your own file permission setting tables, you should place

s/your own file permission setting tables/your own permission setting table files/?

> +      those in your layer or the distro's layer.

Seems confusing to me… I would just say "those in your layer.".

>        You can override the value of :term:`FILESYSTEM_PERMS_TABLES` variable
>        in the ``conf/local.conf`` file, which is found in the
> @@ -3009,11 +3009,12 @@ system and gives an overview of their function and contents.
>
>        In order to disable the volatile log, which is enabled by default, one
>        can remove the ``files/fs-perms-volatile-log.txt`` value from
> -      ``FILESYSTEM_PERMS_TABLES``.
> +      ``FILESYSTEM_PERMS_TABLES``. Similarly, in order to disable the volatile
> +      tmp, one can remove the ``files/fs-perms-volatile-tmp.txt`` value.
>
>        For guidance on how to create your own file permissions settings
> -      table files, examine the existing ``fs-perms.txt`` and
> -      ``fs-perms-volatile-log.txt``.
> +      table files, examine the existing ``fs-perms.txt``,
> +      ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt``.

I would end this sentence with "files": "...and ``fs-perms-volatile-tmp.txt``
files.".

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

