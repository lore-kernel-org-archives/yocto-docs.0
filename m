Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.3517.1621063957252484830
 for <docs@lists.yoctoproject.org>;
 Sat, 15 May 2021 00:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7AB8F240003
	for <docs@lists.yoctoproject.org>; Sat, 15 May 2021 07:32:35 +0000 (UTC)
Subject: Re: [docs] [RFC 0/3] add support for diagrams generated from SVG sources
To: docs@lists.yoctoproject.org
References: <167F2C00C652388E.21757@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <c0f9753e-09f0-e3e5-0898-bd5ab1269112@bootlin.com>
Date: Sat, 15 May 2021 09:32:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <167F2C00C652388E.21757@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/15/21 9:12 AM, Michael Opdenacker wrote:
>
> My goal is to progressively replace PNG diagrams with SVG ones:
>    - To get high quality definition output documents, in all output formats
>    - To Have the ability to update diagrams
> I would indeed do this very progressively, a little bit every week,
> not at the expense of other tasks.


I forgot to mention that, if this is accepted, I'll also propose
guidelines to create such diagrams, such as using a standard color
palette, standard SVG clipart, standard fonts, etc, so that all diagrams
have a consistent aspect across the whole manual.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

