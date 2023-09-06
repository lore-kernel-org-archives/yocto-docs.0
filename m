Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BB8EB8FA5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 08:11:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.3619.1693987875614749986
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 01:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SpB5Nk+Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65C36FF802;
	Wed,  6 Sep 2023 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693987873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9iSVdfT+03jF9d01d9DbtxaPkqjKE/ZDuOi3ZTpTS4=;
	b=SpB5Nk+Yw+wzPDpfuqROy/uhIfkAzcAOH2o4U7ZUrLijToNKiucMJuXjIuMjh0rf5w7baS
	KOnVieBT/i33bSp9RUPSWQBotzzwU/5i5+K0rjheh88P527k/Yl0OO/1hLp4ZiynGBjYfH
	I2FPmGce1/J17nhn8svg7GWJ9OXO/H9fk+9ZEzUrL4RAGkwoRyUuLiImHT98g/3WuxxvZM
	+lk6OJQkQxzXyj5oppqXEC34Ac10dBOYXIe254w+Inzngfj1JEuQBELBm2xsyEYYacb48m
	Ur4D9R1cWFyJsYCtmejLKdh+laZwrfBpTynwTsalt3HF04EtZuoEG+MXBdYlRQ==
Message-ID: <9451700c-ca47-ddbb-0961-b40a884abe5b@bootlin.com>
Date: Wed, 6 Sep 2023 10:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] README: Update to point to new contributor guide
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230830154445.2017109-1-richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230830154445.2017109-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Sep 2023 08:11:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4194

Hi Richard,

On 30.08.23 at 17:44, Richard Purdie wrote:
> Now we have a contributor guide combining various wiki pages, point at
> that and tweak to match our other READMEs.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   README | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/README b/README
> index 85d8d837b..dfbf7bf0e 100644
> --- a/README
> +++ b/README
> @@ -10,23 +10,22 @@ An online version of the documentation can be found at:
>   Contributing
>   ============
>   
> -See https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> -for generic guidelines for configuring Git and preparing patches.
> +Please refer to our contributor guide here: https://docs.yoctoproject.org/dev/contributor-guide/
> +for full details on how to submit changes.


Thanks for the update and fixes.
However, let me first add the current version of the contributor guide 
to the mickledore branch, so that we can refer to this guide through its 
final URL:
https://docs.yoctoproject.org/contributor-guide/

Then, I'll update and merge your change.
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


