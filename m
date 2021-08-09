Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.20686.1628502741488652650
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Aug 2021 02:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F328820002;
	Mon,  9 Aug 2021 09:52:18 +0000 (UTC)
Subject: Re: [docs] [PATCH 0/6] overrides syntax updates
To: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
References: <16982E35B25A391B.6121@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <6e5fad0b-045b-dac2-6328-66d863390621@bootlin.com>
Date: Mon, 9 Aug 2021 11:52:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <16982E35B25A391B.6121@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 8/4/21 8:34 PM, Michael Opdenacker wrote:
> This is the result of automatically converting the YP manual
> through the scripts/contrib/convert-overrides.py script
> in oe-core.
>
> As suggested by Quentin, these changes are also available
> on a dedicated temporary branch:
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=contrib/michaelo/overrides-migration
>
> Your reviews are most welcome. There are probably errors,
> that we can either fix manual or through script updates.
>
> Thank you in advance,
> Michael.


Not sure you're here this week, but in case you are, I remember you said
that some of the replacements are wrong.
Don't hesitate to share those through patches to my branch.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

