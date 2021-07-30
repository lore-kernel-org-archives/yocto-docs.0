Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.353.1627663266203964301
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 09:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CCD44FF806;
	Fri, 30 Jul 2021 16:41:03 +0000 (UTC)
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH] ref-manual: remove unused example recipe source files
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <16959EEB5BD85597.12821@lists.yoctoproject.org>
 <e17cad88-9b81-68fe-66c3-9305aa494f17@bootlin.com>
 <20210727112302.spzqyqnu3k2sskxi@fedora>
 <4c34e5320bb80e9234ca68c1e110e0581853766e.camel@linuxfoundation.org>
 <1695A60376DC3ECA.18160@lists.yoctoproject.org>
 <fc74674b-b3b5-1596-3cbe-a6e3af2e46c8@bootlin.com>
 <446455e7ae18c5381f20aecd95eed2bbe6eaf736.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <0e36ee4a-c227-a6cb-92eb-00826183be5c@bootlin.com>
Date: Fri, 30 Jul 2021 18:41:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <446455e7ae18c5381f20aecd95eed2bbe6eaf736.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 7/29/21 3:48 PM, Richard Purdie wrote:
>
>> While I had no problem moving and testing the "hello-single",
>> "hello-autotools"  (GNU hello actually) and "libxpm" recipe examples,
>> I'm struggling with the "mtd-utils" one.
>>
>> Neither the example recipe (version 1.0.0:
>> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb)
>> nor the one which source code is directly in the documentation (version
>> 1.5.1+:
>> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/dev-manual/common-tasks.rst#n2307)
>> compile any more.
>>
>> Given that we have an upstream mtd-utils recipe that works, what's the
>> point of trying to fix a broken example? This seems like a waste of
>> effort to me...
>>
>> So, may I drop that old mtd-utils example?
> I'd say yes, that one isn't adding value.

Thanks for confirming this.

I'm waiting for you to merge my oe-core patch
(https://lists.openembedded.org/g/openembedded-core/message/154245) to
remove these examples from the documentation.

Thank you in advance,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

