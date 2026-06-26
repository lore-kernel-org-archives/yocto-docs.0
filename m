Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1B2C43327
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 17:01:08 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39701.1782493264807614683
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 10:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ZrQwTvTB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P8K4PewebPDZbhlaenaSz4rbLdWckbRs7qerjKfHH/U=; b=ZrQwTvTB36LXJSYvBHMH0NoH/N
	OAMS4q+3eWCqfz/EA/+VtqfbgzK4QGoXxa0yMoPwbEGuUEfNKDNsDZiprjSXFdi3K30xJ8qpzEYTJ
	oX9D6sPOikLaN/LmXCi3w5YpPNcH01/de22Ajw15eWhgSpmr1cVeJxSX5frIlesn2jLogwjJlaHiq
	PforonntM6oBu2CjAGgzoJ9azyyZQ1RhyO8Hk9lxZYq5oMP9WoPvBSCxGPh0C+IDGTSGwYwtkZ+vo
	mYMaHrut0ryqbkB7/WfoaUMxS0oIucSnSlzKOewiY5li0Bk4OfKf6ih05iXBa+SjanyzqNu5+9hYh
	1jJblIIw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:39644 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wd9vI-00000003WLR-3y3T;
	Fri, 26 Jun 2026 13:01:03 -0400
Date: Fri, 26 Jun 2026 13:00:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: clarify use of "PACKAGE_ARCH" in a
 packagegroup
In-Reply-To: <7cd69d55-5e08-48dc-a31b-004ba88f521f@cherry.de>
Message-ID: <f2bdd535-f2cc-6913-8d56-5f7bfe909cc0@crashcourse.ca>
References: <70a7a488-e6f7-3997-230c-ce8deb26308c@crashcourse.ca> <eb993591-b3d4-4292-8409-7c7db83841a0@cherry.de> <21e3387b-3b80-34ac-6744-9b028a5c282a@crashcourse.ca> <7cd69d55-5e08-48dc-a31b-004ba88f521f@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 17:01:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9914

On Fri, 26 Jun 2026, Quentin Schulz wrote:

>
>
> On 6/19/26 7:10 PM, Robert P. J. Day wrote:
> > On Fri, 19 Jun 2026, Quentin Schulz wrote:
> >
> > > Hi Robert,
> > >
> > > On 6/16/26 6:46 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > > >
> > > > Warn the developer that if they need to set "PACKAGE_ARCH" in a
> > > > custom packagegroup file, that setting must precede the "inherit
> > > > packagegroup" line in the packagegroup recipe file.
> > > >
> > > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > > >
> > > > ---
> > > >
> > > > diff --git a/documentation/ref-manual/classes.rst
> > > > b/documentation/ref-manual/classes.rst
> > > > index 95e07f85a..839a89d4b 100644
> > > > --- a/documentation/ref-manual/classes.rst
> > > > +++ b/documentation/ref-manual/classes.rst
> > > > @@ -2130,6 +2130,18 @@ section in the Yocto Project Development Tasks
> > > > Manual.
> > > >
> > > >    Previously, this class was called the ``task`` class.
> > > >
> > > > +.. note::
> > > > +
> > > > +   If you're defining a packagegroup and need to set::
> > > > +
> > > > +      PACKAGE_ARCH = ${MACHINE_ARCH}
> > > > +
> > >
> > > OK so reading this I was like "but who would need to do this?
> > > packagegroups
> > > are only supposed to include other packages and not compile anything!
> > >
> > > Then I looked in OE-Core, and there are as many packagegroups with
> > > PACKAGE_ARCH set than without. It seems that the need comes from using
> > > MACHINE_FEATURES or other knobs that depend on some configuration
> > > variable.
> > >
> > > I think it'd be nice to document this (if not already, but since you're
> > > scouring the docs now maybe you'd come across something like that?).
> > >
> > > I'm thinking this is a big enough footgun that we may want to document the
> > > order in the variable glossary as well.
> >
> >    richard purdie explained this once upon a time:
> >
> > https://lists.openembedded.org/g/openembedded-core/topic/patch_4_4_package_add/87011325
> >
>
> That sounds like a great thing to add to the docs. Both here and in
> the variable glossary for PACKAGE_ARCH as well I think?
>
> Do you agree? Would you mind sending a patch for this?

  i don't think i'm the right person for that as i don't *fully*
understand what is going on under the hood, and here's why.

  while richard's explanation involves using the variable
${TUNE_PKGARCH}, with a quick scan over all the layers i have checked
out, there are even more packagegroups that are assigning
${MACHINE_ARCH}. and i'm sure i read somewhere that there were at
least two reasons for setting MACHINE_ARCH in a packagegroup recipe
file, one of which was package renaming but i don't remember the other
one.

  if all you're looking for is something like:

"For some packagegroups, it is sometimes necessary to set the
MACHINE_ARCH variable to one of .... If that's the case, that
assignment has to be placed above the 'inherit packagegroup' line."

  but that sort of explanation is maddeningly uninformative, so
someone else who knows more about it should probably do that. but,
yes, that definitely merits a ".. warning::" somewhere.

rday

