Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A78BC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 18:01:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.1363.1664992914451335574
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 11:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=av8ubE6n;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 80A1360005;
	Wed,  5 Oct 2022 18:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664992911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4kbwtP3hUUDO5aQNQD5qgdGy1F9xedo8V8UatsfbhwA=;
	b=av8ubE6n82hhUzjXtP9Kg8rgnilmjXZ9Y8qWSLN25CHOukb0bHDUVZypnnvgPwy4rpODm4
	nqKvAHal9pLvt71rEltYKGB8eM9fOkIQqXXy+5Twy5sw5q8VGSQdx5Tyli9ZuIxyB2ySFl
	nyi980uGjd78GsM+vDwFy6CH8YaJQIm/w6bs0og5X1BPgqdq+ND7YKzU3Wh+jRNKfSj/T0
	zeMhyusNft1wGnXbk+FW189XxiumjiM9lZ+D75kVaGWg0J906EQFrcAClzpNjxHdYgCLYt
	Oq/fdmWc4cWZqf70yh7em0tQhYFkJaMyO2Xuieyvx0TFkGR2QIYagnJTwxSQfA==
Message-ID: <eef6eed7-ea95-df50-5296-5100182559cd@bootlin.com>
Date: Wed, 5 Oct 2022 20:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 04/30] manuals: add reference to "do_configure"
 task
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
 <20220923175219.6652-5-michael.opdenacker@bootlin.com>
 <7d06b610-1df4-a124-6b2c-3637807b07a2@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <7d06b610-1df4-a124-6b2c-3637807b07a2@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Oct 2022 18:01:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3288


On 26.09.22 15:57, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>
> On 9/23/22 19:51, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> [YOCTO #14508]
>> Reported-by: Quentin Schulz <foss@0leil.net>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> You're missing one:
>
> https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/variables.rst#n5524


Fixed, thanks!

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


