Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.29966.1631541836423763947
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 07:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 445271BF20D;
	Mon, 13 Sep 2021 14:03:53 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: correct typo in "classes" section, "${BPN}/{PV}"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <dc2aae2b-af5-a764-5d4b-9b8ac87094d7@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <04f45e8c-d13c-2dc8-068d-d021e8827a07@bootlin.com>
Date: Mon, 13 Sep 2021 16:03:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <dc2aae2b-af5-a764-5d4b-9b8ac87094d7@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello again Robert,

On 9/6/21 8:03 PM, Robert P. J. Day wrote:
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 3af023895..1b685370c 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -543,7 +543,7 @@ which the OpenEmbedded build system places the generated objects built
>  from the recipes. By default, the :term:`B` directory is set to the
>  following, which is separate from the source directory (:term:`S`)::
>
> -   ${WORKDIR}/${BPN}/{PV}/
> +   ${WORKDIR}/${BPN}-{PV}/
>
>  See these variables for more information:
>  :term:`WORKDIR`, :term:`BPN`, and


That's correct. Thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

