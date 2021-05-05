Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.5381.1620207011325966248
 for <docs@lists.yoctoproject.org>;
 Wed, 05 May 2021 02:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.8] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 288EF240018;
	Wed,  5 May 2021 09:30:09 +0000 (UTC)
Cc: quentin.schulz@streamunlimited.com,
 Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: Re: [docs] [PATCH v2] kernel-dev: document KCONFIG_MODE
To: docs@lists.yoctoproject.org
References: <20210505085749.753783-1-dwagenknecht@emlix.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <8bc762e4-cd03-f305-2635-ce390c4ea40d@bootlin.com>
Date: Wed, 5 May 2021 11:30:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505085749.753783-1-dwagenknecht@emlix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Daniel,

Many thanks for the new version.

On 5/5/21 10:57 AM, Daniel Wagenknecht wrote:
> +
> +      In case ``KCONFIG_MODE`` is unset the behaviour will depend on where

From an English perspective, I believe that "unset" means "not set", but
from a UNIX perspective, it makes me think about corresponding shell
command, that unsets an variable that was set previously.

Could we just say "not set" instead of "unset"?

Any thoughts?

Other than that, happy to merge your patch. I can take care of fixing
"explicitely".

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

