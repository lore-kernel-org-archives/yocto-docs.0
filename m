Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BFEC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 18:11:07 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.1313.1664993464876610199
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 11:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n49KprE8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C1CAB20009;
	Wed,  5 Oct 2022 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664993463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KlQ7PN2qgv1YXTkW+JPRrdJJKMfnbItJSOZUkbKsx2M=;
	b=n49KprE8glbQPwcsNWa9Cyf0nVxR3fNOgMH35s9VliCb/ianvXulsnk79K3pYN1eDhLLqo
	xQZy0oe331OZatJkh0lC5lqGWC0eX8I3BYg1BpfCwin6W43sZ20hgvHBqDtNoddedKrpCR
	hqkAEfgLMymZOvK0bkfnyjSnTehajUrlSSJ1m1hswLJdy23ZqZStVzv9RAQHaNtbIKxl2X
	7VEguUJ1SSZ7SoKsMYMAR/EJFiPyoHEyGdodGATx7ApqL6UM2OEsyDZPm+WbiaOO6Hq6xa
	EaIXpBr9kvIWejS8owcHIPkRN3DqtUJamkTvIWm+irIiuIJ+vFxWEx6RM4LeBg==
Message-ID: <46756296-b00c-82cf-3102-64e35bd055c7@bootlin.com>
Date: Wed, 5 Oct 2022 20:11:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 06/30] manuals: add references to the "do_deploy"
 task
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
 <20220923175219.6652-7-michael.opdenacker@bootlin.com>
 <d4ec2d36-c931-3732-356d-fb6e8478803f@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <d4ec2d36-c931-3732-356d-fb6e8478803f@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Oct 2022 18:11:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3290


On 26.09.22 16:04, Quentin Schulz wrote:
> Hi Michael,
>
> On 9/23/22 19:51, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> [YOCTO #14508]
>> Reported-by: Quentin Schulz <foss@0leil.net>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>
> Missing one:
> https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides/migration-3.2.rst#n210 
>


Actually, my patch has this change, unless your thought about the 
instance on the title line 
(https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides/migration-3.2.rst#n207), 
but then I didn't want to add links to section titles.

Thanks for checking
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


