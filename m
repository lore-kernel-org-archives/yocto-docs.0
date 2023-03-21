Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E2CC6FD20
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 20:40:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.25965.1679431236581549810
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 13:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QOpcmBuN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 813291C0003;
	Tue, 21 Mar 2023 20:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679431234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yqGd3BwqeRj35q7FOiGmQy8V9yj7omZ25LHsHWYiwcc=;
	b=QOpcmBuN0G8k2Trh5ZB6iJ75/+KAPoSyUJ4w4jIuEAWocK4xbPudgD82IxI1r/aTxtOaaF
	CVZajqvmqcqyk3N0x+d+r30PrK2Sd6erRAvsFyu5DaLdcvsHFg+gyddLaXuGl0fk+OJsQk
	Rp87n7jmHZ6igjifCQLohjOpOSqGbLuExbfyaE1j7qz8IP07pfcBmTC1PWxcbZSuV+Cx2b
	1MZVYyXlJZwcOezcmJr9jrnXvJdYw8+Mab7PP+U63EAJxaLSaL8E+wKCQzwKdSgaOaCeMk
	Xq1+yQcgQGbr6SdS7HosF0sI8ZA7t/xqqOZMZRY12q8zPU6nSj9zVCg7P3EgMw==
Message-ID: <05c3128f-4d06-bd95-3dba-a15eba48270e@bootlin.com>
Date: Tue, 21 Mar 2023 21:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: Ross Burton <ross.burton@arm.com>
Subject: Re: [docs] [PATCH] ref-manual: release-process.rst: update testing
 section
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <174E89BB108C99F8.22739@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <174E89BB108C99F8.22739@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Mar 2023 20:40:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3812

Hello Ross,

On 21.03.23 at 21:39, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> - Remove note to section not carrying information about
>    special hosts tools for oe-selftest
>
> - Add links to mentioned repositories
>
> CC: Ross Burton <ross.burton@arm.com>
> ---
>   documentation/ref-manual/release-process.rst | 20 +++++++-------------
>   1 file changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
> index fa057e055c..be47ddfa6d 100644
> --- a/documentation/ref-manual/release-process.rst
> +++ b/documentation/ref-manual/release-process.rst
> @@ -161,25 +161,19 @@ consists of the following pieces:
>      ``oe-selftest`` can run all tests by default or can run selected
>      tests or test suites.
>   
> -   .. note::
> -
> -      Running ``oe-selftest`` requires host packages beyond the "Essential"
> -      grouping. See the :ref:`ref-manual/system-requirements:required packages for the build host`
> -      section for more information.
> -
>   Originally, much of this testing was done manually. However, significant
>   effort has been made to automate the tests so that more people can use
>   them and the Yocto Project development team can run them faster and more
>   efficiently.
>   
> -The Yocto Project's main Autobuilder (&YOCTO_AB_URL;)
> -publicly tests each Yocto Project release's code in the
> -:term:`OpenEmbedded-Core (OE-Core)`, Poky, and BitBake repositories. The testing
> -occurs for both the current state of the "master" branch and also for
> +The Yocto Project's main Autobuilder (&YOCTO_AB_URL;) publicly tests each Yocto
> +Project release's code in the :oe_git:`openembedded-core </openembedded-core>`,
> +:yocto_git:`poky </poky>` and :oe_git:`bitbake </bitbake>` repositories. The
> +testing occurs for both the current state of the "master" branch and also for
>   submitted patches. Testing for submitted patches usually occurs in the
> -"ross/mut" branch in the ``poky-contrib`` repository (i.e. the
> -master-under-test branch) or in the "master-next" branch in the ``poky``
> -repository.
> +"ross/mut" branch in the :yocto_git:`poky-contrib </poky-contrib>` repository
> +(i.e. the master-under-test branch) or in the "master-next" branch in the
> +:yocto_git:`poky </poky>` repository.


Is this "ross/mut" branch in poky-contrib still actively used? I'm not 
sure from the last commit dates...

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


