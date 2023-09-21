Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732D6E706F4
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 08:53:58 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.11619.1695286437868353774
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Sep 2023 01:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjFRb-0005nr-QX; Thu, 21 Sep 2023 10:53:55 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjFRa-007suR-Ty; Thu, 21 Sep 2023 10:53:54 +0200
Received: from rhi by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjFRa-00CZfE-Kk; Thu, 21 Sep 2023 10:53:54 +0200
Date: Thu, 21 Sep 2023 10:53:54 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org, yocto@pengutronix.de,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH 3/4] contributor-guide: discourage marking patches
 as Inappropriate
Message-ID: <20230921085354.cfwoukpg5x5eipe6@pengutronix.de>
References: <20230920100647.1038583-1-rhi@pengutronix.de>
 <20230920100647.1038583-3-rhi@pengutronix.de>
 <91629ad7-351b-74d2-133b-ae9805a16c46@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91629ad7-351b-74d2-133b-ae9805a16c46@bootlin.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Sep 2023 08:53:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4286

On Wed, Sep 20, 2023 at 04:19:11PM +0200, Michael Opdenacker via lists.yoctoproject.org wrote:
> 
> On 20.09.23 at 12:06, Roland Hieber wrote:
> > It was never really clear what all those reasons really meant, and every
> > patch submitted upstream liftens the maintenance on the Yocto side.
> > So remove the current list, and replace it with two reasons in which an
> > upstream submission likely won't benefit the upstream project.
> > 
> > Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> > ---
> >   .../contributor-guide/recipe-style-guide.rst  | 30 +++++++++----------
> >   1 file changed, 14 insertions(+), 16 deletions(-)
> > 
> > diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> > index 4faadcd122d8..bc14c58a9759 100644
> > --- a/documentation/contributor-guide/recipe-style-guide.rst
> > +++ b/documentation/contributor-guide/recipe-style-guide.rst
> > @@ -299,22 +299,20 @@ following status strings:
> >   ``Inappropriate [reason]``
> >      The patch is not appropriate for upstream, include a brief reason on the
> > -   same line enclosed with ``[]``. The reason can be:
> > -
> > -   -  ``not author`` (you are not the author and do not intend to upstream this,
> > -      the source must be listed in the comments)
> > -   -  ``native``
> > -   -  ``licensing``
> > -   -  ``configuration``
> > -   -  ``enable feature``
> > -   -  ``disable feature``
> > -   -  ``bugfix`` (add bug URL here)
> > -   -  ``embedded specific``
> > -   -  ``other`` (give details in comments)
> > -
> > -The various ``Inappropriate [reason]`` status items are meant to indicate that
> > -the person responsible for adding this patch to the system does not intend to
> > -upstream the patch for a specific reason.
> > +   same line enclosed with ``[]``. In the past, there were several different
> > +   reasons not to submit patches upstream, but we have to consider that every
> > +   non-upstreamed patch means a maintainance burden for recipe maintainers.
> > +   Currently, the only reasons to mark patches as inappropriate for upstream
> > +   submission are:
> > +
> > +   -  ``oe specific``: the issue is specific to how Yocto performs builds
> > +      or sets things up at runtime, and can be resolved only with a patch that
> > +      is not however relevant or appropriate for general upstream submission.
> > +   - ``upstream ticket <link>``: the issue is not Yocto-specific and should be
> > +      fixed upstream, but the patch in its current form is not suitable for
> > +      merging upstream, and the author lacks sufficient expertise to develope a
> > +      proper patch. Instead the issue is handled via a bug report (include
> > +      link).
> 
> 
> There is a formatting issue here: the second line (starting with "fixed
> upstream") has an extra leading space compared to the first one, and this
> messes-up the way the paragraph is rendered. Check by yourself ;-)

Oh indeed. I'll chalk that up to not enough coffee… :-> Thanks for
catching it!

 - Roland

-- 
Roland Hieber, Pengutronix e.K.          | r.hieber@pengutronix.de     |
Steuerwalder Str. 21                     | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686         | Fax:   +49-5121-206917-5555 |

