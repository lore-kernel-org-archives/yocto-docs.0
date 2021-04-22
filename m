Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.135.1619108179441873785
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 09:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D44ACC0007;
	Thu, 22 Apr 2021 16:16:16 +0000 (UTC)
Subject: Re: [docs][PATCH] ref-manual/variables.rst: Add incompatibility warning for SERIAL_CONSOLES_CHECK
To: Trevor Gamblin <trevor.gamblin@windriver.com>, docs@lists.yoctoproject.org
References: <20210422154853.2102019-1-trevor.gamblin@windriver.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f487889b-45a9-78a8-7587-35fdd3cc7bfc@bootlin.com>
Date: Thu, 22 Apr 2021 18:16:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422154853.2102019-1-trevor.gamblin@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Trevor,

Thanks for your patch!

On 4/22/21 5:48 PM, Trevor Gamblin wrote:
> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13921

I actually replaced this by

See [YOCTO #13921]

>  documentation/ref-manual/variables.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 74ac12bf9..7a87d219d 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6929,7 +6929,11 @@ system and gives an overview of their function and contents.
>           SERIAL_CONSOLES_CHECK = "slcp_line0:ttyS0"
>  
>        This variable is currently only supported with SysVinit (i.e. not
> -      with systemd).
> +      with systemd). Note that SERIAL_CONSOLES_CHECK also requires
> +      /etc/inittab to be writable when used with SysVinit. This makes it
> +      incompatible with customizations such as the following: ::


Actually, we now recommend to just use "::" at the end of the line.
That's equivalent and we've made a tree-wide change for this change.

I took care of updating this too. Looking good to me otherwise.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

I will merge this in "master-next" tomorrow if nobody objects.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

