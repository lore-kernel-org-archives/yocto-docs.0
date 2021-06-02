Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.211.1622650809452002918
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 09:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6CAAC240002;
	Wed,  2 Jun 2021 16:20:06 +0000 (UTC)
Subject: Re: [docs] [PATCH] Remove Clutter references
To: Ross Burton <ross@burtonini.com>, docs@lists.yoctoproject.org
References: <20210601162302.2379983-1-ross.burton@arm.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3deed3bc-bd76-88eb-25b3-867af5e40678@bootlin.com>
Date: Wed, 2 Jun 2021 18:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601162302.2379983-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Ross,

On 6/1/21 6:23 PM, Ross Burton wrote:
> The clutter class and image have been moved to meta-gnome before it
> is finally obsoleted for good, so remove mentions from the documentation.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  documentation/ref-manual/classes.rst | 15 ---------------
>  documentation/ref-manual/images.rst  |  4 ----
>  2 files changed, 19 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 6dd0cbbd41..2314added7 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -289,21 +289,6 @@ is used during the build process for ``nativesdk``, ``cross``, and
>  ``cross-canadian`` recipes to change ``RPATH`` records within binaries
>  in order to make them relocatable.
>  
> -.. _ref-classes-clutter:
> -
> -``clutter.bbclass``
> -===================
> -
> -The ``clutter`` class consolidates the major and minor version naming
> -and other common items used by Clutter and related recipes.
> -
> -.. note::
> -
> -   Unlike some other classes related to specific libraries, recipes
> -   building other software that uses Clutter do not need to inherit this
> -   class unless they use the same recipe versioning scheme that the
> -   Clutter and related recipes do.
> -
>  .. _ref-classes-cmake:
>  
>  ``cmake.bbclass``
> diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
> index b2db1a7734..c6a7239c7e 100644
> --- a/documentation/ref-manual/images.rst
> +++ b/documentation/ref-manual/images.rst
> @@ -46,10 +46,6 @@ Following is a list of supported recipes:
>  -  ``core-image-base``: A console-only image that fully supports the
>     target device hardware.
>  
> --  ``core-image-clutter``: An image with support for the Open GL-based
> -   toolkit Clutter, which enables development of rich and animated
> -   graphical user interfaces.
> -
>  -  ``core-image-full-cmdline``: A console-only image with more
>     full-featured Linux system functionality installed.
>  

Thank you for the patch!

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

I merged it into "master-next" in "yocto-docs".

However, there are still a few references left to Clutter:

$ git grep -i clutter
dev-manual/common-tasks.rst:single recipe that loads one version of a
library (e.g. ``clutter``),
dev-manual/common-tasks.rst:the two separate versions of the ``clutter``
library to co-exist on the
dev-manual/common-tasks.rst:   clutter-1.6_1.6.20.bb
dev-manual/common-tasks.rst:   clutter-1.8_1.8.4.bb
dev-manual/common-tasks.rst:have a recipe depend on the 1.8 version of
the ``clutter`` library, use
dev-manual/common-tasks.rst:   DEPENDS = "clutter-1.8"
overview-manual/yp-intro.rst:   as X11, Wayland, GTK+, Qt, Clutter, and
SDL (among others) to create

I'll take care of them, using a different example, that's something I
should be able to do.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

