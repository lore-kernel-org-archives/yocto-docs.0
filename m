Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9847.1622215144127775631
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 08:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4C0851BF212;
	Fri, 28 May 2021 15:19:01 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RFC 1/3] Makefile: allow epub and latexpdf outputs to use diagrams from SVG sources
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
 <20210515071219.307241-2-michael.opdenacker@bootlin.com>
 <20210528144035.e44vng7jmiogfh6d@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d1bb42f0-d1ea-8d40-7eb8-8d454ef1da5d@bootlin.com>
Date: Fri, 28 May 2021 17:19:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210528144035.e44vng7jmiogfh6d@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 5/28/21 4:40 PM, Quentin Schulz wrote:
> Probably just a note to self but there's now a better chance of me not
> forgetting :)
>
> If this ever makes it (there's some interest so it'll probably make it
> :) ), I'd very much like to see a `make all` which calls the epub,
> latexpdf and html make targets so that I don't need to type all three
> when I modify something :) (and it's easier if we decide to upload all
> three kinds of outputs on yoctoproject.org).


Good idea! I'll keep in in mind for the first patch I submit, hopefully
soon.

Thanks,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

