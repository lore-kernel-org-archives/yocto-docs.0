Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D697C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 09:08:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.3619.1646989682389521394
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 01:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NENEyt/3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 54E481C0015;
	Fri, 11 Mar 2022 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646989680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4By0uZMOHHEBmyL3RPDMEFieu+xPlxz+FGNX/aDiKCY=;
	b=NENEyt/3lzTPco3ni6SWorY65JywQY7MQr+HvY0xLImcUFXfb+5sH4OXSNTYcuoSWzF00r
	RlUsFC/tNetL4BiTI8bwNBWtG29D6AM+sTbzXWIUKg4/w7IbcyHkPUyTDFndzj/fbKy6XX
	8ra4btcsraKu+F9f/z7Nc5vMZjijBS57c/Uc2Mz1zBHpoCCmDh6hyrYLGR5GCxjRK/BbLF
	N+rrIDCdxl+XThAP8OGBezcKsNKDpvAkPRozIMjmU3dXQYfBSZKB5GoLeEeCSSEedcZB7L
	03g4h+bhOBaQV9GH++d/KR4XZcFAO8rKyoCnwqaPJwucB784k0A/Z2Dl5rNkSA==
Message-ID: <91bffdef-67e4-2576-f6ad-3fd9cec983a6@bootlin.com>
Date: Fri, 11 Mar 2022 10:07:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] ref-manual: system-requirements: update supported
 Linux distributions
Content-Language: en-US
To: Christian Eggers <ceggers@arri.de>, docs@lists.yoctoproject.org
References: <20220311084642.22339-1-ceggers@arri.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220311084642.22339-1-ceggers@arri.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Mar 2022 09:08:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2591

Hi Christian

Thanks for the update!

On 3/11/22 09:46, Christian Eggers wrote:
> Align with recent changes in meta-poky/conf/distro/poky.conf
>
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  documentation/ref-manual/system-requirements.rst | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index 30294cb27a3e..b35dc22a39e7 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -37,29 +37,31 @@ Supported Linux Distributions
>  Currently, the Yocto Project is supported on the following
>  distributions:
>  
> +-  Ubuntu 16.04 (LTS)


How can we support this version of the distro when we don't have the
latest updates, which only Canonical customers can receive?
This version was removed a few months ago from the documentation because
of that.

> +
>  -  Ubuntu 18.04 (LTS)
>  
>  -  Ubuntu 20.04 (LTS)
>  
> --  Fedora 33
> +-  Ubuntu 21.10


For Ubuntu 21.10, is it worth supporting this version, which support
will end in July this year? Of course, no problem to run sanity tests on
this one, which will help with the next Ubuntu LTS...

Other than that, the new ones look fine to me.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


