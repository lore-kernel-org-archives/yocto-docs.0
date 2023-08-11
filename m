Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091F6C001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 15:50:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.46373.1691769013367544023
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 08:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=baxmBpzC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4904A1BF203;
	Fri, 11 Aug 2023 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691769011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MnOlDSugLvsp178H+CSjr2hbyoVuAfLtFtV9uIx2l18=;
	b=baxmBpzCRoocPuvlL5pSmy9u7Xh0A18WsnCO1RMpUfh8UAe37lEgcJNQD70x6Cb2wV7Hg3
	+vlTa9IUI76eClKcS6mT8GRnk+buaGSQzZ5f9YIA/i7FylQWqt9lCZW9DG57gtdC82XUqB
	XY+Hkr4hjJ2umK1kkuh2XtYK48OLBx10Hk/F8sg+/IYfTK0MtRhZOlUmxzwYrIciQUgHIE
	9OFrt7e6V4PF9TPapNq8PLpt7KyOfePyO0DlUcg535w/wHYuf2b8K66E2AYLgwHOLQbR+J
	NH97fF25Vb9mZ/ov9uD58vawkbal70iBM8NadTmqug3w14Cvwn1ZmcLgNh334w==
Message-ID: <832bead1-83db-7810-9ca3-190e1104a9de@bootlin.com>
Date: Fri, 11 Aug 2023 17:50:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: Yoann CONGAL <yoann.congal@smile.fr>,
 Randy MacLeod <randy.macleod@windriver.com>,
 Josef Holzmayr <jester@theyoctojester.info>
Subject: Re: [docs] [PATCH] dev-manual: disk-space: mention faster "find"
 command to trim sstate cache
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20230811090920.1095076-1-michael.opdenacker@bootlin.com>
 <e97b46476d71da9139ac2ade7f9e397f45a58d5d.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <e97b46476d71da9139ac2ade7f9e397f45a58d5d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Aug 2023 15:50:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4144

Hi Richard,

On 11.08.23 at 17:06, Richard Purdie wrote:
> On Fri, 2023-08-11 at 11:09 +0200, Michael Opdenacker via
> lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> [YOCTO #15182]
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> Reported-by: Yoann CONGAL <yoann.congal@smile.fr>
>> Reported-by: Randy MacLeod <randy.macleod@windriver.com>
>> Reported-by: Josef Holzmayr <jester@theyoctojester.info>
>> ---
>>   documentation/dev-manual/disk-space.rst | 24 +++++++++++++++---------
>>   1 file changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
>> index c63591cc7a..670f3d2792 100644
>> --- a/documentation/dev-manual/disk-space.rst
>> +++ b/documentation/dev-manual/disk-space.rst
>> @@ -27,19 +27,25 @@ Purging Duplicate Shared State Cache Files
>>   ==========================================
>>   
>>   After multiple build iterations, the Shared State (sstate) cache can contain
>> -duplicate cache files for a given package, while only the most recent one
>> -is likely to be reusable. The following command purges all but the
>> -newest sstate cache file for each package::
>> +duplicate cache files for a given package, consuming a substantial amount of
>> +disk space. However, only the most recent cache files are likeky to be reusable.
>>   
>> -   sstate-cache-management.sh --remove-duplicated --cache-dir=build/sstate-cache
>> +The following command is a quick way to purge all the cache files which
>> +are older than a specified number of days::
>>   
>> -This command will ask you to confirm the deletions it identifies.
>> +   find build/sstate-cache -type f -atime +$DAYS -delete
>>   
>> -.. note::
>> +OpenEmbedded-Core also offers a command which can be used to look for
>> +cache files only for enabled architectures, and purge all but the newest
>> +ones on each architecture::
>>   
>> -   The duplicated sstate cache files of one package must have the same
>> -   architecture, which means that sstate cache files with multiple
>> -   architectures are not considered as duplicate.
>> +   sstate-cache-management.sh --remove-duplicated --cache-dir=build/sstate-cache
>>   
>> +This command will ask you to confirm the deletions it identifies.
>>   Run ``sstate-cache-management.sh`` for more details about this script.
> As long as bitbake builds have writable access to the sstate cache,
> files are touched as they are accessed so it is easy to know which ones
> are being used and which ones are not. As such you can use mtime in the
> above example even for a partition mounted as "noatime" for performance
> reasons.


Good idea, this way the solution is a little broader as "noatime" is 
frequently used.

>
>>   
>> +.. note::
>> +
>> +   As this command is much more cautious and selective, removing only cache files,
>> +   it will execute much slower than the simple ``find`` command described above.
>> +   Therefore, it may not be your best option to trim huge cache directories.
> It doesn't remove only cache files, it removes files that it considers
> to be unreachable by exploring a set of build configurations. It
> requires full build environment to be available and doesn't work well
> covering multiple releases. It also doesn't work in a limited
> environment like a BSD based NAS where the above find command would
> still likely work easily.
>
> Can we get rid of sstate-cache-management.sh? :)

Thanks for these useful details about this script!

Are you suggesting we could at least remove sstate-cache-management.sh 
from the docs?
Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


