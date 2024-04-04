Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A4CCD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 18:06:25 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.45703.1712253981676492713
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 11:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=np6PF1ql;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EA3460004;
	Thu,  4 Apr 2024 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712253980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZwBMLFAtFpKiYyfh8cLY3Q/XrVJjTdLZ2Qo97LWrT0=;
	b=np6PF1qln8CUYy0zPCeZujSmAXkRFgFPhIkcFDY5eEapHJqpjYT14yaqCc4O4i6hJ7h6qE
	Omx9l26inMtv98W12Cd2DhLj9a+hmPNDMPFVjY2NLE7GMjZ7wXK3osbiyDdrqQry6XdflJ
	+d13CpucmJppw4/j73DmXl4uUBmPoxc56594yvNzK8SnLxdgB8FmJp+MeJVEWQtIHRfRsy
	hzv/0a3mt1singVDhocuTSDRwwYxPl23H9t5r5aod58xK0bmnjKNuudXePmraG/eZHhKWY
	yqypWP2Zu8KnYgUYw4LBekklH7RGxwDfAg2PMo3nMlqAMROaEbmIAGUE4JSDhA==
Message-ID: <4f6ca2c8-3ccb-4cca-b880-3d853223c8ea@bootlin.com>
Date: Thu, 4 Apr 2024 20:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: thomas.petazzoni@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [PATCH v1 5/5] release-notes: add create_go.py to script changes
To: joaomarcos.costa@bootlin.com
References: <20240404165620.2248838-1-joaomarcos.costa@bootlin.com>
 <20240404165620.2248838-6-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240404165620.2248838-6-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Apr 2024 18:06:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5067


On 4/4/24 at 18:56, joaomarcos.costa@bootlin.com wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> Mention this new script, at recipetool, in 'Utiliy script changes'.


s/Utiliy/Utility/

Fixed!

>
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   documentation/migration-guides/release-notes-5.0.rst | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index 4ff05d86f..1c8538986 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -46,6 +46,8 @@ New Features / Enhancements in 5.0
>   
>   -  Utility script changes:
>   
> +   -  New ``recipetool/create_go.py`` script added to support Go recipe creation
> +
>   -  BitBake improvements:
>   
>   -  Packaging changes:


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.

So, just need updates for 2 commits.
Please send them against "master-next".

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


