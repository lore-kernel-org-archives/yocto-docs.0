Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.34033.1628843321548732890
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A1C951C000B;
	Fri, 13 Aug 2021 08:28:39 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/3] common-tasks: Add a summary to the end of the bbappend example
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tom Rini <tom.rini@gmail.com>
References: <20210812161027.580-1-trini@konsulko.com>
 <20210813082135.ht62s672l4ap6agm@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <2a1197ce-7dd8-012b-7c5a-1338afe33b43@bootlin.com>
Date: Fri, 13 Aug 2021 10:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813082135.ht62s672l4ap6agm@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Thanks for the review!

On 8/13/21 10:21 AM, Quentin Schulz wrote:

> s/``do_fetch``/:ref:`ref-tasks-fetch`/
>
>> +``do_install`` will return true, and the file will be installed.
>> +
> s/``do_install``/:ref:`ref-tasks-install`/


Good catch! I see other places in the documentation where this could be
done. I'll add it to my TODO list, but be my guest if you have time.

I updated the commit in master-next.
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

