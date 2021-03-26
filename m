Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.10808.1616756381387034685
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 03:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4F6Jrp5XZhz5tlB;
	Fri, 26 Mar 2021 11:59:38 +0100 (CET)
Date: Fri, 26 Mar 2021 11:59:37 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [docs] [PATCH] SDK manual: fix reference to appendix
Message-ID: <20210326105937.koufjbc2cokcg5az@qschulz>
References: <20210326104942.13304-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20210326104942.13304-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Fri, Mar 26, 2021 at 11:49:42AM +0100, Michael Opdenacker wrote:
> This fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=14307
> 

Please use [YOCTO #14307] to match the guidelines:
https://docs.yoctoproject.org/dev-manual/common-tasks.html#preparing-changes-for-submission

(Though, there is a mix of "Fixes [YOCTO #14307]" and just "[YOCTO
#14307]").

Not sure there's a need for a v2 just for that, up to Nicolas/Richard.

> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  documentation/sdk-manual/extensible.rst | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
> index d2ed9a9b8..f1a114368 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -1271,11 +1271,9 @@ To update your installed SDK, use ``devtool`` as follows:
>     $ devtool sdk-update
>  
>  The previous command assumes your SDK provider has set the
> -default update URL for you through the
> -:term:`SDK_UPDATE_URL`
> -variable as described in the "`Providing Updates to the Extensible SDK
> -After
> -Installation <#sdk-providing-updates-to-the-extensible-sdk-after-installation>`__"
> +default update URL for you through the :term:`SDK_UPDATE_URL`
> +variable as described in the
> +":ref:`sdk-manual/appendix-customizing:Providing Updates to the Extensible SDK After Installation`"

We have PLENTY of those. We absolutely want to get rid of <#...> links.
They are bad. If you have time, it'd be great to fix those.

c.f. https://lists.yoctoproject.org/g/docs/topic/79503023#833

We'll need a linter one day to make sure we don't introduce <#..> links
again (and other stuff, like proper rules).

Anyway, Thanks for the patch :)
Quentin
