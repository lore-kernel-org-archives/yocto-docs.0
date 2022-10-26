Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343C1C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:55:44 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.8408.1666796139914112509
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 07:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mLS38RgR;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 90562240002;
	Wed, 26 Oct 2022 14:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666796138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tGKDG4pBRuJqfYFVaWMkbkyqTk2k2XC5T64UNmqj4zI=;
	b=mLS38RgRsO40V59MTKua8LgyaVc+HoD4PMSXUHjX/4t6bQGBLufZQybL4w7gmsoL6XYYmm
	swNyKEmElPsjgGfI/dRmkJU9DLqU+ftkSdUWEmCYglaFgQ5CYhqG+7mKzCXj0F6mB3huVg
	ikFJ4OPODN6qgmgHzgIgRgtZk/xZbN/5kIsQKy14/6Dcoypd4PG6UaZJBOA1vXZCa+EE0Z
	AxaEVXw/Ggm6LnI1cacdNbUniq1lFPgvIabtFAIldfGtI8pdryrQIQBcX57yXHRVqlDgtz
	upAca6EMjOfY2I14wDhRNIabhv78BbSoiXpt1738v7w0KyOsMYjTO7O8Dox7jg==
Message-ID: <bdb49328-0803-c6eb-fc39-c80664890628@bootlin.com>
Date: Wed, 26 Oct 2022 16:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/4] ref-manual/variables.rst: add documentation
 for CVE_VERSION
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20221026131207.3655961-1-mikko.rapeli@linaro.org>
 <20221026131207.3655961-2-mikko.rapeli@linaro.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221026131207.3655961-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 14:55:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3413


On 10/26/22 15:12, Mikko Rapeli wrote:
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
>
> Related to cve-check.bbclass.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   documentation/ref-manual/variables.rst | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 71e8c272a7..467b9678f1 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1508,6 +1508,18 @@ system and gives an overview of their function and contents.
>   
>            CVE_PRODUCT = "vendor:package"
>   
> +   :term:`CVE_VERSION`
> +      In a recipe, defines the version used to match the recipe version
> +      against the version in the `NIST CVE database <https://nvd.nist.gov/>`__
> +      when usign :ref:`cve-check <ref-classes-cve-check>`.
> +
> +      The default is ${:term:`PV`} but if recipes use custom version numbers
> +      which do not map to upstream SW component release versions and the versions


I'd rather use the full word "software" instead of "SW", which isn't 
used anywhere else in the documentation.
I fixed this in my local branch, so no need to send a new version.

Unless there are further reviews.
Thanks again
Cheers
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


