Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.4959.1623918999131193965
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 01:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 403866000E;
	Thu, 17 Jun 2021 08:36:36 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] sdk-manual: fix broken references
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210615170056.211711-1-michael.opdenacker@bootlin.com>
 <20210616095919.du3xmrpe2adlhge7@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d60e15b4-153c-2127-ff44-6315b067fc80@bootlin.com>
Date: Thu, 17 Jun 2021 10:36:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616095919.du3xmrpe2adlhge7@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Many thanks for the review!

On 6/16/21 11:59 AM, Quentin Schulz wrote:
> Hi Michael,
>
> On Tue, Jun 15, 2021 at 07:00:56PM +0200, Michael Opdenacker wrote:
>> Detected by running:
>> git grep "^[\ ]*\" section" | grep -v "\`"
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  .../sdk-manual/appendix-customizing.rst         | 12 ++++++------
>>  documentation/sdk-manual/extensible.rst         | 17 ++++++++---------
>>  documentation/sdk-manual/working-projects.rst   |  5 ++---
>>  3 files changed, 16 insertions(+), 18 deletions(-)
>>
>> diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
>> index 67b49d9f49..c122fb5836 100644
>> --- a/documentation/sdk-manual/appendix-customizing.rst
>> +++ b/documentation/sdk-manual/appendix-customizing.rst
>> @@ -74,9 +74,9 @@ adjustments:
>>        is set using the "?=" operator. Consequently, you will need to
>>        either define the entire list by using the "=" operator, or you
>>        will need to append a value using either "_append" or the "+="
>> -      operator. You can learn more about these operators in the "
>> -      Basic Syntax
>> -      " section of the BitBake User Manual.
>> +      operator. You can learn more about these operators in the
>> +      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:basic syntax`"
>> +      section of the BitBake User Manual.
>>  
>>     .
>>  
> This seems like a spurious dot. (not introduced by your patch, I know :) )


Right! I caught it, but I wanted to address it through a separate patch.
I suspected you would catch it :-)

>
> Looks good otherwise, did you check that it's referring to the same page
> we had in earlier docs? I often check by going on
> https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html
> and click on links and check if the reference I'm giving is the expected
> one.


No, thanks for the reminder. I double checked and will try to remember
to do it from now on.

I merged this patch into "master-next".

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

