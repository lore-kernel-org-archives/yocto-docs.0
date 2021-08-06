Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.35.1628269362870672005
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 10:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 15EBAE0004;
	Fri,  6 Aug 2021 17:02:40 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] manuals: further documentation for cve-check
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <1698BF9C32F2ACEF.15765@lists.yoctoproject.org>
 <20210806153447.59835-1-michael.opdenacker@bootlin.com>
 <20210806153844.3cnrvphjnpddp55w@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f9e2617c-7ed9-3f9a-436e-534a54dd0208@bootlin.com>
Date: Fri, 6 Aug 2021 19:02:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806153844.3cnrvphjnpddp55w@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Quentin,

On 8/6/21 5:38 PM, Quentin Schulz wrote:
>
> I would maybe add that this class should be inherited globally from a
> configuration file with INHERIT += "cve-check" just to highlight it's
> not expected to inherit it in recipe files.

Good idea. Done, and then merged in "master-next".

>
> In any case:
> Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

