Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.5106.1630578413439592294
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Sep 2021 03:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 19A4360003;
	Thu,  2 Sep 2021 10:26:44 +0000 (UTC)
Subject: Re: [docs] [PATCH] dev-manual: small number of minor aesthetic tweaks
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <3d5c2274-c862-de20-34ca-198d33559d2@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9848329a-c482-3048-459f-6002b8cfb5e6@bootlin.com>
Date: Thu, 2 Sep 2021 12:26:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3d5c2274-c862-de20-34ca-198d33559d2@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 9/1/21 12:12 PM, Robert P. J. Day wrote:
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 4a5011ea7..ff5305dcb 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
...
>
>        A common practice is to use a different Build Directory for
> -      different targets. For example, ``~/build/x86`` for a ``qemux86``
> -      target, and ``~/build/arm`` for a ``qemuarm`` target.
> +      different targets; for example, ``~/build/x86`` for a ``qemux86``
> +      target, and ``~/build/arm`` for a ``qemuarm`` target. In any
> +      event, it's typically cleaner to locate the build directory
> +      somewhere outside of your source directory


I agree with this advise. Indeed, that's always better to have a clean
source tree. This reminds me that we probably should update the Quick
Build guide
(https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html), to add
the build directory to the command line sourcing "oe-init-build-env".

I was having the build directory in my sources too. The habits that you
get from the first time you run Bitbake in years are quite sticky :)

Cheers,

Michael.

>
>  3. *Make Sure Your* ``local.conf`` *File is Correct*: Ensure the
>     ``conf/local.conf`` configuration file, which is found in the Build
> @@ -3599,7 +3601,7 @@ The following figure and list overviews the build process:
>     The target is the name of the recipe you want to build. Common
>     targets are the images in ``meta/recipes-core/images``,
>     ``meta/recipes-sato/images``, and so forth all found in the
> -   :term:`Source Directory`. Or, the target
> +   :term:`Source Directory`. Alternatively, the target
>     can be the name of a recipe for a specific piece of software such as
>     BusyBox. For more details about the images the OpenEmbedded build
>     system supports, see the
> @@ -3810,7 +3812,7 @@ Follow these steps to create an initramfs image:
>
>     .. note::
>
> -      It is recommended that you do bundle the initramfs image with the
> +      It is recommended that you bundle the initramfs image with the
>        kernel image to avoid circular dependencies between the kernel
>        recipe and the initramfs recipe should the initramfs image include
>        kernel modules.
> @@ -4430,7 +4432,7 @@ directory:
>           SRCREV = "${AUTOREV}"
>
>        When a recipe sets :term:`SRCREV` to
> -      ``${AUTOREV}``, the build system accesses the network in an
> +      ``${``\ :term:`AUTOREV`\ ``}``, the build system accesses the network in an
>        attempt to determine the latest version of software from the SCM.
>        Typically, recipes that use :term:`AUTOREV` are custom or modified
>        recipes. Recipes that reside in public repositories usually do not
> @@ -7571,7 +7573,7 @@ Selecting a Device Manager
>  The Yocto Project provides multiple ways to manage the device manager
>  (``/dev``):
>
> --  Persistent and Pre-Populated\ ``/dev``: For this case, the ``/dev``
> +-  Persistent and Pre-Populated ``/dev``: For this case, the ``/dev``
>     directory is persistent and the required device nodes are created
>     during the build.
>
> @@ -7581,7 +7583,7 @@ The Yocto Project provides multiple ways to manage the device manager
>     configuration of device nodes is done in user space by a device
>     manager like ``udev`` or ``busybox-mdev``.
>
> -Using Persistent and Pre-Populated\ ``/dev``
> +Using Persistent and Pre-Populated ``/dev``
>  --------------------------------------------
>
>  To use the static method for device population, you need to set the
>
>
> 
>
-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

