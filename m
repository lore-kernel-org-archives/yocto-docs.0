Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web09.7061.1618828438766837351
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 03:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4FP3835Jp2z5tlL;
	Mon, 19 Apr 2021 12:33:55 +0200 (CEST)
Date: Mon, 19 Apr 2021 12:33:54 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs <docs@lists.yoctoproject.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [docs] [OE-core] [PATCH 4/4] dev-manual/common-tasks.rst: correct the documentation for debuginfod
Message-ID: <20210419103354.3gq6dn2c2tw7f3k2@qschulz>
References: <20210419090044.582453-4-alex.kanavin@gmail.com>
 <8b2212544d8f565c7343a88d837c8c6f390e82e8.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <8b2212544d8f565c7343a88d837c8c6f390e82e8.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Mon, Apr 19, 2021 at 11:11:21AM +0100, Richard Purdie wrote:
> Forwarded from OE-Core to ensure docs people see it.
> 
> Cheers,
> 
> Richard

> Date: Mon, 19 Apr 2021 11:00:44 +0200
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> Subject: [OE-core] [PATCH 4/4] dev-manual/common-tasks.rst: correct the
>  documentation for debuginfod
> 
> Particularly,
> - correctly describe the use of DEBUGINFOD_URLS; drop it from bitbake variables
> - all necessary component tweaks are enabled by default via DISTRO_FEATURES
> - provide on-target examples of what to look for when things work properly
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 34 +++++++++++++++--------
>  documentation/ref-manual/variables.rst    |  6 ----
>  2 files changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 176025f9e8..9f33b6b2c8 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10005,34 +10005,44 @@ debug symbols from the server.
>  
>  To run a debuginfod server, you need to do the following:
>  
> --  Ensure that this variable is set in your ``local.conf`` file:
> +-  Ensure that "debuginfod" is present in :term:`DISTRO_FEATURES

Missing trailing `.

> +   (it already is in oe-core defaults and poky reference distribution).

s/oe-core/``OpenEmbedded-core/ ?
s/poky/``poky``/ ?

> +   If not, set:
>     ::
>  
> -      PACKAGECONFIG_pn-elfutils-native = "debuginfod libdebuginfod"
> +      DISTRO_FEATURES_append = " debuginfod"
>  
> -   This :term:`PACKAGECONFIG` option enables debuginfod and libdebuginfod for
> -   "elfutils-native".
> +   This distro feature enables the server and client library in elfutils,

s/elfutils/``elfutils``/ ?

> +   and enables debuginfod support in clients (at the moment, gdb and binutils).
>  

s/debuginfod/``debuginfod``/ ?
s/gdb/``gdb``/ ?
s/binutils/``binutils``/ ?

> --  Run the following commands to set up the "debuginfod" server:
> +-  Run the following commands to launch the "debuginfod" server on the host:

s/"debuginfod"/``debuginfod``/ ?

>     ::
>  
>        $ oe-debuginfod
>  
> +-  To use debuginfod on the target, you need to know the ip:port where
> +   debuginfod is listening on the host (port defaults to 8002), and export

s/debuginfod/``debuginfod``/ for both debuginfod?

> +   that into the shell environment, for example in qemu:

s/qemu/``qemu``/ ?

> +   ::
>  

It should be:

that into the shell environment, for example in qemu::

instead.

> -To use debuginfod on the target, you need the following:
> +      root@qemux86-64:~# export DEBUGINFOD_URLS="http://192.168.7.1:8002/"
>  
> --  Ensure that this variable is set in your ``local.conf`` file:
> +-  Then debug info fetching should simply work when running the target gdb,

s/gdb/``gdb``/ ?

> +   readelf or objdump, for example:

s/readelf/``readelf``/ ?
s/objdump/``objdump``/ ?

>     ::
>  

It should be:

readelf or objdump, for example::

instead.

> -      DEBUGINFOD_URLS = "http://localhost:8002/"
> -
> -   This :term:`DEBUGINFOD_URLS` option does the client configuration.
> +      root@qemux86-64:~# gdb /bin/cat
> +      ...
> +      Reading symbols from /bin/cat...
> +      Downloading separate debug info for /bin/cat...
> +      Reading symbols from /home/root/.cache/debuginfod_client/923dc4780cfbc545850c616bffa884b6b5eaf322/debuginfo...
>  
> +-  It's also possible to use "debuginfod-find" to just query the server:

s/"debuginfod-find"/``debuginfod-find``/ ?

>     ::
>  

It should be:

It's also possible to use "debuginfod-find" to just query the server::

instead.

Cheers,
Quentin
