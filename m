Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.12923.1611071332995668413
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jan 2021 07:48:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:50732 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1l1tFS-0000ze-5f; Tue, 19 Jan 2021 10:48:50 -0500
Date: Tue, 19 Jan 2021 10:48:48 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
    docs <docs@lists.yoctoproject.org>
Subject: Re: [docs] PROVIDES inconsistency
In-Reply-To: <20210119153124.vayhbc6om4dj6uj6@qschulz>
Message-ID: <1dabe8e0-10c0-288e-6d14-2d3db286bec3@crashcourse.ca>
References: <de6c282b93e701bbd5d8b8bd1da6125c1cb6d38c.camel@linuxfoundation.org> <20210119153124.vayhbc6om4dj6uj6@qschulz>
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

On Tue, 19 Jan 2021, Quentin Schulz wrote:

> Hi Richard,
>
> On Tue, Jan 19, 2021 at 03:27:11PM +0000, Richard Purdie wrote:
> > Hi,
> >
> > On irc it was pointed out we have an inconsistency in the documentation of PROVIDES:
> >
> > https://docs.yoctoproject.org/ref-manual/ref-variables.html#term-PROVIDES
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-PROVIDES
> >
> > One says don't use +=, the other uses it as an example.
> >
> > We should probably decide on which and clarify the manual.
> >
> > In many ways I prefer encouraging users to use "+=" rather than setting
> > plain "=".
> >
>
> += all the way.
>
> Even if your recipe sets PROVIDES = "test123test", bitbake (Yocto?) will
> add ${PN} to it (otherwise recipes without PROVIDES would just flat out
> fail to be found by the DEPENDS mechanism).
>
> It's less confusing if you have PROVIDES +=, showing that there's
> actually already a value set for it.

  i well recall raising this very issue once upon a long time ago. at
this point, i'm fine either way ***as long as*** it's clearly
explained that "=" is perfectly adequate because of the automatic
addition of ${PN}. if you don't explain that, then the first time
someone runs across PROVIDES = "..." and doesn't know that, they'll
think it's an error.

rday
