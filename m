Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.199.1617740459840028114
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 13:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.20] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 22489240002
	for <docs@lists.yoctoproject.org>; Tue,  6 Apr 2021 20:20:57 +0000 (UTC)
Subject: Re: [docs] [PATCH] Fix suspicious newlines
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
References: <20210330121540.10101-1-michael.opdenacker@bootlin.com>
 <16711DDA4F8BFBC9.20186@lists.yoctoproject.org>
 <16711E294AEE4A72.27664@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <e2c832a1-73e5-ffae-6c3c-743c49ee3b57@bootlin.com>
Date: Tue, 6 Apr 2021 22:20:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <16711E294AEE4A72.27664@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/30/21 2:21 PM, Michael Opdenacker wrote:
> On 3/30/21 2:15 PM, Michael Opdenacker wrote:
>> - That could originate from documentation migration issues
>> - Checked that the corresponding links still exist
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Oops, apologies, I still failed to add this message to the same thread.
> This should work next time!

Merged in master-next.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

