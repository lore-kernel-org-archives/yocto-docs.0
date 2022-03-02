Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3962C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 08:25:00 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.5181.1646209499764421029
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 00:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bHBaPmIw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 41400E0006;
	Wed,  2 Mar 2022 08:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646209497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PolHV68TGM2c28MYt/OdPG0nYi0WtHr9HqpOxfjGOGA=;
	b=bHBaPmIwDPy9t8yTdgZ88m5FW+ElmT0B5Z011n5YVbDVtcKGEv2+/imza/nfs1ZUsjEMtI
	NVjZD9eQM4BfaGBuJ/1h7z+FUugu0vuC4A7kZ//X5PW7qRbmXHuO58ZSEkOA4f6CuyjbTN
	WW34wtyyHbiJJYe0JVg6s7kFTw+H9MUDKnk9wHmcB+Nnce8ZOGe4MDB6edoLg+MTTef4t8
	E/xYtjRlpHYBLmjvoa7Ldoa1J1Coo+aRMJH+o5Qn8hwAY1ui75IAXdk3i9sbm0ZYOVveSo
	QjJmb9m4ayDK6uXPL3upsX1WYCxr13yd3/M+aB0cYchsJnFFZzLUXpRFAOluhA==
Message-ID: <859cb625-91be-6179-1240-aa73000b5dc7@bootlin.com>
Date: Wed, 2 Mar 2022 09:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] manuals: Update LICENSE vars in examples to use
 SPDX license identifiers
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>, docs@lists.yoctoproject.org
References: <20220227182435.6239-1-peter.kjellerstedt@axis.com>
 <8a194f2e-aae1-85ce-8bfe-0192961660d9@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <8a194f2e-aae1-85ce-8bfe-0192961660d9@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Mar 2022 08:25:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2522

Hi Peter

On 3/1/22 15:03, Quentin Schulz wrote:
> Hi Peter,
>
> On 2/27/22 19:24, Peter Kjellerstedt wrote:
>> This is similar to the recent change in meta to only use SPDX license
>> identifiers in the recipes.
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>
> Looks good to me.
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Many thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next"

Thanks again
Michael
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


