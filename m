Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.9284.1619776916966281670
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 03:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.8] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D103F6000F;
	Fri, 30 Apr 2021 10:01:53 +0000 (UTC)
Subject: Re: [docs] [PATCH] sdk-manual: "beablebone" -> "beaglebone"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <a792186f-e483-e9d9-88a2-b2cf65a6a66c@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <be7c2516-ea25-9339-38ec-a6471e91fb1a@bootlin.com>
Date: Fri, 30 Apr 2021 12:01:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a792186f-e483-e9d9-88a2-b2cf65a6a66c@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 4/30/21 11:56 AM, Robert P. J. Day wrote:
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
> index 0ce828aa2..7927dbea1 100644
> --- a/documentation/sdk-manual/appendix-obtain.rst
> +++ b/documentation/sdk-manual/appendix-obtain.rst
> @@ -253,7 +253,7 @@ Follow these steps to extract the root filesystem:
>
>        $ runqemu-extract-sdk ~/Downloads/core-image-sato-sdk-beaglebone-yocto.tar.bz2 ~/beaglebone-sato
>
> -   You could now point to the target sysroot at ``beablebone-sato``.
> +   You could now point to the target sysroot at ``beaglebone-sato``.


Good catch, thanks!

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
I will merge it in "master-next" soon.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

