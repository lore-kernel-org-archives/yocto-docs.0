Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99AFCE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:56:44 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.33157.1695200200579540559
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qit0g-0003MH-Iu; Wed, 20 Sep 2023 10:56:38 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qit0f-007eAi-AX; Wed, 20 Sep 2023 10:56:37 +0200
Received: from rhi by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qit0f-00B7FJ-0R; Wed, 20 Sep 2023 10:56:37 +0200
Date: Wed, 20 Sep 2023 10:56:37 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RESEND] [PATCH] contributor-guide: add docs for
 Upstream-Status patch headers
Message-ID: <20230920085637.ypa3jr676bdqocf5@pengutronix.de>
References: <20230919125757.1571746-1-rhi@pengutronix.de>
 <20230919125757.1571746-2-rhi@pengutronix.de>
 <d3358ebb-5918-aaab-1a86-4236ce9b8854@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3358ebb-5918-aaab-1a86-4236ce9b8854@bootlin.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:56:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4258

On Tue, Sep 19, 2023 at 04:06:39PM +0200, Michael Opdenacker wrote:
> Hi again Roland
> 
> On 19.09.23 at 14:57, Roland Hieber wrote:
> > Port and update the text from the OpenEmbedded wiki page [1], which has
> > since been deleted and replaced by a link to the Contributor Guide
> > (where not everything is available yet). The original text was available
> > under Creative Commons Attribution-ShareAlike 3.0, and the original
> > authors were wiki users Mhatle, Mariano, Benjamin, and McFrisk.
> > 
> >    [1]: https://www.openembedded.org/index.php?title=Commit_Patch_Message_Guidelines&oldid=10935
> > 
> > Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> > ---
> >   .../contributor-guide/recipe-style-guide.rst       | 119 +++++++++++++++++++++
> >   1 file changed, 119 insertions(+)
> 
> 
> Thanks for this update, but I told, I couldn't find your original
> submissions, and since then, I already merged such documentation into
> master-next.

I resent them because apparently my first submission did not appear on
the web archive (maybe because I was not yet subscribed to the group,
but got auto-subscribed after the submission…?) and I wanted to make
sure they made it through.

> However, I see that the version on master-next
> (https://docs.yoctoproject.org/next/) doesn't cover CVE tags yet, and your
> patch did. Would you be interested in sending an update against master-next
> if necessary, knowing that there is also documentation on https://docs.yoctoproject.org/dev-manual/vulnerabilities.html#fixing-vulnerabilities-in-recipes?

Ah, I didn't see the master-next version yet! I'll rework my patches and
send a new version for the one patch that was not applied yet.

> I'd also like to more details about the "Inappropriate" reasons. For
> example, I don't have a clue what "native" would mean. Why would be patch be
> rejected upstream because it only applies to the x86 host platform?
> 
> Last but not least, we'd need to deprecate the "Accepted" reason and
> recommend "Backport" instead (see https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes).

Phew… I have the same questions as you… I only ported the existing
text from the wiki… :D But I think what Alexander wrote in the other
message in the thread seems reasonable, I'll keep that in mind for v2.

> I can work on this but your help would be much appreciated. Let me know :)

 - Roland

-- 
Roland Hieber, Pengutronix e.K.          | r.hieber@pengutronix.de     |
Steuerwalder Str. 21                     | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686         | Fax:   +49-5121-206917-5555 |

