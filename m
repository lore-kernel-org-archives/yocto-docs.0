Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.9258.1628085774010545485
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 07:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id B80BC200005;
	Wed,  4 Aug 2021 14:02:51 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: mention license information in footer
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1695FB134708B5C3.29235@lists.yoctoproject.org>
 <1695FB528AB59051.5172@lists.yoctoproject.org>
 <1696A0E01FF4F31A.10446@lists.yoctoproject.org>
 <c6225ec3-fe53-8005-093c-c7d7cb16596d@bootlin.com>
 <f8fb3e4e98014f13bca55a71b2c8fdc28771758d.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <0bc5e808-7054-672e-474a-decf74fe2797@bootlin.com>
Date: Wed, 4 Aug 2021 16:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f8fb3e4e98014f13bca55a71b2c8fdc28771758d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Richard,

On 8/4/21 3:48 PM, Richard Purdie wrote:
> We probably should have something mentioning the license, yes and this
> change is ok.
>
> We can't just say it is community owned because it is not, much of the 
> docs work was done through the Linux Foundation and they do technically 
> own that copyright, not the community. If any contributor wants to add
> their copyright we can do that, or we can probably change it to "Linux
> Foundation and The Yocto Project and OpenEmbedded community".


Thanks for your feedback. I'll merge the first change and propose a
quick subsection in the manual detailing the license.
Unless there are disagreements, I propose to stick to the LF as
copyright owner.

Cheers,
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

