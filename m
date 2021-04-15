Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.308.1618506606865406589
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 10:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.10] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 069A660008;
	Thu, 15 Apr 2021 17:10:04 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: simplify colon usage
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <167613DD803B4636.18329@lists.yoctoproject.org>
 <c0301119-4642-4f26-ce90-71679c433a40@bootlin.com>
 <20210415165530.udervizadnby6v6w@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <a45556a5-78f8-1c3e-ae36-335636981efa@bootlin.com>
Date: Thu, 15 Apr 2021 19:10:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415165530.udervizadnby6v6w@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin

On 4/15/21 6:55 PM, Quentin Schulz wrote:
> On Thu, Apr 15, 2021 at 06:14:33PM +0200, Michael Opdenacker wrote:
>> On 4/15/21 6:09 PM, Michael Opdenacker wrote:
>>> - This replaces instances of ": ::" by "::", which
>>>   generates identical HTML output
> Could you explain how you did the changes? I'm pretty sure you are not
> crazy enough to do all those changes by hand :)


Yes, I am!
I was using:

git grep -Ovi ": ::"

This takes at most a few minutes to go through all the matches and
substitute them all in the same way. Actually, when the number of
changes is still not prohibitive such as here, my personal preference is
to check each instance before making the substitution (just alternating
between "n" and "." in vim) to make sure it's not a special case that
would be different. Otherwise, I'd have to inspect each line in the
generated patch which would be an equivalent effort, wouldn't it?

By the way, which remaining occurrences did you find?

Many thanks for the feedback,

Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

