Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.9063.1624028193375620471
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Jun 2021 07:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A41D54000C
	for <docs@lists.yoctoproject.org>; Fri, 18 Jun 2021 14:56:31 +0000 (UTC)
Subject: Re: [docs] [PATCH v2] manuals: fix issues related to trailing dots
To: docs@lists.yoctoproject.org
References: <1689625B83281616.698@lists.yoctoproject.org>
 <1689626DCF45A26C.30611@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <235c993e-b54e-0608-7aa3-38f1cbc3061b@bootlin.com>
Date: Fri, 18 Jun 2021 16:56:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1689626DCF45A26C.30611@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/17/21 3:42 PM, Michael Opdenacker wrote:
> Fix missing reference and styling issues found thanks
> to trailing dots (only non black character in a line)
>
> Matches (and multiple false positives) found with the below command:
> git grep "\s\.$"
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>


Merged in "master-next". This was a quite trivial patch anyway.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

