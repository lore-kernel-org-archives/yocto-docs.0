Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.10042.1618388903177702078
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4FKwbS4LPPz5tlF;
	Wed, 14 Apr 2021 10:28:20 +0200 (CEST)
Date: Wed, 14 Apr 2021 10:28:19 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 13/13] ref-manual: migration guide: add release codenames
Message-ID: <20210414082819.ec4bzs4xxbrxjqkm@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <d0f24cbe8ecb69cc048821d13eca82ad49fe6dc3.1618358456.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <d0f24cbe8ecb69cc048821d13eca82ad49fe6dc3.1618358456.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

Very nice addition. We need to do the same in the dropdown menu for doc
release selection (it's already been discussed, just need someone to
start working on it :) ).

Once merged, could you please send backport patch to dunfell and
gatesgarth :) ?

Thanks!
Quentin

On Tue, Apr 13, 2021 at 05:19:54PM -0700, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> People will see release codenames in other contexts, and thus it is
> useful to mention them explicitly here rather than having to go to the
> Releases wiki page to map version number to release codename.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/migration-1.3.rst | 6 +++---
>  documentation/ref-manual/migration-1.4.rst | 6 +++---
>  documentation/ref-manual/migration-1.5.rst | 6 +++---
>  documentation/ref-manual/migration-1.6.rst | 6 +++---
>  documentation/ref-manual/migration-1.7.rst | 6 +++---
>  documentation/ref-manual/migration-1.8.rst | 6 +++---
>  documentation/ref-manual/migration-2.0.rst | 6 +++---
>  documentation/ref-manual/migration-2.1.rst | 6 +++---
>  documentation/ref-manual/migration-2.2.rst | 6 +++---
>  documentation/ref-manual/migration-2.3.rst | 6 +++---
>  documentation/ref-manual/migration-2.4.rst | 6 +++---
>  documentation/ref-manual/migration-2.5.rst | 6 +++---
>  documentation/ref-manual/migration-2.6.rst | 6 +++---
>  documentation/ref-manual/migration-2.7.rst | 6 +++---
>  documentation/ref-manual/migration-3.0.rst | 6 +++---
>  documentation/ref-manual/migration-3.1.rst | 6 +++---
>  documentation/ref-manual/migration-3.2.rst | 6 +++---
>  documentation/ref-manual/migration-3.3.rst | 6 +++---
>  18 files changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/documentation/ref-manual/migration-1.3.rst b/documentation/ref-manual/migration-1.3.rst
> index 12e225b..0929f49 100644
> --- a/documentation/ref-manual/migration-1.3.rst
> +++ b/documentation/ref-manual/migration-1.3.rst
> @@ -1,10 +1,10 @@
>  .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>  
> -Moving to the Yocto Project 1.3 Release
> -=======================================
> +Moving to the Yocto Project 1.3 Release (danny)
> +===============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 1.3 Release from the prior release.
> +Project 1.3 Release (codename "danny") from the prior release.
>  
>  .. _1.3-local-configuration:
>  
> diff --git a/documentation/ref-manual/migration-1.4.rst b/documentation/ref-manual/migration-1.4.rst
> index 0b7e861..f5fac7a 100644
> --- a/documentation/ref-manual/migration-1.4.rst
> +++ b/documentation/ref-manual/migration-1.4.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 1.4 Release
> -=======================================
> +Moving to the Yocto Project 1.4 Release (dylan)
> +===============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 1.4 Release from the prior release.
> +Project 1.4 Release (codename "dylan") from the prior release.
>  
>  .. _migration-1.4-bitbake:
>  
> diff --git a/documentation/ref-manual/migration-1.5.rst b/documentation/ref-manual/migration-1.5.rst
> index 2d638f9..c772e51 100644
> --- a/documentation/ref-manual/migration-1.5.rst
> +++ b/documentation/ref-manual/migration-1.5.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 1.5 Release
> -=======================================
> +Moving to the Yocto Project 1.5 Release (dora)
> +==============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 1.5 Release from the prior release.
> +Project 1.5 Release (codename "dora") from the prior release.
>  
>  .. _migration-1.5-host-dependency-changes:
>  
> diff --git a/documentation/ref-manual/migration-1.6.rst b/documentation/ref-manual/migration-1.6.rst
> index ed155d0..4c6afab 100644
> --- a/documentation/ref-manual/migration-1.6.rst
> +++ b/documentation/ref-manual/migration-1.6.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 1.6 Release
> -=======================================
> +Moving to the Yocto Project 1.6 Release (daisy)
> +===============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 1.6 Release from the prior release.
> +Project 1.6 Release (codename "daisy") from the prior release.
>  
>  .. _migration-1.6-archiver-class:
>  
> diff --git a/documentation/ref-manual/migration-1.7.rst b/documentation/ref-manual/migration-1.7.rst
> index c00768c..9cf467f 100644
> --- a/documentation/ref-manual/migration-1.7.rst
> +++ b/documentation/ref-manual/migration-1.7.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 1.7 Release
> -=======================================
> +Moving to the Yocto Project 1.7 Release (dizzy)
> +===============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 1.7 Release from the prior release.
> +Project 1.7 Release (codename "dizzy") from the prior release.
>  
>  .. _migration-1.7-changes-to-setting-qemu-packageconfig-options:
>  
> diff --git a/documentation/ref-manual/migration-1.8.rst b/documentation/ref-manual/migration-1.8.rst
> index 73789bd..ec2b138 100644
> --- a/documentation/ref-manual/migration-1.8.rst
> +++ b/documentation/ref-manual/migration-1.8.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 1.8 Release
> -=======================================
> +Moving to the Yocto Project 1.8 Release (fido)
> +==============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 1.8 Release from the prior release.
> +Project 1.8 Release (codename "fido") from the prior release.
>  
>  .. _migration-1.8-removed-recipes:
>  
> diff --git a/documentation/ref-manual/migration-2.0.rst b/documentation/ref-manual/migration-2.0.rst
> index 4eea948..9da60df 100644
> --- a/documentation/ref-manual/migration-2.0.rst
> +++ b/documentation/ref-manual/migration-2.0.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 2.0 Release
> -=======================================
> +Moving to the Yocto Project 2.0 Release (jethro)
> +================================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 2.0 Release from the prior release.
> +Project 2.0 Release (codename "jethro") from the prior release.
>  
>  .. _migration-2.0-gcc-5:
>  
> diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
> index b7bac0c..1eb9ab5 100644
> --- a/documentation/ref-manual/migration-2.1.rst
> +++ b/documentation/ref-manual/migration-2.1.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 2.1 Release
> -=======================================
> +Moving to the Yocto Project 2.1 Release (krogoth)
> +=================================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 2.1 Release from the prior release.
> +Project 2.1 Release (codename "krogoth") from the prior release.
>  
>  .. _migration-2.1-variable-expansion-in-python-functions:
>  
> diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
> index 8b3c5d6..198181a 100644
> --- a/documentation/ref-manual/migration-2.2.rst
> +++ b/documentation/ref-manual/migration-2.2.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 2.2 Release
> -=======================================
> +Moving to the Yocto Project 2.2 Release (morty)
> +===============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 2.2 Release from the prior release.
> +Project 2.2 Release (codename "morty") from the prior release.
>  
>  .. _migration-2.2-minimum-kernel-version:
>  
> diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
> index 04b11da..0541eb3 100644
> --- a/documentation/ref-manual/migration-2.3.rst
> +++ b/documentation/ref-manual/migration-2.3.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 2.3 Release
> -=======================================
> +Moving to the Yocto Project 2.3 Release (pyro)
> +==============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 2.3 Release from the prior release.
> +Project 2.3 Release (codename "pyro") from the prior release.
>  
>  .. _migration-2.3-recipe-specific-sysroots:
>  
> diff --git a/documentation/ref-manual/migration-2.4.rst b/documentation/ref-manual/migration-2.4.rst
> index 260b320..2ba17e0 100644
> --- a/documentation/ref-manual/migration-2.4.rst
> +++ b/documentation/ref-manual/migration-2.4.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 2.4 Release
> -=======================================
> +Moving to the Yocto Project 2.4 Release (rocko)
> +===============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 2.4 Release from the prior release.
> +Project 2.4 Release (codename "rocko") from the prior release.
>  
>  .. _migration-2.4-memory-resident-mode:
>  
> diff --git a/documentation/ref-manual/migration-2.5.rst b/documentation/ref-manual/migration-2.5.rst
> index 9f45ffc..9ef4b55 100644
> --- a/documentation/ref-manual/migration-2.5.rst
> +++ b/documentation/ref-manual/migration-2.5.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 2.5 Release
> -=======================================
> +Moving to the Yocto Project 2.5 Release (sumo)
> +==============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 2.5 Release from the prior release.
> +Project 2.5 Release (codename "sumo") from the prior release.
>  
>  .. _migration-2.5-packaging-changes:
>  
> diff --git a/documentation/ref-manual/migration-2.6.rst b/documentation/ref-manual/migration-2.6.rst
> index 823d3cb..aeac509 100644
> --- a/documentation/ref-manual/migration-2.6.rst
> +++ b/documentation/ref-manual/migration-2.6.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 2.6 Release
> -=======================================
> +Moving to the Yocto Project 2.6 Release (thud)
> +==============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 2.6 Release from the prior release.
> +Project 2.6 Release (codename "thud") from the prior release.
>  
>  .. _migration-2.6-gcc-changes:
>  
> diff --git a/documentation/ref-manual/migration-2.7.rst b/documentation/ref-manual/migration-2.7.rst
> index 5af5947..1be4d5d 100644
> --- a/documentation/ref-manual/migration-2.7.rst
> +++ b/documentation/ref-manual/migration-2.7.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 2.7 Release
> -=======================================
> +Moving to the Yocto Project 2.7 Release (warrior)
> +=================================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 2.7 Release from the prior release.
> +Project 2.7 Release (codename "warrior") from the prior release.
>  
>  .. _migration-2.7-bitbake-changes:
>  
> diff --git a/documentation/ref-manual/migration-3.0.rst b/documentation/ref-manual/migration-3.0.rst
> index 7ef2742..f3d20e2 100644
> --- a/documentation/ref-manual/migration-3.0.rst
> +++ b/documentation/ref-manual/migration-3.0.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 3.0 Release
> -=======================================
> +Moving to the Yocto Project 3.0 Release (zeus)
> +==============================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 3.0 Release from the prior release.
> +Project 3.0 Release (codename "zeus") from the prior release.
>  
>  .. _migration-3.0-init-system-selection:
>  
> diff --git a/documentation/ref-manual/migration-3.1.rst b/documentation/ref-manual/migration-3.1.rst
> index 4fcd249..84d3250 100644
> --- a/documentation/ref-manual/migration-3.1.rst
> +++ b/documentation/ref-manual/migration-3.1.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 3.1 Release
> -=======================================
> +Moving to the Yocto Project 3.1 Release (dunfell)
> +=================================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 3.1 Release from the prior release.
> +Project 3.1 Release (codename "dunfell") from the prior release.
>  
>  .. _migration-3.1-minimum-system-requirements:
>  
> diff --git a/documentation/ref-manual/migration-3.2.rst b/documentation/ref-manual/migration-3.2.rst
> index cca8124..39743af 100644
> --- a/documentation/ref-manual/migration-3.2.rst
> +++ b/documentation/ref-manual/migration-3.2.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 3.2 Release
> -=======================================
> +Moving to the Yocto Project 3.2 Release (gatesgarth)
> +====================================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 3.2 Release from the prior release.
> +Project 3.2 Release (codename "gatesgarth") from the prior release.
>  
>  .. _migration-3.2-minimum-system-requirements:
>  
> diff --git a/documentation/ref-manual/migration-3.3.rst b/documentation/ref-manual/migration-3.3.rst
> index 8dfbe7f..ff010fd 100644
> --- a/documentation/ref-manual/migration-3.3.rst
> +++ b/documentation/ref-manual/migration-3.3.rst
> @@ -1,8 +1,8 @@
> -Moving to the Yocto Project 3.3 Release
> -=======================================
> +Moving to the Yocto Project 3.3 Release (hardknott)
> +===================================================
>  
>  This section provides migration information for moving to the Yocto
> -Project 3.3 Release from the prior release.
> +Project 3.3 Release (codename "hardknott") from the prior release.
>  
>  
>  .. _migration-3.3-minimum-system-requirements:
> -- 
> 1.8.3.1
> 

> 
> 
> 
