Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.8029.1627046367997837298
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jul 2021 06:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0097F2000B;
	Fri, 23 Jul 2021 13:19:25 +0000 (UTC)
Subject: Re: [docs] [PATCH] test-manual: document LTO related reproducibility bug
To: docs@lists.yoctoproject.org, tonyb@cybernetics.com
References: <1692572BA30A3D60.32208@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <bb1efba1-7335-fb00-e133-5562eca438f9@bootlin.com>
Date: Fri, 23 Jul 2021 15:19:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1692572BA30A3D60.32208@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/16/21 7:57 PM, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/test-manual/reproducible-builds.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
> index e13583c0bf..1938041b2d 100644
> --- a/documentation/test-manual/reproducible-builds.rst
> +++ b/documentation/test-manual/reproducible-builds.rst
> @@ -68,6 +68,17 @@ things we do within the build system to ensure reproducibility include:
>  -  Filtering the tools available from the host's ``PATH`` to only a specific set
>     of tools, set using the :term:`HOSTTOOLS` variable.
>  
> +.. note::
> +
> +   Because of an open bug in GCC, using ``DISTRO_FEATURES_append = " lto"`` or
> +   adding ``-flto`` (Link Time Optimization) to a Makefile makes the resulting
> +   binary non-reproducible, in that it depends on the full absolute build path
> +   to ``recipe-sysroot-native``, so installing the Yocto Project in a different
> +   directory results in a different binary.
> +
> +   This issue is addressed by
> +   :yocto_bugs:`bug 14481 -  Programs built with -flto are not reproducible</show_bug.cgi?id=14481>`.

Merged into "master-next" for yocto-docs, after replacing "a Makefile"
by "CFLAGS", as recommended by Tony (thanks!)

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

