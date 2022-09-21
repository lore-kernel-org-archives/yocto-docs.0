Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8A3C32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 09:09:11 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.4243.1663751342685595559
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 02:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dL9B6ZJS;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 95594200007;
	Wed, 21 Sep 2022 09:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663751340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADNoKEzd5LtY9vYeyVvsWTwf13ZaQ8BYb+3z7vASXKc=;
	b=dL9B6ZJSKGEhbXpGYh2akB3+3VASi8Vf97PhsO82lA7BIsjOvxjbAJmsbn6g10cDESW1Uc
	VAr1mgJ/5f+PXH62OT5+Xw49j47f0SHWuRCwF0eu2qehroj/XvuSaXMp/THCJTwTquHY1c
	jtJ36ThZ3scB//gaW3ibdx0rkibHx52EZxCX2iMTdtsngaqdoDr+5pmIy3BIGpf1H3dZX+
	skjyZImzuE8ZUdeYFXK5vrbDK6ejTY6980RApUytaY7EsQZ3eeta8kfA/g7Xe6YFfdsKF/
	yVue3dTQcr/r2lgc49SfDEkeBBeTcfIGOXc+xfQGbnzvmTvoBHp2uKjxKZegxQ==
Message-ID: <81cb1645-8858-e151-de87-3e4df9aa7d19@bootlin.com>
Date: Wed, 21 Sep 2022 11:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: He Zhe <zhe.he@windriver.com>, Ross Burton <ross.burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] ref-manual: variables: document
 KERNEL_IMAGETYPES
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com,
 Johan Korsnes <johan.korsnes@remarkable.no>
References: <20220921073035.11141-1-johan.korsnes@remarkable.no>
 <c869607a-b115-b0c1-1504-ad8bd68576c5@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <c869607a-b115-b0c1-1504-ad8bd68576c5@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Sep 2022 09:09:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3197


On 21.09.22 10:37, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Johan,
>
> On 9/21/22 09:30, Johan Korsnes wrote:
>> Cc: He Zhe <zhe.he@windriver.com>
>> Cc: Ross Burton <ross.burton@arm.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
>>
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks for the update!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


