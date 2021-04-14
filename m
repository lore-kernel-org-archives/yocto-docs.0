Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.9869.1618387442625054427
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4FKw3N59hYz5tlH;
	Wed, 14 Apr 2021 10:04:00 +0200 (CEST)
Date: Wed, 14 Apr 2021 10:03:59 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 05/13] ref-manual: and SDK_CUSTOM_TEMPLATECONF to glossary
Message-ID: <20210414080359.4rjdrmd7tm2n7ofk@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <9fb4cdc8a239461928146cfd94b4bc3f4236764a.1618358456.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <9fb4cdc8a239461928146cfd94b4bc3f4236764a.1618358456.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Tue, Apr 13, 2021 at 05:19:46PM -0700, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/variables.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index b9478a3..ef61339 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6489,6 +6489,11 @@ system and gives an overview of their function and contents.
>        The target architecture for the SDK. Typically, you do not directly
>        set this variable. Instead, use :term:`SDKMACHINE`.
>  
> +   :term:`SDK_CUSTOM_TEMPLATECONF`
> +      When building the extensible SDK, if ``SDK_CUSTOM_TEMPLATECONF`` is set to
> +      "1" and a ``conf/templateconf.conf`` file exists in the build directory
> +      (``TOPDIR``) then this will be copied into the SDK.

s/``TOPDIR``/:term:`TOPDIR`/

Thanks,
Quentin
