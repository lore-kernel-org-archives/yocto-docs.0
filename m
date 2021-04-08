Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.5346.1617870454918851763
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Apr 2021 01:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id EE7254000E;
	Thu,  8 Apr 2021 08:27:31 +0000 (UTC)
Subject: Re: [docs] [PATCH] sdk-manual: fix typo
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>,
 docs@lists.yoctoproject.org
References: <20210407161610.12537-1-u.oelmann@pengutronix.de>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <feb3d5d9-63bd-c4b7-0853-5cb53219687a@bootlin.com>
Date: Thu, 8 Apr 2021 10:27:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407161610.12537-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Ulrich,

Thanks for this fix!

On 4/7/21 6:16 PM, Ulrich Ölmann wrote:
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> ---
>  documentation/sdk-manual/appendix-obtain.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
> index 395102c3bd1b..0fd421f31f8f 100644
> --- a/documentation/sdk-manual/appendix-obtain.rst
> +++ b/documentation/sdk-manual/appendix-obtain.rst
> @@ -38,7 +38,7 @@ Follow these steps to locate and hand-install the toolchain:
>                  "sato" or "minimal"
>  
>            arch is a string representing the target architecture:
> -                 "aarch64", "armv5e", "core2-64", "coretexa8hf-neon", "i586", "mips32r2",
> +                 "aarch64", "armv5e", "core2-64", "cortexa8hf-neon", "i586", "mips32r2",
>                   "mips64", or "ppc7400"
>  
>            release is the version of Yocto Project.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

... and pushed in the "master-next" branch
(http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next)

Thanks again,

Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

