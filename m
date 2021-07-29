Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.9580.1627565975584487147
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 06:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 66C1AE000C;
	Thu, 29 Jul 2021 13:39:33 +0000 (UTC)
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
 <1695F8F487052006.29235@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <1a64aa80-d2a1-3837-0175-ac942cc4976b@bootlin.com>
Date: Thu, 29 Jul 2021 15:39:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1695F8F487052006.29235@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Greetings,

On 7/28/21 3:56 PM, Michael Opdenacker wrote:
> While I had no problem moving and testing the "hello-single",
> "hello-autotools"  (GNU hello actually) and "libxpm" recipe examples,
> I'm struggling with the "mtd-utils" one.
>
> Neither the example recipe (version 1.0.0:
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb)
> nor the one which source code is directly in the documentation (version
> 1.5.1+:
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/dev-manual/common-tasks.rst#n2307)
> compile any more.
>
> Given that we have an upstream mtd-utils recipe that works, what's the
> point of trying to fix a broken example? This seems like a waste of
> effort to me...
>
> So, may I drop that old mtd-utils example?


Following this thread, I posted a patch for OE-core to add the 3
examples that are still working fine:
https://lists.openembedded.org/g/openembedded-core/message/154245

I'll remove the files from the documentation (including the broken
"mtd-utils" one) once this patch is accepted.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

