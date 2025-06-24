Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A34C7EE2A
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 08:19:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.3515.1750753182784660978
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 01:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=yiYsejnO;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DDYYvYY1tsUL0K7SIVlf906Fxt4Q4IsmYOpZwaei2pY=; b=yiYsejnOh2rxQYUzw5yw7MfXAu
	givohHe90i0YXaapNq07YBYLugn77KwunQlB3DM5ciF1yo6D3Bh0JWk77voeHkZIPTU5Gr3s56Vvi
	Yl73McQCAMEiQPtLyQBMS7SRhXd9v8HU5w2eKCRWQG26tVCW2e9RuEG0W5wJbZy4CC5/bnB7jsIim
	9ezAgdo6BIQNLh/0msksZ97X1O1ytOpdmOb+X8cqNDINGul0dHYnWI1aA03MdqdP5pBWcs4rsxY3b
	LfjMTMSSVbSQuzjoVpfwaaa69vRqaHF47NnqRnPeFpZ/C6P6kLt3ajK1S/Tq5P1vpMml6J7AnT6yu
	iE1cpW2w==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:60086 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTysU-0000000DwA0-3jTq;
	Tue, 24 Jun 2025 04:19:41 -0400
Date: Tue, 24 Jun 2025 04:19:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: some minor cleanups to "Pre-Built
 Libraries"
In-Reply-To: <DAULKYBT3POY.38V8CSIV0F8K0@bootlin.com>
Message-ID: <26af7080-8fd3-1010-4c3c-66bfc1e2e057@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7189

On Tue, 24 Jun 2025, Antonin Godard wrote:

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
>
> >  Versioned Libraries
> >  ===================
> >
> > @@ -79,7 +86,7 @@ To write a recipe to use such a library in your system:
> >  -  The vendor will typically ship release builds without debugging symbols.
> >     Avoid errors by preventing the packaging task from stripping out the symbols
> >     and adding them to a separate debug package. This is done by setting the
> > -   ``INHIBIT_`` flags shown below.
> > +   ``INHIBIT_*`` flags shown below.
> >
> >  The complete recipe would look like this::
> >
> > @@ -170,7 +177,7 @@ as follows::
> >  The modifications cause the ``.so`` file to be the real library
> >  and unset :term:`FILES_SOLIBSDEV` so that no libraries get packaged into
> >  ``${PN}-dev``. The changes are required because unless :term:`PACKAGES` is changed,
> > -``${PN}-dev`` collects files before `${PN}`. ``${PN}-dev`` must not collect any of
> > +``${PN}-dev`` collects files before ``${PN}``. ``${PN}-dev`` must not collect any of
>
> Can you send this in a separate patch?

  do you mean the FHS fix as one patch, and all else as a second
patch?  can do.

rday

