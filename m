Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10120.1624033256708911894
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Jun 2021 09:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0121940005
	for <docs@lists.yoctoproject.org>; Fri, 18 Jun 2021 16:20:54 +0000 (UTC)
Subject: Re: [docs] [PATCH] sdk-manual: fix wrong word
To: docs@lists.yoctoproject.org
References: <168963255C83C393.13195@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <46ab9f5c-c99f-093f-73f5-fc76967f4a42@bootlin.com>
Date: Fri, 18 Jun 2021 18:20:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <168963255C83C393.13195@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/17/21 3:55 PM, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/sdk-manual/working-projects.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
> index 27c69ca7dd..276daa9bb6 100644
> --- a/documentation/sdk-manual/working-projects.rst
> +++ b/documentation/sdk-manual/working-projects.rst
> @@ -135,7 +135,7 @@ project:
>  
>        To learn about environment variables established when you run the
>        cross-toolchain environment setup script and how they are used or
> -      overridden when the Makefile, see the
> +      overridden by the Makefile, see the
>        :ref:`sdk-manual/working-projects:makefile-based projects` section.
>  
>     This next command is a simple way to verify the installation of your


Merged in "master-next" too.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

