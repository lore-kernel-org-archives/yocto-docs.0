Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9C9C67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 16:13:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.16624.1712333631768759746
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 09:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i2sfellW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1C04240008;
	Fri,  5 Apr 2024 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712333630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=19D09FAh30V9dfqEU3CIz456OVS7G0AOw3b+jSJBdn4=;
	b=i2sfellWBq1x8G5M/JhnpOp8CGuKiJzrXPUrc3TvUkbaRwxilzeGU5KHpyZ2o10cDuuQCb
	RKhUZwTxpAYSWM5YASfzUrkGQ3P4zNaXXgUjnt7InGfrYC7q368yZXvtLlZy7c0xPtia+f
	1gPctr57xkrMsh1czk9ClCN7HGeriWkZ0QqvxL2BdVgMwIAm8j5BDcu7uKjkzMs1LuIt5U
	+DB+ZFBDpxI5KeSlknMbghQC8Niw19AAcNctGNK6ZzwDaU6/mTnrsYYNWYc6SfgWt79grH
	WHEr48BUtMiWIigPEJ7pzsmt43bjUgiZRQQR47NWQW9gQwtTLIiIL7EeNf/1PQ==
Message-ID: <1b86662b-3cf4-4f06-9bf4-db76e64c6263@bootlin.com>
Date: Fri, 5 Apr 2024 18:13:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: thomas.petazzoni@bootlin.com
Subject: Re: [docs] [PATCH v2 0/4] Add Miscellaneous changes and QEMU changes
To: joaomarcos.costa@bootlin.com, docs@lists.yoctoproject.org
References: <20240405152211.2285650-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240405152211.2285650-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 16:13:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5087


On 4/5/24 at 17:22, Joao Marcos Costa via lists.yoctoproject.org wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> Hello,
>
> The first patch, concerning the removed variables, should have been sent in the
> first series, but I overlooked that. Regarding the others, they address the
> remaining sections and, unless I'm mistaken, the migration doc is complete.
>
> Best regards,
>
> Changes in v2:
> - Squashed commits fixing formatting issues
> - Removed the 5/6 patch
>
> Joao Marcos Costa (4):
>    migration-guides: list removed variables
>    migration: add QEMU changes
>    migration: add Miscellaneous changes
>    migration: add a second space after the items


Thanks João. I understood that your 4th commit was a mistake.
I merged your changes into master-next, but eventually grouped them to 
reduce the number of commits before sending a pull-request to Richard.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


