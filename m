Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.785.1619803632220188052
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 10:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.25] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 79FD5240008
	for <docs@lists.yoctoproject.org>; Fri, 30 Apr 2021 17:27:10 +0000 (UTC)
Subject: Re: [PATCH] dev-manual: update references to Docker installation instructions
To: docs@lists.yoctoproject.org
References: <20210428132711.421123-1-michael.opdenacker@bootlin.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <a9b5d621-8bc8-c7ed-ba06-44e8f529fff1@bootlin.com>
Date: Fri, 30 Apr 2021 19:27:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428132711.421123-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/28/21 3:27 PM, Michael Opdenacker wrote:
> Update Docker installation URL on various plaforms, replacing
> some URLs by the ones they now redirect to, renaming "Docker CE"
> to "Docker Desktop" on Mac and Windows, and to "Docker Engine"
> on GNU/Linux.
>
> Stop mentioning "Docker Toolbox" which is now deprecated and
> replaced by "Docker Desktop" on Mac and Windows.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>


Merged in master-next.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

