Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.1498.1614622695383989726
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Mar 2021 10:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4Dq7mB1Wxvz5tl9;
	Mon,  1 Mar 2021 19:18:02 +0100 (CET)
Date: Mon, 1 Mar 2021 19:18:01 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Dorinda <dorindabassey@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual/common-task.rst: Added documentation for debuginfod support
Message-ID: <20210301181801.if2p5jftdyrjz6cs@qschulz>
References: <20210301154952.29473-1-dorindabassey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210301154952.29473-1-dorindabassey@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dorinda,

Mainly nitpicks.

On Mon, Mar 01, 2021 at 04:49:52PM +0100, Dorinda wrote:
> Added documentation on running debuginfod server and using it on the target.
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 46 ++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 65db4aed33..d4a2b2f28d 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10023,7 +10023,51 @@ before starting the debugging process. These extra computations place
>  more load on the target system and can alter the characteristics of the
>  program being debugged.
>  
> -To help get past the previously mentioned constraints, you can use
> +To help get past the previously mentioned constraints, they're two

s/they're/there are/

> +methods you can use: running a debuginfod server and using gdbserver.
> +
> +Using the debuginfod server Method
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +

s/Method/method/

> +debuginfod from elfutils is a way to distribute debuginfo files.

I'd probably double tick quote debuginfod, debuginfo and elfutils.

> +running a debuginfod server makes debug symbols readily available,

s/running/Running/

Quoting debuginfod.

> +which means you don't need to download debugging information
> +and the binaries of the process being debugged. you can just fetch

s/you/You/

> +debug symbols from the server.
> +
> +1. To run a debuginfod server, you need to do the following:
> +
> +-  Ensure that this variable is set in your ``local.conf`` file:

Not sure a numbered item list followed by a "simple" list works fine, have
you compiled the docs with your patch? Does it render weird?

Thinking about it, you might be missing a three space indentation on the
"simple" list?

Just throwing out my lack of knowledge in the conversation right now :D

> +   ::
> +
> +      PACKAGECONFIG_pn-elfutils-native = "debuginfod libdebuginfod"
> +
> +    This PACKAGECONFIG option enables debuginfod and libdebuginfod for

s/PACKAGECONFIG/:term:`PACKAGECONFIG`/

Quoting debuginfod and libdebuginfod.

I've missed most of the discussion around debuginfo feature/support so
forgive me if it's complete non-sense, but... do we really want to tell
people to put PACKAGECONFIG_pn-elfutils-native in their local.conf
instead of creating a bbappend for elfutils in their own layer? Or add
that line to their distro conf file and not local.conf?

For me, local.conf is for temporary use but it might make sense for some
people/company to always have debuginfo enabled in their builds?

Just asking, being curious right now :)

> +    elfutils-native.
> +
> +-  Run the following commands to set up the debuginfod server:

Quoting debuginfod and elfutils-native.

> +   ::
> +
> +      $ oe-debuginfod

Probably missing at least a newline if not two to end the code blocks
IIRC from my experience.

> +2. To use debuginfod on the target, you need the following:
> +
> +-  Ensure that these variable is set in your ``local.conf`` file:

s/these/this/

> +   ::
> +
> +      DEBUGINFOD_URLS = "http://localhost:port"
> +
> +   This option does the client configuration by setting DEBUGINFOD_URLS 

I'd add an entry in the variable glossary for DEBUGINFOD_URLS and then:
s/DEBUGINFOD_URLS/:term:`DEBUGINFOD_URLS`/

> +   to point at the server running debuginfod. Such that for every lookup, 
> +   the debuginfod client will query the server and return the requested information.
> +   ::
> +
> +        PACKAGECONFIG_pn-gdb = "debuginfod"
> +
> +   This PACKAGECONFIG option enables debuginfod for gdb.

s/PACKAGECONFIG/:term:`PACKAGECONFIG`/

Quoting debuginfod and gdb the few instances above.

> +
> +Using the gdbserver Method
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +

s/Method/method/

Thanks,
Quentin
