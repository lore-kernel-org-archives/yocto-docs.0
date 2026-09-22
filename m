Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828E8C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 12:23:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8849.1790079817290532259
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 05:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kbO6GBYx;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9DF571A0FCC
	for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:23:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BBA160580;
	Tue, 22 Sep 2026 12:23:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EEF6103289FC;
	Tue, 22 Sep 2026 14:23:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790079810; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yGvG1lBppsvi7+vzpi7jPkCfuEfl/mlIlGE6TS1dvio=;
	b=kbO6GBYxi/aH7Rt7xfKPMhCDsimKyGbtjvBepyIxeKCusTyVcIprKGDZGi3th46uRbFOcs
	OVRbavGtwNGQb6e9JulZ5gN2Bd/ugVF3LcUsmI7gYs12Dcc5fvDR1pXRiupz1eqlTM/Ial
	4eip9L59912H5jAWrsIJ2LORlNx+aK2HnV2M7bCcelsXyRvgy/yoz5LnA7zneCEI5+2slp
	AwjEAEqxCT0chFq4ZZxIhM8jzyhsGSqqAYKR4fYfS8bArSohijSbBOPCz9vNHDf8JtI/9d
	49ju0oEhX9gqiUpA32QNu0Wpc1M96GpdIGK4XwZWdDoSlE2SzRzHM4vKlbvDag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 14:23:29 +0200
Message-Id: <DLLUBZUM9H1E.3K1ERG30BS63G@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3] docs: document the conventions used in the
 manuals
References: <20260922120620.2386763-1-twoerner@gmail.com>
In-Reply-To: <20260922120620.2386763-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:23:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10585

On Tue Sep 22, 2026 at 2:06 PM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
> The manuals use angle brackets for placeholders and a prompt to mark a
> command, and say so nowhere. A reader can only infer both, and one
> example reads as advice to paste a line that will not parse.
>
> Add a page stating them, in the sidebar beside the other top-level
[...]

Applied to master-next, thanks!

Antonin

