Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B093C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 14:38:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.24032.1706884698664193258
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Feb 2024 06:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A9a+iGDV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A32A2E0011;
	Fri,  2 Feb 2024 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706884697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bPeA5BsvWdOlTWlgXmFp/aDXuwZrmEaR/Ga5psF56cI=;
	b=A9a+iGDVMxj5+tmWsJHNWykgDptmT6aXbxMLloDwos3D0Q6WWDYTewQOHzIcC1JZfLITTM
	wBVljB+3nnJzDkd5DcV9WLWMmRXKc4u50anaNRBN8AVF5mpcMKwUFyFPRuxMODiAJb4dmi
	JLPzYPzr5B9SyR/4EqwYO+5LCLrlhrFcWmY+/fUuUQgQLdrfW34Hxvrw5MLvzYXGiSS3KA
	e8I8VRLfg+Hqqr1Xkjs/siBaDKQ9ICSwiOBsLDZFqzXa/0JXTCSPRjOqSBU1alV54ad4vA
	zXSGlzogkQIG3So6zXruJYVuTduGE8T6UFxSRz03i8DQMoJ3KOrgJswa81D77g==
Message-ID: <bfc530d1-e8a8-481c-b56d-781142ebfa86@bootlin.com>
Date: Fri, 2 Feb 2024 15:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: gen-tapdevs need iptables installed
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>
References: <20240201165046.28589-1-simone.p.weiss@posteo.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240201165046.28589-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 Feb 2024 14:38:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4807

Hi Simone

On 2/1/24 at 17:50, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> Add the hint to the test setup that runqemu-gen-tapdevs will need the
> iptables package installed.
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>   documentation/dev-manual/runtime-testing.rst | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
> index be1e8c02e..1a2e9ec4f 100644
> --- a/documentation/dev-manual/runtime-testing.rst
> +++ b/documentation/dev-manual/runtime-testing.rst
> @@ -52,6 +52,8 @@ In order to run tests, you need to do the following:
>            -  Be sure to use an absolute path when calling this script
>               with sudo.
>   
> +         -  Ensure that your host has the package ``iptables`` installed.
> +
>            -  The package recipe ``qemu-helper-native`` is required to run
>               this script. Build the package using the following command::
>   


Thanks for the patch, but it doesn't apply with "git am" on 
"master-next". Did you send it with "git send-email", or was the patch 
messed-up by your mail server?

Applying: dev-manual: gen-tapdevs need iptables installed

error: patch failed: documentation/dev-manual/runtime-testing.rst:52

error: documentation/dev-manual/runtime-testing.rst: patch does not apply

Patch failed at 0001 dev-manual: gen-tapdevs need iptables installed

hint: Use 'git am --show-current-patch=diff' to see the failed patch

When you have resolved this problem, run "git am --continue".

If you prefer to skip this patch, run "git am --skip" instead.

To restore the original branch and stop patching, run "git am --abort".

Of course, I could re-create the patch, but that's interesting to solve 
this issue for next time.
Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


