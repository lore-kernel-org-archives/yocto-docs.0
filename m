Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A497C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 10:41:19 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.10471.1638960078358843608
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 02:41:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2273620007;
	Wed,  8 Dec 2021 10:41:15 +0000 (UTC)
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [docs] [PATCH v2] make the documentation a bit more inclusive
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20211206150401.30444-1-foss+yocto@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <7adbcaa4-ca84-fc42-b08f-a96ebf522082@bootlin.com>
Date: Wed, 8 Dec 2021 11:41:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206150401.30444-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 10:41:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2227

Quentin, Peter,

Many thanks for the long patch and review !
See my comments below...

On 12/6/21 4:04 PM, Quentin Schulz wrote:
> -For automated deployment, a "master image" is installed onto the
> +For automated deployment, a "golden image" is installed onto the


I was about to suggest "reference image", but all things considered,
"golden image" seems to work better.

>  
> @@ -10820,18 +10820,19 @@ In general, license flag matching is simple. However, understanding some
>  concepts will help you correctly and effectively use matching.
>  
>  Before a flag defined by a particular recipe is tested against the
> -contents of the whitelist, the expanded string ``_${PN}`` is appended to
> -the flag. This expansion makes each :term:`LICENSE_FLAGS` value
> -recipe-specific. After expansion, the string is then matched against the
> -whitelist. Thus, specifying ``LICENSE_FLAGS = "commercial"`` in recipe
> -"foo", for example, results in the string ``"commercial_foo"``. And, to
> -create a match, that string must appear in the whitelist.
> +entries of :term:`LICENSE_FLAGS_WHITELIST`, the expanded
> +string ``_${PN}`` is appended to the flag. This expansion makes each
> +:term:`LICENSE_FLAGS` value recipe-specific. After expansion, the
> +string is then matched against the entries. Thus, specifying
> +``LICENSE_FLAGS = "commercial"`` in recipe "foo", for example, results
> +in the string ``"commercial_foo"``. And, to create a match, that string
> +must appear among the entries of :term:`LICENSE_FLAGS_WHITELIST`.


Hey, shouldn't it be ``:${PN}`` instead here?
Only the dev-manual/common-tasks.rst file contains "_${PN}", 4 times. It
may be cleaner to address this through a separate patch.

>  
>  -  You can specify a versioned string in the recipe such as
>     "commercial_foo_1.2" in a "foo" recipe. The build system expands this
>     string to "commercial_foo_1.2_foo". Combine this license flag with a
> -   whitelist that has the string "commercial" and you match the flag
> -   along with any other flag that starts with the string "commercial".
> +   :term:`LICENSE_FLAGS_WHITELIST` variable that has the string
> +   "commercial" and you match the flag along with any other flag that
> +   starts with the string "commercial".


That's a smart move, so that we are ready to replace
"LICENSE_FLAGS_WHITELIST" by "LICENSE_FLAGS_ALLOWLIST" (or something
like that) when the code is updated.

Hey, do you know when are variable names expected to be updated? Sorry,
I couldn't attend the summit, but I hope this that's something we can
achieve in the Kirkstone timeline, if possible.

Except for the _${PN} question that may be addressed by a separate
patch, I checked that you took Peter's review into account, and must say
I like the smart alternatives that you chose.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
.... and merged into "master-next".

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


