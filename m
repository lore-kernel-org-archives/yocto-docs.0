Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web09.8111.1620221855943302498
 for <docs@lists.yoctoproject.org>;
 Wed, 05 May 2021 06:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FZySY6v8gz5tlC;
	Wed,  5 May 2021 15:37:33 +0200 (CEST)
Date: Wed, 5 May 2021 15:37:32 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: reduce verbosity with "worry about" expression
Message-ID: <20210505133732.6hcga4tmpy7u5pwk@qschulz>
References: <20210505133408.61293-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20210505133408.61293-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Wed, May 05, 2021 at 03:34:08PM +0200, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst  | 4 ++--
>  documentation/kernel-dev/common.rst        | 4 ++--
>  documentation/ref-manual/classes.rst       | 4 ++--
>  documentation/ref-manual/structure.rst     | 2 +-
>  documentation/toaster-manual/reference.rst | 5 ++---
>  5 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 37c7a19bfa..713ed8d64e 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -1589,7 +1589,7 @@ your software is built:
>  
>  -  *Autotools:* If your source files have a ``configure.ac`` file, then
>     your software is built using Autotools. If this is the case, you just
> -   need to worry about modifying the configuration.
> +   to modify the configuration.
>  

Missing "need"

Otherwise:
Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
