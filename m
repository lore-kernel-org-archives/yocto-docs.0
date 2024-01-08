Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD95C47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 18:22:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.4765.1704738125948493906
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 10:22:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eKA6lFbX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFBAC1BF204;
	Mon,  8 Jan 2024 18:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704738124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7EZCWz87mPo/4t5L1FR/4zIfmqNdLYxFn42jnKLvUc=;
	b=eKA6lFbXzlBCAvt9jYThrWG1tfybepNe/qJNdZz1dS2hEMkgwaveE8MKgqJhZzembjzBs1
	L1Ms2CRIAzaOTMW9MyaaPCoBTDZEjhuLl6dCKNXzikceliMHmHLtPGLbJcvQjx17VUsFKG
	cOvWDE7bEkvHviqoOcEBoLNNFsdKZA0j5/XU7+gpe5gByMFHXsqkVzNPVFfunNF1XQxNoN
	cElpZC79n/8siS8oAYIiE/uhQrsGutnWNJhKA4Segs5asdoUYoqsJ8VjlocfiMx6GiBcki
	5tXr44gJj2EtaN7CY/VxYTd7CECMsfmaEa7iwxoAR51WAFRXvE0EPseuL373zw==
Message-ID: <94a2c456-a490-4b0a-86b8-22c9b3fdaed0@bootlin.com>
Date: Mon, 8 Jan 2024 19:22:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Talel BELHADJ SALEM <bhstalel@gmail.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] overview-manual: Fix bitbake taskmap example
Content-Language: en-US
To: simone.p.weiss@posteo.com
References: <20231223170808.873741-1-simone.p.weiss@posteo.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231223170808.873741-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jan 2024 18:22:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4750

Hi Simone,

Thanks for the update!

On 23.12.23 at 18:08, simone.p.weiss@posteo.com wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> Fix the shared library example, as it currently will throw errors during
> `bitbake sayhello`.
>
> 1) Add `SRCREV = ${AUTOREV}` to both recipes to fix the FetchError
>     complaining about missing valid `SRCREV`.
> 2) Ensure the libhello is build as libhello.so.0.1 instead of libhello.so.1.0.
>     This causes otherwhise issues in do_install of libhello_0.1.bb
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged in master-next.

Copied Talel BELHADJ SALEM for a last minute review of your changes to 
the BitBake taskmap.
Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


