Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web10.5220.1622112440500776324
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 03:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4FrPdw6HDqz5tlD;
	Thu, 27 May 2021 12:47:16 +0200 (CEST)
Date: Thu, 27 May 2021 12:47:15 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add WIC_CREATE_EXTRA_ARGS to var glossary
Message-ID: <20210527104715.ne4qucqip34dq44a@qschulz>
References: <bd62f84-9dbf-19e0-38af-2a36925cd71e@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <bd62f84-9dbf-19e0-38af-2a36925cd71e@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 21, 2021 at 04:52:47PM -0400, Robert P. J. Day wrote:
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 0b61f77cb..1863fb21d 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8600,6 +8600,21 @@ system and gives an overview of their function and contents.
>        can control with this variable, see the
>        ":ref:`insane.bbclass <ref-classes-insane>`" section.
> 
> +   :term:`WIC_CREATE_EXTRA_ARGS`
> +      Extra arguments to be added when running ``wic create``. Possibilities

Which is run when "wic" is in "IMAGE_FSTYPES" isn't it? I guess not
everyone explicitly calls `wic create` in their own image recipe?

Would it make sense to add this notion to the doc here?

Cheers,
Quentin
