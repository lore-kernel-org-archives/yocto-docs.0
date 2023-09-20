Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D12DCE79BE
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:09:56 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.34281.1695204587171722287
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 03:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu9R-0008Ge-Ac; Wed, 20 Sep 2023 12:09:45 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu9Q-007erl-RL; Wed, 20 Sep 2023 12:09:44 +0200
Received: from rhi by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu9Q-00B89y-Gi; Wed, 20 Sep 2023 12:09:44 +0200
Date: Wed, 20 Sep 2023 12:09:44 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org
Subject: Re: [docs] [RESEND] [PATCH] contributor-guide: add docs for
 Upstream-Status patch headers
Message-ID: <20230920100944.2orm2thm5ekqsngt@pengutronix.de>
References: <20230919125757.1571746-1-rhi@pengutronix.de>
 <20230919125757.1571746-2-rhi@pengutronix.de>
 <d3358ebb-5918-aaab-1a86-4236ce9b8854@bootlin.com>
 <CANNYZj9sEW_cBLppDmfkk+Hoo628G3WTiH9SBL3TY6iWcd9Nvg@mail.gmail.com>
 <4670f2e9-971a-3ced-3b5a-b551b1ba558f@bootlin.com>
 <CANNYZj-7C_DeNgVCyRuHRCXZNX-2JPcnysKLn7gQq8w-4aAkNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj-7C_DeNgVCyRuHRCXZNX-2JPcnysKLn7gQq8w-4aAkNA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 10:09:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4268

On Wed, Sep 20, 2023 at 12:00:07PM +0200, Alexander Kanavin wrote:
> On Wed, 20 Sept 2023 at 11:47, Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
> > This definitely makes sense. We could propose documentation changes are
> > the reason strings are not specified in the code. However, isn't this
> > something we should discuss first with a wider audience, for example
> > using the openembedded-core mailing list?
> 
> I can't parse the second sentence :)
> We can notify about these changes outside of the docs list, but
> otherwise as long as the language makes room for other options (e.g.
> saying that there can be other reasons, but they must be clearly
> explained) I don't think this is particularly controversial.
> 
> We should also explain that Pending is something that should not be
> misused as 'I can't be bother to submit upstream', and must have some
> genuine obstacle to immediate upstream submission - just need to find
> polite phrasing for that :)

Ah – just saw this mail after having sent out the patch series already.
Feel free to leave that one out for now if more discussion is needed.

 - Roland

-- 
Roland Hieber, Pengutronix e.K.          | r.hieber@pengutronix.de     |
Steuerwalder Str. 21                     | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686         | Fax:   +49-5121-206917-5555 |

