Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web08.9180.1605112125496877330
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 08:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4CWVXn1SPsz5tlB;
	Wed, 11 Nov 2020 17:28:41 +0100 (CET)
Date: Wed, 11 Nov 2020 17:28:39 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/8] dev-manual-common-tasks: Fix refs to testing branches
Message-ID: <20201111162839.yzc7danu6yr4x3sb@qschulz>
References: <20201111160800.5669-1-pbarker@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20201111160800.5669-1-pbarker@konsulko.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Wed, Nov 11, 2020 at 04:07:53PM +0000, Paul Barker wrote:
> After discussions on IRC with Ross we concluded that the `ross/mut`
> branch shouldn't really be listed in the docs as it's more of a personal
> test branch. Instead we should list the -next branches for
> openembedded-core and poky.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  .../dev-manual/dev-manual-common-tasks.rst    | 35 ++++++++++++-------
>  1 file changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> index 27aacde60..698b27377 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -10665,18 +10665,29 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
>  section in the Yocto Project Overview and Concepts Manual for additional
>  concepts on working in the Yocto Project development environment.
>  
> -Two commonly used testing repositories exist for OpenEmbedded-Core:
> -
> --  *"ross/mut" branch:* The "mut" (master-under-test) tree exists in the
> -   ``poky-contrib`` repository in the
> -   :yocto_git:`Yocto Project source repositories <>`.
> -
> --  *"master-next" branch:* This branch is part of the main "poky"
> -   repository in the Yocto Project source repositories.
> -
> -Maintainers use these branches to test submissions prior to merging
> -patches. Thus, you can get an idea of the status of a patch based on
> -whether the patch has been merged into one of these branches.
> +Maintainers commonly use ``-next`` branches to test submissions prior to
> +merging patches. Thus, you can get an idea of the status of a patch based on
> +whether the patch has been merged into one of these branches. The commonly
> +used testing branches for OpenEmbedded-Core are as follows:
> +
> +-  *openembedded-core "master-next" branch:* This branch is part of the
> +   `openembedded-core <https://git.openembedded.org/openembedded-core/>`__

Side note: should we add a :oe_git: directive as we already have :yocto_git:?

> +   repository on git.openembedded.org and contains proposed changes to the
> +   core metadata.
> +
> +-  *poky "master-next" branch:* This branch is part of the
> +   `poky <https://git.yoctoproject.org/cgit/cgit.cgi/poky/>`__

:yocto_git:`poky </cgit/cgit.cgi/poky/>`

> +   repository on git.yoctoproject.org and combines proposed changes to

Maybe s/git.yoctoproject.org/&YOCTO_GIT_URL;/ ? Not convinced though, no
hard feeling if this is not taken into account.

Thanks,
Quentin
