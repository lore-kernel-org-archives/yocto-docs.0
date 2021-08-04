Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.9012.1628084498203306755
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 06:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 83A74200006;
	Wed,  4 Aug 2021 13:41:35 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: mention license information in footer
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1695FB134708B5C3.29235@lists.yoctoproject.org>
 <1695FB528AB59051.5172@lists.yoctoproject.org>
 <1696A0E01FF4F31A.10446@lists.yoctoproject.org>
Cc: docs@lists.yoctoproject.org
Organization: Bootlin
Message-ID: <c6225ec3-fe53-8005-093c-c7d7cb16596d@bootlin.com>
Date: Wed, 4 Aug 2021 15:41:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1696A0E01FF4F31A.10446@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Richard, all,

On 7/30/21 7:13 PM, Michael Opdenacker wrote:
> On 7/28/21 4:39 PM, Michael Opdenacker wrote:
>> Greetings,
>>
>> On 7/28/21 4:34 PM, Michael Opdenacker wrote:
>>> Previously, the license for the manuals was only
>>> stated in the SPDX headers at the beginning of source files
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>>>  documentation/conf.py | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/documentation/conf.py b/documentation/conf.py
>>> index 6c6458fed7..8e15fdc869 100644
>>> --- a/documentation/conf.py
>>> +++ b/documentation/conf.py
>>> @@ -28,7 +28,7 @@ release = current_version
>>>  
>>>  # -- Project information -----------------------------------------------------
>>>  project = 'The Yocto Project \xae'
>>> -copyright = '2010-%s, The Linux Foundation' % datetime.datetime.now().year
>>> +copyright = '2010-%s, The Linux Foundation, CC-BY-SA-2.0-UK license' % datetime.datetime.now().year
>>>  author = 'The Linux Foundation'
>> I have a few follow-up questions...
>>
>>   * Shouldn't we have a quick section at the beginning of the
>>     documentation mentioning the license information?
>>   * Shouldn't the copyright owner be "The Yocto Project and OpenEmbedded
>>     community", as in the Linux kernel documentation? Though the
>>     contributions funded by the Linux Foundation are very big, there are
>>     other contributors and we don't ask them to transfer their copyright
>>     to the LF.
>>
>> Thanks in advance for your advise.
>
> Any thoughts on this?
> Thanks in advance,
> Michael.


Would you have an idea on this? At least, can I merge the change I'm
proposing?
Thanks in advance,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

