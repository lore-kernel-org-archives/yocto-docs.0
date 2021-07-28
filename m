Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.5211.1627480568718863330
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 06:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id F297824000B;
	Wed, 28 Jul 2021 13:56:06 +0000 (UTC)
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH] ref-manual: remove unused example recipe source files
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <16959EEB5BD85597.12821@lists.yoctoproject.org>
 <e17cad88-9b81-68fe-66c3-9305aa494f17@bootlin.com>
 <20210727112302.spzqyqnu3k2sskxi@fedora>
 <4c34e5320bb80e9234ca68c1e110e0581853766e.camel@linuxfoundation.org>
 <1695A60376DC3ECA.18160@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <fc74674b-b3b5-1596-3cbe-a6e3af2e46c8@bootlin.com>
Date: Wed, 28 Jul 2021 15:56:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1695A60376DC3ECA.18160@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Richard, Quentin, Nicolas and others,

On 7/27/21 2:36 PM, Michael Opdenacker wrote:
> Richard, Quentin,
>
> Many thanks for your feedback.
>
> On 7/27/21 1:38 PM, Richard Purdie wrote:
>> On Tue, 2021-07-27 at 13:23 +0200, Quentin Schulz wrote:
>>> I wouldn't remove them as I find example recipes to be very welcomed as
>>> real life examples of what can/needs to be done. It shows also some
>>> gotchas and what a minimal recipe should look like.
>>>
>>> What I have to complain about those files currently is that they are not
>>> built and they weren't working for a while, which is a bit of a shame
>>> for example recipes :)
>>>
>>> I don't think keeping them in the yocto-docs is something we want to
>>> push for (at least I won't), but I feel like we should keep them
>>> somewhere they are built so we maintain them along other recipes.
>>>
>>> I can see that we have a recipe for an out-of-tree kernel drievr recipe
>>> available in poky/meta-skeleton layer (called hello-mod). I guess this
>>> is a place we could put the examples you want to remove from yocto-docs?
>> If they were in meta-skeleton we could build/test them...
>
> Thanks for the suggestion! I'll propose a patch doing this.

While I had no problem moving and testing the "hello-single",
"hello-autotools"  (GNU hello actually) and "libxpm" recipe examples,
I'm struggling with the "mtd-utils" one.

Neither the example recipe (version 1.0.0:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb)
nor the one which source code is directly in the documentation (version
1.5.1+:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/dev-manual/common-tasks.rst#n2307)
compile any more.

Given that we have an upstream mtd-utils recipe that works, what's the
point of trying to fix a broken example? This seems like a waste of
effort to me...

So, may I drop that old mtd-utils example?

Thanks in advance for your advice.
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

