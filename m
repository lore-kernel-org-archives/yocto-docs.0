Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F163C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 18:02:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.122.1659117744885974064
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 11:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ld09eFez;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 02F2420004;
	Fri, 29 Jul 2022 18:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659117742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pYr6AoEycs4oXNF+l2OqqUm7dlsBtGBH+FpWzkYt5A=;
	b=Ld09eFezArUlhtnPBed0Qz3aEWRs09WKheyJ9FgmrrIT7kTfIhL3FZ3Q6+i4g1zlbdFlFy
	kM4kzhVuWZzLpD12FIGi1JwB4xaQfW/9Ytpww/zpyI0m5CCt7lo0F4h+hn9C++p5e/Q+Pe
	yleDREWA5cAHc+X7IEOsTfu0Otu85BQpnf4rilJIKROWz6D+Ta3e+6YgOa/xsU22jzVdBU
	xwKucmCOr6kmJ183jBFIGwB0fi/+erYwUQa+8F5wZTzmf7paSdL9eICGz6X3wl7yxUpMF5
	05imF2qlyK07VN9chCTSFudf5uV7s7ixHU4d2xZ+kYugg9GcRLZ3SwZTh+kGtg==
Message-ID: <9f0ce5de-3446-c8bb-9269-be8a418c4e93@bootlin.com>
Date: Fri, 29 Jul 2022 20:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [PATCH] system-requirements.rst: remove EOL and Centos7
 hosts
Content-Language: en-US
To: Armin Kuster <akuster808@gmail.com>, docs@lists.yoctoproject.org
References: <20220729142447.100641-1-akuster808@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220729142447.100641-1-akuster808@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Jul 2022 18:02:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3093

Hi Armin

Thanks for the update!

On 7/29/22 16:24, Armin Kuster wrote:
> Commit https://git.yoctoproject.org/poky/commit/?id=d08e47312741a18e7be505d22762b90528253ac9
> removed some EOL and CentOS7 from list hos supported hosts. Sync docs with Poky
> Replace CentOS with AlmaLinux.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   .../ref-manual/system-requirements.rst        | 37 +------------------
>   1 file changed, 2 insertions(+), 35 deletions(-)
>
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index 6cf88f2a9..614f25c21 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -45,14 +45,8 @@ distributions:
>   
>   -  Fedora 35
>   
> --  CentOS 7.x
> -
> --  CentOS 8.x
> -
>   -  AlmaLinux 8.5
>   
> --  Debian GNU/Linux 9.x (Stretch)
> -
>   -  Debian GNU/Linux 10.x (Buster)
>   
>   -  Debian GNU/Linux 11.x (Bullseye)
> @@ -177,38 +171,11 @@ supported openSUSE Linux distribution:
>         &PIP3_HOST_PACKAGES_DOC;
>   
>   
> -CentOS-7 Packages
> ------------------
> -
> -Here are the required packages by function given a
> -supported CentOS-7 Linux distribution:
> -
> --  *Essentials:* Packages needed to build an image for a headless
> -   system::
> -
> -      $ sudo yum install &CENTOS7_HOST_PACKAGES_ESSENTIAL;
> -
> -   .. note::
> -
> -      -  Extra Packages for Enterprise Linux (i.e. ``epel-release``) is
> -         a collection of packages from Fedora built on RHEL/CentOS for
> -         easy installation of packages not included in enterprise Linux
> -         by default. You need to install these packages separately.
> -
> -      -  The ``makecache`` command consumes additional Metadata from
> -         ``epel-release``.
> -
> --  *Documentation:* Packages needed if you are going to build out the
> -   Yocto Project documentation manuals::
> -
> -      $ sudo yum install make python3-pip which
> -      &PIP3_HOST_PACKAGES_DOC;
> -
> -CentOS-8 Packages
> +AlmaLinux-8 Packages
>   -----------------


Actually, Sphinx aborted because of missing dashes here. I'm fixing that.

I'm also proposing to remove 2 paragraphs related to Debian 8. A V2 is 
coming right away.

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


