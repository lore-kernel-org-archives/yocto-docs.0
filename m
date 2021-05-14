Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.6345.1620983481307233068
 for <docs@lists.yoctoproject.org>;
 Fri, 14 May 2021 02:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4135CFF810;
	Fri, 14 May 2021 09:11:18 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: Ubuntu 20.04 is also LTS
To: Ross Burton <ross@burtonini.com>, docs@lists.yoctoproject.org
References: <20210513124808.2703933-1-ross.burton@arm.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <a9bd784b-6923-c0d4-14d6-86846af3319b@bootlin.com>
Date: Fri, 14 May 2021 11:11:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513124808.2703933-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Ross,

On 5/13/21 2:48 PM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  documentation/ref-manual/system-requirements.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index fc251945db8..9b4afc043e6 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -41,7 +41,7 @@ distributions:
>  
>  -  Ubuntu 18.04 (LTS)
>  
> --  Ubuntu 20.04
> +-  Ubuntu 20.04 (LTS)
>  
>  -  Fedora 30


Thanks!

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into the "master-next" tree.

By the way, since standard support for Ubuntu 16.04 has ended last
month, are we supposed to drop support for this version?

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

