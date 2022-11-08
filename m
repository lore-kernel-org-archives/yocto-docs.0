Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDA1C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 11:11:49 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.6555.1667905902303521216
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 03:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dNDTyOyZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3C2B0E0010;
	Tue,  8 Nov 2022 11:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667905899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q9B1AoYHsX8idbS3KGOvBRC+PytioUse7oC7xqiY1eE=;
	b=dNDTyOyZTEaDGSaFhCAOKkx4jYzgGzn+Asx+fmHIEe+b7ada4nfuKNW1GbHnZTMJP9yg/A
	w/xRulJmFqCuUbnPlHpE8BPPEKs99ZVplXtSzGuvHTN6ivuuKhonATpyyHBN17fq+F01Kx
	8H/YwLRguWPI7Sy9SwDxAursUu5WQHfgMM/8LbYMwileIt1R6Kge1N7SHh+VR4TgDfAsWW
	ADVyWsVN6iTacigfiZDWvZXg4HU8KSfmyWZRwxMXZdD4bxX4TYI44Fg9LgwABscJV6kPYf
	iVi/94DpgnnVHishUx4E3xMDUfNH6WkRgdmWI3OzKbYHkgncjLcuRWPuYaDsTA==
Message-ID: <d42e8469-b004-ab05-3200-6c83c18292bc@bootlin.com>
Date: Tue, 8 Nov 2022 12:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH] docs: poky.yaml.in: remove pylint3 from
 Ubuntu/Debian host dependencies
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20221107-upstream-pylint-removal-v1-0-014ecbdb50c7@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221107-upstream-pylint-removal-v1-0-014ecbdb50c7@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Nov 2022 11:11:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3472

Hi Quentin

On 11/7/22 17:07, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> It is not actually needed outside of the autobuilder and since the
> package got renamed in Ubuntu 20.04 and later to pylint, it was giving
> the users an incorrect command line to run and would fail all the time,
> better remove it instead of trying to handle Debian/recent Ubuntu
> differences in the documentation.
>
> Moreover, the other supported host distributions didn't have pylint
> listed as a dependency, proving that it's indeed not needed.
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
> ---
>   documentation/poky.yaml.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 5639f3ca7..2d6affbca 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -13,7 +13,7 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
>   UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
>        build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
>        xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
> -     pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool"
> +     xterm python3-subunit mesa-common-dev zstd liblz4-tool"
>   FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
>        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
>        ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>
> ---
> base-commit: dce50679242d39f133e0cde5c8483b5e69f3eb54
> change-id: 20221107-upstream-pylint-removal-00f7219e14f7

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks for the patch!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


