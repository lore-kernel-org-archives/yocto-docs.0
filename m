Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web08.9863.1618387987556036313
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4FKwFr5cTjz5tlJ;
	Wed, 14 Apr 2021 10:13:04 +0200 (CEST)
Date: Wed, 14 Apr 2021 10:13:03 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 08/13] ref-manual: add passwd-expire to EXTRA_USERS_PARAMS
Message-ID: <20210414081303.kciysuaevt3bhjtg@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <c973665acd8a5259b19ab512b2ae7f6d10848cb5.1618358456.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <c973665acd8a5259b19ab512b2ae7f6d10848cb5.1618358456.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Tue, Apr 13, 2021 at 05:19:49PM -0700, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> Add a reference to the recently added passwd-expire command in
> EXTRA_USERS_PARAMS.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/variables.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 2e3cc22..3b76dbc 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2293,6 +2293,17 @@ system and gives an overview of their function and contents.
>           # usermod -s /bin/sh tester; \
>           # "
>  
> +      Additionally there is a special ``passwd-expire`` command that will
> +      cause the password for a user to be expired and thus force changing it
> +      on first login, for example: ::
> +

IIRC, :: will behave the same as : ::, so please use the former (trying to
have consistency across all docs, though we're far from it now :|, but
this change is something we want).

Pinging @Nicolas just for confirmation :)

Thanks,
Quentin
