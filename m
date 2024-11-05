Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1012FD12671
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 09:36:08 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.14137.1730799359913088686
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 01:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1t8Fyg-0006Sq-Gs; Tue, 05 Nov 2024 10:35:58 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1t8Fyf-0027f5-2q;
	Tue, 05 Nov 2024 10:35:57 +0100
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1t8Fyf-00FJSA-2a;
	Tue, 05 Nov 2024 10:35:57 +0100
From: =?utf-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
To: "Julien Stephan" <jstephan@baylibre.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v3 3/3] dev-manual: add bblock documentation
In-Reply-To: <20241105-add-bblock-documentation-v3-3-b870ded39a2d@baylibre.com>
	(Julien Stephan's message of "Tue, 05 Nov 2024 09:17:37 +0100")
References: <20241105-add-bblock-documentation-v3-0-b870ded39a2d@baylibre.com>
	<20241105-add-bblock-documentation-v3-3-b870ded39a2d@baylibre.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Tue, 05 Nov 2024 10:35:57 +0100
Message-ID: <6rh68mqayq.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 09:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5677

On Tue, Nov 05 2024 at 09:17 +0100, "Julien Stephan" <jstephan@baylibre.com=
> wrote:
> bblock is a helper tool to lock/unlock tasks and recipes to specific
> signatures. Add a documentation page for it.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  documentation/dev-manual/bblock.rst    | 129 +++++++++++++++++++++++++++=
++++++
>  documentation/dev-manual/index.rst     |   1 +
>  documentation/ref-manual/structure.rst |   8 ++
>  documentation/ref-manual/variables.rst |   3 +
>  4 files changed, 141 insertions(+)

Reviewed-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

