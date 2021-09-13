Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.30447.1631542972593594142
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 07:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 920D3C000E;
	Mon, 13 Sep 2021 14:22:50 +0000 (UTC)
Subject: Re: [docs] [PATCH v2] ref-manual: add potential of parallelism to defn of "Task"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <79475bcc-344e-b3bb-eb82-8ab31446b57d@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f41481c7-2e62-ed28-a256-451f143e6e8e@bootlin.com>
Date: Mon, 13 Sep 2021 16:22:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <79475bcc-344e-b3bb-eb82-8ab31446b57d@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello again Robert,

On 9/6/21 4:00 PM, Robert P. J. Day wrote:
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> index 32658051a..e5a7565df 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -367,10 +367,16 @@ universal, the list includes them just in case:
>       section in the Yocto Project Overview and Concepts Manual.
>
>     :term:`Task`
> -      A unit of execution for BitBake (e.g.
> +      A per-recipe unit of execution for BitBake (e.g.
>        :ref:`ref-tasks-compile`,
>        :ref:`ref-tasks-fetch`,
>        :ref:`ref-tasks-patch`, and so forth).
> +      One of the major benefits of the build system is that, since each
> +      recipe will typically spawn the execution of numerous tasks,
> +      it is entirely possible that many tasks can execute in parallel,
> +      either tasks from separate recipes or independent tasks within
> +      the same recipe, potentially up to the parallelism of your
> +      build system.
>
>     :term:`Toaster`
>        A web interface to the Yocto Project's :term:`OpenEmbedded Build System`.


Thanks for the patch.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged in "master-next".

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

