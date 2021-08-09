Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.21940.1628511787274491179
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Aug 2021 05:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D784940006;
	Mon,  9 Aug 2021 12:22:58 +0000 (UTC)
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH 0/6] overrides syntax updates
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <16982E35B25A391B.6121@lists.yoctoproject.org>
 <6e5fad0b-045b-dac2-6328-66d863390621@bootlin.com>
 <20210809095749.emmddxv2z6veks25@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <6020deb2-87d2-204a-be4f-8ce937a823f3@bootlin.com>
Date: Mon, 9 Aug 2021 14:22:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809095749.emmddxv2z6veks25@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 8/9/21 11:57 AM, Quentin Schulz wrote:
> Yeah, been busy last evenings, sorry.


No, problem, when you have time!

>
> The script is good to start the work, but there's some additional work
> to be done :)
>
> Also, I think we should watch the Bitbake ML for variables that didn't
> use overrides but now do. That's on-going work to bring some consistency
> :)
>
> I guess I need write access to the contrib repo? Who shall I ask,
> halstead I guess?


Yes, you can ask Michael Halstead to allow you to push your own branches
on the server. I'll be happy to take pull requests too.
Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

