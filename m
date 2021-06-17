Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.165.1623936252341263334
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 06:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id F20B41BF212
	for <docs@lists.yoctoproject.org>; Thu, 17 Jun 2021 13:24:10 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: fix issues related to trailing docs
To: docs@lists.yoctoproject.org
References: <16896134F7F1FF15.9483@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f6b2c48d-d972-7a69-f2b0-05eab65ef148@bootlin.com>
Date: Thu, 17 Jun 2021 15:24:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <16896134F7F1FF15.9483@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/17/21 3:20 PM, Michael Opdenacker wrote:
> Fix missing reference and styling issues found thanks
> to trailing dots (only non black character in a line)
>
> Matches (and multiple false positives) found with the below command:
> git grep "\s\.$"
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>


Oops, I meant "trailing dots", not "trailing dots" in the subject line.

Let me resubmit...

Apologies for the noise.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

