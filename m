Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763AFFA373E
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 19:04:30 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.2096.1666724664627803512
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 12:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U2c4clvX;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id y14so15139770ejd.9
        for <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 12:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w3icFomaC9oenDOAl+kEDKxQrPSigMz8pZFx1H5Xk3s=;
        b=U2c4clvXSW054tgcDmKmDafP2q+pap4EHVpqwZWIJYlHu89mhhBfszmLSC3WtRu3tJ
         ShvMsplXdigVr7zUksq4p7qEDGgsaueLDPrdKrsGXbAHwpNZbbPrh4w8ugnPZhcJJEA6
         WwEGuC1K7knZxNoREi79IcFDpmZRJ/qKtbT2E2CVkYWQqBsuQ2cu8ObVsE+CsCuksR1H
         kdmGmoPnn2GPV32RHyh8KHSQqYGGfxaY99P9GYNJcgSIMN8Rrq91bOyCxs3nsGZDpnwV
         pT8YNUllM+nMbmYpPaxJ2m8aVCwrZke7LAMyAUv3kN6SctUzMjV2ujnrvJT8AOph+udT
         theQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3icFomaC9oenDOAl+kEDKxQrPSigMz8pZFx1H5Xk3s=;
        b=XbIBcYk/6FRJTbZQVwAz5UxhAhKcmmF6ACxaZLn/84veITfgfRbpXT5CDDd42ltfd+
         fdgrpdNDyGx65SJ0hpIXpZGfIEaqdk24Ckg55pPbZEpmEVmG+WJ1Sv+CHwHZJAGuFohx
         LC/ZL4Q4YkbqtbMK2iCU3Rslj/rDVL3LtwjPSeToiEqLV72cSA/hzArrTDeU4zWhabSe
         Ng/0r/hbPdENAhn+0VqnXI9ighji6pnLhCpd13SFKXxBAcNp6QHv1fRL2evfw6OuCtHc
         Q46K6ooPBBz+d5dI5DZ8OdsbHo50O+UPjH/rz/VBfKrMt8IVk0hrXTAqxdKBCSUKzxvh
         EXWQ==
X-Gm-Message-State: ACrzQf2LZSdIlOsqVcKnXHzlKNbt8MUnjpo/J4Gw89KCCdPjlCMnq+V6
	IprHfW6iOHJNbgmwad358q4tI3FGGx8FAdvJ4CwDPr+G
X-Google-Smtp-Source: AMsMyM7vb5w03i4FFHMsWh876fnc2lDYwJL20Tb2E/cfDBxbtpTvMB1FZKkyMkey9vtHTA2MBcHvTW4aWFArvpVI/Pw=
X-Received: by 2002:aa7:dc06:0:b0:461:b683:5fba with SMTP id
 b6-20020aa7dc06000000b00461b6835fbamr12231828edu.72.1666724651987; Tue, 25
 Oct 2022 12:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221025160014.2858893-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20221025160014.2858893-1-michael.opdenacker@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 25 Oct 2022 14:04:00 -0500
Message-ID: <CAJdd5GbVCX5hbBns_n_2N066zB07MWukcws+SJtqbt4kLKW36g@mail.gmail.com>
Subject: Re: [RFC PATCH] ref-manual: document create-spdx class and variables
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 19:04:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3404

On Tue, Oct 25, 2022 at 11:00 AM <michael.opdenacker@bootlin.com> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/ref-manual/classes.rst   | 11 ++++
>  documentation/ref-manual/variables.rst | 71 ++++++++++++++++++++++++++
>  2 files changed, 82 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 1880e44486..5274dd20bd 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -376,6 +376,17 @@ support.
>  The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for automatically creating
>  SPDX SBoM documents based upon image and SDK contents.
>
> +This class is meant to be inherited globally from a configuration file::
> +
> +   INHERIT += "create-spdx"
> +
> +The output files are generated in ``tmp/deploy/spdx`` under the
> +:term:`Build Directory`.

The "important" SPDX document that gets generated is actually the
image document that lives along side the image you built, e.g.

 tmp/deploy/images/MACHINE/core-image-minimal-MACHINE.spdx.tar.zst
(not sure the correct way to explain this path in the documentation)

