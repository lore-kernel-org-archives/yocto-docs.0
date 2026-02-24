Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273A4F3C997
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:24:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22691.1771946656128782682
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 07:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=D0J3u7WL;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oEkadazq2iaV8yJdCXhrqDo/JvscqczPETKyAuAemsQ=; b=D0J3u7WLWLi4TK0I5o5838doIM
	zdcI6cTmzw0R7SN5QAbnK9h1Pg9B0NpBO5HWiQohL1VZjEFMmPbOx9HUrRLr+Rrq1hokbsEv7xTwZ
	uEs07OuD6YkfzCWC7bJYtZO7Moa4V5/Mt84WlCWACnX7oEq5RUBBX8ZF3C95uEiQ70O+bGXfr9ARL
	2iSvRit8AWfDdCj2sWRyG5kz9XJ6if/timmGWjNc5INj/9Pjfuq9gvJmB7qwodAR66ckmaRAg+IY1
	gzmzaSnXIinHb62UhZdKUyVlGZBxRntUWrJ+vo4vOsYaUOdxNWXlRHjUM7Iennf3W2G6zZuYJidwf
	lvo9+44Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:60292 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vuuGk-000000009yn-1mUo;
	Tue, 24 Feb 2026 10:24:14 -0500
Date: Tue, 24 Feb 2026 10:26:17 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: antonin.godard@bootlin.com, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] variables.rst: expand explanation of RSUGGESTS
In-Reply-To: <f336c43c-c7e7-4f6d-88e0-c5cc79f26b77@cherry.de>
Message-ID: <91e83bdb-d111-db18-73a5-31cb8f06050b@crashcourse.ca>
References: <1ee12fbd-a5c7-7b14-a558-cd6dda9e539e@crashcourse.ca> <DGN78E65FUWN.2BTR1KCHXV2VN@bootlin.com> <1b69d976-4159-354d-a283-bd06bedef3b7@crashcourse.ca> <f336c43c-c7e7-4f6d-88e0-c5cc79f26b77@cherry.de>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 15:24:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8975

On Tue, 24 Feb 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 2/24/26 1:55 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > On Tue, 24 Feb 2026, Antonin Godard via lists.yoctoproject.org wrote:
> >
> > > Hi,
> > >
> > > On Tue Feb 24, 2026 at 1:15 PM CET, Robert P. J. Day wrote:
> > > >
> > > > Add that the RSUGGESTS variable would be processed only by a
> > > > supporting package manager when installing packages from a
> > > > package feed.
> > > >
> > > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > > >
> > > > ---
> > > >
> > > > diff --git a/documentation/ref-manual/variables.rst
> > > > b/documentation/ref-manual/variables.rst
> > > > index 208b5e43d..92476d509 100644
> > > > --- a/documentation/ref-manual/variables.rst
> > > > +++ b/documentation/ref-manual/variables.rst
> > > > @@ -8361,7 +8361,9 @@ system and gives an overview of their function and
> > > > contents.
> > > >      :term:`RSUGGESTS`
> > > >         A list of additional packages that you can suggest for
> > > > installation
> > > >         by the package manager at the time a package is installed. Not
> > > > all
> > > > -      package managers support this functionality.
> > > > +      package managers support this functionality. This feature takes
> > > > effect
> > > > +      only when the package manager is being used to install packages
> > > > on
> > > > +      the target system from a package feed.
> > >
> > > Could you add a link to the section explaining how to enable this?
> > >
> > > """
> > > See the :ref:`dev-manual/packages:Using Runtime Package Management`
> > > section of
> > > the Yocto Project Development Tasks Manual for more information on the
> > > package management feature.
> > > """
> >
> >    oh, man, did this just open up a can of worms. if you check that
> > section:
> >
> > https://docs.yoctoproject.org/dev-manual/packages.html#using-runtime-package-management
> >
> > it has no reference to RSUGGESTS, so sending readers there might be
> > less than useful. so should some explanation of RSUGGESTS be added
> > there to provide context?
> >
> >    and when i scroll to the top of that chapter:
> >
> > https://docs.yoctoproject.org/dev-manual/packages.html#
> >
> > the first section, "Excluding Package from an Image", mentions
> > PACKAGE_EXCLUDE, but does not mention using IMAGE_INSTALL:remove,
>
> IMAGE_INSTALL:remove is *almost* always wrong.
>
> This only has an impact if the package is explicitly listed in IMAGE_INSTALL
> variable. If that is the case, then instead of using :remove, simply do not
> add it to IMAGE_INSTALL in the first place. If it's not in IMAGE_INSTALL,
> using :remove will be a no-op.
>
> If the package is brought in as a dependency, you need to remove whatever
> package you explicitly list in IMAGE_INSTALL that is bringing this package as
> a dependency, which may not be possible without rebuilding the recipe with
> different PACKAGECONFIG for example.
>
> If it's brought in as a light dependency (read RRECOMMENDS), then
> BAD_RECOMMENDATIONS or NO_RECOMMENDATIONS should do the trick.
>
> PACKAGE_EXCLUDE will prevent building and then you can easily figure out which
> packages that are to be installed in your image depend on the package you want
> to exclude from your image. This is a good starting point to start debugging.
>
> > which is definitely used in places i've run across. should that also
> > be mentioned as a way to exclude packages?
> >
>
> Hard no from me. See above why I think it is a bad idea to tell people to do
> that. Maybe we should actually explain why this is a bad idea as I see this
> being repeated here and there.

  so would it be sufficient to simply add a note here:

https://docs.yoctoproject.org/dev-manual/packages.html#excluding-packages-from-an-image

stating that, while "IMAGE_INSTALL:remove" is occasionally seen as a
way to omit a package from installation, this is almost always a bad
idea and that "PACKAGE_EXCLUDE" is the proper way?

  that at least would warn developers off.

rdayt

