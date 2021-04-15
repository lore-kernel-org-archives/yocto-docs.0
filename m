Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.7419.1618494870947334287
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 06:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.10] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 32DC424000B;
	Thu, 15 Apr 2021 13:54:28 +0000 (UTC)
Subject: Re: [docs] [PATCH 00/13] Documentation updates for 3.3
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 docs@lists.yoctoproject.org
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <446635da-f144-9e8e-fd4b-7dc127e4b8da@bootlin.com>
Date: Thu, 15 Apr 2021 15:54:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Paul,

On 4/14/21 2:19 AM, Paul Eggleton wrote:
> The migration guide for 3.3, plus some missing related changes and a few
> cleanups. Let me know if I missed anything.
>
>
> The following changes since commit 4f7f451df266a307b34bf145b29291ca85eb882f:
>
>   docs: add a top level page for bitbake documentation (2021-04-09 09:00:53 +0200)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib paule/migration-3.3
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/migration-3.3


Thanks, the changes look good to me. I checked that indeed you took the
feedback into account.

I merged them in yocto-docs' master-next.

Many thanks!

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

