Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.31087.1627312057629853158
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 08:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 53D3CE0008
	for <docs@lists.yoctoproject.org>; Mon, 26 Jul 2021 15:07:34 +0000 (UTC)
Subject: Re: [docs] [PATCH] quick start manual: update "source oe-init-build-env" output
To: docs@lists.yoctoproject.org
References: <16947B16E67B810B.7804@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <8c44fe46-c467-0559-54ac-1dbb5f68f0c8@bootlin.com>
Date: Mon, 26 Jul 2021 17:07:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <16947B16E67B810B.7804@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/23/21 7:18 PM, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/brief-yoctoprojectqs/index.rst | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index b92b0d33d9..8e2f2d423c 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -207,7 +207,7 @@ an entire Linux distribution, including the toolchain, from source.
>            https://docs.yoctoproject.org
>  
>        For more information about OpenEmbedded see their website:
> -          http://www.openembedded.org/
> +          https://www.openembedded.org/
>  
>        ### Shell environment set up for builds. ###
>  
> @@ -215,12 +215,19 @@ an entire Linux distribution, including the toolchain, from source.
>  
>        Common targets are:
>            core-image-minimal
> +          core-image-full-cmdline
>            core-image-sato
> +          core-image-weston
>            meta-toolchain
>            meta-ide-support
>  
>        You can also run generated QEMU images with a command like 'runqemu qemux86-64'
>  
> +      Other commonly useful commands are:
> +       - 'devtool' and 'recipetool' handle common recipe tasks
> +       - 'bitbake-layers' handles common layer tasks
> +       - 'oe-pkgdata-util' handles common target package tasks
> +
>     Among other things, the script creates the :term:`Build Directory`, which is
>     ``build`` in this case and is located in the :term:`Source Directory`.  After
>     the script runs, your current working directory is set to the Build


Merged into yocto-doc's "master-next" branch.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

