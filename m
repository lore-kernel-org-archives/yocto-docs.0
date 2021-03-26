Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.9801.1616748970399619270
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 01:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4B3CC24000A;
	Fri, 26 Mar 2021 08:56:07 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] scripts/run-docs-build: publish docs for 3.1.6 and 3.2.2
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 yocto@lists.yoctoproject.org, richard.purdie@linuxfoundation.org
References: <20210325181211.59332-1-nicolas.dechesne@linaro.org>
 <20210325181211.59332-2-nicolas.dechesne@linaro.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ceff9689-ae7b-098c-35d2-01df6b6f03ad@bootlin.com>
Date: Fri, 26 Mar 2021 09:56:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210325181211.59332-2-nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

(for both patches).

Thanks!

On 3/25/21 7:12 PM, Nicolas Dechesne wrote:
> Fixes: #14308
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  scripts/run-docs-build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/run-docs-build b/scripts/run-docs-build
> index e8e081c..9c7ec8d 100755
> --- a/scripts/run-docs-build
> +++ b/scripts/run-docs-build
> @@ -77,7 +77,7 @@ for branch in dunfell gatesgarth; do
>  done
>  
>  # Yocto Project releases/tags
> -for tag in 3.1.5 3.2 3.2.1; do
> +for tag in 3.1.5 3.1.6 3.2 3.2.1 3.2.2; do
>      cd $ypdocs
>      git checkout yocto-$tag
>      make clean
>
> 
>
-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

