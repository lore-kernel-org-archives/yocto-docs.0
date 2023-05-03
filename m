Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D09C77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:13:58 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.14561.1683105232232357134
 for <docs@lists.yoctoproject.org>;
 Wed, 03 May 2023 02:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=HhTWx93b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-2fddb442d47so4556849f8f.2
        for <docs@lists.yoctoproject.org>; Wed, 03 May 2023 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683105230; x=1685697230;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLAfm2P7Wm3doNWdY/KZjyPnNEkRJrKOEjRxXQgYcDM=;
        b=HhTWx93bdLfZYeKE8EIfKH39kAu1XD5Q3QxQR9yTxfUp5GFOHCeTEB4vbMKkGutGp7
         uaHHAbewBREdZjDP8kC2GxMDinK16uzxiWxo2wqtiSo/52hSGAA+MvZRKT1pxeoGQ7ZX
         zBgwZAE8YdbmX/q+RM4cxxcUIEObk5dWhabnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683105230; x=1685697230;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kLAfm2P7Wm3doNWdY/KZjyPnNEkRJrKOEjRxXQgYcDM=;
        b=lLicENANitc54rK1Eiir+DCWOer1UPfBgQLg8rNFD+pDKnK/VJgETcmz46sFVw6Zba
         Y79kIvZlq7F0EU62ZYwoLh5KzVfHZacZbQ01GNy9SHvMoe8kwsZC4L51QwMbzcGmOx0I
         kQZDpMAf1SNZ1QUyMExjq7PWSdtMhWvkpRo6qzd60p6cwsc1sxYy7Os/kCWvV4GHJ3Xc
         ZIf5F66k012bJFJQB4D8gftuUdI8FFjVuCuxqxBDfeJexy1exnw4r05AWUF7LERYZAIg
         q3fd2Tv436gHJXJFaT06jg9asmzH6UnilBgv5o6PGDxKM3KSMbn6fn8ULN8UaokKPbG6
         zWog==
X-Gm-Message-State: AC+VfDyiRKnvnjlM2vqZJuc/iwdqNYnj61ifef/o4T5K2cp2AieqOQdW
	7vbQUbXevR+iBgfmEPyOV9CI/xDlabVAcgP3SYRPOA==
X-Google-Smtp-Source: ACHHUZ7bH4AKgD5hnNB/oqg0Iyx8ScaufLwfYKDIMWYa8QnK+70hl5kfWApXuBOiDiz44sKBKUGxJg==
X-Received: by 2002:a5d:4d46:0:b0:306:2f91:302e with SMTP id a6-20020a5d4d46000000b003062f91302emr5808380wru.21.1683105230567;
        Wed, 03 May 2023 02:13:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id b18-20020a5d4b92000000b003062b6a522bsm8665704wrt.96.2023.05.03.02.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:13:50 -0700 (PDT)
Message-ID: <cdaf1f42bc82c7a9146070925079ea0ceba3e98e.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] poky.yaml.in: simplify host package requirements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Date: Wed, 03 May 2023 10:13:49 +0100
In-Reply-To: <20230503090136.2483595-1-michael.opdenacker@bootlin.com>
References: <20230503090136.2483595-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 09:13:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3897

On Wed, 2023-05-03 at 11:01 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>=20
> Some of the listed host packages were no longer necessary.
>=20
> [YOCTO #14873]
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/poky.yaml.in | 28 ++++++++--------------------
>  1 file changed, 8 insertions(+), 20 deletions(-)

I think this is another "it depends" situation.

The cut down lists you have below probably works fine if you just want
to build and image and hopefully let you run it under runqemu.

Where things will start to get problematic is some of the testing
workflows such as "oe-selftest -j X" which definitely needs python3-
subunit, or resulttool which does need python3-jinja2 for some options
iirc.

As such, which this change is right for some workflows, it isn't
correct for others.

Ideally there would be two levels of dependencies, those needed for the
basics and those needed to cover all the needs.

Looking at the original bug, I think we did remove some of the
SDL/xterm/vnc requirements. Even then some vnc pieces are still needed
for some autobuilder setups though.

We likely should define which workflows we expect to work with this
"essential" dependency list?

Cheers,

Richard


> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 1c072c1d05..7f71412fee 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -10,31 +10,19 @@ BITBAKE_SERIES : ""
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
>  YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> -UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo g=
cc \
> -     build-essential chrpath socat cpio python3 python3-pip python3-pexp=
ect \
> -     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl=
1-mesa libsdl1.2-dev \
> -     python3-subunit mesa-common-dev zstd liblz4-tool file locales
> +UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat build-essential=
 chrpath cpio \
> +     python3 zstd liblz4-tool file locales
>       \n\   $ sudo locale-gen en_US.UTF-8"
> -FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 =
unzip perl patch \
> -     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath =
\
> -     ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl=
-bignum socat \
> -     python3-pexpect findutils which file cpio python python3-pip xz pyt=
hon3-GitPython \
> -     python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-=
File-Compare \
> -     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en"
> -OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make =
wget python-xml \
> -     diffstat makeinfo python-curses patch socat python3 python3-curses =
tar python3-pip \
> -     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel r=
pcgen Mesa-dri-devel \
> -     zstd lz4 bzip2 gzip hostname
> -     \n\   $ sudo pip3 install GitPython"
> +FEDORA_HOST_PACKAGES_ESSENTIAL : "bzip2 perl patch diffutils diffstat gi=
t gcc g++ chrpath \
> +     which glibc-langpack-en which cpio file hostname patch rpcgen wget =
zstd lz4 xz"
> +OPENSUSE_HOST_PACKAGES_ESSENTIAL : "git python3 gcc gcc-c++ zstd bzip2 c=
hrpath diffstat \
> +     gzip hostname lz4 make patch rpcgen tar wget python3-curses xz"=20
>  ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
>       \n\   $ sudo yum install dnf-plugins-core
>       \n\   $ sudo dnf config-manager --set-enabled crb
>       \n\   $ sudo dnf makecache
> -     \n\   $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzi=
p perl patch \
> -     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath =
ccache \
> -     socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue pytho=
n3-pip \
> -     python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel=
 \
> -     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en"
> +     \n\   $ sudo dnf install bzip2 perl patch diffutils diffstat git gc=
c g++ chrpath \
> +     which glibc-langpack-en which cpio file hostname patch rpcgen wget =
zstd lz4 xz"
>  PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme py=
yaml"
>  MIN_PYTHON_VERSION : "3.8.0"
>  MIN_TAR_VERSION : "1.28"
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3895): https://lists.yoctoproject.org/g/docs/message/=
3895
> Mute This Topic: https://lists.yoctoproject.org/mt/98657701/1686473
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [richard.purdie@=
linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


