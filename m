Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.4011.1631688141524820496
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Sep 2021 23:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4F2CE40002;
	Wed, 15 Sep 2021 06:42:12 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: replace Freenode by Libera Chat as IRC host
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20210914190432.2045216-1-michael.opdenacker@bootlin.com>
 <e2e971ad0d00ea02456bdf5010015c1031fe2d77.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <14eff19d-a6f2-6a36-d13e-ad413d170046@bootlin.com>
Date: Wed, 15 Sep 2021 08:42:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e2e971ad0d00ea02456bdf5010015c1031fe2d77.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard,

On 9/15/21 12:10 AM, Richard Purdie wrote:
> On Tue, 2021-09-14 at 21:04 +0200, Michael Opdenacker wrote:
>> Fixes [YOCTO #14546]
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  documentation/boilerplate.rst          | 2 +-
>>  documentation/ref-manual/resources.rst | 7 ++++---
>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/documentation/boilerplate.rst b/documentation/boilerplate.rst
>> index baccc9fe40..9b64d91efd 100644
>> --- a/documentation/boilerplate.rst
>> +++ b/documentation/boilerplate.rst
>> @@ -14,5 +14,5 @@ Commons.
>>  To report any inaccuracies or problems with this (or any other Yocto Project)
>>  manual, or to send additions or changes, please send email/patches to the Yocto
>>  Project documentation mailing list at ``docs@lists.yoctoproject.org`` or
>> -log into the Freenode ``#yocto`` channel.
>> +log into the `Libera Chat <https://libera.chat/>`__ ``#yocto`` channel.
>>  
>> diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
>> index 5ffd2b3991..f34ab8a53d 100644
>> --- a/documentation/ref-manual/resources.rst
>> +++ b/documentation/ref-manual/resources.rst
>> @@ -90,8 +90,8 @@ For more Yocto Project-related mailing lists, see the
>>  Internet Relay Chat (IRC)
>>  =========================
>>  
>> -Two IRC channels on Freenode are available for the Yocto Project and
>> -Poky discussions:
>> +Two IRC channels on `Libera Chat <https://libera.chat/>`__
>> +are available for the Yocto Project and Poky discussions:
>>  
>>  -  ``#yocto``
>>  
>> @@ -187,7 +187,8 @@ Here is a list of resources you might find helpful:
>>     implementation of Bugzilla for logging and tracking Yocto Project
>>     defects.
>>  
>> --  *Internet Relay Chat (IRC):* Two IRC channels on Freenode are
>> +-  *Internet Relay Chat (IRC):* Two IRC channels on
>> +   `Libera Chat <https://libera.chat/>`__ are
>>     available for Yocto Project and Poky discussions: ``#yocto`` and
>>     ``#poky``, respectively.
>>  
> I think the poky channel is mostly dead now. Perhaps we should mention #oe
> instead?


Sure, I was going to ask, after seeing how "active" #poky was.
I'll post an update.

Thanks,
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

