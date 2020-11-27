Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.18675.1606482497740017429
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2020 05:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:50636 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kidTz-0004Xh-Bt; Fri, 27 Nov 2020 08:08:15 -0500
Date: Fri, 27 Nov 2020 08:08:12 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] clarifying the variations of BBMASK
In-Reply-To: <a221d9c555a64b798d12b862a661e134@XBOX03.axis.com>
Message-ID: <97cbc544-3031-d991-7fd4-5c9b20aa33f4@crashcourse.ca>
References: <8eb9ab43-974b-3fa2-4335-e13e2044bb61@crashcourse.ca> <a221d9c555a64b798d12b862a661e134@XBOX03.axis.com>
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

On Thu, 26 Nov 2020, Peter Kjellerstedt wrote:

> > -----Original Message-----
> > From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> > Of Robert P. J. Day
> > Sent: den 17 november 2020 17:44
> > To: YP docs mailing list <docs@lists.yoctoproject.org>
> > Subject: [docs] clarifying the variations of BBMASK
> >
> >   as i've rarely needed to BBMASK stuff, i learned a couple things
> > today when a colleague brought me some masking that could use some
> > highlighting in the docs, methinks.
> >
> >   first, all of his BBMASKing was of the form:
> >
> >   BBMASK += "|layer stuff ..."
>
> Using += with "|...." doesn't really make sense. Originally, BBMASK
> only supported a single regular expression, and you would then
> typically have to either use BBMASK .= "|..." or BBMASK_append =
> "|..." This was troublesome as you had to basically know if
> something had already added something to BBMASK to know whether you
> should use BBMASK = "..." or BBMASK .= "|...". So I changed that a
> couple of years ago so that it now supports multiple regular
> expressions. At the same time I rewrote the documentation to only
> use examples that use BBMASK += "..." as there is absolutely no
> reason to promote the old way of adding more regular expressions to
> BBMASK.

  ah, that explains it as i am working with a fairly old OE/YP code
base and migrating it to zeus, so i can safely simplify all that
stuff.

rday
