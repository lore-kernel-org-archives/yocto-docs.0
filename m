Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C351EEE14D6
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 18:28:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6889.1694024879575009828
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 11:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EOIkxXbi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-401da71b85eso1772595e9.1
        for <docs@lists.yoctoproject.org>; Wed, 06 Sep 2023 11:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694024878; x=1694629678; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dms4/r2z3mnWqQ2Ohyg8RopQgs/Xffm80Pg6cjgP4pw=;
        b=EOIkxXbidn1Qa/Wdv5CXG+HnuJCRc63+OEOSIeOn0anUCZkYfyBsKaC+urq1NyU4uc
         BH1NnK3u4ocxAfr1Mr99wSTNnEeB63D3igaBIJu9fmONtD67RWz8xoG0WHXsbNc8DVJE
         NfSrFw5mpNjXhbXYRGmuiijV7ZBlF1XX3+5TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694024878; x=1694629678;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dms4/r2z3mnWqQ2Ohyg8RopQgs/Xffm80Pg6cjgP4pw=;
        b=btWUt7zUMhZxFYABqQBxucy7lZzkXoTvWjsCUcb1ABdeGzcBWiSdKtnGyABvMq0157
         hWiw3uJCS8ngi97KX40tLFdoqfocgjMQ6NV47r3lIDPjRHgKIDlYDV1uVlMh8TO4xsTj
         C5IdoUGEDmpVBcglwfu9VPEIK2vyD1/Vsn41uNqe+xjTBDMZXxOLJhO3E1hfPcUJUxU0
         cfd0VKrVT10Z4Uvxe56djwjspohuxdg753Z1nSSSMbPhmEhBFZuUxSpkmIMixuroyP/6
         bIIgbsIlj+A18c6eW8myhCYbGclbXYoJRiV9XX01xpKXx0/O8t666KBjOlHaxYBLqpV5
         Hqiw==
X-Gm-Message-State: AOJu0YyO+u+UuzFUCbJKJ2YUyfGtPQc8trM36K96CxOzaS18KT1aBGbN
	Sl0JBhbskC1Bsg92OhWsNQUoQg==
X-Google-Smtp-Source: AGHT+IHLejzos3vQFL6IQvOhOx+oTmAgnS3e3yvH35CZoMIV4rDWwj54gX3So9q3YSnh+eh/M0Zm8g==
X-Received: by 2002:a05:600c:3647:b0:401:5443:5591 with SMTP id y7-20020a05600c364700b0040154435591mr2676700wmq.20.1694024878047;
        Wed, 06 Sep 2023 11:27:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:81e2:ebec:c0f0:bc4f? ([2001:8b0:aba:5f3c:81e2:ebec:c0f0:bc4f])
        by smtp.gmail.com with ESMTPSA id t20-20020a1c7714000000b003fbc9d178a8sm260023wmi.4.2023.09.06.11.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 11:27:57 -0700 (PDT)
Message-ID: <08c2ac4a90bdceec79e8499acd102b8eb675817b.camel@linuxfoundation.org>
Subject: Re: [docs][PATCH] Add libacl to required packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, Joshua Watt <JPEWhacker@gmail.com>
Cc: docs@lists.yoctoproject.org
Date: Wed, 06 Sep 2023 19:27:56 +0100
In-Reply-To: <dd0b939b-7780-61c6-26a7-35956f4118e8@bootlin.com>
References: <20230824142702.3491681-1-JPEWhacker@gmail.com>
	 <dd0b939b-7780-61c6-26a7-35956f4118e8@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Sep 2023 18:28:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4198

On Wed, 2023-09-06 at 20:25 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> Hi Joshua,
>=20
> On 24.08.23 at 16:27, Joshua Watt wrote:
> > libacl is required for correctly calculating output hashes, so add it t=
o
> > the require host packages
> >=20
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >   documentation/poky.yaml.in | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
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
>=20
>=20
> Thank you for the update!
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ... and merged into master-next.
>=20
> Is this applicable to Mickledore, Kirkstone and maybe Dunfell?
> I'll be happy to update these branches too.

No, it definitely isn't appropriate there!

Cheers,

Richard

