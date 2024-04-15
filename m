Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920B5C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 15:22:58 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.24061.1713194577767528799
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 08:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EwoSaVwD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33DDAC0002;
	Mon, 15 Apr 2024 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713194575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=usd9nO1p1SqZLA4K0ThqDbo1Pwcp/ZvmYGfBULfuEao=;
	b=EwoSaVwDxpvMmwfg2HUW5dMPennUmHFuX6WNhkwzkYT8aZ4Op/UVCEcUZLDhMvN1NqT5Ot
	bA4o+DZ5uZYJu1fn/zNulI7+X+oVeSURcd2OB/RDaYiJyp3PDMzpDkGO9ByXwjuLvI8CZB
	Ryb748AUNdeo9cCzGaDAwLx79M+mVLWBW1LVNByeQwdAMopvTKKxPZPtxuyNSqfUzI6grq
	89m5Udc4LInFF0TYxTwJjVSGuyf8ZTQqH6sAQV5ZO1EONh1g/KeNc3TbPt8JGbZIGr8Zmx
	z3bjlIVTpuMQYch2qYHovVmnQNo0c54LvM8qxNNCSt3GENPUP0n7A/Npgk5mAg==
Message-ID: <269d718f-5d81-4ef4-865c-036f4215fc08@bootlin.com>
Date: Mon, 15 Apr 2024 17:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH 9/9] release-notes: additional features and one
 known issue for 5.0
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 bluelightning@bluelightning.org, docs@lists.yoctoproject.org
References: <cover.1713127068.git.bluelightning@bluelightning.org>
 <91fad937a3567c0c66d0c28e4ed2fb3227450a5e.1713127068.git.bluelightning@bluelightning.org>
 <bd77ae10-99da-44cc-9086-3eb4deb80218@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <bd77ae10-99da-44cc-9086-3eb4deb80218@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 15:22:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5156

Paul, Quentin,

Thanks for the patch and review!

On 4/15/24 at 10:06, Quentin Schulz wrote:
>
> I think there's a way to link to the bitbake doc for inherit directive.
>
> Maybe something like:
>
> """
> :ref:`inherit 
> <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit\`\` 
> directive>`
> """
>
> would work? Just a suggestion though.


It works! I made the change.

>
>> +      it is only evaluated at the end of parsing - recommended where 
>> a conditional
>> +      expression is used, e.g.
>> +
>
> I think we're missing a double colon here to make this a code snippet?
>
> """
> expression is used, e.g.::
> """


Indeed. Fixed.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


