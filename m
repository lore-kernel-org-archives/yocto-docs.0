Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.5963.1628261942340599009
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 07:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 64461E0005;
	Fri,  6 Aug 2021 14:59:00 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: further documentation for cve-check
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210806103720.50047-1-michael.opdenacker@bootlin.com>
 <20210806114113.4453gl435gtde7xy@fedora>
 <1698BCAA59B53D79.17952@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <a822bc10-12fa-8a68-3c22-d81c98b1672f@bootlin.com>
Date: Fri, 6 Aug 2021 16:58:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1698BCAA59B53D79.17952@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Quentin,

Preemptive nitpicking ;-)

On 8/6/21 4:05 PM, Michael Opdenacker wrote:
>
>> Since CVE stands for "Common Vulnerabilities and Exposures", isn't
>> adding vulnerabilities redundant?
>
> Oh yes, agreed!


Worse, CVE is already a plural acronym. So, we should use "CVE" instead
of "CVEs", otherwise we're making a multi-plural! I'm sure you would
have ended up noticing this.

Fortunately, not all readers are like you, but those are the best ones :-P
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

