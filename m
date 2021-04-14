Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web09.9915.1618387804185279151
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4FKwBK60BYz5tlM;
	Wed, 14 Apr 2021 10:10:01 +0200 (CEST)
Date: Wed, 14 Apr 2021 10:10:00 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 06/13] ref-manual: add REQUIRED_VERSION and adjust PREFERRED_VERSION entry
Message-ID: <20210414081000.74szybq42anpitfs@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <9a02215494bae33c57e9fd7f6924e995713c7b1c.1618358456.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <9a02215494bae33c57e9fd7f6924e995713c7b1c.1618358456.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

Just nitpicking.

On Tue, Apr 13, 2021 at 05:19:47PM -0700, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> Add REQUIRED_VERSION, add a reference to it in PREFERRED_VERSION and
> adjust the opening statement to read slightly better.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/variables.rst | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index ef61339..a97f858 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5798,10 +5798,10 @@ system and gives an overview of their function and contents.
>           exclusive alternative providers.
>  
>     :term:`PREFERRED_VERSION`
> -      If multiple versions of recipes exist, this variable determines which
> -      version is given preference. You must always suffix the variable with
> -      the :term:`PN` you want to select, and you should set the
> -      :term:`PV` accordingly for precedence.
> +      If there are multiple versions of a recipe available, this variable
> +      determines which version should be given preference. You must always
> +      suffix the variable with the :term:`PN` you want to select, and you
> +      should set the :term:`PV` accordingly for precedence.
>  

Would it make sense to explicit what suffixing with PN and specifying PV mean?
We have an example just a few lines below, so I'd see something like:

suffix the variable with the :term:`PN` you want to select (`python` in
the example below), and you should set the :term:`PV` accordingly
(`3.4.0` in the example).

>        The ``PREFERRED_VERSION`` variable supports limited wildcard use
>        through the "``%``" character. You can use the character to match any
> @@ -5859,6 +5859,10 @@ system and gives an overview of their function and contents.
>           The ``\_forcevariable`` override is not handled specially. This override
>           only works because the default value of ``OVERRIDES`` includes "forcevariable".
>  
> +      If a recipe with the specified version is not available, a warning
> +      message will be shown. See :term:`REQUIRED_VERSION` if you want this
> +      to be an error instead.
> +
>     :term:`PREMIRRORS`
>        Specifies additional paths from which the OpenEmbedded build system
>        gets source code. When the build system searches for source code, it
> @@ -6216,6 +6220,16 @@ system and gives an overview of their function and contents.
>        the recipe will be skipped, and if the build system attempts to build
>        the recipe then an error will be triggered.
>  
> +   :term:`REQUIRED_VERSION`
> +      If there are multiple versions of a recipe available, this variable
> +      determines which version should be given preference. ``REQUIRED_VERSION``
> +      works in exactly the same manner as :term:`PREFERRED_VERSION`, except
> +      that if the specified version is not available then an error message
> +      is shown and the build fails immediately.
> +
> +      If both ``REQUIRED_VERSION`` and ``PREFERRED_VERSION`` are set for

I think we wanted to go for using :term: for every occurence of a
variable (which is *definitely* not something we've done so far), so I'd
suggest s/``PREFERRED_VERSION``/:term:`PREFERRED_VERSION`/ here. For me
REQUIRED_VERSION does not warrant the use of term because it is used in
the paragraph defining it (but maybe it's something we want?).

Cheers,
Quentin
