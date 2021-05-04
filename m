Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.8587.1620146158531201135
 for <docs@lists.yoctoproject.org>;
 Tue, 04 May 2021 09:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.8] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 916F71C0011;
	Tue,  4 May 2021 16:35:56 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] kernel-dev: document KCONFIG_MODE
To: Quentin Schulz <quentin.schulz@streamunlimited.com>,
 Daniel Wagenknecht <dwagenknecht@emlix.com>
References: <20210503184431.3156865-1-dwagenknecht@emlix.com>
 <20210504084500.5i7d7d66ntvcqala@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <c6398278-fa3b-0519-5b8c-6f843416a2df@bootlin.com>
Date: Tue, 4 May 2021 18:35:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210504084500.5i7d7d66ntvcqala@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Daniel,

Many thanks for the patch!

On 5/4/21 10:45 AM, Quentin Schulz wrote:
> I'd try to make a bit more explicit that unset KCONFIG_MODE is valid but
> its meaning is different depending on where the defconfig is coming.
>
> I'd first specify what alldefconfig and allnoconfig mean, then different
> meaning for unset KCONFIG_MODE, and finally explanation on how to build a
> defconfig.
>
> I'd also explain that an "in-tree" defconfig is selected via the
> :term:`KBUILD_DEFCONFIG` variable.


I agree with Quentin on explaining the case when KCONFIG_MODE is not
used, and on adding the reference to  KBUILD_DEFCONFIG. I'm not sure
about the need to reorder the explanations, provided the result makes sense.

Other than that, your patch looks ready and would be a welcome addition
to our manual.

Do you think you will have time to send an update?

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

