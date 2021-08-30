Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.14137.1630310010642086556
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 00:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:37198 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKc6j-00056f-AB; Mon, 30 Aug 2021 03:53:29 -0400
Date: Mon, 30 Aug 2021 03:53:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: emphasize that new layers live outside of poky
In-Reply-To: <20210830075053.ukfstwhowux2mfye@fedora>
Message-ID: <3fe473c-734d-db54-1348-e67bed91856e@crashcourse.ca>
References: <e080c70-2cec-7e94-8fe3-ea6e25c3839c@crashcourse.ca> <20210830075053.ukfstwhowux2mfye@fedora>
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
> On Sun, Aug 29, 2021 at 05:42:31AM -0400, Robert P. J. Day wrote:
> > Tweak the bblayers.conf example to encourage the reader to appreciate
> > that any new layers should not share space with the official Poky
> > checkout.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
>
> Reviewed-by: Quentin Schulz <foss@0leil.net>
>
> On a similar topic, I assume we should change the "Adding a Layer Using
> the ``bitbake-layers`` Script" section to have meta-scottrif in
> /home/scottrif/. Basically outside of build directory at least :)

  ah, quite so, i missed that. i'll take care of that later today.

rday
