Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108F1C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 08:43:57 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.3905.1750754630096537000
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 01:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=IRtbkjnF;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9HnK+ADivrGMthhPYfr7QMQ0+wOfbst+U3g5BzhJhKo=; b=IRtbkjnFtKzJShNWcVCgsWLQzS
	4bAL3E2qAqVdC8qEP3Kw6DboJktozgnaFh95oMRjSCMIhuuNMmFPFtGhivna39B9WCv1jPmvpk7+D
	gzDsscysSpu1BgXf2/nEZhOPwIvREZQLamXjPubbFMZtFxVL2dtAfNz7lu+0DjC4lP2W4NVR6x1Bn
	8XlM8W88VeofO2L2PP7aiV+tIYRg+n2wrJddrx2LTJwgCSEDQLrmqBuL3CCrfrv9K9nzHlHRTKcV7
	vT1on0zaGRMTSxseeOojbVogCyNFLso46fext4YPLu/HdBoKA1zsLn/vpLzzz0qGo7c+AsuLBoOo2
	S0KiRcwg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:46514 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTzFo-0000000Dzho-1wWX;
	Tue, 24 Jun 2025 04:43:48 -0400
Date: Tue, 24 Jun 2025 04:43:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: some minor cleanups to "Pre-Built
 Libraries"
In-Reply-To: <DAUMJR1JIO0X.I9IFP24VIJ4Y@bootlin.com>
Message-ID: <985c7b54-7607-121b-d8a9-6cf2a7ac5830@crashcourse.ca>
References: <b88499e3-e0d1-5aff-490c-ae13c2dbfb31@crashcourse.ca> <DAULKYBT3POY.38V8CSIV0F8K0@bootlin.com> <e35decf1-32df-59f8-9456-335ecdec531b@crashcourse.ca> <DAUMJR1JIO0X.I9IFP24VIJ4Y@bootlin.com>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 08:43:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7194

On Tue, 24 Jun 2025, Antonin Godard via lists.yoctoproject.org wrote:

> On Tue Jun 24, 2025 at 10:31 AM CEST, Robert P. J. Day wrote:
> > On Tue, 24 Jun 2025, Antonin Godard via lists.yoctoproject.org wrote:
> >
> >> On Sun Jun 22, 2025 at 12:59 PM CEST, Robert P. J. Day wrote:
> >> >
> >> >   * Add note about new URL for FHS 3.0.
> >> >   * Add wildcard for "INHIBIT_" variable.
> >> >   * Fix font for ${PN}.
> >> >
> >> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >> >
> >> > ---
> >> >
> >> > diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
> >> > index a05f39ca1..077184657 100644
> >> > --- a/documentation/dev-manual/prebuilt-libraries.rst
> >> > +++ b/documentation/dev-manual/prebuilt-libraries.rst
> >> > @@ -22,6 +22,13 @@ To summarize, a versioned library must meet two conditions:
> >> >  This section shows how to deal with both versioned and unversioned
> >> >  pre-built libraries.
> >> >
> >> > +.. note::
> >> > +
> >> > +   In the shared library article referenced above, the link to the current
> >> > +   version of the Filesystem Hierarchy Standard (FHS) is out of date;
> >> > +   the current FHS 3.0 release can be found
> >> > +   `here <https://refspecs.linuxfoundation.org/FHS_3.0/index.html>`__.
> >>
> >> Not sure adding a note to say a link is outdated is the good approach.
> >> Instead update the link above?
> >
> >   i'm not sure that's the right way to do it. that old article is
> > quite a decent explanation of library versioning; if we now link
> > directly to the FHS spec from the yocto docs and bypass that article,
> > we lose a lot of good intro-level explanation.
> >
> >   thoughts?
>
> I see. Then as Quentin suggested I think it's reasonable to link to
> https://refspecs.linuxfoundation.org/fhs.shtml instead of the 3.0 version, and
> say:
>
> """
> the latest release can be found `here
> <https://refspecs.linuxfoundation.org/fhs.shtml>`__.
> """

  I'll reword as first referring to that older article with the good
explanation of library versioning and SONAMEs, then add a reference to
the current FHS.

rday

