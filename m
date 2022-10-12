Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC97C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 08:33:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.17848.1665563598223200476
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 01:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UwUA03UB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 08CC1FF802;
	Wed, 12 Oct 2022 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665563596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/km+bSp9BWgfeoC1coee+J1tAEvbdzmQRYA9P2zbGA=;
	b=UwUA03UBVxMfs7fOAzeQV80GMLbr5TzGciUpjbB+1U9VoIgRjLHlj+3OJUfNk5pBSd+ox6
	MC9MSK7whbE2S08fUa26QAMbNmvFnfc+3DSRqD8UQai3/0dRyXl+wVy+KdKl7sXWxlaGCc
	vk2bMVwERKceh8PAg4RmO9yKxh6rSqC22B5Gg6BfAriDxxMlYPMy8fH5QmwjOo8uizvUxq
	7/iIv7/bATFwO1pSLYcrx9F5JgfRd7S+q+wZUsw2Hw2ty4sCBf3DxMSVPRz3cQSwmdxho1
	FKAoJid7hczfxTG8cX2h1VK/kKmHRXBX5yf5mdSABOMNmIBbewMClT/DJL+gMQ==
Message-ID: <f119ac33-314b-0031-2fc9-9ae8a5a45054@bootlin.com>
Date: Wed, 12 Oct 2022 10:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 34/34] Add 4.1 migration guide & release notes
Content-Language: en-US
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <eab587c8b9e2b1afc2eed83159e9eb728cdccbbb.1665392836.git.paul.eggleton@linux.microsoft.com>
 <171D1A9DBE3157A3.17458@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <171D1A9DBE3157A3.17458@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Oct 2022 08:33:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3351

Hi Paul,

On 10/11/22 21:31, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Paul
>
> On 10/10/22 11:24, Paul Eggleton wrote:
>> From: Paul Eggleton <paul.eggleton@microsoft.com>
>>
>> This currently does not include known issues or download information.
>>
>> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
>> ---
>>   documentation/migration-guides/index.rst           |   1 +
>>   documentation/migration-guides/migration-4.1.rst   | 214 +++++++
>>   documentation/migration-guides/release-4.1.rst     |   7 +
>>   .../migration-guides/release-notes-4.1.rst         | 687 
>> +++++++++++++++++++++
>>   4 files changed, 909 insertions(+)
>>   create mode 100644 documentation/migration-guides/migration-4.1.rst
>>   create mode 100644 documentation/migration-guides/release-4.1.rst
>>   create mode 100644 
>> documentation/migration-guides/release-notes-4.1.rst
>
>
> This all looks great, including these last two documents. I'd really 
> like to include these changes in the "master-next" branch, so that we 
> can base our new work on them.
> Would you be able to share an update of your branch taking into 
> account the few comments that we had?


As you already updated your branch for most of the items, I'll take care 
of merging your changes into master-next right away.
This way, I won't make further changes which will conflict with yours.

Thanks again
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