This archive is the compendium of SPDX that went into that image;
notably it culls anything that didn't actually contribute to the
images (e.g. packages built, but not installed are omitted).

It would be good to point users there as the first stop instead of the
individual SPDX documents since it's a "complete" SBoM for the image.
The individual files are useful for some things, but probably not as
interesting for people who "just want an SBoM" :)

> +
> +The exact behaviour of this class can be controlled by the :term:`SPDX_PRETTY`,
> +:term:`SPDX_ARCHIVE_PACKAGED`, :term:`SPDX_ARCHIVE_SOURCES` and
> +:term:`SPDX_INCLUDE_SOURCES` variables.
> +
>  .. _ref-classes-cross:
>
>  ``cross.bbclass``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 71e8c272a7..60d801932e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7278,6 +7278,77 @@ system and gives an overview of their function and contents.
>
>           You can specify only a single URL in :term:`SOURCE_MIRROR_URL`.
>
> +   :term:`SPDX_ARCHIVE_PACKAGED`
> +      This option allows to add to the SPDX output directory
> +      compressed archives of the files in the generated target packages.
> +
> +      Such archives are available in
> +      ``tmp/deploy/spdx/MACHINE/packages/packagename.tar.zst``
> +      under the :term:`Build Directory`.
> +
> +      Enable this option as follows::
> +
> +         SPDX_ARCHIVE_PACKAGED = "1"
> +
> +      According to our tests on release 4.1 "langdale", building
> +      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
> +      this option multiplied the size of the ``tmp/deploy/spdx``
> +      directory by a factor of 13 (+1.6 GiB for this image),
> +      compared to just using the :ref:`create-spdx <ref-classes-create-spdx>`
> +      class with no option.
> +
> +   :term:`SPDX_ARCHIVE_SOURCES`
> +      This option allows to add to the SPDX output directory compressed archives
> +      of the sources for packages installed on the target. It currently
> +      only works when :term:`SPDX_INCLUDE_SOURCES` is set.
> +
> +      Such archives are available in
> +      ``tmp/deploy/spdx/MACHINE/recipes/recipe-packagename.tar.zst``
> +      under the :term:`Build Directory`.
> +
> +      Enable this option as follows::
> +
> +        SPDX_INCLUDE_SOURCES = "1"
> +         SPDX_ARCHIVE_SOURCES = "1"
> +
> +      According to our tests on release 4.1 "langdale", building
> +      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
> +      these options multiplied the size of the ``tmp/deploy/spdx``
> +      directory by a factor of 11 (+1.4 GiB for this image),
> +      compared to just using the :ref:`create-spdx <ref-classes-create-spdx>`
> +      class with no option.
> +
> +   :term:`SPDX_INCLUDE_SOURCES`
> +      This option allows to add a description of the source
> +      files handled by the target recipes, to the ``spdx.json`` files in
> +      ``tmp/deploy/spdx/MACHINE/recipes/`` under the
> +      :term:`Build Directory`. As a consequence, the ``spdx.json`` files
> +      under the ``by-namespace`` and ``packages`` subdirectories
> +      in ``tmp/deploy/spdx/MACHINE`` are also modified to include
> +      references to such source file descriptions.
> +
> +      Enable this option as follows::
> +
> +         SPDX_INCLUDE_SOURCES = "1"
> +
> +      According to our tests on release 4.1 "langdale", building
> +      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
> +      this option multiplied the size of the ``tmp/deploy/spdx``
> +      directory by a factor of 3  (+291 MiB for this image),
> +      compared to just using the :ref:`create-spdx <ref-classes-create-spdx>`
> +      class with no option.
> +
> +   :term:`SPDX_PRETTY`
> +      This option makes the SPDX output more human-readable, using
> +      identation and newlines, instead of the default output in a
> +      single line::
> +
> +         SPDX_PRETTY = "1"
> +
> +      The generated SPDX files are approximately 20% bigger, but
> +      this option is recommended if you want to inspect the SPDX
> +      output files with a text editor.
> +
>     :term:`SPDXLICENSEMAP`
>        Maps commonly used license names to their SPDX counterparts found in
>        ``meta/files/common-licenses/``. For the default :term:`SPDXLICENSEMAP`
> --
> 2.34.1
>

