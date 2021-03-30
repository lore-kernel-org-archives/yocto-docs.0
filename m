Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.753.1617120581697446276
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 09:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E077040006;
	Tue, 30 Mar 2021 16:09:39 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <167127D8F46CF10E.18414@lists.yoctoproject.org>
 <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com>
 <20210330153400.tem5ztfbjaptmkl6@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <2c4e894e-02c4-d655-b7eb-0c5d8b166bdc@bootlin.com>
Date: Tue, 30 Mar 2021 18:09:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210330153400.tem5ztfbjaptmkl6@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Thanks for your advise!

> git format-patch --cover-letter <commit-hash>
>
> (refer to man git-format-patch for the logic behind the <commit-hash>
>  parameter)
>
> Edit the cover letter manually.


Good, I'll try that!

>
> git send-email --to docs@lists.yoctoproject.org *.patch

Thanks! I had the wrong belief that git send-email was sending by
default to separate threads. I tested again and you are obviously right.

Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

