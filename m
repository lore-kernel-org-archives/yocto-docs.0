Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7087C7EE32
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 13:03:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.22572.1677589397818557199
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 05:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KDX/N0Yo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 03B3F1BF20F;
	Tue, 28 Feb 2023 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677589395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EihpzTmjh5iqx/ARUYoJ9JGLuZYei2esySLY5irGm68=;
	b=KDX/N0YoGrII2gVMqzTH/9iANpHIiCBZiiqQjIdiku+Vk8lXO7bv4OUzUBgavAjDoagCDH
	nNUFKRjKxe7KfEE8yLyl8Ac2ZCTQ8KLnFzJNQ0SVyneNrVh5eS47jddyhA72vwBZrGn6vv
	EmaJ7KXlMx/1NUWkQ82nmQcAF9texI59rhB3ATt0tFuzDPM96mCmFLPMF1Nma9H/UXOc8M
	1qCE7F/i9H1/kvsp6w095dfCA2Zqjd5VaYVrpyRrQmNQE83ZV+ga3L8mzkGe+T8ihAs2C6
	1D7Co9cjqFTnT1NyA/8bJBmLigHtfcchjpc9M5RAWRxKTIfaACEz7tiS6GqXKw==
Message-ID: <7c984573-9a10-eeda-e76d-fba06a64d032@bootlin.com>
Date: Tue, 28 Feb 2023 14:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: simplify references within the same
 document
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20230227150137.271106-1-michael.opdenacker@bootlin.com>
 <6a26afbf-3669-bcb3-5add-e9e5c38a09f9@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <6a26afbf-3669-bcb3-5add-e9e5c38a09f9@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Feb 2023 13:03:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3756

Hi Quentin

On 28.02.23 at 12:15, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>
> On 2/27/23 16:01, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Replace :ref:`path/docname.rst:section title`
>> by `section title`_, which is much more compact and
>> doesn't need changing when you change the document file name.
>>
>> There are drawbacks though:
>>
>> - There are no warnings at compile time when the trailing
>>    `_` character is omitted. You just get plain italic text
>>    without a link. However, you do get an error if `_` is
>>    present and the text doesn't correspond to an existing target.
>>
>> - The capitalization of the link text doesn't necessarily
>>    match the one in the target. You get the capitalization that you
>>    specify in the text between quotes (target matching is
>>    case insensitive).
>>
>
> Does it also detect when a link is broken because the section got 
> renamed or removed?


Yes, the references to the section will be broken, causing an error when 
building the docs.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


