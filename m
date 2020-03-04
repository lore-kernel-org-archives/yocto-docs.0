Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web09.181.1583363294929924820
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Mar 2020 15:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:33950 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j9d7d-00FIHn-LY
	for docs@lists.yoctoproject.org; Wed, 04 Mar 2020 18:08:14 -0500
Date: Wed, 4 Mar 2020 18:08:08 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: docs@lists.yoctoproject.org
Subject: Re: [docs] update "Notes" in each manual to refer to this mailing list?
In-Reply-To: <8355cd28f9ba8e03e4e2c29cbee17cbf9a053313.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.2003041804340.11420@localhost.localdomain>
References: <alpine.LFD.2.21.2003041751070.10876@localhost.localdomain> <8355cd28f9ba8e03e4e2c29cbee17cbf9a053313.camel@linuxfoundation.org>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Mar 2020, Richard Purdie wrote:

> On Wed, 2020-03-04 at 17:52 -0500, rpjday@crashcourse.ca wrote:
> >   all of the current YP guides, in their opening, contain the line:
> >
> > "To report any inaccuracies or problems with this manual, send an
> > email to the Yocto Project discussion group at yocto@yoctoproject.com
> > or log into the freenode #yocto channel."
> >
> > should that be updated to refer to this docs mailing list?
>
> Yes, it should.

  What about:

"To report any inaccuracies or problems with this (or any other Yocto
Project) manual, send an email to the Yocto Project documentation
mailing list at docs@lists.yoctoproject.org, or log into the freenode
#yocto channel."

if that's acceptable, i'll submit a patch that covers all manuals.

rday

