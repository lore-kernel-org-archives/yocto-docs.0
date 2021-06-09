Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.8820.1623249617144390630
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 07:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2A7D61BF207;
	Wed,  9 Jun 2021 14:40:14 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] test-manual: add initial reproducible builds documentation
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <16868CB8BF8EEF84.10003@lists.yoctoproject.org>
 <20210608095853.48522-1-michael.opdenacker@bootlin.com>
 <20210609091143.vvykg2irov6wcbdu@qschulz>
 <bd3a88e611ed0de758eafd6928e2ee077b4861d5.camel@linuxfoundation.org>
 <20210609093457.3jgih5vydfcv5nbe@qschulz>
 <299b4ab741e279343bb71e5a059e34b0bcc0bd33.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <cd06288e-2575-749a-d777-cc69c93b05b6@bootlin.com>
Date: Wed, 9 Jun 2021 16:40:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <299b4ab741e279343bb71e5a059e34b0bcc0bd33.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 6/9/21 12:38 PM, Richard Purdie wrote:
>
> You could test world which is what the test does.
>
> You could subclass the test and change "targets" to a different target.
>
> You can also change sstate_targets which would allow you to "pre-cache" some
> set of recipes before the test, meaning they were excluded from reproducibility
> testing. An in practice example would be setting sstate_targets to "core-image-sato", 
> then targets to "core-image-sato-sdk" would test the delta between the two for 
> reproducibility from what I remember.


Thanks for this extra text. I tried to use it in my updates.

I'll post a V3 next in the thread to review the full text again, for
people who would be interested.
>
>
>> If not, it's anyway worth repeating ourselves :)


Well, in this case this sounded a little too explicit, I stressed to use
the command detailed above.

>>
>> We should provide dirt-simple, easy-to-follow instructions so that it's
>> easy to get people behind the idea that reproducible is a must and
>> should be tested before it's too late :)


I like your "before it's too late" point very much!

I added a note to the "Why it matters" section to stress this.

Many thanks!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

