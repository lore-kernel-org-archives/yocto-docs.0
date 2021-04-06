Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.2259.1617738709359833500
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 12:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from [192.168.1.20] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 8B791100006;
	Tue,  6 Apr 2021 19:51:47 +0000 (UTC)
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <167127D8F46CF10E.18414@lists.yoctoproject.org>
 <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com>
 <167128A8C71457FE.21770@lists.yoctoproject.org>
 <20210330153638.xgbtnl7zenp36wb5@qschulz>
 <6c5e096e-d376-c053-f097-f5fd7ee56ade@linaro.org>
 <603250fc-2501-32b9-66be-4d10c32545f0@bootlin.com>
 <30690264b09d460b82b585322ebae090@XBOX03.axis.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <c2edf0b7-c6ff-3ba5-c379-8c97eefb5fdd@bootlin.com>
Date: Tue, 6 Apr 2021 21:51:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <30690264b09d460b82b585322ebae090@XBOX03.axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Peter,

On 3/31/21 6:39 PM, Peter Kjellerstedt wrote:
> Please make sure to prefix the commit subjects with a relevant document 
> or similar, just like we do for all commits to, e.g., OE-Core. Contrary 
> to, e.g., commits in the bitbake repository, there is no prefix added 
> when the commits to the documentation repository are included in poky, 
> making these commit stand out and lacking context when using, e.g., 
> `git log --oneline`. Look back through the git log to get examples of 
> how this has traditionally been done.


Thank you for the advise; it definitely makes sense when understanding
the Poky constraints.

I split the patch into 2 different commits with a proper subject header.
They are now in branch "master-next".

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

