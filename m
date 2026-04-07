Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7DBFEEF3E
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:15:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80948.1775567707547131147
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 06:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=l2rYKBa7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0D2624E42947;
	Tue,  7 Apr 2026 13:15:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D71DD603C7;
	Tue,  7 Apr 2026 13:15:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B3A2104500ED;
	Tue,  7 Apr 2026 15:15:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775567705; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tiTESe2IxyduKsE+MIf4mTnkP18OI6/ygHHK2T6xAVI=;
	b=l2rYKBa7PU7l7YQv/P709uxfeWbmU5+eQ/7l5Mz0SPCmEcock2oSjcJWwIm4EUk3G7rGN7
	RaeL4mQH0iaFVaeHhJeZm/HP1nCeT6r/TaErv7if9tbfC4iYRAOw5J5JapaEbW7jyMF671
	MxDeY2BLYcKmFPttw1Dm6ax7b1TtNfy8+4uCBaNLIiR16V2fjlg+rMnv53dg7eFHBYcIDk
	8XgP8FoIojNlmdpjJo6H2YHavXPcbMlRza46efuIP2sifMAbppRMZ6Rgdc+IAW0L2v/p/F
	QiDAvpFpRFQolpyH3VP8rtPJfroVv5FgjBL0TUPr0qRDt+3eyP20f9W9m9mlQg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 15:15:03 +0200
Message-Id: <DHMY7YER91Y5.2IY9QR1J6D67K@bootlin.com>
Cc: "Antonin Godard" <antonin.godard@bootlin.com>,
 <Peter.Marko@siemens.com>, <adrian.freihofer@siemens.com>,
 <jpewhacker@gmail.com>, <stefano.tondo.ext@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <docs@lists.yoctoproject.org>, <stondo@gmail.com>
Subject: Re: [docs][PATCH] ref-manual/dev-manual: document new SPDX
 variables and capabilities
References: <20260317085735.32664-1-stondo@gmail.com>
 <177556742859.245356.4667804354467853669.b4-ty@b4>
In-Reply-To: <177556742859.245356.4667804354467853669.b4-ty@b4>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Apr 2026 13:15:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9196

On Tue Apr 7, 2026 at 3:11 PM CEST, Antonin Godard wrote:
> Applied, thanks!
>
> [1/1] ref-manual/dev-manual: document new SPDX variables and capabilities
>       commit: b8502b2ba5707b7036c26f9218b5846e0ed2ffb8

Sorry, obviously, only v2 was merged but my tool decided to reply to your v=
1
too.

Antonin

