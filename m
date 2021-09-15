Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.10800.1631724724208499135
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 09:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 337AD200007;
	Wed, 15 Sep 2021 16:52:02 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: delete unmaintained history sections
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210914145930.371537-1-michael.opdenacker@bootlin.com>
 <20210915105931.yonsqyxkb67ytjim@fedora>
 <e88e2062-128d-6b3b-09c4-50f916535553@bootlin.com>
 <4D8E093F-E713-4BA3-88D2-1BEF4B8C9726@0leil.net>
 <16A50B3E9F31C51C.29450@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ae5f9250-0053-8295-5361-55f34875f5cf@bootlin.com>
Date: Wed, 15 Sep 2021 18:52:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <16A50B3E9F31C51C.29450@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Greetings,

On 9/15/21 6:19 PM, Michael Opdenacker wrote:
>>> Something such as "Last updated on Sep 13, 2021, for Yocto Project
>>> release 3.4" in the common footer, instead of just "Last updated on Sep
>>> 13, 2021". I could use "&YOCTO_DOC_VERSION;" to get this and it would
>>> work without extra effort from the people managing the releases.
>>>
>>> What do you think?
>>>
>> I think those are different topics, so I may not have conveyed my idea the way I intended to.
>>
>> On that topic, I can suggest Something like "Yocto Project documentation release 3.4 - Last updated on Sep 13, 2021"?
>>
>> But yeah, it could be a good idea especially if the footer is at the bottom of each page on a PDF version of the doc.
>
> Sure, I'll propose another change to address this.


Actually, this turns out to be unnecessary IMHO. The version name is
already shown at the top of the left bar and also on each page of the
PDF output. That should be easy enough to identify the version.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

