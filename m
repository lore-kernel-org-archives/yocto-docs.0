Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.2291.1616616375484359084
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 13:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:35914 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lP9ld-004pkK-Bz; Wed, 24 Mar 2021 16:06:14 -0400
Date: Wed, 24 Mar 2021 16:06:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] HOSTTOOLS and HOSTTOOLS_NONFATAL and ASSUME_PROVIDED
In-Reply-To: <abc98a06c805118148fb3dd5539b785d748aa24f.camel@linuxfoundation.org>
Message-ID: <a8f08050-fcfa-444f-0e7-9074a2e7c430@crashcourse.ca>
References: <f76e5093-205a-5e1f-6da2-4658dcf23bd@crashcourse.ca>  <fb8b836dd93fe5c3f0074a5a10b6e00ee0127a53.camel@linuxfoundation.org>  <b0edd6d-7221-1f7d-cb6-6068c6963e23@crashcourse.ca> <abc98a06c805118148fb3dd5539b785d748aa24f.camel@linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="8323328-672090615-1616616373=:6943"

--8323328-672090615-1616616373=:6943
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 24 Mar 2021, Richard Purdie wrote:

> On Wed, 2021-03-24 at 12:49 -0400, Robert P. J. Day wrote:
> > On Wed, 24 Mar 2021, Richard Purdie wrote:
> > > On Wed, 2021-03-24 at 12:06 -0400, Robert P. J. Day wrote:
> > > >  yes, i realize the end of that entry gets around to that, but
> > > > that should be emphasized from the beginning. i might even throw
> > > > in a link for the reader to here:
> > > >
> > > > https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#required-packages-for-the-build-host
> > > >
> > > >   also, the required presence of those tools on the host is
> > > > totally independent of whatever ASSUME_PROVIDED is set to; the
> > > > setup_hosttools_dir() routine in base.bbclass has no interest in
> > > > the value of ASSUME_PROVIDED. so even if some of those tools had
> > > > been built natively by the OE build, they would be ignored
> > > > entirely.
> > >
> > > No, they would not. If they are built natively, they would be injected
> > > into PATH ahead of HOSTTOOLS and used.
> >
> >   really? i was unaware of that, i should have checked more carefully.
> > i find that confusing -- effectively, this is saying that certain
> > tools *must* exist on the build host, but even if they do, they might
> > not be the ones used? that seems counter-intuitive.
>
> If you add something into DEPENDS, it is used instead of what is on
> the host as long as it is not in ASSUME_PROVIDED.
>
> Adding something to DEPENDS and it not being used instead replaced
> by the host's tools would seem worse...

  i was about to say that makes no sense until i think i finally clued
in, so let me try to summarize what seems logical (i'll eventually
verify this against the actual code ... someday).

  obviously, HOSTTOOLS represents what absolutely has to be on the
build system -- effectively, minimal host requirements to bootstrap
the build. so the very early part of the build verifies the existence
of these tools on the host, then downloads and configures enough to
start the real part of the build.

  at this point, the search path is extended (prepended) to now start
using the tools built natively. (if i was explaining this to someone
else, i'd say something like, "you need the host git executable to
grab source code, including git itself, but once you build those
tools natively, you'll switch to the natively-built git.")

  *now* that makes sense since, while the host tools might vary in
terms of version, tools compiled by the build will be absolutely
predictable, thereby guaranteeing a stable build environment. in
short, the stuff specified in HOSTTOOLS is needed only early on, then
it's superseded by the built native tools.

  except where ASSUME_PROVIDED comes in, but i think that's clear as
well.

rday

--8323328-672090615-1616616373=:6943--
