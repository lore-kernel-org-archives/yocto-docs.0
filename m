Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.1028.1617121479293202370
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 09:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3D0B9200009;
	Tue, 30 Mar 2021 16:24:36 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <167127D8F46CF10E.18414@lists.yoctoproject.org>
 <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com>
 <167128A8C71457FE.21770@lists.yoctoproject.org>
 <20210330153638.xgbtnl7zenp36wb5@qschulz>
 <6c5e096e-d376-c053-f097-f5fd7ee56ade@linaro.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <603250fc-2501-32b9-66be-4d10c32545f0@bootlin.com>
Date: Tue, 30 Mar 2021 18:24:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6c5e096e-d376-c053-f097-f5fd7ee56ade@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Nicolas,

On 3/30/21 5:42 PM, Nicolas Dechesne wrote:
> On 3/30/21 5:36 PM, Quentin Schulz wrote:
>
> Looks fine for me too.
> However please avoid cover letter when you have just one patch. You
> can add additional information when you send one email, if you add it
> after the commit message (after the ---), this will not be used when
> applying the patch.


Very good to know! I'll do that next time.
Indeed, I didn't want to provide some context by replying to my patch.

Or maybe I'm just being too verbose ;-)

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

