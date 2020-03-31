Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web11.12139.1585669848522534692
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2020 08:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 48sDLt2XcHz5tlC;
	Tue, 31 Mar 2020 17:50:46 +0200 (CEST)
Date: Tue, 31 Mar 2020 17:50:45 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: akuster <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] yocto docs: change author info
Message-ID: <20200331155044.4zjhzawdgn4po5ew@qschulz>
References: <20200331154715.15744-1-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200331154715.15744-1-akuster808@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Armin,

On Tue, Mar 31, 2020 at 08:47:15AM -0700, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  documentation/bsp-guide/bsp-guide.xml             | 4 ++--
>  documentation/dev-manual/dev-manual.xml           | 5 ++---
>  documentation/kernel-dev/kernel-dev.xml           | 5 ++---
>  documentation/mega-manual/mega-manual.xml         | 5 ++---
>  documentation/overview-manual/overview-manual.xml | 5 ++---
>  documentation/poky.ent                            | 2 +-
>  documentation/profile-manual/profile-manual.xml   | 5 ++---
>  documentation/ref-manual/ref-manual.xml           | 5 ++---
>  documentation/sdk-manual/sdk-manual.xml           | 5 ++---
>  documentation/toaster-manual/toaster-manual.xml   | 5 ++---
>  10 files changed, 19 insertions(+), 27 deletions(-)
> 
> diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
> index ea4899b70..d2294a45c 100755
> --- a/documentation/bsp-guide/bsp-guide.xml
> +++ b/documentation/bsp-guide/bsp-guide.xml
> @@ -24,9 +24,9 @@
>              <author>
>                  <firstname>Scott</firstname> <surname>Rifenbark</surname>

According to all the other changes, I think you might have forgotten to
remove the line above.

Quentin
