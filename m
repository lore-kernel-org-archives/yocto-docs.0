Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B486CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 17:56:25 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.45426.1712253384177933399
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 10:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TNxrrWfS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9D29C0004;
	Thu,  4 Apr 2024 17:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712253382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=88O2bHYMf+oeAm0CX0/AoNsX+LUKLeuu9eH5y5JlBjI=;
	b=TNxrrWfSTr8ucFcsqeyPUMH9Bh5To8xpZrbn0RfU3oiym+AtA1BXClB3N5Bc6joMs8g1zp
	Vbdsiabb1uRedqA7ichpzBzFg7wNJdUQowSoowxVUwfxNNnw496OEbSXGhgJYv+Gwnpi6j
	acqSF2k3FTa554wUYOpMyRXkxT80qx0PDoFmrntz/RPv3tjcJe1Iv+Lfl87MYZ7Nqo5LPp
	j+ubAxv0kP9rlJkX6O/d1HEyrsQ3ts3HxYmG9GjtpNZHDdQQw4iztmydsX6IXiUmR44WYh
	SwPA37O+zTSAOg5NcjuPRehWOgtlV7BMVE+h/xd2+SWBnHwoUb9ua5jYmfVaDw==
Message-ID: <9297bc67-701a-452e-bc67-20d48da9472b@bootlin.com>
Date: Thu, 4 Apr 2024 19:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: thomas.petazzoni@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [PATCH v1 3/5] release-notes: add Go language upgrade
To: joaomarcos.costa@bootlin.com
References: <20240404165620.2248838-1-joaomarcos.costa@bootlin.com>
 <20240404165620.2248838-4-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240404165620.2248838-4-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Apr 2024 17:56:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5065


On 4/4/24 at 18:56, joaomarcos.costa@bootlin.com wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> There were multiple bumps between Scarthgap and Nanbield, but overall
> the version was upgraded from 1.20.10 (in Nanbield) to 1.22.1 (in Scarthgap).
>
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   documentation/migration-guides/release-notes-5.0.rst | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index e03f722a2..4ff05d86f 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -85,6 +85,8 @@ Security Fixes in 5.0
>   Recipe Upgrades in 5.0
>   ~~~~~~~~~~~~~~~~~~~~~~
>   
> +-  go: update 1.20.10 -> 1.22.1
> +
>   Contributors to 5.0
>   ~~~~~~~~~~~~~~~~~~~


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


