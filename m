Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web09.155.1582325368819606444
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Feb 2020 14:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:35778 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j5H6t-00GNuX-C3; Fri, 21 Feb 2020 17:49:27 -0500
Date: Fri, 21 Feb 2020 17:49:25 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: akuster808 <akuster808@gmail.com>
cc: docs@lists.yoctoproject.org
Subject: Re: [docs] what about more current security links for section 3.18 in dev manual?
In-Reply-To: <ffb95f6b-72ea-cf64-24e9-b0a62942f006@gmail.com>
Message-ID: <alpine.LFD.2.21.2002211747370.13763@localhost.localdomain>
References: <alpine.LFD.2.21.2002170408230.2313534@localhost.localdomain> <ffb95f6b-72ea-cf64-24e9-b0a62942f006@gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=3.0
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

On Fri, 21 Feb 2020, akuster808 wrote:

> I found this doc on-line an plan on adding a link in the meta-security layer.
>
> https://www.nccgroup.trust/us/our-research/improving-your-embedded-linux-security-posture-
> with-yocto/

  given that that doc is written relative to "sumo", it might be worth
updating it in some way to reflect current code base. i'm betting
enough has changed that it would be worth somehow bringing that doc up
to date. even as is, it clearly has value.

rday
