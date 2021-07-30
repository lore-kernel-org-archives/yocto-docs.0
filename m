Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.174.1627662421853310458
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 09:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0E8B3240006;
	Fri, 30 Jul 2021 16:26:59 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 2/3] manuals: simplify references to BitBake manual
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <1695B21F5A0B37B5.3345@lists.yoctoproject.org>
 <20210727171147.132288-1-michael.opdenacker@bootlin.com>
 <20210727171147.132288-3-michael.opdenacker@bootlin.com>
 <20210728084650.ynbq3fofbe2c3jug@fedora>
 <1695E98A2F617A0D.29235@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <653ff3cb-eb89-9048-fa66-a72b25650dab@bootlin.com>
Date: Fri, 30 Jul 2021 18:26:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1695E98A2F617A0D.29235@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

On 7/28/21 11:13 AM, Michael Opdenacker wrote:
> Actually, this one was intentional, as "The"  is part of the section
> name. The result is:
> "see the The BitBake Command
> <https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-intro.html#the-bitbake-command> section
> in the BitBake User Manual"
>
> I could put "The BitBake Command" between double quotes, but I agree
> that this still sounds weird if you read out loud.
>
> I could either revert the change or just drop "the"  and "section" and get:
> "see The BitBake Command in the BitBake User Manual"
>
> Any preference? The second solution has the simplest source code.


I eventually chose the simplest solution (the second one) and merged my
3 commits into "master-next".

Thanks again for the reviews!

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

