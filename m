Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.5939.1622797463742827961
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Jun 2021 02:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id D70D0200007;
	Fri,  4 Jun 2021 09:04:21 +0000 (UTC)
Subject: Re: [docs] [PATCH] releases: update to include 3.1.8
To: Michael Halstead <mhalstead@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20210602190353.84307-1-mhalstead@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <48e0b677-7243-29c9-e065-f5a434bbdf75@bootlin.com>
Date: Fri, 4 Jun 2021 11:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602190353.84307-1-mhalstead@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Michael,

On 6/2/21 9:03 PM, Michael Halstead wrote:
> Adding 3.1.8 to documentation switcher and release list.
>
> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> ---
>  documentation/releases.rst               | 1 +
>  documentation/sphinx-static/switchers.js | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/releases.rst b/documentation/releases.rst
> index f278e2159..56f2def0c 100644
> --- a/documentation/releases.rst
> +++ b/documentation/releases.rst
> @@ -33,6 +33,7 @@
>  - :yocto_docs:`3.1.5 Documentation </3.1.5>`
>  - :yocto_docs:`3.1.6 Documentation </3.1.6>`
>  - :yocto_docs:`3.1.7 Documentation </3.1.7>`
> +- :yocto_docs:`3.1.8 Documentation </3.1.8>`
>  
>  ==========================
>   Previous Release Manuals
> diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> index a32d87236..301c2315a 100644
> --- a/documentation/sphinx-static/switchers.js
> +++ b/documentation/sphinx-static/switchers.js
> @@ -5,7 +5,7 @@
>      'dev': 'dev (3.4)',
>      '3.3.1': '3.3.1',
>      '3.2.4': '3.2.4',
> -    '3.1.7': '3.1.7',
> +    '3.1.8': '3.1.8',
>      '3.0.4': '3.0.4',
>      '2.7.4': '2.7.4',
>    };


Thanks for the update!

Cheers,

Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

