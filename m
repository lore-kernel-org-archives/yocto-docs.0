Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.33374.1623055989013349217
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 01:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8C5F4200018;
	Mon,  7 Jun 2021 08:53:06 +0000 (UTC)
Cc: Quentin Schulz <foss@0leil.net>,
 YP docs mailing list <docs@lists.yoctoproject.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [docs] [PATCH] docs: replace ``FOO`` by :term:`FOO` where possible
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210527184117.80067-1-foss@0leil.net>
 <CAP71Wjy9rLUs3kF7k9jjK04p8K4qLbqvzKXRtOQiKhOctxffxw@mail.gmail.com>
 <707599b21e074097e0a8a89873354a8c@0leil.net>
 <65a33804-8952-b322-3103-1a758920a0fe@bootlin.com>
 <CAP71Wjy+_tu6VAdWOZAFqfYeE3UQgYDcufFw2LJwOY0NM6efUg@mail.gmail.com>
 <a7b2178f-f6c7-4332-1b70-aa3c3835947f@bootlin.com>
 <20210607084435.fi4hrzga6rkijsl3@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3f2e4bda-9d2e-3437-2713-c7c7026fe1ee@bootlin.com>
Date: Mon, 7 Jun 2021 10:53:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607084435.fi4hrzga6rkijsl3@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 6/7/21 10:44 AM, Quentin Schulz wrote:
> Yes I will. It was a long (and sunny) week-end in Austria, sorry for the
> delay :)


No problem, take your time! I just wanted to avoid any possible
missunderstanding.

>
> I was also trying to find a way to create a module for sphinx to do this
> on the fly when compiling and throw errors/warnings but in the few hours
> I spent, I didn't find anything straightforward. So for now, the manual
> way will do.

Thanks for trying anyway!
>
> Just to be sure, no separate patch for bitbake and YP variables right?
> (not talking the :term:`bitbake:` stuff but more the objects.inv used
> to detect the missing term references; I run the script twice now :) )


Right, a single patch will do, when you have time.

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

