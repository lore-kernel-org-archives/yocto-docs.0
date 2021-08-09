Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.20218.1628497287274525568
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Aug 2021 01:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4B76EE0005;
	Mon,  9 Aug 2021 08:21:24 +0000 (UTC)
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] manuals: further documentation for cve-check
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210806103720.50047-1-michael.opdenacker@bootlin.com>
 <20210806114113.4453gl435gtde7xy@fedora>
 <1698BCAA59B53D79.17952@lists.yoctoproject.org>
 <a822bc10-12fa-8a68-3c22-d81c98b1672f@bootlin.com>
 <d1d6b6d2e58b47b4a506f305403b5546@axis.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3ca8cb2f-500b-3e5f-1142-421e916cf904@bootlin.com>
Date: Mon, 9 Aug 2021 10:21:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d1d6b6d2e58b47b4a506f305403b5546@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Peter,

Thank you for your review and feedback.

On 8/7/21 5:33 AM, Peter Kjellerstedt wrote:
>
>> Worse, CVE is already a plural acronym. So, we should use "CVE" instead
>> of "CVEs", otherwise we're making a multi-plural! I'm sure you would
>> have ended up noticing this.
> That doesn't make sense. I would argue that "a CVE" is singular and refers 
> to one entry in the CVE database, regardless of what the acronym actually 
> stands for. Thus "bugs and CVEs" make sense, while "bugs and CVE" does not.


You have a point, and this is consistent with the CVE warning messages
issued by the cve-check class.
I fixed this in "master-next", actually before Richard merged it into
master.

Thanks again,
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

