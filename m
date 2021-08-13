Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.34074.1628844540705041513
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 64F0BE0009;
	Fri, 13 Aug 2021 08:48:48 +0000 (UTC)
Cc: Tom Rini <tom.rini@gmail.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/3] common-tasks: Add a summary to the end of the bbappend example
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210812161027.580-1-trini@konsulko.com>
 <20210813082135.ht62s672l4ap6agm@fedora>
 <2a1197ce-7dd8-012b-7c5a-1338afe33b43@bootlin.com>
 <20210813083131.w6upkqiqki4e5owo@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <0d44a4dc-5008-7356-c8e0-16fdde4ceadb@bootlin.com>
Date: Fri, 13 Aug 2021 10:48:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813083131.w6upkqiqki4e5owo@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/13/21 10:31 AM, Quentin Schulz wrote:
> You can open a Bugzilla entry for this so we don't forget :)
>
> We probably need to do the same for classes, tasks and variables. I saw
> I missed a few variables that aren't highlighted with tick quotes in the
> docs, which explains why they were missed by the script :)


Good idea. Anyway, I'm one of the people with the greatest number of bugs.
Here it is: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14508

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

