Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.9427.1630431129713821480
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 10:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9590A240006;
	Tue, 31 Aug 2021 17:32:07 +0000 (UTC)
Subject: Re: [docs] virtual providers don't apply to runtime dependencies?
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <09ae7be-46c4-ab72-542-a450f6132b5b@crashcourse.ca>
 <0af509d5adc926ade1439a011d03e26687773e74.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d39a9c39-f618-a02d-f188-87172318f3bc@bootlin.com>
Date: Tue, 31 Aug 2021 19:32:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0af509d5adc926ade1439a011d03e26687773e74.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 8/30/21 2:20 PM, Richard Purdie wrote:
> On Mon, 2021-08-30 at 04:44 -0400, Robert P. J. Day wrote:
>>   in this section:
>>
>> https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-virtual-providers
>>
>> one reads the note:
>>
>> "Virtual providers only apply to build time dependencies specified
>> with PROVIDES and DEPENDS. They do not apply to runtime dependencies
>> specified with RPROVIDES and RDEPENDS."
>>
>>   except in current oe-core, there seem to be a couple examples of
>> that:
>>
>> meta/recipes-core/systemd/systemd-bootconf_1.00.bb:RPROVIDES:${PN} +=
>> "virtual/systemd-bootconf"
>>
>> meta/recipes-bsp/grub/grub-bootconf_1.00.bb:RPROVIDES:${PN} +=
>> "virtual/grub-bootconf"
>>
>>   am i misreadimg something?
> No, the above lines are incorrect and should be fixed. A bug or something to
> track that would be good.


Oops, I now understand that I misunderstood Richard's point. The lines
in the recipes are wrong, not the documentation text.

So bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=14530 is not a
documentation bug, but an OE core one. I'll fix this.

Thanks for your patience with us mere mortals, Richard ;-)
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

