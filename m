Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web09.5249.1622112865662805756
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 03:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FrPp71zDCz5tlC;
	Thu, 27 May 2021 12:54:23 +0200 (CEST)
Date: Thu, 27 May 2021 12:54:22 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add SRCTREECOVEREDTASKS to variable glossary
Message-ID: <20210527105422.d2s777ostilbroyv@qschulz>
References: <7a97671f-9ba8-2c0-9a68-3483a57113f@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <7a97671f-9ba8-2c0-9a68-3483a57113f@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 23, 2021 at 08:22:50AM -0400, Robert P. J. Day wrote:
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index df6413b68..b179abf74 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7092,6 +7092,30 @@ system and gives an overview of their function and contents.
>           ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
>           section, which is in the Yocto Project Development Tasks Manual.
> 
> +   :term:`SRCTREECOVEREDTASKS`
> +      A list of tasks that are typically not relevant (and therefore skipped)

I'm not sure it really matters here, but they are actually removed for
most of them (except for fetch and unpack if there's a file:// npsmw:// or kmeta
type). Therefore, it can break your task tree if you're not careful
where you hook your own tasks.

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks for the patch!
Cheers,
Quentin
