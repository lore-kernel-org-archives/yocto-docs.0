Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8581FCE7B1A
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 10:49:45 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.10644.1695898181320063343
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 03:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qloaQ-0001VH-Tz; Thu, 28 Sep 2023 12:49:38 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qloaQ-009YZL-03; Thu, 28 Sep 2023 12:49:38 +0200
Received: from rhi by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qloaP-0057iQ-NJ; Thu, 28 Sep 2023 12:49:37 +0200
Date: Thu, 28 Sep 2023 12:49:37 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>,
	richard.purdie@linuxfoundation.org, docs@lists.yoctoproject.org
Subject: Re: [docs][RFC] overview: Add note about non-reproducibility side
 effects
Message-ID: <20230928104937.gvum3l6gefobsbgz@pengutronix.de>
References: <20230926160049.1537656-1-JPEWhacker@gmail.com>
 <6r1qekubtv.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6r1qekubtv.fsf@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Sep 2023 10:49:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4301

On Tue, Sep 26, 2023 at 06:38:12PM +0200, Ulrich Ölmann wrote:
> Hi Joshua!
> 
> On Tue, Sep 26 2023 at 10:00 -0600, "Joshua Watt" <JPEWhacker@gmail.com> wrote:
> > Adds an additional note about some of the side effects that can occur if
> > recipes are not reproducible and hash equivalence is enabled.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  documentation/overview-manual/concepts.rst | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> > index af825a98c..0c2f148c8 100644
> > --- a/documentation/overview-manual/concepts.rst
> > +++ b/documentation/overview-manual/concepts.rst
> > @@ -1963,6 +1963,14 @@ task output from the Shared State cache.
> >     the stability of the task's output hash. Therefore, the effectiveness
> >     of Hash Equivalence strongly depends on it.
> >  
> > +   Recipes that are not reproducible may have undesired behavior if hash
> > +   equivalence is enabled, since the non-reproducible diverging output maybe be
> > +   remapped to an older sstate object in the cache by the server. If a recipe
> > +   is non-reprodible in trivial ways, such as different timestamps this is
> 
> s/non-reprodible/non-reproducible/

I would also include an additional comma after "timestamps".

> > +   likely not a problem. However recipes that have more dramatic changes (such
> > +   as completely different file names) will likely outright fail since the
> > +   downstream sstate objects not actually equivalent to what was just built.
> 
> s/objects not/objects are not/ ?
> 
> Best regards
> Ulrich

 - Roland

> > +
> >  This applies to multiple scenarios:
> >  
> >  -  A "trivial" change to a recipe that doesn't impact its generated output,
> -- 
> Pengutronix e.K.                           | Ulrich Ölmann               |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4300): https://lists.yoctoproject.org/g/docs/message/4300
> Mute This Topic: https://lists.yoctoproject.org/mt/101598940/5053951
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [rhi@pengutronix.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Roland Hieber, Pengutronix e.K.          | r.hieber@pengutronix.de     |
Steuerwalder Str. 21                     | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686         | Fax:   +49-5121-206917-5555 |

