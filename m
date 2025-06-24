Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081D0C7EE2A
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 08:31:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.3625.1750753869028518741
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 01:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=QfLcyhDf;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Co96Tlu6Hu31mfu5TG5Rlau9teGxsLVDb9OFbVn3W6g=; b=QfLcyhDf0Y4fZb8pn9pNdtxQbC
	HJVfpDg4MFHhJEU2LDNwGglShrO62pbajD4U69qDabtiIglF/3uJe3x4ihCDQNCp+1aY8aOVWsoXv
	7uRNzmW69XcnMJNYaOXoxdT+CzH/k25NKCJA7tYMDQK0sN9Y/YVjCrz6lHR2bkCwRHsINh8dlDssC
	7ih7mqj4J4k8ik1tTrTYhrk/RN48ik/9vK/SG6et2b0BZrLYsifp2qnMAONZe2pQ5eP5HpaCTjqAm
	cS0kCvaETThLoGW2MGWlYfWBrvGlGeaW3BXb+G54bbi+3KNS7JVpISnfWLs8yxcm+cgjhRwANztwU
	kr+qnRpg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:53718 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTz3Z-0000000Dxw4-0I8J;
	Tue, 24 Jun 2025 04:31:07 -0400
Date: Tue, 24 Jun 2025 04:31:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: some minor cleanups to "Pre-Built
 Libraries"
In-Reply-To: <DAULKYBT3POY.38V8CSIV0F8K0@bootlin.com>
Message-ID: <e35decf1-32df-59f8-9456-335ecdec531b@crashcourse.ca>
References: <b88499e3-e0d1-5aff-490c-ae13c2dbfb31@crashcourse.ca> <DAULKYBT3POY.38V8CSIV0F8K0@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 08:31:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7191

On Tue, 24 Jun 2025, Antonin Godard via lists.yoctoproject.org wrote:

> On Sun Jun 22, 2025 at 12:59 PM CEST, Robert P. J. Day wrote:
> >
> >   * Add note about new URL for FHS 3.0.
> >   * Add wildcard for "INHIBIT_" variable.
> >   * Fix font for ${PN}.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
> > index a05f39ca1..077184657 100644
> > --- a/documentation/dev-manual/prebuilt-libraries.rst
> > +++ b/documentation/dev-manual/prebuilt-libraries.rst
> > @@ -22,6 +22,13 @@ To summarize, a versioned library must meet two conditions:
> >  This section shows how to deal with both versioned and unversioned
> >  pre-built libraries.
> >
> > +.. note::
> > +
> > +   In the shared library article referenced above, the link to the current
> > +   version of the Filesystem Hierarchy Standard (FHS) is out of date;
> > +   the current FHS 3.0 release can be found
> > +   `here <https://refspecs.linuxfoundation.org/FHS_3.0/index.html>`__.
>
> Not sure adding a note to say a link is outdated is the good approach.
> Instead update the link above?

  i'm not sure that's the right way to do it. that old article is
quite a decent explanation of library versioning; if we now link
directly to the FHS spec from the yocto docs and bypass that article,
we lose a lot of good intro-level explanation.

  thoughts?

rday

