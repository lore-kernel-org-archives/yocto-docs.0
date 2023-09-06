Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91ABEE14D4
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 18:27:54 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.6885.1694024873082204862
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 11:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=i8nq/Cof;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2bcfd3220d3so2849861fa.2
        for <docs@lists.yoctoproject.org>; Wed, 06 Sep 2023 11:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694024871; x=1694629671; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gzm09d0Evb58yaWa7QQZeVftwmHjrao7oUh0mObrLkE=;
        b=i8nq/CofgRpemsQnOR+3Qv7c0a8AodRGOE05mesoPjxduQE1uNt3GIzjZSn8W3DUZo
         Yf83baSX7Te/GLp5qAa4bhZsU2UkYuo9iIQeBQM+fc9f44oO6Fb9+97QpOeWeN2VC5rP
         s8vBSvnqFZNVFB37uzdEtLuGEGtnImlrkcCKusqCzUW/3VIr7CCC/VmF37+xEK6UP2Om
         xic+h3yw173bsB0nriOqOJRB92j8x/kiWrbpc2cab3bAEzUw4lOO4WRakFD2NmiC6xhO
         VOEWb0XpILF/gOqwTUX/lbvJmGX9ssz1Fs+LP2I+1QaL54vsNfMKM4Pcw+DytI+Kt51B
         N9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694024871; x=1694629671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gzm09d0Evb58yaWa7QQZeVftwmHjrao7oUh0mObrLkE=;
        b=TiR9+fTQw16bjIlAZZgofj4ELd4y7aEP0lOO6buRmRCrPf4D9bOJqaTRvmoIoHqfjk
         YhO69tj4aY5syitE4Ch3iNLr7kZ4YPzkdgKHNGtaWc8axzF8JQfiEurEgtC2hhN4Z8kX
         OAWn+OchKgiHSRsH5BgUtB+0PI/6A4qaL62PFHW4WeMbVPQubwXHH1S8pRxXd//dX3gk
         dksdP9Fb0cM2Eh1lPyw/jo/9I/1V+QSrX1asCl4b/0D1fDnBBMBsnyPtWvQ1fxbKumWF
         tdQf8u+0omC6CL61k0ymumi+cF4Vi2yQrhxZqHLzKDdWZxZMKglGvnO+/5V7mMAB4Tlc
         sUgw==
X-Gm-Message-State: AOJu0YyI871Me5QOXp5JzL/Xn7O+dpXg5FA3Cm+3BGlxdyG7gZXACHsM
	JXsrpNP+GGuyueJC87RuK+MYoLYJNn0UYEVuDNQ=
X-Google-Smtp-Source: AGHT+IGc0Rl47Zk3GCNAuZGgMuZ0a+mg1NW0L6nqA59zbqDF1BNtagGyLLa9wW5vPE6Ql/AocAimoM4sBVzKsYmvyeo=
X-Received: by 2002:a2e:b0ec:0:b0:2bc:c28c:a2b8 with SMTP id
 h12-20020a2eb0ec000000b002bcc28ca2b8mr3139737ljl.27.1694024870948; Wed, 06
 Sep 2023 11:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230824142702.3491681-1-JPEWhacker@gmail.com> <dd0b939b-7780-61c6-26a7-35956f4118e8@bootlin.com>
In-Reply-To: <dd0b939b-7780-61c6-26a7-35956f4118e8@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 6 Sep 2023 12:27:38 -0600
Message-ID: <CAJdd5Gb-0MmtOtoQtewrxhTuLx5Dj=3KDGoj2sMAwXY-yQFXiw@mail.gmail.com>
Subject: Re: [docs][PATCH] Add libacl to required packages
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Sep 2023 18:27:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4197

On Wed, Sep 6, 2023 at 12:25=E2=80=AFPM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Joshua,
>
> On 24.08.23 at 16:27, Joshua Watt wrote:
> > libacl is required for correctly calculating output hashes, so add it t=
o
> > the require host packages
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >   documentation/poky.yaml.in | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> > index b2b6a6330ff..2922214bc94 100644
> > --- a/documentation/poky.yaml.in
> > +++ b/documentation/poky.yaml.in
> > @@ -13,18 +13,18 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yoc=
to/yocto-&DISTRO;"
> >   UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinf=
o gcc \
> >        build-essential chrpath socat cpio python3 python3-pip python3-p=
expect \
> >        xz-utils debianutils iputils-ping python3-git python3-jinja2 lib=
egl1-mesa libsdl1.2-dev \
> > -     python3-subunit mesa-common-dev zstd liblz4-tool file locales
> > +     python3-subunit mesa-common-dev zstd liblz4-tool file locales lib=
acl1
> >        \n\   $ sudo locale-gen en_US.UTF-8"
> >   FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip pytho=
n3 unzip perl patch \
> >        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpa=
th \
> >        ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue p=
erl-bignum socat \
> >        python3-pexpect findutils which file cpio python python3-pip xz =
python3-GitPython \
> >        python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin pe=
rl-File-Compare \
> > -     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en"
> > +     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en li=
bacl"
> >   OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath ma=
ke wget python-xml \
> >        diffstat makeinfo python-curses patch socat python3 python3-curs=
es tar python3-pip \
> >        python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-deve=
l rpcgen Mesa-dri-devel \
> > -     zstd lz4 bzip2 gzip hostname
> > +     zstd lz4 bzip2 gzip hostname libacl1
> >        \n\   $ sudo pip3 install GitPython"
> >   ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
> >        \n\   $ sudo yum install dnf-plugins-core
> > @@ -34,7 +34,7 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
> >        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpa=
th ccache \
> >        socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue py=
thon3-pip \
> >        python3-GitPython python3-jinja2 python3-pexpect xz which SDL-de=
vel \
> > -     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en"
> > +     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en libacl"
> >   PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme=
 pyyaml"
> >   MIN_PYTHON_VERSION : "3.8.0"
> >   MIN_TAR_VERSION : "1.28"
>
>
> Thank you for the update!
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ... and merged into master-next.
>
> Is this applicable to Mickledore, Kirkstone and maybe Dunfell?
> I'll be happy to update these branches too.

No I don't think it's going to be backported to those branches. If it
does, we'll let you know.

>
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

