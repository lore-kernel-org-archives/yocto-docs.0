Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07BBEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 08:48:25 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.6420.1687337296887103839
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 01:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oqnnBt2R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687337294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+5AhGG5DrfI1YtqN8MWuR4weS55x9xbU+Oxfy/LhxI=;
	b=oqnnBt2RwCO78xj5R9G9bQjSWIy/kJfvVT8pmzrhOB7MEUvCIIcAZJVzIw3Qh9s5hWCz0E
	5F+TEpSSG0rTzKa7pOjkOq2b3KDmOilbosKkYz2PIG55Hv1n20Vk1pGy4RiWczSVXqgphy
	3ej7FiPGqorF4SoPUA+d4W3grS+MnC1AzB0Wc0Jqy7dFRB12+6HIuvx3GYArk2GTI3dyyi
	jVh11g1cHkbW5k52UaIVfwTh9JV6vl6L/Ywwa/ebvYWerLhtmJAwp2VWVNYTYWl0Yhvry1
	UZCYygACzHVe8h9uooracx7Oq6VEsVF4WaNRKiD+Yd/Anw/kpXUkAw8QjhJdEw==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00C1460007;
	Wed, 21 Jun 2023 08:48:13 +0000 (UTC)
Message-ID: <24b77e34-7e49-adfc-f0f3-259ed41eda2c@bootlin.com>
Date: Wed, 21 Jun 2023 10:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] migration-guide: Add notes on systemd/usrmerge
 changes
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230620140053.2802542-1-richard.purdie@linuxfoundation.org>
 <20230620140053.2802542-2-richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230620140053.2802542-2-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jun 2023 08:48:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4017

Hi Richard,

On 20.06.23 at 16:00, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   documentation/migration-guides/migration-4.3.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/documentation/migration-guides/migration-4.3.rst b/documentation/migration-guides/migration-4.3.rst
> index e72967bf3..74cc6354c 100644
> --- a/documentation/migration-guides/migration-4.3.rst
> +++ b/documentation/migration-guides/migration-4.3.rst
> @@ -55,6 +55,13 @@ Go language changes
>   -  Support for the Glide package manager has been removed, as ``go mod``
>      has become the standard.
>   
> +Systemd changes
> +~~~~~~~~~~~~~~~
> +
> +Upstream systemd is now more strict on filesystem layout and the usrmerge
> +feature is therefore required alongside systemd. The Poky test configurations
> +have been updated accordingly for systemd.


Thanks for the two patches!
After a few minor formatting edits, I merged them into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


