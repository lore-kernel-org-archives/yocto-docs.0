Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31972C4332F
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 08:54:09 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.19240.1669280045205342690
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Nov 2022 00:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DdLDTdJ2;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4A03A100018;
	Thu, 24 Nov 2022 08:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669280042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7GhoN6VI2G30gNdpPMR/+M01mFng7JgZV3dZr1fA6gI=;
	b=DdLDTdJ2i1R3IasdisptDhBj0BolwjuARN6IIIJpTAgRGwVMDcb+cnO3z26Yb9bFxMZFqH
	5KS1cqqEL/0pu2AVTPGNWTt8Wsy3+kjqQ1wLXFwA3mT+9xpeNIXPhXBH2L8p6hARlXqXt2
	KY1Bgzfiwo/uRiBkfJq/liV6Veqop8EAuGd5KQpofIEpWotGmy1QLF0bAjBb7LogPPzq9X
	rNDbtzCi16o4KzPPQgz+utcyN406r6iH0LHwtqeJJR5kY1XO/rQsT4pIspNIM7NmiXmFbz
	Q2oMGFKVZbVYXmQnUiY9/Ic0QuFTAek8IDbNPyUncfm+QVTz2dlEmVX/dvgnRQ==
Message-ID: <c6589e1f-aebf-cf1c-97b2-e68c4a9ffafa@bootlin.com>
Date: Thu, 24 Nov 2022 09:53:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: "poky@lists.yoctoproject.org" <poky@lists.yoctoproject.org>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] Add missing iproute and iputils packages for
 Fedora 36
Content-Language: en-US
To: Javier Tia <javier.tia@linaro.org>
References: <20221124012446.483364-1-javier.tia@linaro.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221124012446.483364-1-javier.tia@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Nov 2022 08:54:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3501

Hi Javier,

On 11/24/22 02:24, Javier Tia wrote:
> So far from crops/yocto:fedora-36-base I have been building in Fedora 36
> without issue. Just found iproute and iputils are missing.
>
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>   documentation/poky.yaml.in                       | 2 +-
>   documentation/ref-manual/system-requirements.rst | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index ce67c4d3d..c6a6560a4 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -19,7 +19,7 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
>        ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>        python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
>        python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
> -     perl-File-Copy perl-locale zstd lz4"
> +     perl-File-Copy perl-locale zstd lz4 iproute iputils"
>   OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
>        diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
>        python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index 150263381..3e1fc40d5 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -47,6 +47,8 @@ distributions:
>   
>   -  Fedora 35
>   
> +-  Fedora 36
> +


Many thanks for the patch and for testing!
However, we usually add a new supported distro to 
meta-poky/conf/distro/poky.conf in the meta-yocto repository 
(https://git.yoctoproject.org/meta-yocto/tree/meta-poky/conf/distro/poky.conf), 
before adding it to the docs.

It seems that Fedora 36 is indeed supported now. See all the successful 
builds on https://autobuilder.yoctoproject.org/typhoon/#/builders/86

Could you send a patch for poky.conf? I could do it but you deserve the 
credit :)
Then, you can come back with the documentation patch.
Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


