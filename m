Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web09.276.1616605748890055430
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 10:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4F5F822Srzz5tlH;
	Wed, 24 Mar 2021 18:09:05 +0100 (CET)
Date: Wed, 24 Mar 2021 18:09:04 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: extend/add HOSTTOOLS, HOSTTOOLS_DIR defns
Message-ID: <20210324170904.tmlw5by6w35t7byw@qschulz>
References: <1191825-a9e8-ea67-69e8-468edc9e6095@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <1191825-a9e8-ea67-69e8-468edc9e6095@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

Nitpicking, I'll leave the review of the essence of the patch to people
who know more about it.

On Wed, Mar 24, 2021 at 12:43:52PM -0400, Robert P. J. Day wrote:
> Tighten up the definition for HOSTTOOLS, and add an entry for
> HOSTTOOLS_DIR.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 0310429bd..80b73f70c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2793,16 +2793,22 @@ system and gives an overview of their function and contents.
>           Linux, the value might be "mipsel-linux".
> 
>     :term:`HOSTTOOLS`
> -      A space-separated list (filter) of tools on the build host that
> -      should be allowed to be called from within build tasks. Using this
> -      filter helps reduce the possibility of host contamination. If a tool
> -      specified in the value of ``HOSTTOOLS`` is not found on the build
> -      host, the OpenEmbedded build system produces an error and the build
> -      is not started.
> +      A space-separated list (filter) of tools that must exist on the
> +      build host and which will be called from within build tasks.
> +      If a tool specified in the value of ``HOSTTOOLS`` is not found
> +      on the build host, the OpenEmbedded build system produces an error
> +      and the build is not started.
> 
> -      For additional information, see
> +      For additional information, see the related
>        :term:`HOSTTOOLS_NONFATAL`.
> 
> +   :term:`HOSTTOOLS_DIR`
> +      The directory which contains symlinks to all of the host tools
> +      specified by ``HOSTTOOLS``, as well as any of the available

:term:`HOSTTOOLS`

> +      host tools specified by ``HOSTTOOLS_NONFATAL``.

:term:`HOSTTOOLS_NONFATAL`

> +      The default value for this directory is typically
> +      ``${TMPDIR}/hosttools``.

I don't remember if :term: can be surrounded in ``, but if it can :term:
would make sense too here (it probably can't but better know it for sure
:) )

Quentin
