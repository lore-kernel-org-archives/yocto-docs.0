Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C5DD13C39
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:39:28 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23041.1769441963948152628
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 07:39:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TckAEkj3;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 21C104E4229F
	for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 15:39:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E735E60717;
	Mon, 26 Jan 2026 15:39:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A678E119A8409;
	Mon, 26 Jan 2026 16:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769441961; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NF14cVQp2TnCwWKu3l3kadxwKDR/1r9UFo7tj9XKREM=;
	b=TckAEkj3ebbeEhdu7YVKhsFc0WVtdgWrDA1Xak+ivRFRJiXrmeAhhHIABh77osUfGT7aXR
	86QzUORFpWigA3zGU5AkMHYJOAvgY7IC00sMSZVP/A48J0ATUDslfEJe2BmF0BRaqVf+Nt
	P3SP/aNDthOO0HhYM0RRmFtqoivNE9bvIqjphMwxSLkeaq37OA+rirUINRGCCKV7sy4iUJ
	lreCwXKNuzunMbtyWIM0qsy1YAtKBMqP8fIZhLA9CwwcskL0AQarVM0Y7MG2j5CrQMdfzS
	KR7jF/tob0LQ5ong7tdddLBRUPLNn56OnA4P6QlkYZcdmeS8KHRGolFwxHoKlg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 16:39:20 +0100
Message-Id: <DFYMTQOITQJO.3V0CH9BSU5QOC@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 32/53] toaster-manual: remove obsolete poky repo
 references
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-32-658a5f4dbde2@bootlin.com>
 <c1558d5e-c1ed-49a0-b0d2-8761c47d3c25@cherry.de>
In-Reply-To: <c1558d5e-c1ed-49a0-b0d2-8761c47d3c25@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 15:39:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8652

Hi,

I'm going to drop this patch as you correctly pointed to some diffs which s=
eemed
wrong. To be fair, I tried setting up Toaster and failed. I will try to wor=
k on
it at later point.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


