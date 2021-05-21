Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web11.6658.1621587640866367712
 for <docs@lists.yoctoproject.org>;
 Fri, 21 May 2021 02:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4FmgYS3sm2z5tlD;
	Fri, 21 May 2021 11:00:27 +0200 (CEST)
Date: Fri, 21 May 2021 11:00:26 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] is meta/conf/documentation.conf meant to be kept up to date?
Message-ID: <20210521090026.ty75dcnizwqztudg@qschulz>
References: <56c767a6-50ad-bf2f-4fa1-a4b974a4eef7@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <56c767a6-50ad-bf2f-4fa1-a4b974a4eef7@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Fri, May 21, 2021 at 04:51:00AM -0400, Robert P. J. Day wrote:
> 
>   in the enthusiasm to improve the online docs, it seems that
> documentation.conf is lagging a bit. is that file still meant to be
> kept current?
> 

I guess so? In any case I wouldn't want it to be gone, it is useful in
this context:

$ bitbake -e strace | less
[...]
# $BBCLASSEXTEND [4 operations]
#   _append /yocto/poky/meta/conf/multilib.conf:15
#     " ${MULTILIBS}"
#   set /yocto/poky/meta/conf/documentation.conf:82
#     [doc] "Allows you to extend a recipe so that it builds variants of the software. Common variants for recipes are 'native', 'cross', 'nativesdk' and multilibs."
#   set /yocto/poky/meta/recipes-devtools/strace/strace_4.24.bb:63
#     "native"
#   set ast.py:431 [multi_finalize]
#     "native multilib:lib32"
# pre-expansion value:
#   "native multilib:lib32"
BBCLASSEXTEND="native multilib:lib32"
[...]

Though admittedly, one could check the docs online. Can we at least make sure
all entries in poky/meta/conf/documentation.conf are listed in our docs?

Cheers,
Quentin
