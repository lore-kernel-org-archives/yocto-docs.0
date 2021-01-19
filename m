Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web11.13149.1611072184720369894
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jan 2021 08:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4DKtjL3v64z5tlH;
	Tue, 19 Jan 2021 17:03:02 +0100 (CET)
Date: Tue, 19 Jan 2021 17:03:01 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: docs@lists.yoctoproject.org, richard.purdie@linuxfoundation.org,
	rpjday@crashcourse.ca
Subject: Re: [docs][PATCH] ref-manual: Clarify recommended operator for PROVIDES
Message-ID: <20210119160301.5ywnqttcdt73xyx3@qschulz>
References: <20210119155751.11243-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210119155751.11243-1-JPEWhacker@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joshua,

On Tue, Jan 19, 2021 at 09:57:51AM -0600, Joshua Watt wrote:
> Updates the documentation for PROVIDES so that it recommends "+="
> instead of "=".
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 4ce264813..2ea0cc36c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5915,23 +5915,17 @@ system and gives an overview of their function and contents.
>        file ``eudev_3.2.9.bb``:
>        ::
>  
> -         PROVIDES = "udev"
> +         PROVIDES += "udev"
>  
>        The ``PROVIDES`` statement
>        results in the "eudev" recipe also being available as simply "udev".
>  
>        .. note::
>  
> -         Given that a recipe's own recipe name is already implicitly in its
> -         own PROVIDES list, it is unnecessary to add aliases with the "+=" operator;
> -         using a simple assignment will be sufficient. In other words,
> -         while you could write:
> -         ::
> -
> -                 PROVIDES += "udev"
> -
> -
> -         in the above, the "+=" is overkill and unnecessary.
> +         A recipe's own recipe name (:term:`${PN}`) is always implicitly
> +         included in the recipe aliases, so while using "+=" in the above

s/included in the recipe aliases/included in its own PROVIDES list/ ?

Just a suggestion.

> +         example may not be strictly necessary it is recommend to avoid

s/recommend/recommended/

Thanks,
Quentin
