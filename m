Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B762CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 16:08:01 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.130851.1697472477544697355
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 09:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=UY64YUYk;
 spf=pass (domain: smile.fr, ip: 209.85.218.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9be3b66f254so391015566b.3
        for <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697472476; x=1698077276; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+o/E87/ASjdKGSfPpBXJJsKF+00TAmJUYz32xDmHUHE=;
        b=UY64YUYkFez5AHqu1CSLie4W0gEDJAND/P0P+m6inWoDmF4aNo1v1uO0URXpGH/U6i
         p1qHX9uuA8nkLvs2GCZvqpXLZBi5tD0Ck02BRADl9lvsNi2x2QKzrpQW6pDJDqDA6HRf
         XkAaOGJtTs0gaEVageGytyx0e6MjpB3jCbfz4AVUCu5YU5FiEovKprh2VmPXC6MxZY6A
         rY/uIEjiw3Ezq24pGnrzAScweDGPBqs5XmcMMhD1axwKE3ZZiRHbXhvsaxNmum+MOyXe
         sSoew+lqwT+L1bxxu3pYevyPEldbyX7mgRF6en6KB0SgguEgl1NPCa2UpYWDQoVIfPRi
         Aynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697472476; x=1698077276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+o/E87/ASjdKGSfPpBXJJsKF+00TAmJUYz32xDmHUHE=;
        b=MFwJp94n6Xk3A02S40WPqBH3qOTH1A4pj8CDojgxxGYZq/XyZdyeZtUhg5pth+ypia
         h28+i2MJc+a1I4F9/LAgJixTp/L4q0avQ9u4BOhv57BkZSwT7M2K099Mox1jhe7JQ/EE
         Qhl45ou+usxv8OO8/6q3O/yCqd4F6BFvoDRNFJ8iWLsijpKM8Vao4ex/r/rXbRtYHp3l
         8VXMjK/pxVSOOiXoQwjGtKjfODaRVyn6UjWeAdxCou34wMh2DlkHj8+jX6ajq5Fb5eOh
         Q0/wjergKJwTdJCXMmB/hoA2lzI1Tx/y/RcYM6BKPq8zdR/LDuoKvpQKTYXYQTV66BnK
         I2lQ==
X-Gm-Message-State: AOJu0Yxy4ewpO71CmtAtMYBGj805ePyzO8ykaH9EAs8Na+wmpSCcOARK
	I0QxGdGIGxvPFKJNMrr3IW6zd+JDu9BD0b8eUOAuOgD4wLc9v6km
X-Google-Smtp-Source: AGHT+IF8HvWB3i30oA7nBIby/iZCOzF2KugwcVrimlEdd5lJc8c4Ae4olUCW/bZSLWMWoM78PQfvevD97uzGOWz6iJw=
X-Received: by 2002:a17:907:77c9:b0:9b2:6d09:847c with SMTP id
 kz9-20020a17090777c900b009b26d09847cmr27466283ejc.10.1697472475768; Mon, 16
 Oct 2023 09:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231010135139.3995226-1-yoann.congal@smile.fr>
In-Reply-To: <20231010135139.3995226-1-yoann.congal@smile.fr>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Mon, 16 Oct 2023 18:07:30 +0200
Message-ID: <CAMSfU+58yne1QDVLQMLK2xBbM4n3kCPLsFdS_NXU5+OXKyuN+A@mail.gmail.com>
Subject: Re: [PATCH v3] ref-manual: Add documentation for the
 unimplemented-ptest QA warning
To: docs@lists.yoctoproject.org, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 16:08:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4381

Hi Michael,

Le mar. 10 oct. 2023 =C3=A0 15:53, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :
>
> From: J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr>
>
> Signed-off-by: J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> Note: The code documented here has been sent to ML there:
> https://lists.openembedded.org/g/openembedded-core/message/188892

FYi, the code part has been merged :
https://git.yoctoproject.org/poky/commit/?id=3D5330065f51fc0dcc2b74360220b2=
c97c4b80e622
https://git.yoctoproject.org/poky/commit/?id=3D18bd65d241d2ca2d14541b9c6dd0=
d9f3f1cdba35
https://git.yoctoproject.org/poky/commit/?id=3Df4b039cae0833634487607a4c6ad=
e441dbe94cbf
https://git.yoctoproject.org/poky/commit/?id=3Db233e2f8c2d756010fd4fae5b817=
3b1fddf39693

Thanks!


>  documentation/ref-manual/classes.rst   |  3 +++
>  documentation/ref-manual/qa-checks.rst | 11 +++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 3f0d4844e..c7a5e9a63 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1480,6 +1480,9 @@ Here are the tests you can list with the :term:`WAR=
N_QA` and
>     also inherits :ref:`ref-classes-features_check` in order for the
>     requirement to actually work.
>
> +-  ``unimplemented-ptest:`` Checks that ptests are implemented for upstr=
eam
> +   tests.
> +
>  -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
>     for a package are also declared on the recipe level (i.e. any license
>     in ``LICENSE:*`` should appear in :term:`LICENSE`).
> diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-m=
anual/qa-checks.rst
> index 4a02e7206..63b2ecdc4 100644
> --- a/documentation/ref-manual/qa-checks.rst
> +++ b/documentation/ref-manual/qa-checks.rst
> @@ -789,6 +789,17 @@ Errors and Warnings
>      use a relative path rather than an absolute one, or to pick up the p=
ath from
>      runtime configuration or environment variables.
>
> +.. _qa-check-unimplemented-ptest:
> +
> +- ``<tool> tests detected [unimplemented-ptest]``
> +
> +    This check will detect if the source of the package contains some up=
stream-
> +    provided tests and, if so, that ptests are implemented for this reci=
pe.
> +    See the ":ref:`dev-manual/packages:testing packages with ptest`"
> +    section in the Yocto Project Development Tasks Manual. See also the
> +    ":ref:`ref-classes-ptest`" section.
> +
> +
>
>  Configuring and Disabling QA Checks
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --
> 2.30.2
>


--
Yoann Congal
Smile ECS - Tech expert

