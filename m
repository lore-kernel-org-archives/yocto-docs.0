Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.14893.1622648846918673467
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 08:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3074120000D;
	Wed,  2 Jun 2021 15:47:24 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: ref-manual: variables: add missing links to terms glossary
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20210601193048.9970-1-foss@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <70c6a714-0800-11a2-95f2-55bb4d4304ad@bootlin.com>
Date: Wed, 2 Jun 2021 17:47:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601193048.9970-1-foss@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 6/1/21 9:30 PM, Quentin Schulz wrote:
> The automated script used back then didn't take into account that
> terms could be lowercase which is the case for module_autoload and
> module_conf, so let's add a link to those too.
>
> Fixes: 9e468274eaad "docs: ref-manual: ref-variables: add links to terms in glossary"
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/ref-manual/variables.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index df6413b68..0f8a255cf 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4629,7 +4629,7 @@ system and gives an overview of their function and contents.
>  
>           do_foo[depends] += "${MLPREFIX}recipe:do_foo"
>  
> -   module_autoload
> +   :term:`module_autoload`
>        This variable has been replaced by the ``KERNEL_MODULE_AUTOLOAD``
>        variable. You should replace all occurrences of ``module_autoload``
>        with additions to ``KERNEL_MODULE_AUTOLOAD``, for example::
> @@ -4642,7 +4642,7 @@ system and gives an overview of their function and contents.
>  
>        See the :term:`KERNEL_MODULE_AUTOLOAD` variable for more information.
>  
> -   module_conf
> +   :term:`module_conf`
>        Specifies `modprobe.d <https://linux.die.net/man/5/modprobe.d>`_
>        syntax lines for inclusion in the ``/etc/modprobe.d/modname.conf``
>        file.


Good catch, many thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

I merged it into "master-next".

By the way, there are other terms in the glossary that don't correspond
to variables, such as "Toaster", which has a few index references in the
manuals, or "Task" or "Layer", which have no index link at all.

While the entry in the manual is definitely useful, do you think we
should add more index references to such terms?

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

