Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web09.10026.1618388766291760293
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4FKwXr2Wlcz5tlD;
	Wed, 14 Apr 2021 10:26:04 +0200 (CEST)
Date: Wed, 14 Apr 2021 10:26:03 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 12/13] ref-manual: add migration section for 3.3 release
Message-ID: <20210414082603.gmkxjpyxwnhwzzor@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <d8b43077bf92ad403028cbf37b61c4a6349f9370.1618358456.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <d8b43077bf92ad403028cbf37b61c4a6349f9370.1618358456.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Tue, Apr 13, 2021 at 05:19:53PM -0700, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/migration-3.3.rst | 144 +++++++++++++++++++++++++++++
>  documentation/ref-manual/migration.rst     |   1 +
>  2 files changed, 145 insertions(+)
>  create mode 100644 documentation/ref-manual/migration-3.3.rst
> 
> diff --git a/documentation/ref-manual/migration-3.3.rst b/documentation/ref-manual/migration-3.3.rst
> new file mode 100644
> index 0000000..8dfbe7f
> --- /dev/null
> +++ b/documentation/ref-manual/migration-3.3.rst
> @@ -0,0 +1,144 @@
> +Moving to the Yocto Project 3.3 Release
> +=======================================
> +
> +This section provides migration information for moving to the Yocto
> +Project 3.3 Release from the prior release.
> +
> +
> +.. _migration-3.3-minimum-system-requirements:
> +
> +Minimum system requirements
> +---------------------------
> +
> +You will now need at least Python 3.6 installed on your build host. Most recent
> +distributions provide this, but should you be building on a distribution that
> +does not have it, you can use the ``buildtools-tarball`` (easily installable
> +using ``scripts/install-buildtools``) - see
> +:ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`
> +for details.
> +
> +
> +.. _migration-3.3-removed-recipes:
> +
> +Removed recipes
> +---------------
> +
> +The following recipes have been removed:
> +
> +- ``go-dep``: obsolete with the advent of go modules
> +- ``gst-validate``: replaced by ``gst-devtools``
> +- ``linux-yocto``: removed 5.8 version recipes (5.4 / 5.10 still provided)
> +- ``vulkan-demos``: replaced by ``vulkan-samples``
> +
> +
> +.. _migration-3.3-common-license-only-versions:
> +
> +Single version common license file naming
> +-----------------------------------------
> +
> +Some license files in ``meta/files/common-licenses`` have been renamed to match
> +current SPDX naming conventions:
> +
> +- AGPL-3.0 -> AGPL-3.0-only
> +- GPL-1.0 -> GPL-1.0-only
> +- GPL-2.0 -> GPL-2.0-only
> +- GPL-3.0 -> GPL-3.0-only
> +- LGPL-2.0 -> LGPL-2.0-only
> +- LGPL-2.1 -> LGPL-2.1-only
> +- LGPL-3.0 -> LGPL-3.0-only
> +
> +Additionally, corresponding "-or-later" suffixed files have been added e.g.
> +``GPL-2.0-or-later``.
> +
> +It is not required that you change :term:`LICENSE` values as there are mappings
> +from the original names in place; however, in rare cases where you have a recipe
> +which sets :term:`LIC_FILES_CHKSUM` to point to file(s) in
> +``meta/files/common-licenses`` (which in any case is not recommended) you will
> +need to update those.
> +
> +
> +.. _migration-3.3-python3targetconfig:
> +
> +New ``python3targetconfig`` class
> +---------------------------------
> +
> +A new :ref:`python3targetconfig <ref-classes-python3targetconfig>` class has been
> +created for situations where you would previously have inherited the
> +``python3native`` class but need access to target configuration data (such as
> +correct installation directories). Recipes where this situation applies should
> +be changed to inherit ``python3targetconfig`` instead of ``python3native``. This
> +also adds a dependency on target ``python3``, so it should only be used where
> +appropriate in order to avoid unnecessarily lengthening builds.
> +
> +Some example recipes where this change has been made: ``gpgme``, ``libcap-ng``,
> +``python3-pycairo``.
> +
> +
> +.. _migration-3.3-bitbake:
> +
> +BitBake changes
> +---------------
> +
> +- BitBake is now configured to use a default ``umask`` of ``022`` for all tasks
> +  (specified via a new ``BB_DEFAULT_UMASK`` variable). If needed, ``umask`` can

s/``BB_DEFAULT_UMASK``/:term:`BB_DEFAULT_UMASK`/

IIRC, this works fine even for bitbake terms (might need some tweaking
if it does not work but I know we use :term: for some bitbake variables
from bitbake's docs).

Cheers,
Quentin

> +  still be set on a per-task basis via the ``umask`` varflag on the task
> +  function, but that is unlikely to be necessary in most cases.
> +
> +- If a version specified in :term:`PREFERRED_VERSION` is not available this
> +  will now trigger a warning instead of just a note, making such issues more
> +  visible.
> +
> +
> +.. _migration-3.3-packaging:
> +
> +Packaging changes
> +-----------------
> +
> +The following packaging changes have been made; in all cases the main package
> +still depends upon the split out packages so you should not need to do anything
> +unless you want to take advantage of the improved granularity:
> +
> +- ``dbus``: ``-common`` and ``-tools`` split out
> +- ``iproute2``: split ip binary to its own package

s/ip/``ip``/

> +- ``net-tools``: split ``mii-tool`` into its own package
> +- ``procps``: split ``ps`` and ``sysctl`` into their own packages
> +- ``rpm``: split build and extra functionality into separate packages
> +- ``sudo``: split ``sudo`` binary into ``sudo-sudo`` and libs into ``sudo-lib``
> +- ``systemtap``: examples, python scripts and runtime material split out
> +- ``util-linux``: ``libuuid`` has been split out to its own
> +  ``util-linux-libuuid`` recipe (and corresponding packages) to avoid circular
> +  dependencies if ``libgcrypt`` support is enabled in ``util-linux``.
> +  (``util-linux`` depends upon ``util-linux-libuuid``.)
> +
> +
> +.. _migration-3.3-misc:
> +
> +Miscellaneous changes
> +---------------------
> +
> +- The default poky :term:`DISTRO_VERSION` value now uses the core metadata's
> +  git hash (i.e. :term:`METADATA_REVISION`) rather than the date (i.e.
> +  :term:`DATE`) to reduce one small source of non-reproducibility. You can
> +  of course specify your own ``DISTRO_VERSION`` value as desired

s/``DISTRO_VERSION``/:term:`DISTRO_VERSION`/

> +  (particularly if you create your own custom distro configuration).
> +- The :ref:`ccache <ref-classes-ccache>` class now uses ``ccache`` from the
> +  build host rather than building ``ccache-native`` (due to circular
> +  dependencies in ccache 4.0 that are impractical to resolve otherwise), so
> +  if you enable it you will now need to have ``ccache`` installed on your
> +  host system.

Will a warning be shown if ccache is not installed on the host or does
it silently fail to use ccache?

Would be nice to mention if there's a warning/error message being shown
so that at least the user knows if they should take extra care to verify
it is installed (and used).

Cheers,
Quentin
