Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.9843.1618387192914447798
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 00:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4FKvyY1DsBz5tlJ;
	Wed, 14 Apr 2021 09:59:48 +0200 (CEST)
Date: Wed, 14 Apr 2021 09:59:47 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 01/13] ref-manual: add METADATA_REVISION and METADATA_BRANCH
Message-ID: <20210414075947.c4eidvjkqhub76ss@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <f6857b2b650e83625318860576f489734d99d4c8.1618358456.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <f6857b2b650e83625318860576f489734d99d4c8.1618358456.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Tue, Apr 13, 2021 at 05:19:42PM -0700, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> These are not new variables, but we are using METADATA_REVISION in a new
> place and thus need to refer to it.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/variables.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 19f5e34..de63046 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4659,6 +4659,14 @@ system and gives an overview of their function and contents.
>     :term:`MAINTAINER`
>        The email address of the distribution maintainer.
>  
> +   :term:`METADATA_BRANCH`
> +      The branch currently checked out for the core layer (path determined by
> +      :term:`COREBASE`).
> +
> +   :term:`METADATA_REVISION`
> +      The revision currently checked out for the core layer (path determined by
> +      :term:`COREBASE`).
> +

Would it make sense to explicit which is the core layer? I assume it is
openembedded-core layer which is poky/meta too. Just to explicit a bit
more.

Also, if they really aren't new variables, could you please send
backport patches to the appropriate branches once it's merged in master?

Thanks!

Cheers,
Quentin
