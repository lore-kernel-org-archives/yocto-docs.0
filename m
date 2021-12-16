Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40589C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 16:52:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.13035.1639673564768170992
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 08:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E92AF40004;
	Thu, 16 Dec 2021 16:52:42 +0000 (UTC)
Subject: Re: [docs] [PATCH v2 2/2] ref-manual: document overlayfs-etc image
 feature
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, docs@lists.yoctoproject.org
References: <20211216112235.129737-1-uvv.mail@gmail.com>
 <20211216112235.129737-2-uvv.mail@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <daf0e23e-60f5-6716-5137-c64b4d4442a1@bootlin.com>
Date: Thu, 16 Dec 2021 17:52:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216112235.129737-2-uvv.mail@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 16:52:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2289

Hi Slava,

Many thanks for the updates!

On 12/16/21 12:22 PM, Vyacheslav Yurkov wrote:
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  documentation/ref-manual/features.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
> index ded653221..57fe0cc3c 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -219,6 +219,10 @@ Here are the image features available for all images:
>  -  *empty-root-password:* Sets the root password to an empty string,
>     which allows logins with a blank password.
>  
> +-  *overlayfs-etc:* Configures the ``/etc`` directory to be in ``overlayfs``.
> +   This allows to store device specific information elsewhere, especially
> +   if root filesystem is configured to be read-only.
> +
>  -  *package-management:* Installs package management tools and preserves
>     the package manager database.


For both patches: Reviewed-by: Michael Opdenacker
<michael.opdenacker@bootlin.com>
There were a few remaining punctuation and missing article issues (that
I probably failed to report), but I was happy to fix them!

Merged in "master-next".

Thanks again.
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


