Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BCDC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 08:38:57 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.38357.1658219934851307373
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 01:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NnVxq8wC;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 47A3720000C;
	Tue, 19 Jul 2022 08:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658219932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RwnL6wDGcRj4WYqti838MYGEl9YyrYNDLMreAkXdXjA=;
	b=NnVxq8wCRiAx1wlm0FeYDCsgT293Bl5Kb2Lp3STVdt8Hui6Jxjt/6sUUBZLU2jwTyd/Z3E
	nUl2epxFzfMJtO4BxmjiqITPV4KZeoKnB2HB7i+DA8ajTorPE8fCeqRBVVqYzfLb+nMH+/
	OvYj9ooz5jU6TMdWXWFIgVpXLSUWPHDSNe03eeOzW5UJO4C+ixa+kGryYftV5V5/zazqcv
	yqnkFBPNpJtW/WJOVn8V1LHmMCTBiKIm5GinO/hBVIHl2Uc1gb2zdMKenXSJBl5dArWgjF
	AygkHp7SObNEXkypAX3kUpE5Hw4gzb/OEeAIOIimsRDRYSKVRMrkhR2fko7tpA==
Message-ID: <5b760b4a-1f67-8799-ec91-44d81d3ad2f5@bootlin.com>
Date: Tue, 19 Jul 2022 10:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Paul Eggleton <paul.eggleton@microsoft.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Re: [docs] [dunfell][PATCH] ref-manual: Add XZ_THREADS and
 XZ_MEMLIMIT
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20220718161745.652970-1-foss+yocto@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220718161745.652970-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Jul 2022 08:38:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3067

Hi Quentin

Thanks for the patch!

On 7/18/22 18:17, Quentin Schulz wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> XZ_THREADS and XZ_MEMLIMIT were introduced in dunfell.
>
> [RP improved an original patch from Paul]
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   documentation/ref-manual/ref-variables.rst | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
> index 49e756cfb..c5facfa98 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -8745,4 +8745,23 @@ system and gives an overview of their function and contents.
>   
>         The default value of ``XSERVER``, if not specified in the machine
>         configuration, is "xserver-xorg xf86-video-fbdev xf86-input-evdev".
> -
> +
> +   :term:`XZ_THREADS`
> +      Specifies the number of parallel threads that should be used when
> +      using xz compression.
> +
> +      By default this scales with core count, but is never set less than 2
> +      to ensure that multi-threaded mode is always used so that the output
> +      file contents are deterministic. Builds will work with a value of 1
> +      but the output will differ compared to the output from the compression
> +      generated when more than one thread is used.
> +
> +      On systems where many tasks run in parallel, setting a limit to this
> +      can be helpful in controlling system resource usage.
> +
> +    :term:`XZ_MEMLIMIT`
> +      Specifies the maximum memory the xz compression should use as a percentage
> +      of system memory. If unconstrained the xz compressor can use large amounts of
> +      memory and become problematic with parallelism elsewhere in the build.
> +      "50%" has been found to be a good value.
> +


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into the "dunfell" branch.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


