Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.6708.1621589402576347097
 for <docs@lists.yoctoproject.org>;
 Fri, 21 May 2021 02:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56040 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lk1Tn-0004p8-72; Fri, 21 May 2021 05:30:01 -0400
Date: Fri, 21 May 2021 05:29:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] is meta/conf/documentation.conf meant to be kept up to date?
In-Reply-To: <20210521090026.ty75dcnizwqztudg@qschulz>
Message-ID: <945af536-8e6d-7b6f-ef1f-1c934c661a55@crashcourse.ca>
References: <56c767a6-50ad-bf2f-4fa1-a4b974a4eef7@crashcourse.ca> <20210521090026.ty75dcnizwqztudg@qschulz>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 May 2021, Quentin Schulz wrote:

> Hi Robert,
>
> On Fri, May 21, 2021 at 04:51:00AM -0400, Robert P. J. Day wrote:
> >
> >   in the enthusiasm to improve the online docs, it seems that
> > documentation.conf is lagging a bit. is that file still meant to be
> > kept current?
> >
>
> I guess so? In any case I wouldn't want it to be gone, it is useful in
> this context:
>
> $ bitbake -e strace | less
> [...]
> # $BBCLASSEXTEND [4 operations]
> #   _append /yocto/poky/meta/conf/multilib.conf:15
> #     " ${MULTILIBS}"
> #   set /yocto/poky/meta/conf/documentation.conf:82
> #     [doc] "Allows you to extend a recipe so that it builds variants of the software. Common variants for recipes are 'native', 'cross', 'nativesdk' and multilibs."
> #   set /yocto/poky/meta/recipes-devtools/strace/strace_4.24.bb:63
> #     "native"
> #   set ast.py:431 [multi_finalize]
> #     "native multilib:lib32"
> # pre-expansion value:
> #   "native multilib:lib32"
> BBCLASSEXTEND="native multilib:lib32"
> [...]
>
> Though admittedly, one could check the docs online. Can we at least
> make sure all entries in poky/meta/conf/documentation.conf are
> listed in our docs?

  it strikes me that keeping these things in sync would be a good
project for a newbie who wants something to do, and would definitely
have value. can this be added as a newbie project?

rday
