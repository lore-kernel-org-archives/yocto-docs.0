Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.6258.1620983996821984795
 for <docs@lists.yoctoproject.org>;
 Fri, 14 May 2021 02:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E4D7F240003;
	Fri, 14 May 2021 09:19:54 +0000 (UTC)
Subject: Re: [docs] [yocto-docs][dunfell] ref-system-requirements.rst: Add Fedora 33 to list of supported distros
To: Steve Sakoman <steve@sakoman.com>, docs@lists.yoctoproject.org
References: <cover.1620838359.git.steve@sakoman.com>
 <07669400a5affa6bc19a5bfdea9ebc05db0b07e3.1620838359.git.steve@sakoman.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <995ed3d0-0f9d-5780-bd69-e7b4a2975239@bootlin.com>
Date: Fri, 14 May 2021 11:19:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <07669400a5affa6bc19a5bfdea9ebc05db0b07e3.1620838359.git.steve@sakoman.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Steve,

On 5/12/21 6:54 PM, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  documentation/ref-manual/ref-system-requirements.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
> index 65234d072..bb688772f 100644
> --- a/documentation/ref-manual/ref-system-requirements.rst
> +++ b/documentation/ref-manual/ref-system-requirements.rst
> @@ -55,6 +55,8 @@ distributions:
>  
>  -  Fedora 32
>  
> +-  Fedora 33
> +


If Fedora 33 is supported in our LTS, shouldn't we support it too in the
next release? I could propose the same update to the "master" branch of
yocto-docs...

Thanks in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

