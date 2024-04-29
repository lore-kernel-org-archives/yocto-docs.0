Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45790C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 12:59:28 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.20583.1714395566234251773
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 05:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KwRITUBS;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2dac77cdf43so56383161fa.2
        for <docs@lists.yoctoproject.org>; Mon, 29 Apr 2024 05:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714395564; x=1715000364; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p5zFBvmOmN5uKsDfYxhJeyvXhskCpieuerPMiEeeJaU=;
        b=KwRITUBS1Lf9kkSbCS5EaeVRaN7zRD21PqAwHG1vFcuZRgQ194JLLRgb3yevERTfxT
         mHlLqdq9skTgHic1Xe81PwTzD7WoBSIDQakIH18x05jPwUBOq0eGBfBK3vOmx6ZERzLw
         jqSXc9XA8IoSKQcJb20kowIYaDIe0+LmAryb1hkzOq0rbKP+GMUIkWhuJ0Yyvcgc2IVN
         q1BE+LEFmKVdLGFaChv+rPB/HvtAg4QK2hdd8L5SRw6MPUD9DTDsZCZg8YhbzCd1+WK5
         NIzlPRScMJa6jcPgKkIjJo4fiUxvyQ/y8eYkiHX4w3tAYkA7qMJGcywjgH1tuI2UW/e1
         hmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395564; x=1715000364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5zFBvmOmN5uKsDfYxhJeyvXhskCpieuerPMiEeeJaU=;
        b=Yp9JybPoF7QZBctNO2LVpgzit+TFBC6YUC8Rs85kjTGnIuvfarL1twlHvZZhH2D6/I
         FMWnfKwFVwOLJdR4Ar6LN7IgTDR3SS1S/u+TdJYXSJ7uZgFch2Ebocd9rEE8D97fX6iI
         iVJTvJss+JRnfGr4/mBOG6zWCNtSh/BKcgLXtGPgOkuGRVGdN1TSzuqYjwj/NJTT3eH0
         PP7O3OUqD036qnyhCMrpqnA086EiO3rantPrqwI0n3gTSJSXhyi9xDTNz8MVg98yaSpz
         UfrNkutpLTonIovGXH0VwwtbrkkprSvA8BVxBm6hdwf2ZKL9YL287+oDp4BNN5Btqtqj
         kLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZU7QHbFBP9IoLaGbFqynxG79T4rKNWztuNR2Lf4hn30XRrfdVsmnYrHJCY710Gsh7h1jX90bA2oiuHlaX+CUvWc4ZPHawcWrXTTM=
X-Gm-Message-State: AOJu0YzuORJZtS/5pC8sMLB0tWxEe9EJ2OuFYnQILQ1Ne5IUWbBkrR/B
	eYhgdHKuC6dleenpt3bF+U56/zdosgF4JtNGhj+OvFdKa7NejBLfC6hy9J/8CQmSSHfP1dABR+3
	mxX7Jc1p7dRaAgk/irw6FWfsAiQg=
X-Google-Smtp-Source: AGHT+IE7f9ax4Mf5Jz+vrO2ObguEtE5Q2IfDhkfsL3ErdKSFuMqX9kVlcSO35w3cUM3M0Pxtd8/mg9tcZxSbdV7kSjU=
X-Received: by 2002:a2e:9e07:0:b0:2de:4cb4:2601 with SMTP id
 e7-20020a2e9e07000000b002de4cb42601mr7513157ljk.43.1714395564066; Mon, 29 Apr
 2024 05:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240429093447.4163638-1-alex@linutronix.de> <55922270-61b0-4a6d-8c3d-3b4e61e68d67@bootlin.com>
In-Reply-To: <55922270-61b0-4a6d-8c3d-3b4e61e68d67@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Apr 2024 14:59:13 +0200
Message-ID: <CANNYZj8fjrUkh0xuHiWh6DdV7b3cGGn+PDntUvj==j_W6hFcJw@mail.gmail.com>
Subject: Re: [docs] [PATCH] documentation/poky.yaml.in: drop mesa/sdl from
 essential host packages
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Apr 2024 12:59:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5181

This should go to scarthgap and kirkstone as well, as the removal of
host mesa/sdl dependencies pre-dates that.

Alex

On Mon, 29 Apr 2024 at 14:41, Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Alex,
>
> On 4/29/24 at 11:34, Alexander Kanavin wrote:
> > They used to be required for qemu graphics support, but neither is being
> > for anything anymore.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   documentation/poky.yaml.in | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> > index 7a686ac4e..5a1b8ef59 100644
> > --- a/documentation/poky.yaml.in
> > +++ b/documentation/poky.yaml.in
> > @@ -12,18 +12,18 @@ YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
> >   YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> >   UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
> >        build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
> > -     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
> > -     python3-subunit mesa-common-dev zstd liblz4-tool file locales libacl1
> > +     xz-utils debianutils iputils-ping python3-git python3-jinja2 \
> > +     python3-subunit zstd liblz4-tool file locales libacl1
> >        \n\   $ sudo locale-gen en_US.UTF-8"
> >   FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
> >        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
> >        ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
> >        python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
> > -     python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
> > +     python3-jinja2 rpcgen perl-FindBin perl-File-Compare \
> >        perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en libacl"
> >   OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
> >        diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
> > -     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
> > +     python3-pexpect xz which python3-Jinja2 rpcgen \
> >        zstd lz4 bzip2 gzip hostname libacl1
> >        \n\   $ sudo pip3 install GitPython"
> >   ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
> > @@ -33,8 +33,8 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
> >        \n\   $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
> >        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
> >        socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
> > -     python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
> > -     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en libacl"
> > +     python3-GitPython python3-jinja2 python3-pexpect xz which \
> > +     rpcgen zstd lz4 cpio glibc-langpack-en libacl"
> >   PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
> >   MIN_PYTHON_VERSION : "3.8.0"
> >   MIN_TAR_VERSION : "1.28"
>
>
> Thanks for this simplification!
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Merged into master-next.
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

