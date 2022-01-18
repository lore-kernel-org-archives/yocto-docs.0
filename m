Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFE8C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 09:03:39 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.10352.1642496617307190446
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 01:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6D3CF24000E;
	Tue, 18 Jan 2022 09:03:35 +0000 (UTC)
Subject: Re: [docs] [PATCH] dev-manual/common-tasks: Fix typo
To: Robert Joslyn <robert.joslyn@redrectangle.org>,
 docs@lists.yoctoproject.org
References: <20220118004250.1083005-1-robert.joslyn@redrectangle.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3b758b50-5e57-0fa5-4c2a-f2ddbbd59776@bootlin.com>
Date: Tue, 18 Jan 2022 10:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118004250.1083005-1-robert.joslyn@redrectangle.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jan 2022 09:03:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2420

Hi Robert,

On 1/18/22 1:42 AM, Robert Joslyn wrote:
> direction -> directory
>
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  documentation/dev-manual/common-tasks.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index ed6b1446f..d465c2f44 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -7032,7 +7032,7 @@ variables were set.
>  
>  The ``opkg`` application uses configuration files to find available
>  package databases. Thus, you need to create a configuration file inside
> -the ``/etc/opkg/`` direction, which informs ``opkg`` of any repository
> +the ``/etc/opkg/`` directory, which informs ``opkg`` of any repository
>  you want to use.
>  
>  As an example, suppose you are serving packages from a ``ipk/``


Good catch, thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


