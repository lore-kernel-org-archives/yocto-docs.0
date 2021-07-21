Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.1638.1626887068560939968
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 10:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9817124000A;
	Wed, 21 Jul 2021 17:04:26 +0000 (UTC)
Subject: Re: [docs] "metadata": plural or singular or both?
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <8b294bc7-ab17-3dab-2cf6-ef2af316ca00@bootlin.com>
 <db9ccfa4d7a7c41b6f926366918a71c76c37ce7c.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <dddfda36-0837-51a8-39ad-3b49eceb4e84@bootlin.com>
Date: Wed, 21 Jul 2021 19:04:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <db9ccfa4d7a7c41b6f926366918a71c76c37ce7c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

On 7/21/21 6:20 PM, Richard Purdie wrote:
> Hi Michael,
>
> On Wed, 2021-07-21 at 18:11 +0200, Michael Opdenacker wrote:
>> I'm currently reading BitBake's documentation, and I'm always
>> uncomfortable when I read "Metadata is", while I know that in English
>> and in Latin, "data" is the plural of "datum". However, many people seem
>> to use "data" as singular.
>>
>> I also find confusing that actually "metadata" is both used:
>>
>>   * in plural form as in: "Split metadata into layers and allow layers
>>     to enhance or override other layers."
>>   * in singular form as in: "Metadata is stored in recipe (|.bb|) and
>>     related recipe “append” (|.bbappend|) files"
>>
>> How do you feel about this? I'm especially interested in the feedback
>> from native English speakers, which I'm not.
> Personally, I'd read both of those sentences above as being correct and
> they sound fine to me as a native speaker. There are other things in the
> manual that probably grate on me a bit but not that!

Thank you for your feedback.

Here's a more troubling sentence:
"BitBake executes tasks according to provided metadata that builds up
the tasks"

Here, "metadata" is obviously plural because otherwise you would say "a
provided metadata", but it still conjugated as if it was singular.
Doesn't this sentence grate a bit?

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

