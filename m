Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.330.1619109431881173726
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 09:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AC41AFF802;
	Thu, 22 Apr 2021 16:37:09 +0000 (UTC)
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>, docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH] ref-manual/variables.rst: Add incompatibility warning for SERIAL_CONSOLES_CHECK
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210422154853.2102019-1-trevor.gamblin@windriver.com>
 <f487889b-45a9-78a8-7587-35fdd3cc7bfc@bootlin.com>
 <20210422162954.aihz7eevpltsjf7j@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <7e7596a7-cd92-3dfa-7771-51015162e0ca@bootlin.com>
Date: Thu, 22 Apr 2021 18:37:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422162954.aihz7eevpltsjf7j@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 4/22/21 6:29 PM, Quentin Schulz wrote:
> s/SERIAL_CONSOLES_CHECK/:term:`SERIAL_CONSOLES_CHECK`/
> s/\/etc\/inittab/``\/etc\/inittab``/


Oops, thanks!

I'll take care of sending the V2 then ;-)

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

