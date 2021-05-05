Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.10160.1620229174161560433
 for <docs@lists.yoctoproject.org>;
 Wed, 05 May 2021 08:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.8] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 053AF20005;
	Wed,  5 May 2021 15:39:31 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH] ref-manual: delete extraneous back quote
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <46457291-97c5-e8f2-8ff5-8484a6345a57@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <7cb65b98-be0b-c278-1a9f-a7074edba5fa@bootlin.com>
Date: Wed, 5 May 2021 17:39:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <46457291-97c5-e8f2-8ff5-8484a6345a57@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 5/1/21 2:41 PM, Robert P. J. Day wrote:
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> index f8dc7d282..72dfe0a59 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -279,7 +279,7 @@ file, it uses ``sed`` to substitute final
>  .. note::
>
>     You can see how the ``TEMPLATECONF`` variable is used by looking at the
> -   ``scripts/oe-setup-builddir``` script in the :term:`Source Directory`.
> +   ``scripts/oe-setup-builddir`` script in the :term:`Source Directory`.
>     You can find the Yocto Project version of the ``local.conf.sample`` file in
>     the ``meta-poky/conf`` directory.


Thanks for the patch.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into the "master-next" branch of yocto-docs.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

