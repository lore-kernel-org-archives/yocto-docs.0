Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.9581.1618503276132702056
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 09:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.10] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 60DCD240008
	for <docs@lists.yoctoproject.org>; Thu, 15 Apr 2021 16:14:34 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: simplify colon usage
To: docs@lists.yoctoproject.org
References: <167613DD803B4636.18329@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <c0301119-4642-4f26-ce90-71679c433a40@bootlin.com>
Date: Thu, 15 Apr 2021 18:14:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <167613DD803B4636.18329@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/15/21 6:09 PM, Michael Opdenacker wrote:
> - This replaces instances of ": ::" by "::", which
>   generates identical HTML output

I'll propose the same changes to the Bitbake manual :)

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

