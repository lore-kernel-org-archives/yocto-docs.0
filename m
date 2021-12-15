Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD44C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.1281.1639601697427576604
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 12:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9ECB81BF208;
	Wed, 15 Dec 2021 20:54:55 +0000 (UTC)
Subject: Re: [docs] [PATCH 2/2] ref-manual: document overlayfs-etc image
 feature
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, docs@lists.yoctoproject.org
References: <20211215171138.127272-1-uvv.mail@gmail.com>
 <20211215171138.127272-2-uvv.mail@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <dfb94861-9167-7691-72ca-d0672bc9b1b5@bootlin.com>
Date: Wed, 15 Dec 2021 21:54:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215171138.127272-2-uvv.mail@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 01:44:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2279


On 12/15/21 6:11 PM, Vyacheslav Yurkov wrote:
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  documentation/ref-manual/features.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
> index ded653221..5f6c00fac 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -219,6 +219,10 @@ Here are the image features available for all images:
>  -  *empty-root-password:* Sets the root password to an empty string,
>     which allows logins with a blank password.
>  
> +-  *overlayfs-etc:* Configures ``/etc`` directory to be in ``overlayfs``.


/s/Configures/Configures the/

> +   This allows to store device specific information elsewhere, especially
> +   if rootfs is configured to be read-only.

s/rootfs/the root filesystem/

I'll propose a guideline to replace "rootfs" by "root filesystem", but
the way. Everyone understands this term here of course, but that's
better English ;-)

Thanks for the patch, and thanks in advance for the V2 ;)
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


