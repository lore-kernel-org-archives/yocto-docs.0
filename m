Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939BCC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 12:50:22 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.6724.1655902219914336490
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 05:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Yc66ykfA;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BA448240002;
	Wed, 22 Jun 2022 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655902218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D4/r4Wun4wRAWLhQKnifksyX+RxAx+fer9sRpmCXQuk=;
	b=Yc66ykfAh/Moh9HvvrGvu/VinLRhZLGWOZmJqBaLYnhHRYaM2YEmnY/wxMnjQfZko9wS8V
	Nn7x7yMuXPV8xMmuN9/YqygtJNxg8ri8nnxzA3pkz5Fw0Ikn7Y5+FgT2EwgbF3+/Qbwm0K
	UBUaakVDBukcSuBdROu92isSLS4CTX3YZ1yq32rIm0KaaJSzq1o0C6LE5hVXStTCFn6/ZS
	jp1tYZXJxFXcdmhexs9eKEUYfgOVrwTX7AQmA5buV4DTaKezRAQc50baCGvprp++0zTbip
	9ZV48WEMrCVBUWEhKabH+WJtBpmnXOgRFurfBjkeLeuz9mSibzhyHI0MwPMQew==
Message-ID: <f14b7aa4-fa3d-7bcf-ec43-e58d0abdf507@bootlin.com>
Date: Wed, 22 Jun 2022 14:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [yocto] [PATCH yocto-autobuilder-helper 4/4] Revert "scripts:
 run-docs-build: do not turn sphinx warnings into errors"
Content-Language: en-US
To: yocto@lists.yoctoproject.org, Quentin Schulz <foss+yocto@0leil.net>
References: <20220315163115.2186540-1-foss+yocto@0leil.net>
 <20220315163115.2186540-4-foss+yocto@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220315163115.2186540-4-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jun 2022 12:50:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3020

Hi Quentin

On 3/15/22 17:31, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> The patch was meant as a quick temporary work-around to have the docs
> built and published.
>
> Now that releases where -W flag is set (turning warnings into errors)
> are appropriately patched to make those warnings disappear (on Sphinx
> v3.2.1 which is the one used on the builder), this patch can be reverted
> so that next time a warning appears the doc building will fail but will
> not destroy the doc website (because of commit
> 6a4e6ef18d1415c719be51c773d7c57cae5549cf "scripts: run-docs-build: make
> the script fail hard ASAP when there's an error", since rsync will not
> be run if any error happens before).
>
> This reverts commit 931d409b255a85f2217ca093d8391a678ce00ddb.
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   scripts/run-docs-build | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/run-docs-build b/scripts/run-docs-build
> index 73cba3f..b9b331b 100755
> --- a/scripts/run-docs-build
> +++ b/scripts/run-docs-build
> @@ -33,14 +33,14 @@ cd $bbdocs
>   echo Building bitbake master branch
>   git checkout master
>   make clean
> -SPHINXOPTS="-j auto" make publish
> +make publish
>   mkdir $outputdir/bitbake
>   cp -r ./_build/final/* $outputdir/bitbake

We're trying to build the docs with Sphinx 5.0.0 on a special branch, 
and we're getting warnings causing the builds to fail: 
https://autobuilder.yoctoproject.org/typhoon/#/builders/114/builds/487/steps/5/logs/stdio

If this patch hadn't been reverted, we would probably be fine.

What should we do now? Patch docs for all past Sphinx based releases? If 
we tolerated warnings, we would have to do this less often when we want 
to upgrade Sphinx.

In my opinion, another more trouble-free solution would be not to 
regenerate docs for past releases, but instead only for the latest 
commits in the branches we currently support.

What do you think?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


