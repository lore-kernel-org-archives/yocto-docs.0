Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA41CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 15:46:18 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.18567.1761925575285332530
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 08:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ct99+aVS;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-81efcad9c90so26884096d6.0
        for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 08:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761925574; x=1762530374; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShbJi6ACJLSIalAaRn/ViMqPlg3M7tfWY+gPGLW9ihM=;
        b=ct99+aVSQ3Hn8/YQhnomG+T6WpZ3d/FY7HHgfLHP8PwtADQO6Ygl3m0uEeEz1C+zQn
         taF4dc6hIdpO6wCIwb/qsrBa8dRAnzQyPECeos6Hw5qwn4kr1reYqUbSw2Ca0parz+4N
         oVGa/JOTZWr1nXoe3i6OLZJoUT+lPOUMWHY5BF3aMOaqm8VrIN38bs0H4xZsXJTkW22d
         GQeh/RXPseUSUkvnPPLrfW/R7g0Kal+Pg3liXUkjQGnNh3dV0JdlN2zw1tAgGnvHPYMo
         9x5CjyOUTMRqhi/mUMFt/pU9yTQjX2fcLeSCkBqaz0z3ynoNmYK6no1Kv9fNnWJ7SHj+
         ISHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761925574; x=1762530374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShbJi6ACJLSIalAaRn/ViMqPlg3M7tfWY+gPGLW9ihM=;
        b=GGiEwyDj204O8+VbL1A5nEi1n5OovNULJ2WiDMIXglahiRo2lTckEeeTcDoc3WqQhq
         gz7xDvJxlyGZfJ5Y7mC74Vi5kGsmBLTy0ddOyImyUOGVcgNzy6CDFUjm5yacZvaCP5l/
         becHq+KMs1TUnMwYcB90wMQH8GxOv+p1RddKUkH9zT88TtHGvF8dDsUsiCkf7BWKx86k
         a7rBLSP3nugqVAR1au7vLfVg2i/BhfEZxkejNFIA61O0EUJaYGWAODUhQbWpINdjBuX0
         CU+62Lue6U7hX4SpArnbNF66LPSBhMXtrMPBnaqH9znUyQvXwBBnehrz0LetA2Wp/EpQ
         mPwA==
X-Gm-Message-State: AOJu0YyW0E7OvTEERF7XvcC03UiOXbx6hjiH+08nM81iNs8dJAcBSq2D
	9VU751rG/ze4bzOSWYXel3zG/2yIPpBu7Kz/X6QCJM18vS4XeDkOpWrm9qod2AH+6Evs5cgEwD4
	LEbg1YRkqLKqD8ru2giuuLfs2ViOoWCs=
X-Gm-Gg: ASbGncv81DslOG7dys3s193CCJruZSY7Ep3Nx4AV2AR0SKATGBIHm8jCTEUoKFevy78
	xM1yDymSfwHhRrl4UwX7adT99i5YI0mUAxFH8uv4qZ3aMdGLlBUL6HbJJhIv2ZsXdx9qAtjfvaa
	Rj/rWJd9X3xYaP08DysFovaBR8/QgoRE9GstVQrbOLZIeGUaE6Klrmz9j2W39NPGJEFfezIRSlZ
	rHrrXzNjVacCCzH4juO2b3G3L2sjwA8G5yER4BQt6JqX2/ohvVi3rV09VhNd7U+CmK9Y15sW6fp
	CSd1jx42RCG+huHxfOW5LQPTd1gKEkT09IoIS9dh1X5ZQH1ysN985jczEQ==
X-Google-Smtp-Source: AGHT+IENvz5K+H3016wX9FofccjaZD2ihyXG4zYSu8rpo2bY49ENnCHnLvPw6vOFUDJyhyDRlfVY+zMBjVpJLEBaF1U=
X-Received: by 2002:a05:6214:1cc1:b0:87c:1d89:a24d with SMTP id
 6a1803df08f44-8802f31767amr47906076d6.27.1761925574185; Fri, 31 Oct 2025
 08:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com> <20251030-bitbake-setup-v1-2-f44a8a2b7c0b@bootlin.com>
In-Reply-To: <20251030-bitbake-setup-v1-2-f44a8a2b7c0b@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Oct 2025 16:46:02 +0100
X-Gm-Features: AWmQ_bn_jnrENdwRnEnllyRU05aeSz4gCK8c_Tzq34v1eSWaUi6I2pOidaKFMgM
Message-ID: <CANNYZj8L33HvQLvML-91137pcXbKWSoroaCZLRgiqC8FF5uirA@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/6] ref-manual/structure.rst: document the
 site.conf file
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 15:46:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7953

lgtm

Alex

On Thu, 30 Oct 2025 at 17:29, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>
> This was not documented and its usage is going to increase massively
> once users start using bitbake-setup. Add a description for this file as
> well as an example on how bitbake-setup shares it for multiple builds,
> to insist on the "site-wide" usage of this file.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Note: a link to bitbake-setup documentation comes in the next patch.
> ---
>  documentation/ref-manual/structure.rst | 29 ++++++++++++++++++++++++++++=
+
>  1 file changed, 29 insertions(+)
>
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
> index f7d7a819d..d817ee426 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -339,6 +339,35 @@ Once the build process gets the sample file, it uses=
 ``sed`` to substitute final
>     version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/=
templates/default``
>     directory.
>
> +.. _structure-build-conf-site.conf:
> +
> +``build/conf/site.conf``
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This configuration file contains the site specific configurations for yo=
ur build
> +environment.
> +
> +You could for example edit this file to limit the number of threads used=
 by
> +:term:`BitBake` (:term:`BB_NUMBER_THREADS`) or set the location from whi=
ch you
> +want to access downloaded files (:term:`DL_DIR`).
> +
> +This file can be shared for multiple build directories. For example,
> +``bitbake-setup`` makes the :ref:`structure-build-conf-site.conf` file a
> +symbolic link to a common ``site.conf`` file::
> +
> +   =E2=94=9C=E2=94=80=E2=94=80 poky-master-poky-distro_poky-machine_qemu=
x86-64/
> +   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 build/
> +   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 conf/
> +   =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 site.conf -> ../../..=
/site.conf
> +   =E2=94=9C=E2=94=80=E2=94=80 poky-master-poky-with-sstate-distro_poky-=
machine_qemux86-64/
> +   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 build/
> +   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 conf/
> +   =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 site.conf -> ../../..=
/site.conf
> +   =E2=94=94=E2=94=80=E2=94=80 site.conf
> +
> +This way, site-specific settings can be shared for multiple build
> +configurations.
> +
>  .. _structure-build-conf-bblock.conf:
>
>  ``build/conf/bblock.conf``
>
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7927): https://lists.yoctoproject.org/g/docs/message/=
7927
> Mute This Topic: https://lists.yoctoproject.org/mt/116033120/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gm=
ail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

