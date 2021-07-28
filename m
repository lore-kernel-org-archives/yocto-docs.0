Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.5688.1627483171826429906
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 07:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 183ADFF802
	for <docs@lists.yoctoproject.org>; Wed, 28 Jul 2021 14:39:29 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: mention license information in footer
To: docs@lists.yoctoproject.org
References: <1695FB134708B5C3.29235@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d0ec6411-b44e-d597-2a4b-501d2035df4f@bootlin.com>
Date: Wed, 28 Jul 2021 16:39:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1695FB134708B5C3.29235@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Greetings,

On 7/28/21 4:34 PM, Michael Opdenacker wrote:
> Previously, the license for the manuals was only
> stated in the SPDX headers at the beginning of source files
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/conf.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 6c6458fed7..8e15fdc869 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -28,7 +28,7 @@ release = current_version
>  
>  # -- Project information -----------------------------------------------------
>  project = 'The Yocto Project \xae'
> -copyright = '2010-%s, The Linux Foundation' % datetime.datetime.now().year
> +copyright = '2010-%s, The Linux Foundation, CC-BY-SA-2.0-UK license' % datetime.datetime.now().year
>  author = 'The Linux Foundation'


I have a few follow-up questions...

  * Shouldn't we have a quick section at the beginning of the
    documentation mentioning the license information?
  * Shouldn't the copyright owner be "The Yocto Project and OpenEmbedded
    community", as in the Linux kernel documentation? Though the
    contributions funded by the Linux Foundation are very big, there are
    other contributors and we don't ask them to transfer their copyright
    to the LF.

Thanks in advance for your advise.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

