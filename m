Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594E1CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:25:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1755.1781627106525638686
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 09:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=y0QMLBUg;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+oB4TQdegO+1buSEJFAmzeFBLdknUTT4RUTJz9jdSkQ=; b=y0QMLBUggKjuFAq8suz4oZ/YG6
	iE7sU6UAUe4JCdwIBlk+BjFVpRsFV0cIRQG9GIMXEB84DD0evqI+qpHEuuxMIkke7hC3zAOg1iski
	KyO+FG5buE7coLl3Wbr3WeUO9ndfPQSmg97WOK0C8yAJx67oa9P4f10ayQS0cjIKSZ1xvVkNkNJIm
	NpvmtimKI1w5gD0AVpGMPV/Vm1WlmPB2jP6NhsUQVU2xFc5Ovhbcam6tPSXyJx78uZnbiUHxXgHSL
	ne1W8spFNj4UfepaOraHWSfzNRbVeLCzXL38Yg6XFs4FrX+yi5gRvSblxApVyTbEoQoOhkg4tVMd/
	oBtL56Ig==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:35602 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZWaz-00000007NPu-3BH1;
	Tue, 16 Jun 2026 12:25:03 -0400
Date: Tue, 16 Jun 2026 12:24:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: clarify use of "PACKAGE_ARCH" in a
 packagegroup
In-Reply-To: <DJAKF642PGUJ.38GYK6HMEVQ0I@bootlin.com>
Message-ID: <a2ccfa10-3da6-ab89-507d-58ada402b9ea@crashcourse.ca>
References: <eeebe32f-3a88-90e7-555f-96ada6016c5f@crashcourse.ca> <DJAKF642PGUJ.38GYK6HMEVQ0I@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 16:25:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9759

On Tue, 16 Jun 2026, Antonin Godard wrote:

> Hi,
>
> On Tue Jun 16, 2026 at 3:17 PM CEST, Robert P. J. Day wrote:
> >
> > Warn the developer that if they need to set "PACKAGE_ARCH" in a
> > custom packagegroup file, that setting must precede the "inherit
> > packagegroup" line in the packagegroup recipe file.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/dev-manual/customizing-images.rst b/documentation/dev-manual/customizing-images.rst
> > index 6eed9ef56..606252fe1 100644
> > --- a/documentation/dev-manual/customizing-images.rst
> > +++ b/documentation/dev-manual/customizing-images.rst
> > @@ -183,6 +183,18 @@ build an image using these package group packages, you need to add
> >  :term:`IMAGE_INSTALL`. For other forms of image dependencies see the other
> >  areas of this section.
> >
> > +.. note::
> > +
> > +   If you're defining a packagegroup and need to set::
> > +
> > +      PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +   for the packagegroup, you need to do that *before* the
> > +   ``inherit packagegroup`` line in the recipe file.
> > +   Setting it afterward can break BitBake parsing, result in
> > +   an "allarch" architecture mismatch error, or allow
> > +   architecture-independent defaults to override your intent.
> > +
> >  Customizing an Image Hostname
> >  =============================
>
> Again, I think this belongs to the packagegroup class documentation.

  ah, the "class" documentation.  got it.

rday

