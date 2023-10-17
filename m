Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4C2CDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 08:43:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.202453.1697532197512901713
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 01:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RBPVly54;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E84F5FF809;
	Tue, 17 Oct 2023 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697532195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycyfhqnKCdEUILJzGhlXpjxhpbEGqfyJ/3lQe59sMHc=;
	b=RBPVly54MV/DqwTi3MIvYQjhaVghItondIo+NftCXUuO9IJH3LXIypr27QgAOmJGf/NjiA
	MyuLJwFQ0IMu6WLsJAgUAyIFCZ8G2nNn8kSUtsBIZhKdEWEnjzbagsxSIVdWtHRxv4Gdli
	H7nmPt4gO9KBhnrzMhE7s89DuwX4+2DhYtuKXAuIh7/0xAdFrg1EanSKU4ylpvzq4oGkE3
	Yk6XgRbdmRApeOmi6exzDrRnJyWWTFtBSZJKO9egGblF6yfkKx2eIq0jHZ3ETWKMfQaSaO
	Hms1mHsgOX4AOp+EAEGeRkWvZvx/ZGjAm1EOF0TM9Fd3Xg7jVjQgzOc8stUj1Q==
Message-ID: <6c3a40d6-2881-4697-86b2-0b26ce3feb76@bootlin.com>
Date: Tue, 17 Oct 2023 10:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: variables: provide no-match example
 for COMPATIBLE_MACHINE
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>
References: <20231016-dev-compatible_machine-v1-1-6528e1c98611@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231016-dev-compatible_machine-v1-1-6528e1c98611@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 08:43:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4388

Hi Quentin

Many thanks for the patch!

On 16.10.23 at 14:16, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> COMPATIBLE_MACHINE is used to forbid the use of a recipe or its packages
> for a specific set of machines.
>
> In some cases, it may make more sense to have the logic inverted and
> have the recipe always forbidden except for hand-picked machines. Such
> could be the case for pieces of software that only support some
> architectures. In that scenario, it is sometimes a bit easier on the eye
> and for maintenance to use the OVERRIDES mechanism but for that, a
> default should be set.
>
> COMPATIBLE_MACHINE:aarch64 = "$(aarch64)$"
> COMPATIBLE_MACHINE:mips64 = "$(mips64)$"
>
> wouldn't do much because if COMPATIBLE_MACHINE isn't set, the recipe is
> assumed compatible and therefore, if no default is provided we enter
> that case.
>
> Hence, we need to add
>
> COMPATIBLE_MACHINE = "^$"
>
> as default so that it only matches the empty string, which isn't
> possible for MACHINEOVERRIDES.
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   documentation/ref-manual/variables.rst | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 11523bb9e..370b5bfbf 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1358,6 +1358,26 @@ system and gives an overview of their function and contents.
>         speed since the build system skips parsing recipes not compatible
>         with the current machine.
>   
> +      If one wants to have a recipe only available for some architectures
> +      (here `aarch64` and `mips64`), the following can be used::
> +
> +         COMPATIBLE_MACHINE = "^$"
> +         COMPATIBLE_MACHINE:arch64 = "^(aarch64)$"
> +         COMPATIBLE_MACHINE:mips64 = "^(mips64)$"
> +
> +      The first line means "match all machines whose :term:`MACHINEOVERRIDES`
> +      contains the empty string", which will always be none.
> +
> +      The second is for matching all machines whose :term:`MACHINEOVERRIDES`
> +      contains one override which is exactly `aarch64`.
> +
> +      The third is for matching all machines whose :term:`MACHINEOVERRIDES`
> +      contains one override which is exactly `mips64`.


The text looks good to me, but I see your use of single back-quotes such 
as in `mips64`.

Was that a special choice? In most of the documentation, we use double 
back-quotes. You can check the variables.rst file.

Would you see a case for using single back-quotes? At least on my 
machine, `word` produces italic text, while *word* produces boldface italic.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


