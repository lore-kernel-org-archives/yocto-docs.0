Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6269CE7A94
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 10:48:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.57920.1695638918430956979
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Sep 2023 03:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qkj8m-0007Zy-Nh; Mon, 25 Sep 2023 12:48:36 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qkj8l-008qc4-OC; Mon, 25 Sep 2023 12:48:35 +0200
Received: from rhi by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qkj8l-000nQq-Ez; Mon, 25 Sep 2023 12:48:35 +0200
Date: Mon, 25 Sep 2023 12:48:35 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org, yocto@pengutronix.de
Subject: Re: [docs] [PATCH v2 5/5] contributor-guide: style-guide: discourage
 using Pending patch status
Message-ID: <20230925104835.x4mlrgy24ord54r2@pengutronix.de>
References: <20230922100006.756477-1-rhi@pengutronix.de>
 <20230922100006.756477-5-rhi@pengutronix.de>
 <65e503d6-5609-c8d4-6be2-6c9635445f2d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <65e503d6-5609-c8d4-6be2-6c9635445f2d@bootlin.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Sep 2023 10:48:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4298

On Fri, Sep 22, 2023 at 03:14:25PM +0200, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Roland
> 
> On 22.09.23 at 12:00, Roland Hieber wrote:
> > Suggested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> > ---
> > PATCH v2:
> >   * new patch in v2, based on feedback by Michael Opdenacker in v1
> >     https://lore.kernel.org/yocto-docs/12ef125b-5466-408c-ec8c-c5bef1510bc7@bootlin.com/
> >     and Alexander Kanavin in
> >     https://lore.kernel.org/yocto-docs/CANNYZj-7C_DeNgVCyRuHRCXZNX-2JPcnysKLn7gQq8w-4aAkNA@mail.gmail.com/
> > ---
> >   documentation/contributor-guide/recipe-style-guide.rst | 8 +++++++-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> 
> Many thanks for these updates!
> For all of them: Reviewed-by: Michael Opdenacker
> <michael.opdenacker@bootlin.com>
> Merged into "master-next".
> 
> Thanks to you, the Contributor Guide has made nice progress this week, and
> we now have a better and up to date reference for people adding patches to
> recipes.

Whee \o/ And thanks for your fixups too!

 - Roland

> Come back anytime :)
> 
> Cheers
> Michael.
> 
> -- 
> 
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4296): https://lists.yoctoproject.org/g/docs/message/4296
> Mute This Topic: https://lists.yoctoproject.org/mt/101518215/5053951
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [rhi@pengutronix.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Roland Hieber, Pengutronix e.K.          | r.hieber@pengutronix.de     |
Steuerwalder Str. 21                     | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686         | Fax:   +49-5121-206917-5555 |

