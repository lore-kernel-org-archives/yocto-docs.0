Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.497.1630688402409578676
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Sep 2021 10:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 41934C0008;
	Fri,  3 Sep 2021 16:59:59 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: drop "three" since there are four requirements
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <4da9cc0-d5df-d2f3-493-4af3c2368ae@crashcourse.ca>
 <20210830075751.lvklllqmay7c2bl6@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <12888b86-e5ff-c76c-ee0a-63ae3a95b725@bootlin.com>
Date: Fri, 3 Sep 2021 18:59:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210830075751.lvklllqmay7c2bl6@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/30/21 9:57 AM, Quentin Schulz wrote:
> Hi Robert,
>
> On Sat, Aug 28, 2021 at 01:34:52PM -0400, Robert P. J. Day wrote:
>> Since there are actually four listed requirements, just drop the
>> number to avoid future issues.
>>
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
> Reviewed-by: Quentin Schulz <foss@0leil.net>


Merged into master-next. Thanks for the patch and review!
Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

