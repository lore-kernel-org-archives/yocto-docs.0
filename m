Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.33879.1628842566489897071
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 974361C000E;
	Fri, 13 Aug 2021 08:16:03 +0000 (UTC)
Subject: Re: [docs] [PATCH 1/3] common-tasks: Add a summary to the end of the bbappend example
To: Tom Rini <tom.rini@gmail.com>, docs@lists.yoctoproject.org
References: <20210812161027.580-1-trini@konsulko.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1db73331-4415-49c1-36e9-a841d5a11ef7@bootlin.com>
Date: Fri, 13 Aug 2021 10:16:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812161027.580-1-trini@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Tom,

On 8/12/21 6:10 PM, Tom Rini wrote:
> Try and make it clearer what the final result of this bbappend example
> is.
>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 37077d72d451..2d8ef96e2600 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -545,6 +545,12 @@ important as it ensures that items in the list remain colon-separated.
>     allow to add build options (e.g. ``systemd``). For these cases, your
>     append file would not even use the :term:`FILESEXTRAPATHS` statement.
>  
> +The end result of this ``.bbappend`` file is that on a Raspberry Pi, where
> +``rpi`` will exist in the list of :term:`OVERRIDES`, the file
> +``meta-raspberrypi/recipes-bsp/formfactor/formfactor/rpi/machconfig`` will be
> +used during ``do_fetch`` and the test for a non-zero file size in
> +``do_install`` will return true, and the file will be installed.


I agree that this text really helps to understand this section. I was
confused otherwise.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next" for yocto-docs.

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

