Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.11012.1587055893164561924
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 09:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:50870 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jP7jf-00DrEZ-Fe; Thu, 16 Apr 2020 12:51:32 -0400
Date: Thu, 16 Apr 2020 12:51:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: docs@lists.yoctoproject.org
cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [docs] Possible changes to the project docs
In-Reply-To: <20200415152105.GA11838@linux-uys3>
Message-ID: <alpine.LFD.2.21.2004161247290.35575@localhost.localdomain>
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org> <20200415152105.GA11838@linux-uys3>
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

On Wed, 15 Apr 2020, Trevor Woerner wrote:

> On Wed 2020-04-15 @ 11:19:25 AM, Richard Purdie wrote:
> > Basically, the thought is whether to move from docbook to sphinx.
>
> This sounds like a good idea to me.
>
> Prior to yesterday I had never looked into sphinx before. Skimming some
> information about sphinx, it looks like it's flexible with regards to the
> exact formatting you use for, for example, section headings. If that's true, I
> believe we'll need a "coding standard" in place before proceeding. We wouldn't
> want the BSP Manual to use:
>
> 	section 1
> 	^^^^^^^^^
> 	section 1.1
> 	===========
> 	section 1.1.1
> 	-------------
>
> and the Reference Manual to use:
>
> 	section 1
> 	=========
> 	section 1.1
> 	***********
> 	section 1.1.1
> 	^^^^^^^^^^^^^

  absolutely, and i'll throw out one more "coding standard" that i
initially loathed, but came to appreciate -- keep sentences on the
same physical line.

  i first ran into that standard when contributing to the "pro git"
book, and i hated, hated, hated it as it naturally made long sentences
go on forever off the right side of the terminal window.

  however, i grew to like it because it makes side-by-side comparison
trivial and if you ended up with a sentence like that, it made you
reconsider whether you were doing this correctly.

  anyway, yes to the above.

rday

p.s. i've played briefly with sphinx on my fedora 31/32 system -- has
anyone set up a full processing toolchain that can just be purloined
to get started? even though it looks pretty simple.
