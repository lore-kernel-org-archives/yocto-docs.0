Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.1809.1631900241336764158
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Sep 2021 10:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D72D71C0004;
	Fri, 17 Sep 2021 17:37:18 +0000 (UTC)
Subject: Re: [docs] [PATCH] dev-manual: update output of "wic list images"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <d8bbda85-5b41-c51-c5da-c82defe4ec45@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <4f91f86a-c15e-7869-37bf-1ccb3d60a86a@bootlin.com>
Date: Fri, 17 Sep 2021 19:37:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d8bbda85-5b41-c51-c5da-c82defe4ec45@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

Thanks for the update!

On 8/16/21 11:26 AM, Robert P. J. Day wrote:
> Output order from "wic list images" is in different order, and was
> missing a couple entries.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into "master-next".

Thanks again,
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

