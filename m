Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.34248.1628845925461996257
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 02:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 18B6E2000B;
	Fri, 13 Aug 2021 09:12:02 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/3] manuals: Rename the "Using .bbappend Files in Your Layer" section
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tom Rini <tom.rini@gmail.com>
References: <20210812161027.580-1-trini@konsulko.com>
 <20210812161027.580-2-trini@konsulko.com>
 <20210813082943.h66je2usb6o5r76i@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <22ca6211-5ecf-472f-b928-eec85bae04a3@bootlin.com>
Date: Fri, 13 Aug 2021 11:12:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813082943.h66je2usb6o5r76i@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Tom,

Thanks for the patch!

On 8/13/21 10:29 AM, Quentin Schulz wrote:
> Hi Tom,
>
> On Thu, Aug 12, 2021 at 12:10:26PM -0400, Tom Rini wrote:
>> .bbappend Files in Your Layer" section to "Appending Other Layers With
>> Your Layer".  Name the current example as "Overlaying a File Using Your
>> Layer".
>>
>> Signed-off-by: Tom Rini <trini@konsulko.com>
>> ---
>>  documentation/dev-manual/common-tasks.rst        | 9 ++++++---
>>  documentation/kernel-dev/common.rst              | 4 ++--
>>  documentation/kernel-dev/faq.rst                 | 2 +-
>>  documentation/migration-guides/migration-1.4.rst | 2 +-
>>  4 files changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
>> index 2d8ef96e2600..f15e72887c04 100644
>> --- a/documentation/dev-manual/common-tasks.rst
>> +++ b/documentation/dev-manual/common-tasks.rst
>> @@ -443,8 +443,8 @@ file. During the processing of each ``conf/layer.conf`` file, BitBake
>>  adds the recipes, classes and configurations contained within the
>>  particular layer to the source directory.
>>  
>> -Using .bbappend Files in Your Layer
>> ------------------------------------
>> +Appending Other Layers With Your Layer
>> +--------------------------------------
>>  
> I could suggest:
>
> Appending Other Layers Metadata With Your Layer
>
> But I think it's fine either way.
>
> Reviewed-by: Quentin Schulz <foss@0leil.net>

I'm taking your proposal, Quentin, thanks!

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into "master-next".

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

