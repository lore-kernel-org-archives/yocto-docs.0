Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F164DC001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 09:22:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.57407.1691486528783693575
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 02:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hmc55MTc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A498220003;
	Tue,  8 Aug 2023 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691486526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9BL4NcdWNGyQI6X1Nh31yTB4pA8gTNg/hPcYT/1fJ0=;
	b=hmc55MTcxGiiEoKJxYReN9m3j1GFIVznJi+xcKvWnJJU0KrOabAfvnlSwxRKGPj54pSnZN
	wMy3xz1tup0Z4kwMPxUpcWRjjzMgObRyce1y5rQ454BBMmtL6Oi1snzNur0qUGMNV8fswc
	wffixELTeM7HgFdKEw9AUkSqWSJRX1SQ/aXaXtt4WdE/SrkyVzTv2WsS+BIsg8siM64lkD
	7L+ZOVgcA1CVYBs0xAjehnQi5BCO0b4UFXa3WiTLzR8gmOjgJIdpVv4vmPblNZH7426wib
	nev/mj5ow85kMteMtqzs511yrzNhPh2Hj1yCmvgB2zpx6846FFhUlwIo4Ay3og==
Message-ID: <149547d8-bb0b-2569-31d4-1c0eab6c8941@bootlin.com>
Date: Tue, 8 Aug 2023 11:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [docs] [PATCH] [dunfell] ref-manual: ref-system-requirements:
 update supported distros
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <17795DC4E16ECCFB.9264@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <17795DC4E16ECCFB.9264@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Aug 2023 09:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4113

Greetings,

On 08.08.23 at 11:17, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> - Update according to changes in SANITY_TESTED_DISTROS
>    (meta-poky/conf/distro/poky.conf)
>
> - No longer declare as "Supported" the distributions versions
>    which are End of Life for their vendors, as some of them
>    (Ubuntu for example) ship updates to subscribers only,
>    which the Yocto Project has no access to.
>
> - List distribution versions which were previously tested
>    for the branch of the Yocto Project being considered.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   .../ref-manual/ref-system-requirements.rst    | 34 ++++++++++++-------
>   1 file changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
> index ac963dcdb9..d45a88efa5 100644
> --- a/documentation/ref-manual/ref-system-requirements.rst
> +++ b/documentation/ref-manual/ref-system-requirements.rst
> @@ -34,22 +34,27 @@ and conceptual information in the :doc:`../overview-manual/overview-manual`.
>   Supported Linux Distributions
>   =============================
>   
> -Currently, the Yocto Project is supported on the following
> -distributions:
> +Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project is
> +supported on the following distributions:
>   
> --  Ubuntu 16.04 (LTS)
> -
> --  Ubuntu 18.04 (LTS)
> -
> --  Ubuntu 19.04
>   
>   -  Ubuntu 20.04
>   
>   -  Ubuntu 22.04
>   
> --  Fedora 28
> +-  CentOS 7.x
>   
> --  Fedora 29
> +-  Debian GNU/Linux 11.x (Bullseye)
> +
> +The following distribution versions are still tested (being listed
> +in :term:`SANITY_TESTED_DISTROS`), even though the organizations
> +publishing them no longer make updates publicly available:
> +
> +-  Ubuntu 16.04 (LTS)
> +
> +-  Ubuntu 18.04 (LTS)
> +
> +-  Ubuntu 19.04
>   
>   -  Fedora 30
>   
> @@ -65,7 +70,7 @@ distributions:
>   
>   -  Fedora 36
>   
> --  CentOS 7.x
> +-  CentOS 8.x
>   
>   -  Debian GNU/Linux 8.x (Jessie)
>   
> @@ -73,8 +78,6 @@ distributions:
>   
>   -  Debian GNU/Linux 10.x (Buster)
>   
> --  Debian GNU/Linux 11.x (Bullseye)
> -
>   -  OpenSUSE Leap 15.1
>   
>   -  OpenSUSE Leap 15.2
> @@ -85,6 +88,13 @@ distributions:
>   
>   -  AlmaLinux 8.7
>   
> +Finally, here are the distribution versions which were previously
> +tested by the &DISTRO; release ("&DISTRO_NAME;"), but no longer are:
> +
> +-  Fedora 28
> +
> +-  Fedora 29
> +
>   .. note::
>   
>      -  While the Yocto Project Team attempts to ensure all Yocto Project


Here too, I suspect that SANITY_TESTED_DISTROS is no longer up to date.
Do we really continue to test Fedora 30 (for example)? Any more recent 
ones which we are testing Dunfell on?
Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


