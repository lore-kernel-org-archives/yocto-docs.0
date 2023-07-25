Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EF3C001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 17:47:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.26917.1690307223471379464
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Jul 2023 10:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Acr1t41g;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C7C91C000B;
	Tue, 25 Jul 2023 17:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690307221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reI8HPE4bxO5npnALD4TuM2vcVRSLqn2vj0ER21xlDA=;
	b=Acr1t41gEZzorC7zCXWRz7kl3AUZcRWN+P0F+kooCAm3Xwm0cnQqklQkPc1ej+EiFofpjM
	kZcNYtP4bXFJIr4gEZ2k9ic7GbQDvHxaClhvRF5jEOR3ZutJBmLbOYkuPyr9voc4RCqCmf
	B9uJHcM09aZG17NpDD1edehvXSQJ2Uye2zyTtnn0R3SDCSzkn04qq4pu6RNiMwhpX0sXje
	YPH3gANjn+75jLRpGFA3J+VB0AiDcy0onEPKzY6zRrE3qruBuHH1X8kJZmR+sVT2JPTbRv
	PMt8MGF3eB1dRvEQIbQ2m0qvetO9LGSDjJe6crhhBmxNC9RLMO35sBHNxSz64A==
Message-ID: <4afbe3d4-51f9-9f6d-c3b8-e59bbcc877ba@bootlin.com>
Date: Tue, 25 Jul 2023 19:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] [dunfell] ref-manual: ref-system-requirements.rst:
 align with poky.conf
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <177516732202084A.7114@lists.yoctoproject.org>
 <edd8ede4-f463-d6d1-02d7-d3cfb3939abb@bootlin.com>
 <6e0e712c7d9edbd0058a9d65db66dd97f670a5c2.camel@linuxfoundation.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <6e0e712c7d9edbd0058a9d65db66dd97f670a5c2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Jul 2023 17:47:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4080

Hi Richard,

On 25.07.23 at 16:59, Richard Purdie wrote:
> On Tue, 2023-07-25 at 12:48 +0200, Michael Opdenacker via
> lists.yoctoproject.org wrote:
>> Hello,
>>
>> On 25.07.23 at 12:45, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> Align with the contents of meta-poky/conf/distro/poky.conf
>>> which represent the distro versions currently tested.
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>>>    documentation/ref-manual/ref-system-requirements.rst | 6 ++----
>>>    1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
>>> index ac963dcdb9..6e1ad8ee21 100644
>>> --- a/documentation/ref-manual/ref-system-requirements.rst
>>> +++ b/documentation/ref-manual/ref-system-requirements.rst
>>> @@ -47,10 +47,6 @@ distributions:
>>>    
>>>    -  Ubuntu 22.04
>>>    
>>> --  Fedora 28
>>> -
>>> --  Fedora 29
>>> -
>>>    -  Fedora 30
>>>    
>>>    -  Fedora 31
>>> @@ -67,6 +63,8 @@ distributions:
>>>    
>>>    -  CentOS 7.x
>>>    
>>> +-  CentOS 8.x
>>> +
>>>    -  Debian GNU/Linux 8.x (Jessie)
>>>    
>>>    -  Debian GNU/Linux 9.x (Stretch)
>>
>> I could further reduce the list by removing the distros that we are
>> still supposed to test (such as Ubuntu 19.04), but that we obviously
>> cannot support any more as they have reached their end of life.
>> Any thoughts?
> I think for the older releases, they should document what we tested
> when they originally shipped. We could note that it was originally
> tested with them but they're EOL?


Good idea.
I could do that with all the releases we support, and effectively, we 
don't loose the information about initially supported distros.

This will help when people get back to a project after a few months or 
years, and their distro version is no longer supported by the distro vendor.
Thanks
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


