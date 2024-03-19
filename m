Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004CAC54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 09:32:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10892.1710840720094125788
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 02:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bu397G20;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFE661BF209;
	Tue, 19 Mar 2024 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710840718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FYKYFLfGDVLgi0HK6UCldXDOzGnI5g8Cp0fnfqLPKj8=;
	b=bu397G20vGs97Of3QlBeUxIINxMcsYBabpzmfywjdZMZT6WRzkrers5o0klUVmuu7WZK7c
	XogCFC+tuyfBigJeC8QFeYHRaWshvSHMXxpShSPJQLOG8S0lGjaw84n3biNTRkyEGGbDma
	10fYCEavRljGY06UZkddcm7l8n/u5PVi8bu3WXKzvP8wHNtFLdOyx81XTvtBeuxo8iz+8v
	OyjV9IqIAioahzR4UpUbAbMcLdLELdYRlLJVY8xSXLk4CC4kehYZfg220HL1twQUSCZXLP
	zZdVQ3BqKvfrMJmNEmQO7FR4a0Si4JvpKgLstQaUqovo1rD3uFsrX9kMIBEOrQ==
Message-ID: <2def2a3f-7c65-4618-a8a7-86928acae537@bootlin.com>
Date: Tue, 19 Mar 2024 10:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/3] sdk-manual: correctly describe separate
 build-sysroots tasks in direct sdk workflows
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20240318150211.1192651-1-alex@linutronix.de>
 <20240318150211.1192651-2-alex@linutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240318150211.1192651-2-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Mar 2024 09:32:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4992

Hi Alex,

On 3/18/24 at 16:02, Alexander Kanavin wrote:
> They were separated in
> https://git.yoctoproject.org/poky/commit/?id=63e53fb8b60d38315015844bd3357fa1649cd639
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/sdk-manual/extensible.rst | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
> index 05dd527469e..3f6a754d881 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -76,7 +76,7 @@ Setting up the Extensible SDK environment directly in a Yocto build
>         $ bitbake meta-ide-support
>         $ bitbake -c populate_sysroot gtk+3
>         # or any other target or native item that the application developer would need
> -      $ bitbake build-sysroots
> +      $ bitbake build-sysroots -c build_native_sysroot && bitbake build-sysroots -c build_target_sysroot
>   
>   Setting up the Extensible SDK from a standalone installer
>   ---------------------------------------------------------
> @@ -1507,8 +1507,12 @@ In this scenario, the Yocto build tooling, e.g. ``bitbake``
>   is directly accessible to build additional items, and it
>   can simply be executed directly::
>   
> +   $ bitbake curl-native
> +   # Add newly built native items to native sysroot
> +   $ bitbake build-sysroots -c build_native_sysroot
>      $ bitbake mesa
> -   $ bitbake build-sysroots
> +   # Add newly built target items to target sysroot
> +   $ bitbake build-sysroots -c build_target_sysroot
>   
>   When using a standalone installer for the Extensible SDK
>   --------------------------------------------------------


Thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


