Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0A6C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 12:41:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.19940.1714394496084044210
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 05:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kbAd/1yS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19B3340006;
	Mon, 29 Apr 2024 12:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714394494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6eKNfbKl8nM4BZCvj+StrAZAKRKzQ19wHcL2mfXyjk=;
	b=kbAd/1ySmLyKDVgvplorJF+yBGxjMIFxOxAEAnARHbpvpmqGv/VA7AGUqBEiSpDX8YeADc
	7VGIU+yhbQMbxXGnXQ531uRUKS6e26QtKWJWZPaMubfYka6oOUSk1AjPEb37Bm+Hd9Kjsk
	KZGWmD29gOmRt8QjbaAHdfPoxV3bZVQKTYKrEdsnXoB0BVUrG+SZGjNE9+cEb1FLnmFuvQ
	JbvE7gTuPQSMa3NT3r5EPMbiI67613Jf+nN32DECbK8u95MRcNb+IxM5C4NCUg1sSd5W9Q
	Am5RcgxrstRLJ7qRTYOUeax8G2KiqZUF85zMQL+FloHmA95h1E1PkQFLLpZXMQ==
Message-ID: <55922270-61b0-4a6d-8c3d-3b4e61e68d67@bootlin.com>
Date: Mon, 29 Apr 2024 14:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] documentation/poky.yaml.in: drop mesa/sdl from
 essential host packages
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20240429093447.4163638-1-alex@linutronix.de>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240429093447.4163638-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Apr 2024 12:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5180

Hi Alex,

On 4/29/24 at 11:34, Alexander Kanavin wrote:
> They used to be required for qemu graphics support, but neither is being
> for anything anymore.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/poky.yaml.in | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 7a686ac4e..5a1b8ef59 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -12,18 +12,18 @@ YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
>   YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
>   UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
>        build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
> -     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
> -     python3-subunit mesa-common-dev zstd liblz4-tool file locales libacl1
> +     xz-utils debianutils iputils-ping python3-git python3-jinja2 \
> +     python3-subunit zstd liblz4-tool file locales libacl1
>        \n\   $ sudo locale-gen en_US.UTF-8"
>   FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
>        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
>        ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>        python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
> -     python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
> +     python3-jinja2 rpcgen perl-FindBin perl-File-Compare \
>        perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en libacl"
>   OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
>        diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
> -     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
> +     python3-pexpect xz which python3-Jinja2 rpcgen \
>        zstd lz4 bzip2 gzip hostname libacl1
>        \n\   $ sudo pip3 install GitPython"
>   ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
> @@ -33,8 +33,8 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
>        \n\   $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
>        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
>        socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
> -     python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
> -     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en libacl"
> +     python3-GitPython python3-jinja2 python3-pexpect xz which \
> +     rpcgen zstd lz4 cpio glibc-langpack-en libacl"
>   PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
>   MIN_PYTHON_VERSION : "3.8.0"
>   MIN_TAR_VERSION : "1.28"


Thanks for this simplification!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


