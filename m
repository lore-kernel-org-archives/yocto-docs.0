Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.1847.1630529004475826629
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 13:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 02C82100003;
	Wed,  1 Sep 2021 20:43:21 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add missing "${PN}-src" to default PACKAGES list
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <1baa1152-eef0-83ab-75a0-bd243c4dadd3@crashcourse.ca>
 <20210901105342.tvbra6zimodobpst@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <5456ef53-6b04-323d-9665-19aa830349e2@bootlin.com>
Date: Wed, 1 Sep 2021 22:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901105342.tvbra6zimodobpst@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/1/21 12:53 PM, Quentin Schulz wrote:
> Hi Robert,
>
> On Tue, Aug 31, 2021 at 06:28:00AM -0400, Robert P. J. Day wrote:
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
> Reviewed-by: Quentin Schulz <foss@0leil.net>


Good catch, many thanks!

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

