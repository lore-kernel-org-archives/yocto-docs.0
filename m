Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.36623.1620060774272536189
 for <docs@lists.yoctoproject.org>;
 Mon, 03 May 2021 09:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.19] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id BC91C200005;
	Mon,  3 May 2021 16:52:51 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: Fix a few incorrect option specifications.
To: Drew Moseley <drew.moseley@gmail.com>, docs@lists.yoctoproject.org
References: <20210430190432.100307-1-drew@moseleynet.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <0036f27a-1de9-50fa-4b54-dd382699a326@bootlin.com>
Date: Mon, 3 May 2021 18:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430190432.100307-1-drew@moseleynet.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Drew,

Good catch. Thanks for the patch!

On 4/30/21 9:04 PM, Drew Moseley wrote:
> From: Drew Moseley <drew@moseleynet.net>
>
> Signed-off-by: Drew Moseley <drew@moseleynet.net>
> ---
>  documentation/ref-manual/migration-2.2.rst | 2 +-
>  documentation/sdk-manual/extensible.rst    | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
> index a9d3cde7b7..a60ce8d52b 100644
> --- a/documentation/ref-manual/migration-2.2.rst
> +++ b/documentation/ref-manual/migration-2.2.rst
> @@ -422,7 +422,7 @@ The following miscellaneous changes have occurred:
>     :term:`SRCREV` by default when fetching from a Git
>     repository. You can override this in either case to use
>     ``${``\ :term:`AUTOREV`\ ``}`` instead by using the
> -   ``-a`` or ``DASHDASHautorev`` command-line option
> +   ``-a`` or ``--autorev`` command-line option
>  
>  -  ``distcc``: GTK+ UI is now disabled by default.
>  
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
> index 04bafaed9e..81727e6f28 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -953,7 +953,7 @@ following methods when you run ``devtool add``:
>     Specifying the name like this produces a recipe that only builds for
>     the build host.
>  
> --  Specify the "DASHDASHalso-native" option with the ``devtool add``
> +-  Specify the "--also-native" option with the ``devtool add``
>     command. Specifying this option creates a recipe file that still
>     builds for the target but also creates a variant with a "-native"
>     suffix that builds for the build host.
> @@ -964,7 +964,7 @@ following methods when you run ``devtool add``:
>     that builds code for the target, you can typically accomplish this by
>     building the native and target parts separately rather than within
>     the same compilation process. Realize though that with the
> -   "DASHDASHalso-native" option, you can add the tool using just one
> +   "--also-native" option, you can add the tool using just one
>     recipe file.
>  
>  Adding Node.js Modules
> @@ -1100,7 +1100,7 @@ arguments listed in the previous paragraph. The command determines the
>  exact options being passed, and shows them to you along with any custom
>  arguments specified through ``EXTRA_OECONF`` or
>  ``PACKAGECONFIG_CONFARGS``. If applicable, the command also shows you
> -the output of the configure script's "DASHDASHhelp" option as a
> +the output of the configure script's "--help" option as a
>  reference.
>  
>  Sharing Files Between Recipes

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into the "master-next" branch of "yocto-docs".

Thanks again!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

