Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B98C4167B
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 10:52:44 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.10339.1671187958130985899
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 02:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iTEUQ0/K;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CAE57E0014;
	Fri, 16 Dec 2022 10:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671187956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ns+QNxLZvX/Tiyiac+z953Oin9LUVbCYw8uoe1RJExU=;
	b=iTEUQ0/KX7oT35vO4XkAZXjAA62JUVeFdq/8x8cK5lDjOTxVTnKDXZ0YBn8HNfjIw4KMuy
	1JAUhfIww6h48Ztd/GQ817uuT5pfCHz8ZKOfmp9G8koT+wDvLbQh5U4658URekcMrgjqhl
	rj52d0laxw4FEm7wwaPWRddDvZcpPBapd7usuhomE0MqpckKuYlS3r0KF1boyHtlXOBhxj
	+8R1BkFWG+yhSYAjA6RWPzAGplCJ1lM7LVpUCs8qqgM+1gGQQeoUAktepK+zlhWIvETrRi
	bxhpokB6hMy/dPzcmnzxa2dM1n4ymybs3mT8/IV6v2MoMPkq89MYBr1hAoC40A==
Message-ID: <406b9b9b-73d0-5298-3fd1-bc82fb2475c5@bootlin.com>
Date: Fri, 16 Dec 2022 11:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: prepare 4.2 migration notes
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20221216101232.356972-1-michael.opdenacker@bootlin.com>
 <ac6fa145-fea6-cb21-4558-38f93a42c13a@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <ac6fa145-fea6-cb21-4558-38f93a42c13a@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Dec 2022 10:52:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3559

Hi Quentin,

Thanks for the review!

Am 16.12.22 um 11:27 schrieb Quentin Schulz via lists.yoctoproject.org:
>
>> +++ b/documentation/migration-guides/release-notes-4.2.rst
>> @@ -0,0 +1,28 @@
>> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>> +
>> +Release notes for 4.2 (mickledore)
>> +---------------------------------
>> +
>> +New Features / Enhancements in 4.2
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +- Python 3.8 s the minimum Python version required on the build host.
>
> s/s/is/
>
>> +  For host distros that do not provide it, this is included as part 
>> of the
>
> s/distros/distributions/


Fixed.

>
>> +  :term:`buildtools` tarball.
>> +
>> +- This release now supports a new ``addpylib`` directive to enable
>> +  Python libraries within layers.
>> +
>
> I think it's worth saying a few more words here if we don't already 
> have some explanations elsewhere in the docs.
>
> When should I use this?
>
> IIRC, it's when you want to use some function in some configuration 
> file (where one cannot define functions?) or put things in common in 
> recipes without using a class to define this new function. Is there 
> another usecase I haven't thought about?
>
> Anyways, this can be improved over time :)


Sure, this was just a placeholder and I hope people would provide more 
details. Indeed, this should also be added to the documentation.

Thanks again,

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


