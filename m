Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.6989.1615373078708058255
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Mar 2021 02:44:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:57024 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lJwKS-0000Sc-Fm; Wed, 10 Mar 2021 05:44:37 -0500
Date: Wed, 10 Mar 2021 05:44:35 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] rendering double dashes more emphatically
In-Reply-To: <20210309101702.g6y4lvp2b3wnfakn@qschulz>
Message-ID: <39db855-c3ac-f32-a4b7-a15b228337@crashcourse.ca>
References: <b1323c30-5681-20cc-af2b-e38f56c1d22f@crashcourse.ca> <20210309101702.g6y4lvp2b3wnfakn@qschulz>
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

On Tue, 9 Mar 2021, Quentin Schulz wrote:

> Hi Robert,
>
> On Tue, Mar 09, 2021 at 04:58:54AM -0500, Robert P. J. Day wrote:
> >
> >   reading bitbake user manual and, in section 1.5.2.2:
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-intro.html#executing-tasks-against-a-set-of-recipe-files
> >
> > in the first line of the second paragraph, the distinction between a
> > single dash and a double dash seems to be pretty vague since, by
> > default, i believe sphinx renders a double dash as simply an "em", so
> > visually, it's just not as clear as it could be.
> >
> > one possible fix is to mark up stuff like that with ``...``, since it
> > seems it should be monospaced content anyway, and doing that renders
> > double dashes nicely.
> >
> >   thoughts? other options?
> >
>
> Considering in Yocto docs we usually use ``--options`` when not in
> code-blocks, I'd say it's pretty safe to do the same for bitbake
> documentation.

  last, really, really, nitpicky question about this rendering ... if
one renders in monospace, is it worth still surrounding that with
double quotes? since there is an erratic mixture of those two styles.
as in:

  You can use the --c option to ...

versus

  You can use the "--c" option to ...

Personally, I'd forego the quotes, but ... thoughts? Just trying to
get a consistent feel for the rendering.

rday

p.s. also personally, for verbatim/monospaced rendering, i might pick
a font that's not so visually similar to the regular text as it's
rendered, at least in my browser.
