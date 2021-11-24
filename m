Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEABC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 18:45:55 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.2262.1637779553753668086
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 10:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C1124C000B;
	Wed, 24 Nov 2021 18:45:51 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [yocto] [docs] [PATCH yocto-autobuilder-helper]
 scripts/run-docs-build: remove gatesgarth
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 yocto@lists.yoctoproject.org
References: <20211124171617.2088604-1-michael.opdenacker@bootlin.com>
 <98664c40610ee3163638a373f105f29c9c70a912.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1914a66b-2f8a-da6b-d892-53fbe6b45562@bootlin.com>
Date: Wed, 24 Nov 2021 19:45:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <98664c40610ee3163638a373f105f29c9c70a912.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 18:45:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2194

Hi Richard,

Thanks for the review!

On 11/24/21 7:10 PM, Richard Purdie wrote:
> On Wed, 2021-11-24 at 18:16 +0100, Michael Opdenacker wrote:
>> Together with the corresponding Bitbake version, which are no
>> longer supported.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  scripts/run-docs-build | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/run-docs-build b/scripts/run-docs-build
>> index 3db4a97..5e1d649 100755
>> --- a/scripts/run-docs-build
>> +++ b/scripts/run-docs-build
>> @@ -35,7 +35,7 @@ mkdir $outputdir/bitbake/next
>>  cp -r ./_build/final/* $outputdir/bitbake/next
>>  
>>  # stable branches
>> -for branch in 1.46 1.48 1.50 1.52; do
>> +for branch in 1.46 1.50 1.52; do
>>      git checkout $branch
>>      make clean
>>      make publish
>> @@ -68,7 +68,7 @@ mkdir $outputdir/next
>>  cp -r ./_build/final/* $outputdir/next
>>  
>>  # stable branches
>> -for branch in dunfell gatesgarth hardknott honister; do
>> +for branch in dunfell hardknott honister; do
>>      cd $ypdocs
>>      git checkout $branch
>>      make clean
> I'm a bit torn on this. They are no longer officially supported releases now but
> it may make sense to rebuild all the sphinx docs in this script rather than some
> subset?


I understand. Your decision to make.
I just proposed this change for consistency with the current implementation.

Any other opinions?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


