Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FD0C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 14:52:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.9502.1659538336625438652
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 07:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K6NlDILS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 778C21BF20B;
	Wed,  3 Aug 2022 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659538333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mqn1RhNT5WJiwxyxaUYU8lzj09k0LU2DUKarkHzPXKI=;
	b=K6NlDILSPmPmJn27NJN5G1+gkxptKo/PJgYgXUwtMLIUkgCWtkXpm2eAbqgkj8tqKPW0O0
	8OsVxeTHRSZSG7lnECqIFZVwCEDhCK0EWIzSA324Aeqg/piSXsfi+Qff0H7OfIGBc7bkPO
	k/mk0SWGuhAG+qv9TFN6VhSgwTzSsuBjY0FgD/u9KH/j1k6SjO6HkNEjqQF7DycCeGysyj
	sszrGs6P7hBioDcBalmyXwggai9oIeqTwPp3CDHul6b9LcWRbq/31hIZtOtAfHqKXD81Jr
	R6jbMjipQbaEch1nqLoqbjnLeE2Fk50Vb218BC8HBl1CExaOijHX/GdAjA+q2g==
Message-ID: <d648db04-13f7-b20e-5922-565a611995c2@bootlin.com>
Date: Wed, 3 Aug 2022 16:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: Re: [docs] [PATCH 2/2] sdk-manual: describe how to use extensible SDK
 functionality directly in a Yocto build
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, docs@lists.yoctoproject.org
References: <20220802083803.2773818-1-alex@linutronix.de>
 <20220802083803.2773818-2-alex@linutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220802083803.2773818-2-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Aug 2022 14:52:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3111

Hi Alex,

On 8/2/22 10:38, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../sdk-manual/appendix-customizing.rst       | 14 ++--
>   documentation/sdk-manual/appendix-obtain.rst  | 18 +++++-
>   documentation/sdk-manual/extensible.rst       | 64 ++++++++++++++++++-
>   documentation/sdk-manual/working-projects.rst |  8 +++
>   4 files changed, 96 insertions(+), 8 deletions(-)


Thanks for the patch!

I had a few issues indentation issues but I fixed them:

/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/sdk-manual/extensible.rst:1269: 
WARNING: Literal block expected; none found.
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/sdk-manual/working-projects.rst:93: 
ERROR: Unexpected indentation.
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/sdk-manual/working-projects.rst:288: 
ERROR: Unexpected indentation.

> diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
> index ece378c75..9b7717a4c 100644
> --- a/documentation/sdk-manual/appendix-obtain.rst
> +++ b/documentation/sdk-manual/appendix-obtain.rst
> @@ -4,8 +4,22 @@
>   Obtaining the SDK
>   *****************
>   
> +Working with the SDK components directly in a Yocto build
> +=========================================================
> +
> +Please refer to section
> +":ref:`sdk-manual/extensible:Setting up the Extensible SDK environment directly in a Yocto build`"
> +
> +Note that to use this feature effectively either a powerful build
> +machine, or a well-functioning sstate cache infrastructure is required:
> +otherwise significant time could be spent waiting for components to be built
> +by bitbake from source code.


I replaced "bitbake" by "BitBake" here. That's how we usually refer to 
the tool.

>
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
> index ed9e43a2d..ae0587fec 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -41,6 +41,42 @@ functionality.
>   Installing the Extensible SDK
>   =============================
>   
> +Two ways to install the Extensible SDK
> +--------------------------------------
> +
> +Extensible SDK can be installed in two different ways, and both have
> +their own pros and cons:
> +
> +1. *Setting up the Extensible SDK environment directly in a Yocto build*. This
> +avoids having to produce, test, distribute and maintain separate SDK installer
> +archives, which can get very large. There is only one environment for the regular
> +yocto build and the SDK and less code paths where things can go not according to plan.
> +It's easier to update the SDK: it simply means updating the yocto layers with

Here, I replaced "yocto" by "Yocto" too (4 times in this file).

> +git fetch or layer management tooling. The SDK extensibility is better than in the
> +second option: just run ``bitbake`` again to add more things to the sysroot, or add layers
> +if even more things are required.
> +
> +2. *Setting up the Extensible SDK from a standalone installer*. This has the benefit of
> +having a single, self-contained archive that includes all the needed binary artifacts.
> +So nothing needs to be rebuild, and there is no need to provide a well-functioning

s/rebuild/rebuilt/
Fixed

> diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
> index 7f8d9b849..12cb2efee 100644
> --- a/documentation/sdk-manual/working-projects.rst
> +++ b/documentation/sdk-manual/working-projects.rst
> @@ -88,6 +88,10 @@ project:
>   
>         $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
>   
> +   Another example is sourcing the environment setup directly in a yocto
> +   build::
> +      $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux


Missing an empty line after "::" here. Fixed.

> +
>   3. *Create the configure Script:* Use the ``autoreconf`` command to
>      generate the ``configure`` script.
>      ::
> @@ -279,6 +283,10 @@ example:
>   
>         $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
>   
> +   Another example is sourcing the environment setup directly in a yocto
> +   build::
> +      $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux


Same here. Fixed too.

After the fixes: Reviewed-by: Michael Opdenacker 
<michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


