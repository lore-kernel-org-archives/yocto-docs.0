Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.1988.1620082233940011446
 for <docs@lists.yoctoproject.org>;
 Mon, 03 May 2021 15:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:48254 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ldhOa-0006Lp-Dh; Mon, 03 May 2021 18:50:32 -0400
Date: Mon, 3 May 2021 18:50:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] sdk manual, how does one simply *use* a pre-built SDK?
In-Reply-To: <ff26267bb1afa5ae061c74da9c87231fea0d7559.camel@linuxfoundation.org>
Message-ID: <eda1b5b8-78b8-2711-d968-3b8a1f964a69@crashcourse.ca>
References: <50434d1c-369-8679-9a5-91c9d5acb77d@crashcourse.ca> <ff26267bb1afa5ae061c74da9c87231fea0d7559.camel@linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="8323328-1357022018-1620082232=:206578"

--8323328-1357022018-1620082232=:206578
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 3 May 2021, Richard Purdie wrote:

> On Mon, 2021-05-03 at 17:40 -0400, Robert P. J. Day wrote:
> >   having perused the SDK manual and nitpicked here and there (and
> > submitted some patches, hi, michael!), it's not clear to me how one
> > simply *uses* a pre-built SDK to speed up subsequent builds of
> > compatible projects.
> >
> >   if i'm focused on building for a particular target, i recall from
> > way back there was an option to identify an external toolchain to use
> > to speed things. i'm *assuming* you can do the same by building,
> > installing and sourcing an SDK, but the SDK manual doesn't seem to
> > explain how to do something that basic.
> >
> >   am i missing something? if i go to the trouble of building and
> > installing a standard SDK, how can i use it to speed up subsequent
> > builds?
>
> You don't, we got rid of that. You'd want the eSDK to do anything remotely
> like that. Supporting random toolchains for the build was a world of pain
> for everyone as it invariably broke in interesting ways. It isn't the point
> of an SDK which is t give someone a toolchain to external development.

  ok, now it makes so much more sense. thanks.

rday

--8323328-1357022018-1620082232=:206578--
