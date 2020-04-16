Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.10525.1587055633494602008
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 09:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:50862 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jP7fS-00Dqe3-Tq; Thu, 16 Apr 2020 12:47:11 -0400
Date: Thu, 16 Apr 2020 12:47:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [docs] Possible changes to the project docs
In-Reply-To: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.2004161242280.35575@localhost.localdomain>
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
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

On Wed, 15 Apr 2020, Richard Purdie wrote:

> Since Robert was talking about future docs wide changes, I wanted to
> put an idea out there. Its something a few of us have talked a
> little about. At this point it is an idea, not a decision and
> something we're thinking we need to explore and evaluate.
>
> Basically, the thought is whether to move from docbook to sphinx.
>
> Other projects like the kernel have switched and it could assist
> some of our website/publishing challenges. It might also be easier
> for people to contribute to and there are wider and more modern
> tools supporting that format.
>
> It'd be a big change, particularly if we consider we may need to
> convert previous releases of the docs as well as the current
> version. That said, if we were going to do this, the time could be
> now...

  ok, time to weigh in now that i have a minute ... i am totally on
board with a rewriting in sphinx, as that would not only make it
easier for others to contribute, but it's something that, given some
minimal direction, could be handed off to an intern of some kind or --
as i see already mentioned in subsequent replies -- fed through an
automatic translator (eg., pandoc).

  it would also be the right time to restructure some of the docs
(migration manual all on its own, etc, etc.).

  the only downside to the switch is that, as arcane as docbook and
xsl stylesheets can be at times, they do support pretty much infinite
and incredibly refined customization. however, i don't think the YP
docs really scream for that level of customization.

  i'm for it.

rday
