Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA4CC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 08:53:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.9144.1633510424198514955
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 01:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 31687C001A;
	Wed,  6 Oct 2021 08:53:40 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: correct NO_GENERIC_LICENSE section
 title
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20211006081525.952523-1-michael.opdenacker@bootlin.com>
 <20211006082001.rgqhbh6kwpu2ybnk@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <028e67ca-2712-af16-9feb-632a267e2c1e@bootlin.com>
Date: Wed, 6 Oct 2021 10:53:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006082001.rgqhbh6kwpu2ybnk@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 08:53:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1923

Hi Quentin,

On 10/6/21 10:20 AM, Quentin Schulz wrote:
> Hi Michael,
>
> On Wed, Oct 06, 2021 at 10:15:25AM +0200, Michael Opdenacker wrote:
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  documentation/dev-manual/common-tasks.rst | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
>> index b81f51bf83..bcc8d056c0 100644
>> --- a/documentation/dev-manual/common-tasks.rst
>> +++ b/documentation/dev-manual/common-tasks.rst
>> @@ -11159,8 +11159,8 @@ For more usage information refer to :yocto_git:`the meta-spdxscanner repository
>>  </meta-spdxscanner/>`.
>>  
>>  
>> -Copying Licenses that Do Not Exist
>> -----------------------------------
>> +Copying Non Standard Licenses
>> +-----------------------------
>>  
> Provided this is not linked to from anywhere else (in which case we need
> to change the ref link there too),


Ah right, well thought! Fortunately, the whole manual rebuilds well
after a "make clean", so it should be all right.

>
> Reviewed-By: Quentin Schulz <foss@0leil.net>

Thanks for the review!

Cheers,
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


