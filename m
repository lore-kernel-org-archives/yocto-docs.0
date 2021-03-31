Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.4292.1617182540567625631
 for <docs@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 02:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C8A1840006;
	Wed, 31 Mar 2021 09:22:17 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/1] Update documentation URL
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210319181321.45758-1-michael.opdenacker@bootlin.com>
 <20210319181321.45758-2-michael.opdenacker@bootlin.com>
 <099D8738-5946-4A6B-8A31-C575E7B77F4E@0leil.net>
 <9aeeb509-7a46-a761-2782-7d28dc0199c0@bootlin.com>
 <20210323092749.2vuhqkef6ptxhfww@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <7fc7cdd8-56af-877f-1a71-d3c512375f98@bootlin.com>
Date: Wed, 31 Mar 2021 11:22:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323092749.2vuhqkef6ptxhfww@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 3/23/21 10:27 AM, Quentin Schulz wrote:
> Ah the eternal struggle with literal blocks. We should check if those
> the same links appear often in literal blocks and then maybe have an
> entry in poky.yaml for those for easier maintenance.

Thanks for the suggestion. I added that to my todo list.

Thanks to your review, the patch is now in master-next:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=master-next&id=87315f3fa6664f6ac588935b4ac67bacbee0de13

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

