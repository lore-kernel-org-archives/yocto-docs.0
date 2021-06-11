Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.5978.1623402970918556592
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 02:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 507E81BF203;
	Fri, 11 Jun 2021 09:16:07 +0000 (UTC)
Subject: Re: [docs] [PATCH 2/2] ref-manual: variables: document IMGDEPLOYDIR
To: Daniel Wagenknecht <dwagenknecht@emlix.com>, docs@lists.yoctoproject.org
References: <20210611062613.188300-1-dwagenknecht@emlix.com>
 <20210611062613.188300-3-dwagenknecht@emlix.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3b453c89-232e-fa95-6114-b308dedea681@bootlin.com>
Date: Fri, 11 Jun 2021 11:16:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210611062613.188300-3-dwagenknecht@emlix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 6/11/21 8:26 AM, Daniel Wagenknecht wrote:
>  
> +   :term:`IMGDEPLOYDIR`
> +      When inheriting the :ref:`image <ref-classes-image>` directly or

I guess you meant "the  :ref:`image <ref-classes-image>` *class* directly".

I fixed that in my branch too.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

