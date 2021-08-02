Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.17388.1627893586261650756
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 01:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6D359240008;
	Mon,  2 Aug 2021 08:39:44 +0000 (UTC)
Subject: Re: [docs] [PATCH] dev-manual: fix source release example script
To: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>,
 docs@lists.yoctoproject.org
References: <20210802062805.43135-1-stefan.wiehler@missinglinkelectronics.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <730954bf-6cae-071f-530d-76590b4aded6@bootlin.com>
Date: Mon, 2 Aug 2021 10:39:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802062805.43135-1-stefan.wiehler@missinglinkelectronics.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Stefan,

On 8/2/21 8:28 AM, Stefan Wiehler wrote:
> Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 5600076b7..77af03b3c 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10929,7 +10929,7 @@ concerned with GPL code as identified by running the following script:
>           p=${p%-*}
>           # Only archive GPL packages (update *GPL* regex for your license check)
>           numfiles=`ls tmp/deploy/licenses/$p/*GPL* 2> /dev/null | wc -l`
> -         if [ $numfiles -gt 1 ]; then
> +         if [ $numfiles -ge 1 ]; then
>              echo Archiving $p
>              mkdir -p $src_release_dir/$p/source
>              cp $d/* $src_release_dir/$p/source 2> /dev/null


Good catch, thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

I merged it into the "master-next" branch of "yocto-docs", which is
merged into "master" about once a week.

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

