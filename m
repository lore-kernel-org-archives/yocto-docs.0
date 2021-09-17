Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.709.1631895763732089404
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Sep 2021 09:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 90665200006;
	Fri, 17 Sep 2021 16:22:40 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: emphasize that new layers live outside of poky
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <e080c70-2cec-7e94-8fe3-ea6e25c3839c@crashcourse.ca>
 <20210830075053.ukfstwhowux2mfye@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ce7292af-0327-79eb-cfd7-3f88e526755e@bootlin.com>
Date: Fri, 17 Sep 2021 18:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210830075053.ukfstwhowux2mfye@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/30/21 9:50 AM, Quentin Schulz wrote:
> Hi Robert,
>
> On Sun, Aug 29, 2021 at 05:42:31AM -0400, Robert P. J. Day wrote:
>> Tweak the bblayers.conf example to encourage the reader to appreciate
>> that any new layers should not share space with the official Poky
>> checkout.
>>
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
> Reviewed-by: Quentin Schulz <foss@0leil.net>


Merged into "master-next". Thanks for the patch and review!
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

