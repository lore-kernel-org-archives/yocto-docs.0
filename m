Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.1258.1616604569615059829
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 09:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:59480 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lP6hD-004FX4-SG; Wed, 24 Mar 2021 12:49:28 -0400
Date: Wed, 24 Mar 2021 12:49:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] HOSTTOOLS and HOSTTOOLS_NONFATAL and ASSUME_PROVIDED
In-Reply-To: <fb8b836dd93fe5c3f0074a5a10b6e00ee0127a53.camel@linuxfoundation.org>
Message-ID: <b0edd6d-7221-1f7d-cb6-6068c6963e23@crashcourse.ca>
References: <f76e5093-205a-5e1f-6da2-4658dcf23bd@crashcourse.ca> <fb8b836dd93fe5c3f0074a5a10b6e00ee0127a53.camel@linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="8323328-233363357-1616604567=:33325"

--8323328-233363357-1616604567=:33325
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 24 Mar 2021, Richard Purdie wrote:

> On Wed, 2021-03-24 at 12:06 -0400, Robert P. J. Day wrote:
> >   following up (briefly?) on richard's last post, a question or
> > two about HOSTTOOLS, whose ref manual entry reads:
> >
> > "A space-separated list (filter) of tools on the build host that
> > should be allowed to be called from within build tasks. Using this
> > filter helps reduce the possibility of host contamination. If a
> > tool specified in the value of HOSTTOOLS is not found on the build
> > host, the OpenEmbedded build system produces an error and the
> > build is not started."
> >
> >   i would first suggest that that opening sentence is a bit wussy
> > ... it's not so much that the listed tools "should be allowed to
> > be called", it's more, "here are the individual tools that
> > absolutely must exist on the host or you're not going anywhere."
>
> It is both. It is actually really important to describe what these
> are being used for as well as what it implies.
>
> The important thing here is we explicitly list which tools from the
> build host you can call from tasks. A side effect of that is you get
> an error if they don't exist. So no, I disagree the opening sentence
> is incorrect, you're just viewing this from a different perspective.

  ah, then you might want to ignore that last docs patch i sent.

> >  yes, i realize the end of that entry gets around to that, but
> > that should be emphasized from the beginning. i might even throw
> > in a link for the reader to here:
> >
> > https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#required-packages-for-the-build-host
> >
> >   also, the required presence of those tools on the host is
> > totally independent of whatever ASSUME_PROVIDED is set to; the
> > setup_hosttools_dir() routine in base.bbclass has no interest in
> > the value of ASSUME_PROVIDED. so even if some of those tools had
> > been built natively by the OE build, they would be ignored
> > entirely.
>
> No, they would not. If they are built natively, they would be injected
> into PATH ahead of HOSTTOOLS and used.

  really? i was unaware of that, i should have checked more carefully.
i find that confusing -- effectively, this is saying that certain
tools *must* exist on the build host, but even if they do, they might
not be the ones used? that seems counter-intuitive.

rday

--8323328-233363357-1616604567=:33325--
