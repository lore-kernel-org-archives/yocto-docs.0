Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915E4C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:08:43 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.32076.1641823722197165179
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 06:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id F02AB240008;
	Mon, 10 Jan 2022 14:08:38 +0000 (UTC)
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: Re: [docs] [PATCH] poky.yaml: centos-7 python36-pip -> python3-pip
To: Tim Orling <ticotimo@gmail.com>, docs@lists.yoctoproject.org
References: <20220106193341.2610619-1-tim.orling@konsulko.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9f527ad8-fe61-056f-49c6-376fcdfc2b20@bootlin.com>
Date: Mon, 10 Jan 2022 15:08:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106193341.2610619-1-tim.orling@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Jan 2022 14:08:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2366

Hi Tim,

On 1/6/22 8:33 PM, Tim Orling wrote:
> In CENTOS7_HOST_PACKAGES_ESSENTIAL, change python36-pip to python3-pip.
>
> The python36-pip package was obsoleted by python3-pip in RHEL 7.7+
>
> https://src.fedoraproject.org/rpms/python-pip/c/6771a1c54f5c7ac333c7af644c055da670027f6c?branch=epel7
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  documentation/poky.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 11e209e3075..62589acd9f0 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -30,7 +30,7 @@ CENTOS7_HOST_PACKAGES_ESSENTIAL : "-y epel-release
>       \n\      $ sudo yum makecache
>       \n\      $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
>       diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
> -     perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python36-pip xz \
> +     perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip xz \
>       which SDL-devel xterm mesa-libGL-devel zstd lz4
>       \n\      $ sudo pip3 install GitPython jinja2"
>  CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release

Thanks for the patch!

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


