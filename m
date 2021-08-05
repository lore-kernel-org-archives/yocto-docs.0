Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.5962.1628150881622353468
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Aug 2021 01:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B440F1BF203;
	Thu,  5 Aug 2021 08:07:49 +0000 (UTC)
Subject: Re: [docs] [PATCH 1/2] test-manual: Add extra detail to YP Compatible section
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
 <d982b722-9fd8-035f-878e-62ce7da99e9c@bootlin.com>
 <e3e42e73f4b5e84cf3674e5a7448c1b24532561f.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <4893870d-be93-87b7-6220-ef6a3bfe4238@bootlin.com>
Date: Thu, 5 Aug 2021 10:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e3e42e73f4b5e84cf3674e5a7448c1b24532561f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 8/4/21 12:15 PM, Richard Purdie wrote:
>>> +-  Layers should be documenting where they don’t support normal 'core'
>>> +   functionality such as where debug symbols are disabled or missing, where
>>> +   development headers and on-target library usage may not work or where
>>
>> Replaced "or" by "and" here, as we are dealing with a list of examples,
>> rather than with a list of alternatives.
>> https://forum.oxforddictionaries.com/en/discussion/27/such-as-or-or-and
> I think it was more correct with "or". From your link, "If you are choosing from 
> a list of alternatives, then OR precedes the last item." from that link applies 
> here since you are not choosing a list of items and only one of the list may apply. 


Thanks for double checking this. I considered this as a list of examples
rather than a list of alternatives, but indeed, you need to understand
the exact meaning to know which case you are in.
I fixed this in my commit in "master-next".

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

