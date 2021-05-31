Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web11.41807.1622451784049691841
 for <docs@lists.yoctoproject.org>;
 Mon, 31 May 2021 02:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4Ftq7n008Kz5tlK;
	Mon, 31 May 2021 11:03:00 +0200 (CEST)
Date: Mon, 31 May 2021 11:02:59 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] docs don't mention INIT_MANAGER variable other than YP 3.0 migration
Message-ID: <20210531090259.n44lleyam326ki3c@qschulz>
References: <6529bc86-96be-2e2a-822-e7eee3782ce@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <6529bc86-96be-2e2a-822-e7eee3782ce@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Sat, May 29, 2021 at 07:37:55AM -0400, Robert P. J. Day wrote:
> 
>   as it came up recently on the OE(?) list, i checked and noticed that
> there is no mention of the immensely handy INIT_MANAGER variable for
> selecting the init system, other than in the YP 3.0 migration section
> (not even in the variables glossary):
> 
> http://docs.yoctoproject.org/ref-manual/migration-3.0.html#init-system-selection
> 
> someone want to propose where that should be described? this is the
> sort of thing that would be an ideal candidate for the imminent
> "variable glossary" bugzilla category.
> 

https://docs.yoctoproject.org/dev-manual/common-tasks.html?highlight=sysvinit#selecting-an-initialization-manager

To be updated if INIT_MANAGER is the way to go? Then a new entry in the
glossary would be great too (might just have an overview of what it does
and then point to the link above for in-depth explanation?).

Cheers,
Quentin
