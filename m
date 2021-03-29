Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.21267.1617024340691527560
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 06:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id C846F10000E;
	Mon, 29 Mar 2021 13:25:38 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] documentation/README minor improvements
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210323144528.107878-1-michael.opdenacker@bootlin.com>
 <20210323173659.hdjbvz6mortxpmbo@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <19b5a7b5-a596-49c7-e877-93fd7a7a1333@bootlin.com>
Date: Mon, 29 Mar 2021 15:25:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323173659.hdjbvz6mortxpmbo@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 3/23/21 6:36 PM, Quentin Schulz wrote:
>>  Sphinx might be available in your Linux distro packages repositories,
>> -however it is not recommend using distro packages, as they might be
>> +however it is not recommend to use distro packages, as they might be
> s/recommend/recommended/ while you're at it :)


Thanks!

That was an opportunity to hunt for trivial fixes, and this one is fixed
in the trivial patch I've just sent.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

