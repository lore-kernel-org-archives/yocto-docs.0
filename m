Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.10631.1624035591031298259
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Jun 2021 09:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 103DBC0002;
	Fri, 18 Jun 2021 16:59:48 +0000 (UTC)
Subject: Re: [docs] [RFC 0/1] initial documentation for hash equivalence
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 JPEWhacker@gmail.com, docs@lists.yoctoproject.org
References: <20210617195530.258307-1-michael.opdenacker@bootlin.com>
 <e0fbf82a03bef065ed381299a7c38d5f9a47932e.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <b8c98536-c720-a5ba-3e27-cac5b34e2fd2@bootlin.com>
Date: Fri, 18 Jun 2021 18:59:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e0fbf82a03bef065ed381299a7c38d5f9a47932e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

Many thanks for your answers to my questions!

On 6/17/21 10:47 PM, Richard Purdie wrote:
> We definitely need a high level overview so people can understand what it 
> is doing. I suspect we'll need this and some more in depth docs too.

Right, this makes sense.

>
>>   Would I need to add more details about the implementation,
>>   such as using explaining unihashes and adding diagrams such
>>   as the ones in Joshua Watt's presentation on the topic?
> People will need to know more about it so I do think further manual 
> sections on topics like that will be needed, yes.


Ok, will do :)

>> - Doesn't this need a more thorough update of the whole
>>   documentation about share state cache to give the new
>>   full picture right away, rather than adding this new
>>   feature later in the manual ?
> We do need to update other sections and tie this in, yes.


Yes, I suspected that. Thanks for confirming. I'll see what I can do.

>
>> - Anything else that I should mention?
> There is a read only mode and pass through for the server which will be 
> needed. We need to document how to launch a standalone server instance?


Good to know. I'll investigate it.

Thanks again!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

