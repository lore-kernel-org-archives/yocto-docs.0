Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C3AC6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 16:37:41 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.42916.1681922257231127995
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 09:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YtEn1aJj;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3293e4b2cb5so39344505ab.3
        for <docs@lists.yoctoproject.org>; Wed, 19 Apr 2023 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681922256; x=1684514256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHlwWbH09e8bmomlzh0zxPloFDgWjYF/Y5SYBMkCv5M=;
        b=YtEn1aJjinslNFkknaYtyXcVEgTmIom2dUUNvnha/COZmUqXJ78l28ZNApTsKOtjOS
         g8X9DGTDo7bTiEYrSZ3fTcgXN+JXzKvxSEoA2X/4isZDaWGyRTej7CRYeRZqBr7u2DSa
         g6u83t4Bc3c8/Lp2XPRhs6yVktMEG226VjvA3L8ars722T8RxSsSwFjp75CcMirPgcZO
         oEi2lbJb0O4TDSeDqmbNW1GjUm2IdtHUIjxKpt8ckExKNCRX3q/BKHh0wJfjVVF86tZ+
         t9OMDmKsKObskQ64sGTazK+V60OsxylcsJD9tEjLd55ARaA0rAoaftaGUHRYgzaKXsTg
         Z4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681922256; x=1684514256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHlwWbH09e8bmomlzh0zxPloFDgWjYF/Y5SYBMkCv5M=;
        b=eQgs0qFqZuKv/MvF7XQwsHLSLIFCdRTgo6yblKDjrqgFk3o+VObq5/uANgOi1pwN0m
         4aj2UJkvKXFIJB1qBUKAnYlU5ZR8fbz2zDHZZCm20fPylBS/Twv2JN4LY4YPfVlaAC55
         vyoH3w26XxVGJhRsCa+l9jh1rrtA5cyjFSEIvURmO4mMauueAkmZ1EDFuRozLvdJhxeL
         6rUfAzLwnSYi0pINj9BQ+yhGxLLmaUUisthGG2uYpWFVrfXp79Dilf0oiYAl9SUwILuJ
         Z+lhNlbAdZeMIP/H1yyVZFph5RoOXkJzTmaYHBefVM4siNCXotEVFE4fsfu/ML59TZLG
         JAcw==
X-Gm-Message-State: AAQBX9cOyu3ZaCrb3qhb27zahDJglyPx2xnS2TdgVqxT8s2XqyfWUL9U
	M2Li8lRHQmCM5oXd/I5SMLIi1mizBuiSDyAYNOI=
X-Google-Smtp-Source: AKy350Yp7wmZvdUOw+Uh7qW/6uoSh558T2Gc7751EdZRvUF/imFPeH86x6dNZlHrW2sL1llJ4/AZZ6Jwc5hDOMtHn5k=
X-Received: by 2002:a92:902:0:b0:328:213e:4cc9 with SMTP id
 y2-20020a920902000000b00328213e4cc9mr470143ilg.26.1681922256379; Wed, 19 Apr
 2023 09:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230418171026.1327353-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20230418171026.1327353-1-michael.opdenacker@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Apr 2023 12:37:30 -0400
Message-ID: <CADkTA4MpL8+E1x40G=Wmp7orWwA=veBHLRC=vPwoFk06EvFZpA@mail.gmail.com>
Subject: Re: [PATCH] ref-manual: variables.rst: document KERNEL_DANGLING_FEATURES_WARN_ONLY
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Apr 2023 16:37:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3849

On Tue, Apr 18, 2023 at 1:10=E2=80=AFPM <michael.opdenacker@bootlin.com> wr=
ote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> CC: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 6a9dcfd5ba..2899bd78fc 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4420,6 +4420,20 @@ system and gives an overview of their function and=
 contents.
>        You can register custom kernel image types with the
>        :ref:`ref-classes-kernel` class using this variable.
>
> +   :term:`KERNEL_DANGLING_FEATURES_WARN_ONLY`
> +      When kernel configuration fragments are missing for some
> +      :term:`KERNEL_FEATURES` specified by layers or BSPs,
> +      building and configuring the kernel stops with an error.
> +
> +      You can turn these errors into warnings by setting the
> +      following in ``conf/local.conf``::
> +
> +         KERNEL_DANGLING_FEATURES_WARN_ONLY =3D "1"
> +
> +      You will still be warned that runtime issues may occur,
> +      but at least the kernel configuration and build process will
> +      be allowed to continue.
> +

Looks good to me.

Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>

>     :term:`KERNEL_DEBUG_TIMESTAMPS`
>        If set to "1", enables timestamping functionality during building
>        the kernel. The default is "0" to disable this for reproducibility
> --
> 2.34.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

