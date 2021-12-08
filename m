Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC8FC433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 13:34:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.12050.1638970472363322413
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9BF2220005;
	Wed,  8 Dec 2021 13:34:29 +0000 (UTC)
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [docs] [PATCH v2] make the documentation a bit more inclusive
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20211206150401.30444-1-foss+yocto@0leil.net>
 <7adbcaa4-ca84-fc42-b08f-a96ebf522082@bootlin.com>
 <e3a61e6754f81f0c54b21c9ca66296f91b53af8a.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <6d4aaf4c-72ed-3d30-8d09-8bd62f43360c@bootlin.com>
Date: Wed, 8 Dec 2021 14:34:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <e3a61e6754f81f0c54b21c9ca66296f91b53af8a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 13:34:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2230

Hi Richard,

On 12/8/21 11:45 AM, Richard Purdie wrote:
> On Wed, 2021-12-08 at 11:41 +0100, Michael Opdenacker wrote:
>> Quentin, Peter,
>>
>> Many thanks for the long patch and review !
>> See my comments below...
>>
>> On 12/6/21 4:04 PM, Quentin Schulz wrote:
>>> -For automated deployment, a "master image" is installed onto the
>>> +For automated deployment, a "golden image" is installed onto the
>>
>> I was about to suggest "reference image", but all things considered,
>> "golden image" seems to work better.
> I don't know if it is just me but "golden image" really doesn't work that well
> for me. "controller" would be the terminology we use elsewhere, e.g. the
> autobuilder. It says what it does...


Sounds good to me, thanks! I updated the term in the commit in
"master-next". I don't mind if others have even better suggestions.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


