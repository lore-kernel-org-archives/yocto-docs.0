Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75388E706F3
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 08:52:48 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.11603.1695286366842091947
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Sep 2023 01:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjFQS-0005RK-FI; Thu, 21 Sep 2023 10:52:44 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjFQR-007su4-Ap; Thu, 21 Sep 2023 10:52:43 +0200
Received: from rhi by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjFQR-00CZdk-1k; Thu, 21 Sep 2023 10:52:43 +0200
Date: Thu, 21 Sep 2023 10:52:43 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org, yocto@pengutronix.de
Subject: Re: [docs] [PATCH 2/4] contributor-guide: recipe-style-guide: add
 some more patch tagging examples
Message-ID: <20230921085243.yunlcrdstdwpthld@pengutronix.de>
References: <20230920100647.1038583-1-rhi@pengutronix.de>
 <20230920100647.1038583-2-rhi@pengutronix.de>
 <6e8be021-45ef-0b0e-5956-31fb1a252575@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e8be021-45ef-0b0e-5956-31fb1a252575@bootlin.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Sep 2023 08:52:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4285

On Wed, Sep 20, 2023 at 04:16:12PM +0200, Michael Opdenacker via lists.yoctoproject.org wrote:
> 
> On 20.09.23 at 12:06, Roland Hieber wrote:
> > Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> > ---
> >   .../contributor-guide/recipe-style-guide.rst     | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> > 
> > diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> > index 52ab4523c49f..4faadcd122d8 100644
> > --- a/documentation/contributor-guide/recipe-style-guide.rst
> > +++ b/documentation/contributor-guide/recipe-style-guide.rst
> > @@ -347,6 +347,22 @@ Here's an example of a patch that has been submitted upstream::
> >   A future update can change the value to ``Accepted`` or ``Denied`` as
> >   appropriate.
> > +Another example of a patch that is specific to OpenEmbedded::
> > +
> > +   Do not treat warnings as errors
> > +
> > +   There are additional warnings found with musl which are
> > +   treated as errors and fails the build, we have more combinations
> > +   than upstream supports to handle.
> > +
> > +   Upstream-Status: Inappropriate [oe specific]
> > +
> > +Here's a patch that has been backported from a pull request::
> > +
> > +   include missing sys/file.h for LOCK_EX
> > +
> > +   Upstream-Status: Backport [https://github.com/systemd/systemd/pull/28651]
> 
> Could we instead use an example giving a commit instead of a pull request?
> With a pull request (like this one), it's hard to see what the final commit
> was, and we have to follow the link to double check whether the request was
> merged or not.

Yes, that also makes more sense to me. But note that GitHub URLs
pointing to a commit also work if the commit in question was not yet
merged (or even if it is only available in a fork), so you'd still have
to click on the URL or check for the commit ID in the Git repo yourself
to see if it was merged (however this way you have the commit ID
directly in the patch).

 - Roland

-- 
Roland Hieber, Pengutronix e.K.          | r.hieber@pengutronix.de     |
Steuerwalder Str. 21                     | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686         | Fax:   +49-5121-206917-5555 |

