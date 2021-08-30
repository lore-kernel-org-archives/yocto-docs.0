Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.14811.1630315564837120270
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 02:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:37222 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKdYJ-0006eC-Bm; Mon, 30 Aug 2021 05:26:03 -0400
Date: Mon, 30 Aug 2021 05:26:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: add line continuations for aesthetics
In-Reply-To: <20210830091723.ercjocjlom2yond6@fedora>
Message-ID: <5458d17c-ba98-7e9a-e351-8f91dbbd6912@crashcourse.ca>
References: <9490f67c-af80-2517-737f-f05591c9a0bb@crashcourse.ca> <20210830091723.ercjocjlom2yond6@fedora>
MIME-Version: 1.0
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

On Mon, 30 Aug 2021, Quentin Schulz wrote:

> Hi Robert,
>
> On Mon, Aug 30, 2021 at 05:00:39AM -0400, Robert P. J. Day wrote:
> >
> > Not a fan of lengthy lines that require horizontal scrolling,
> > so add line continuations.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
>
> It is the content of the recipe afterall, so not sure it's desired?
> Will let Michael/Nicolas decide.
>
> In any case, this code is out of sync, e.g. WITHOUT_XATTR is now
> embedded in a bb.utils.contains check. Since you're sending patch
> for this already, do you mind sending a patch for this too please?

  in cases like this, it's pretty much a given that any recipe will be
out of date in a while, but i don't think that's a big deal -- the
idea is just to present a *concept*, not to guarantee that the recipe
matches exactly the current version. i am willing to be corrected,
though.

rday
