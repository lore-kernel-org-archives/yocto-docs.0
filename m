Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.24314.1627654323502150630
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 07:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4AC1520000D;
	Fri, 30 Jul 2021 14:12:01 +0000 (UTC)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH v3] migration-guides: Add start of 3.4 guide with override migration notes
To: docs@lists.yoctoproject.org
References: <169696B02F879A93.7588@lists.yoctoproject.org>
 <169696DEEE299346.20313@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <895bf466-37d4-e39e-f744-d2b3bffb1f52@bootlin.com>
Date: Fri, 30 Jul 2021 16:12:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <169696DEEE299346.20313@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/30/21 4:09 PM, Michael Opdenacker wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Reviewed-by: Quentin Schulz <foss@0leil.net>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/migration-guides/index.rst      |  1 +
>  .../migration-guides/migration-3.4.rst        | 76 +++++++++++++++++++


The latest version can also be reviewed on
https://docs.yoctoproject.org/next/migration-guides/migration-3.4.html#override-syntax-changes
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

