Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D37DECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 14:09:53 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.25273.1662386989757025148
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Sep 2022 07:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CzDV/syw;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 244EA10000E;
	Mon,  5 Sep 2022 14:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662386987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4NXNEgHxraklSdn1NE/R5x1Fu2U99F89K2TGAuow1i8=;
	b=CzDV/syw7nPwndphgempA6sPkT0NS7AkySi8qgXiC0t+0IBaH5vprn+x3l8hvch8L/LBOJ
	hBbO5SGjA4iwDqgPsUw9d14ORQlO13r1BqTfncBMQJorG5wvUaQt1RwnutdpsUm/RSg4Mh
	OuwcZ9FptM5BbexbapNAzt/BREOrTxaGS+qAOz2MBj2DU+hPXeVVmkul36M08gNr6OTw0M
	oFAl6p7TyvdrYu+qX9rUxAL6Km63i2lvyQvHFz9Hk/KdK19x67I646SHDLa97EhRlOSZMs
	RH2opUrYvFFbynKiuMcXiurehUlivpg7s2BYCkWODUxn41gIFOmhxFYjip7W2Q==
Message-ID: <7cc3f391-915d-4d38-19e1-f0cea0d7010f@bootlin.com>
Date: Mon, 5 Sep 2022 16:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: remove obsolete product listing from
 FAQ
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20220902201705.101145-1-michael.opdenacker@bootlin.com>
 <1aaadff6-f0c9-1ff1-c06b-72751b5056ed@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1aaadff6-f0c9-1ff1-c06b-72751b5056ed@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Sep 2022 14:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3143

Hi Quentin,

On 9/5/22 15:55, Quentin Schulz wrote:
> Hi Michael,
>
> On 9/2/22 22:17, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> This removes the single reference to a product built with OE.
>> The URL for this product doesn't refer to OE any more
>> and this FAQ is problably not the best place to highlight
>> products built with OE.
>>
>
> We can point to the wiki page Richard gave you in an answer to your 
> mail to the advocacy ML instead of completely deleting it :)


Right, I was going to do this :)
Thanks
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


