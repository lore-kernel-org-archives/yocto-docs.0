Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4267C001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 18:10:33 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.2490.1690827031492632814
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 11:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=je4BHKqa;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so7793598e87.2
        for <docs@lists.yoctoproject.org>; Mon, 31 Jul 2023 11:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690827029; x=1691431829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ51/KAI8qUj9HnZIJxQ2W9Jvie4rfSfghggmmhxMCs=;
        b=je4BHKqa4fIvIAq+foohVSSYSAswOhDaFP13mztnjTh1V3jB1b+m14ERo9FU4MJJHl
         N5dbSoWBspHz1mMEc/2IWKQU9GsLaoKY9xmR56TyRZ7fuPHPFBECsJ1FTX8d+OVcwX4E
         lwGWNKsey/M7NcT9fHu/CmGQJQ7m72hfhVRDGd9Q3xfEjLC1AcL71LuPfd8XQ+nL/pw3
         ObUAfSG/6wDKDys3nNJnl8p0sn1s+b39w/96dNyoB2FoJF04cbZE/1lc4+QEcST2j3Sa
         uy4uW7ugaPJbz68SapIgtuHXhyVdK178RmcbScbI/n7obgk3fSeL2Xa501QDErMynVD/
         PoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690827029; x=1691431829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJ51/KAI8qUj9HnZIJxQ2W9Jvie4rfSfghggmmhxMCs=;
        b=X0pkSU4ursC8In+OjThH7D6PWNdXmuNKddx+4p59qYsylV7VSj5QP/6LLRkx8NNR/h
         UVVXgWX0tdehNbVSXrQTS23CQlC7BvKQ7MLN+FwwbE9yNXAuP4zSk73ZL0jX+B6rT1Dt
         5kbtV98Z6aBR7jHVlByZcsFvx79ZDpXCQopjSj0DqzUs8sUAbCmfc/vzfWK6f2VulPkd
         iSQvIM69kLEoY3lzwCwq5G9FlStN36TRc6luRroc8mcVDZswbOGalM8vqkf6IVcIQGGn
         kLxsrT7GOA+jYPeV/NXfJ6z3vTUAnkEby9m9xULbJnydJCNxoPHeJKYr4a8u+v69PWa2
         X5+Q==
X-Gm-Message-State: ABy/qLbNL6GU5mwOJ2z43kls8f1VPh9Ld853ESfa+0bisjTd7CDWrOkH
	Cq0QxIQAHwvfSbMJdiI8nIYOlXQ05b3IlTCvRzw=
X-Google-Smtp-Source: APBJJlGtG4Et/h2ufHYvoP1gLwB/ozRX0KCvNLf7z6bBbDU/d4R9IGwlFoT8U6OO5jwF2fImUB/OZMFu1mQxYIhemtA=
X-Received: by 2002:ac2:5f66:0:b0:4fa:ad2d:6c58 with SMTP id
 c6-20020ac25f66000000b004faad2d6c58mr371759lfc.61.1690827029362; Mon, 31 Jul
 2023 11:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230731175836.51755-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20230731175836.51755-1-michael.opdenacker@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Jul 2023 20:10:17 +0200
Message-ID: <CANNYZj9EKMEu6-9_YvKNaicsJia5ixoJuZOy7C8V-ZfK3mPTxA@mail.gmail.com>
Subject: Re: [docs] [PATCH] [kirkstone] ref-manual: document image-specific
 variant of INCOMPATIBLE_LICENSE
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Jul 2023 18:10:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4092

Just in case, dunfell can get this too, with old-style override syntax.

Alex

On Mon, 31 Jul 2023 at 19:58, Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> This has been around without being properly documented since 2019 (!!!),
> and is nowadays the preferred method for enforcing license restrictions,
> especially since meta-gplv2 is officially obsolete.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/ref-manual/images.rst    | 16 +++++++++-------
>  documentation/ref-manual/variables.rst | 11 ++++++++++-
>  2 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
> index 31fb567687..33e5b53d9f 100644
> --- a/documentation/ref-manual/images.rst
> +++ b/documentation/ref-manual/images.rst
> @@ -14,15 +14,17 @@ image you want.
>     Building an image without GNU General Public License Version 3
>     (GPLv3), GNU Lesser General Public License Version 3 (LGPLv3), and
>     the GNU Affero General Public License Version 3 (AGPL-3.0) components
> -   is only supported for minimal and base images. Furthermore, if you
> -   are going to build an image using non-GPLv3 and similarly licensed
> -   components, you must make the following changes in the ``local.conf``
> -   file before using the BitBake command to build the minimal or base
> -   image::
> +   is only tested for core-image-minimal image. Furthermore, if you would like to
> +   build an image and verify that it does not include GPLv3 and similarly licensed
> +   components, you must make the following changes in the image recipe
> +   file before using the BitBake command to build the image:
>
> -           1. Comment out the EXTRA_IMAGE_FEATURES line
> -           2. Set INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0* AGPL-3.0*"
> +       INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0*"
>
> +   Alternatively, you can adjust ``local.conf`` file, repeating and adjusting the line
> +   for all images where the license restriction must apply:
> +
> +       INCOMPATIBLE_LICENSE:pn-your-image-name = "GPL-3.0* LGPL-3.0*"
>
>  From within the ``poky`` Git repository, you can use the following
>  command to display the list of directories within the :term:`Source Directory`
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 9aab6e0709..88b27492c7 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3547,9 +3547,18 @@ system and gives an overview of their function and contents.
>     :term:`INCOMPATIBLE_LICENSE`
>        Specifies a space-separated list of license names (as they would
>        appear in :term:`LICENSE`) that should be excluded
> -      from the build. Recipes that provide no alternatives to listed
> +      from the build (if set globally), or from an image (if set locally
> +      in an image recipe).
> +
> +      When the variable is set globally, recipes that provide no alternatives to listed
>        incompatible licenses are not built. Packages that are individually
>        licensed with the specified incompatible licenses will be deleted.
> +      Most of the time this does not allow a feasible build (because it becomes impossible
> +      to satisfy build time dependencies), so the recommended way to
> +      implement license restrictions is to set the variable in specific
> +      image recipes where the restrictions must apply. That way there
> +      are no build time restrictions, but the license check is still
> +      performed when the image's filesystem is assembled from packages.
>
>        There is some support for wildcards in this variable's value,
>        however it is restricted to specific licenses. Currently only
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4091): https://lists.yoctoproject.org/g/docs/message/4091
> Mute This Topic: https://lists.yoctoproject.org/mt/100467120/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

