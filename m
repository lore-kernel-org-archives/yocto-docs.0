Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web11.29309.1620639182021269655
 for <docs@lists.yoctoproject.org>;
 Mon, 10 May 2021 02:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4Fdwp31llGz5tlC;
	Mon, 10 May 2021 11:32:58 +0200 (CEST)
Date: Mon, 10 May 2021 11:32:57 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: improve SSTATE_MIRRORS documentation
Message-ID: <20210510093257.ovej5z4h7pcxn74u@qschulz>
References: <20210507155209.147892-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20210507155209.147892-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Fri, May 07, 2021 at 05:52:09PM +0200, Michael Opdenacker wrote:
> Mention the Yocto Project mirrors
> Use a more sensible order for such mirrors (dev, latest, latest - 1)
> Assign the variable through "?=" (for consistency)
> 

A list in commit log usually means separate commits should be made.

> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/brief-yoctoprojectqs/index.rst      |  7 +++----
>  documentation/overview-manual/concepts.rst        |  5 +++++
>  documentation/ref-manual/variables.rst            | 10 ++++++++++
>  documentation/sdk-manual/appendix-customizing.rst |  7 ++++++-
>  4 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 6a12b19ca0..ad26ad05ea 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -240,14 +240,13 @@ an entire Linux distribution, including the toolchain, from source.
>        failures by using mirrors. To use mirrors, add these lines to your
>        local.conf file in the Build directory::
>  
> -         SSTATE_MIRRORS = "\
> +         SSTATE_MIRRORS ?= "\
>           file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH \n \
> -         file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION_MINUS_ONE;/PATH;downloadfilename=PATH \n \
>           file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH \n \
> +         file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION_MINUS_ONE;/PATH;downloadfilename=PATH \n \
>           "
>  
> -
> -      The previous examples showed how to add sstate paths for Yocto Project
> +      The previous examples showed how to add sstate mirrors for Yocto Project
>        &YOCTO_DOC_VERSION_MINUS_ONE;, &YOCTO_DOC_VERSION;, and a development
>        area. For a complete index of sstate locations, see http://sstate.yoctoproject.org/.
>  
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 2e3f1af442..00aa502855 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1924,6 +1924,11 @@ shared state files. Here is an example::
>         file://.\* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
>         file://.\* file:///some/local/dir/sstate/PATH"
>  
> +It's also possible to directly take advantage of Yocto Project's own mirrors,
> +for example, for the latest release::
> +
> +   SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
> +

This is actually not really working right now, only 55% of the
sstate-cache is matched because since dunfell (I think?) hashserv is
enabled by default and the hashserv data is not shared yet.

Richard would probably be able to help more with this but here's the
quick IRC log from a month ago of our discussion:
https://www.yoctoproject.org/irc/%23yocto.2021-04-06.log.html#t2021-04-06T13:56:41

I'd be against suggesting it until we figure it out, it'll bring more
questions than help IMO.

>  .. note::
>  
>     The shared state directory (``SSTATE_DIR``) is organized into two-character
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 957362bb6d..0a8ccdca3c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7117,6 +7117,16 @@ system and gives an overview of their function and contents.
>        cache (sstate-cache) results from previous builds. The sstate-cache
>        you point to can also be from builds on other machines.
>  
> +      The simplest configuration is to directly take advantage of Yocto
> +      Project's own mirrors, for example, for the development, latest and
> +      previous releases::
> +
> +         SSTATE_MIRRORS ?= "\
> +            file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH \n \
> +            file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH \n \
> +            file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION_MINUS_ONE;/PATH;downloadfilename=PATH \n \
> +         "
> +

Ditto.

>        When pointing to sstate build artifacts on another machine that uses
>        a different GCC version for native builds, you must configure
>        ``SSTATE_MIRRORS`` with a regular expression that maps local search
> diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
> index fb2d78452b..ddc8850dbf 100644
> --- a/documentation/sdk-manual/appendix-customizing.rst
> +++ b/documentation/sdk-manual/appendix-customizing.rst
> @@ -269,7 +269,12 @@ source, you need to do a number of things:
>     to find the configuration. The variable you need to set is
>     :term:`SSTATE_MIRRORS`::
>  
> -      SSTATE_MIRRORS = "file://.* http://example.com/some_path/sstate-cache/PATH"
> +      SSTATE_MIRRORS ?= "file://.* http://example.com/some_path/sstate-cache/PATH"
> +

Wondering if this shouldn't rather be:
SSTATE_MIRRORS ?= "file://.* http://example.com/some_path/sstate-cache/PATH;downloadfilename=PATH"
like we have in other places in the docs?

It seems "PATH;downloadfilename=PATH" might not be even needed at all
since we set up a sstate mirror and forgot to append this and it seemed
to work ok (we added it during review anyway, just to match documentation).

> +   It's even possible to directly take advantage of Yocto Project's own mirrors,
> +   for example for the current release::
> +
> +      SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
>  

Not fully working yet. I'd remove it. See comments above.

Cheers,
Quentin
