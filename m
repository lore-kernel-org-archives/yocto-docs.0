Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC89C7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 08:39:18 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.16791.1684831153449783241
 for <docs@lists.yoctoproject.org>;
 Tue, 23 May 2023 01:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FxvEHCVo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 450D540014;
	Tue, 23 May 2023 08:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684831150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m+8J9tsYSVRJYDEt+vycw6+s02KWLWDk5QhhiObD0+g=;
	b=FxvEHCVodUeaOsZDWjz4DPGaXHRYWE9Coqn+Lxk2bb43491gXJnb9WRtoQKkt98Wt/9EMG
	fWTRQ+uPtM/y/qvjgPTMydgfwjVAJX4+mVYhCo3OTxS/yQIlJE52fCBc415UZirWtrfCTO
	2D+Wm1i/3LAiFGE/U5fVq1OPM/nU4g4eoMkj0iCptLhh1T+C2bNm4PCViuE4Paw/KdquOU
	nYyFjuXhQkpkT/pzdfb4j+cWA4CTFyNchmtB4Lyco40cyHF+eD140R3UvJk/QvYB8asg3D
	hk77WxgvuvPjHizeB+vOJZdkclHOHT1bkUNOfS4GT+LEkBStFj1F/1f1K07gxQ==
Message-ID: <21db4d81-57ab-9299-3179-c74e9f972df1@bootlin.com>
Date: Tue, 23 May 2023 10:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] kernel-dev: Use protocol=https in a SRC_URI
 example
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20230523013242.54314-1-pkj@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230523013242.54314-1-pkj@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 May 2023 08:39:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3954

Hi Peter,

On 23.05.23 at 03:32, Peter Kjellerstedt wrote:
> This matches the change in commit 139102a73d (recipes: Default to https
> git protocol where possible) in openembedded-core.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>   documentation/kernel-dev/advanced.rst | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
> index 35195135c4..355326de6e 100644
> --- a/documentation/kernel-dev/advanced.rst
> +++ b/documentation/kernel-dev/advanced.rst
> @@ -730,11 +730,10 @@ reside in a separate repository. The OpenEmbedded build system adds the
>   Metadata to the build as a "type=kmeta" repository through the
>   :term:`SRC_URI` variable. As an
>   example, consider the following :term:`SRC_URI` statement from the
> -``linux-yocto_4.12.bb`` kernel recipe::
> -
> -   SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
> -              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
> +``linux-yocto_5.15.bb`` kernel recipe::
>   
> +   SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
> +              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
>   
>   ``${KMETA}``, in this context, is simply used to name the directory into
>   which the Git fetcher places the Metadata. This behavior is no different


Many thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


