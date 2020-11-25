Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web08.4902.1606299412366990358
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 02:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4CgxdD50KBz5tlR;
	Wed, 25 Nov 2020 11:16:48 +0100 (CET)
Date: Wed, 25 Nov 2020 11:16:47 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] {dev,kernel,sdk}-manual: replace hardcoded release version with &DISTRO;
Message-ID: <20201125101647.jzde6uprwod3cvpd@qschulz>
References: <20201125091526.46021-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201125091526.46021-1-nicolas.dechesne@linaro.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Wed, Nov 25, 2020 at 10:15:26AM +0100, Nicolas Dechesne wrote:
> In the Docbook files we had DISTRO, but somehow it was lost during the
> migration to Sphinx.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  documentation/dev-manual/dev-manual-qemu.rst   |  2 +-
>  documentation/kernel-dev/kernel-dev-common.rst |  4 ++--
>  .../sdk-manual/sdk-appendix-obtain.rst         |  8 ++++----
>  documentation/sdk-manual/sdk-extensible.rst    |  4 ++--
>  documentation/sdk-manual/sdk-intro.rst         |  4 ++--
>  documentation/sdk-manual/sdk-using.rst         | 18 +++++++++---------
>  .../sdk-manual/sdk-working-projects.rst        | 10 +++++-----
>  7 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentation/dev-manual/dev-manual-qemu.rst
> index c91e8b538..63640411d 100644
> --- a/documentation/dev-manual/dev-manual-qemu.rst
> +++ b/documentation/dev-manual/dev-manual-qemu.rst
> @@ -81,7 +81,7 @@ available. Follow these general steps to run QEMU:
>        your :term:`Build Directory`.
>  
>     -  If you have not built an image, you can go to the
> -      :yocto_dl:`machines/qemu </releases/yocto/yocto-3.1.2/machines/qemu/>` area and download a
> +      :yocto_dl:`machines/qemu </releases/yocto/yocto-&DISTRO;/machines/qemu/>` area and download a

The only remark I have is that DISTRO is 3.2 now. My question is, can
all places where 3.1.2 is used have a non-dot version instead (i.e. 3.2
instead of 3.2.0)?

If yes, we're good. If not, we probably need to add a DISTRO_DOT or
something, that is 3.2.0 when DISTRO is 3.2 but then have them equal
when 3.2.1 is released.

I don't know how the version numbers are picked and how much they are
used as is, hence the question :)

Quentin
