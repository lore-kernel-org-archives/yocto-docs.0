Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8140.1621598349414436898
 for <docs@lists.yoctoproject.org>;
 Fri, 21 May 2021 04:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 648ED20009;
	Fri, 21 May 2021 11:59:06 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: add links to some variables in glossary
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <1bccf6a-c79-cb46-a04-2fb4a2ed8c6b@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <904a39a0-1f55-536c-2b4c-fad8763995f9@bootlin.com>
Date: Fri, 21 May 2021 13:59:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1bccf6a-c79-cb46-a04-2fb4a2ed8c6b@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 5/21/21 11:57 AM, Robert P. J. Day wrote:
> Add some links to a small set of glossary variables that I happened
> to be perusing at the time.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> commit ab92c97908bf80b1148f67121c692183b3c47ffc
> Author: Robert P. J. Day <rpjday@crashcourse.ca>
> Date:   Fri May 21 05:55:32 2021 -0400
>
>     add links to some vars in glossary
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 0b61f77cb..5c15bb351 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1525,10 +1525,10 @@ system and gives an overview of their function and contents.
>
>     :term:`DEBUG_BUILD`
>        Specifies to build packages with debugging information. This
> -      influences the value of the ``SELECTED_OPTIMIZATION`` variable.
> +      influences the value of the :term:`SELECTED_OPTIMIZATION` variable.
>
>     :term:`DEBUG_OPTIMIZATION`
> -      The options to pass in ``TARGET_CFLAGS`` and ``CFLAGS`` when
> +      The options to pass in :term:`TARGET_CFLAGS` and :term:`CFLAGS` when
>        compiling a system for debugging. This variable defaults to "-O
>        -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe".
>
> @@ -1538,7 +1538,7 @@ system and gives an overview of their function and contents.
>        The most common usage of this is variable is to set it to "-1" within
>        a recipe for a development version of a piece of software. Using the
>        variable in this way causes the stable version of the recipe to build
> -      by default in the absence of ``PREFERRED_VERSION`` being used to
> +      by default in the absence of :term:`PREFERRED_VERSION` being used to
>        build the development version.
>
>        .. note::
> @@ -2579,7 +2579,7 @@ system and gives an overview of their function and contents.
>        Set the variable to "1" to force the removal of these packages.
>
>     :term:`FULL_OPTIMIZATION`
> -      The options to pass in ``TARGET_CFLAGS`` and ``CFLAGS`` when
> +      The options to pass in :term:`TARGET_CFLAGS` and :term:`CFLAGS` when
>        compiling an optimized system. This variable defaults to "-O2 -pipe
>        ${DEBUG_FLAGS}".
>
> @@ -6691,8 +6691,8 @@ system and gives an overview of their function and contents.
>        value of the :term:`TARGET_CFLAGS` variable.
>
>        The ``SELECTED_OPTIMIZATION`` variable takes the value of
> -      ``FULL_OPTIMIZATION`` unless ``DEBUG_BUILD`` = "1". If that is the
> -      case, the value of ``DEBUG_OPTIMIZATION`` is used.
> +      :term:`FULL_OPTIMIZATION` unless :term:`DEBUG_BUILD` = "1", in which
> +      case the value of :term:`DEBUG_OPTIMIZATION` is used.
>
>     :term:`SERIAL_CONSOLE`
>        Defines a serial console (TTY) to enable using


Thanks for the patch. I checked that the corresponding variables didn't
already have a nearby reference to the glossary, but that wasn't the case.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Applied to master-next.

Cheers,
Michael.

