Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.1025.1619805139198036087
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 10:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.25] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4680E240002;
	Fri, 30 Apr 2021 17:52:16 +0000 (UTC)
Subject: Re: [docs] [PATCH] sdk-manual: fix broken formatting of sample command
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <53696327-b187-808d-29cb-0d007ef27@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1b6389e4-a9e3-14fa-74a7-65f26d624330@bootlin.com>
Date: Fri, 30 Apr 2021 19:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <53696327-b187-808d-29cb-0d007ef27@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert

On 4/30/21 12:03 PM, Robert P. J. Day wrote:
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
> index 0ce828aa2..0d1422ed4 100644
> --- a/documentation/sdk-manual/appendix-obtain.rst
> +++ b/documentation/sdk-manual/appendix-obtain.rst
> @@ -138,9 +138,11 @@ build the SDK installer. Follow these steps:
>
>  6. *Build the SDK Installer:* To build the SDK installer for a standard
>     SDK and populate the SDK image, use the following command form. Be
> -   sure to replace image with an image (e.g. "core-image-sato"): $
> -   bitbake image -c populate_sdk You can do the same for the extensible
> -   SDK using this command form::
> +   sure to replace image with an image (e.g. "core-image-sato")::
> +
> +      $ bitbake image -c populate_sdk
> +
> +   You can do the same for the extensible SDK using this command form::
>
>        $ bitbake image -c populate_sdk_ext


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

I also took the opportunity to add quotes around the first instance of
the "image" word.

Merged in master-next:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=master-next&id=a0fc2e1b4bdc8411b97d02d34bfecfc888b6eb0c

Many thanks!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

