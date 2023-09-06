Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC7AEE14D3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 18:25:34 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.6819.1694024728233759150
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 11:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QNoSJN40;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05F051BF205;
	Wed,  6 Sep 2023 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694024726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pGdRkigSHMCj59CEeFYeAPgCoLOISZHn8lvQCOjkBQ=;
	b=QNoSJN40qJQ87pu42/3QXm8P4FImP10brpdt8jA8SAdKRELGStULzK4/MKSqnI9vi9Gr/u
	+1b6vrKGzwz6ZBQynWs5poxcsb/WYwW7cJYiP6sG2xUXXMH9dTSNpNKBRK2yw76Prrdt6P
	Zre0Bx9m+OJGHWFZjDrz4h0+UnR/tTGwSSbzGktf2gn/0WE4sUHy+0Ft1SclAX394ywyvH
	U36W9L+nxRdEcFujDHRTQOcokSgFoadJpzQgfsRmiNNwISG5zSPsd4dqWn0HKXwr742KAe
	qdXhk4kMumSV0h3la+AbRYIhKl+VoKlQxD6a/W3wvrdbOL6kpzwJtgToWgPt3g==
Message-ID: <dd0b939b-7780-61c6-26a7-35956f4118e8@bootlin.com>
Date: Wed, 6 Sep 2023 20:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH] Add libacl to required packages
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>
References: <20230824142702.3491681-1-JPEWhacker@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230824142702.3491681-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Sep 2023 18:25:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4196

Hi Joshua,

On 24.08.23 at 16:27, Joshua Watt wrote:
> libacl is required for correctly calculating output hashes, so add it to
> the require host packages
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   documentation/poky.yaml.in | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index b2b6a6330ff..2922214bc94 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -13,18 +13,18 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
>   UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
>        build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
>        xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
> -     python3-subunit mesa-common-dev zstd liblz4-tool file locales
> +     python3-subunit mesa-common-dev zstd liblz4-tool file locales libacl1
>        \n\   $ sudo locale-gen en_US.UTF-8"
>   FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
>        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
>        ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>        python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
>        python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
> -     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en"
> +     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en libacl"
>   OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
>        diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
>        python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
> -     zstd lz4 bzip2 gzip hostname
> +     zstd lz4 bzip2 gzip hostname libacl1
>        \n\   $ sudo pip3 install GitPython"
>   ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
>        \n\   $ sudo yum install dnf-plugins-core
> @@ -34,7 +34,7 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
>        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
>        socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
>        python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
> -     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en"
> +     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en libacl"
>   PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
>   MIN_PYTHON_VERSION : "3.8.0"
>   MIN_TAR_VERSION : "1.28"


Thank you for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Is this applicable to Mickledore, Kirkstone and maybe Dunfell?
I'll be happy to update these branches too.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


