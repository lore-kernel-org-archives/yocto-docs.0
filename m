Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C549DC761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 16:50:32 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.107429.1680627031769302353
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Apr 2023 09:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c/kcFfx7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BAF96FF807;
	Tue,  4 Apr 2023 16:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680627030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FydWBm6VXbKxOUA8EaRV8QK00mkOpZNKTjI/UrYuoxc=;
	b=c/kcFfx7fQKayrUy9F9COMrEVpH6CEIHQc+U6dXCJPy+Q0WPHdM2n8HFSbn0ViYqTpCURd
	QL8/f20rXTLmj4a+2SL48q7RI8k3MX2ue43DEtbPIA3+FSS04euKU/lk/Gy2FAbNg7dgeD
	dcislcH6w/NSLnqkRUA1EXQvICjTiosYTxXll/JQnLI40jO1lFzEDHbOF4FUA90d9OhU/m
	/+PxLpRBu7FRZs8PYA+fsNvvekZKmsUQqZdCqAj3ydRnAvLZyL/Eh8cSxWnJkk4l98r7VT
	9Rxrm7bbxomfa151MSYyKV0BKlC8p2w8cP1HxM1GtWfOaLlKUkxo2DXQNdkP/w==
Message-ID: <bd01e8e0-443c-a148-b5eb-ff8ce406574f@bootlin.com>
Date: Tue, 4 Apr 2023 18:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: nd@arm.com
Subject: Re: [docs] [PATCH] Increase minimum GCC version to 8.0
To: Ross Burton <ross.burton@arm.com>, docs@lists.yoctoproject.org
References: <20230404155620.3278946-1-ross.burton@arm.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230404155620.3278946-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Apr 2023 16:50:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3822

Hi Ross,

On 04.04.23 at 17:56, Ross Burton wrote:
> We've increased the minimum GCC version to 8.0[1] so update the
> documentation to match.
>
> [1] sanity.bbclass: Update minimum gcc version to 8.0
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   documentation/poky.yaml.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index dc0c257e5..1c072c1d0 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -39,7 +39,7 @@ PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
>   MIN_PYTHON_VERSION : "3.8.0"
>   MIN_TAR_VERSION : "1.28"
>   MIN_GIT_VERSION : "1.8.3.1"
> -MIN_GCC_VERSION : "7.5"
> +MIN_GCC_VERSION : "8.0"
>   MIN_MAKE_VERSION : "4.0"
>   # Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64), rounded up from 87
>   MIN_DISK_SPACE : "90"


Thanks for the patch! I saw the change too.
However, I'll wait for the change to be applied to Poky master before 
applying it.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


