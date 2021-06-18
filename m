Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.10196.1624033478359488323
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Jun 2021 09:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id ED44B20005
	for <docs@lists.yoctoproject.org>; Fri, 18 Jun 2021 16:24:35 +0000 (UTC)
Subject: Re: [docs] [PATCH] sdk-manual: add missing index references
To: docs@lists.yoctoproject.org
References: <168962DDE2295857.9483@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <6be527c2-4c22-f871-0b2e-04e33b902155@bootlin.com>
Date: Fri, 18 Jun 2021 18:24:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <168962DDE2295857.9483@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/17/21 3:50 PM, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/sdk-manual/appendix-customizing.rst | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
> index 8c635d1662..73ec7c5e8f 100644
> --- a/documentation/sdk-manual/appendix-customizing.rst
> +++ b/documentation/sdk-manual/appendix-customizing.rst
> @@ -128,8 +128,7 @@ adjustments:
>     .. note::
>  
>        You must also reflect this change in the value used for the
> -      COREBASE_FILES
> -      variable as previously described.
> +      :term:`COREBASE_FILES` variable as previously described.
>  
>  Changing the Extensible SDK Installer Title
>  ===========================================
> @@ -270,8 +269,7 @@ source, you need to do a number of things:
>  
>        SSTATE_MIRRORS = "file://.* http://example.com/some_path/sstate-cache/PATH"
>  
> -   You can set the
> -   ``SSTATE_MIRRORS`` variable in two different places:
> +   You can set the :term:`SSTATE_MIRRORS` variable in two different places:
>  
>     -  If the mirror value you are setting is appropriate to be set for
>        both the OpenEmbedded build system that is actually building the


Merged into "master-next" too.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

