Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.1088.1616177826243546134
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 11:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.24] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5739A1C0004
	for <docs@lists.yoctoproject.org>; Fri, 19 Mar 2021 18:17:03 +0000 (UTC)
Subject: Re: [docs] [PATCH 0/1] Update documentation URL
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
References: <166DD0FD4FAD95A4.4525@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <6b6bfab8-5dc0-ad8f-a7d7-468754f7f8de@bootlin.com>
Date: Fri, 19 Mar 2021 19:17:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <166DD0FD4FAD95A4.4525@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/19/21 7:13 PM, Michael Opdenacker wrote:
> This patch looks trivial, but the change to
> documentation/brief-yoctoprojectqs/index.rst
> anticipates that my patches, to change the welcome message when you
> don't have any conf/local.conf file yet, have been accepted.
>
> You may prefer to wait for such patches to be merged
> before merging this one, just to make sure
> that the documentation is consistent with the command output.


Oops, sorry, my two messages didn't end up in the same thread. Will do
better next time.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

