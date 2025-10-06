Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17219CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 07:55:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.28386.1759737308582306886
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 00:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yDVUgEBG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C57031A11A0
	for <docs@lists.yoctoproject.org>; Mon,  6 Oct 2025 07:55:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AE91606F2;
	Mon,  6 Oct 2025 07:55:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D83E102F1CA4;
	Mon,  6 Oct 2025 09:55:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759737306; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n6DQyW8YuCycNq56LRm0HHPy7vBM7xJYcWTKUxiEiX4=;
	b=yDVUgEBGLaQJD3Vju/ZM0St7s5q/auXHHuF/l0bjDTC7a3ajAQitHD2Bjhmd8dDgufYbCg
	QDpL7fwHyonzaJnnRBcGf0psSs4SxXcbZLvKEKDfHvJ9nLmBGf7M3T4WNkMR1ZxdEnRojq
	3I5GpBZf9agDt8ul3/pdgTiev8aTup8vJBVMJpEtICtu4UX7gSI4GXSNhAu58mS+CA+Dkz
	64OXOEcAAi8RibRbf0RDADRQSfMtDXJBg+eDkKTrJQV4N0WgSbmrkxfgd7sSOJK1mp4R1t
	amrwFxS1sC4yQWWXkDPO3BkeW3xGtW/7U0C+rFW2aH+PIAm+WGhYgN1OG1YsLw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 09:55:06 +0200
Message-Id: <DDB2TABNCZJ2.FMULQF8IFNCQ@bootlin.com>
Subject: Re: [docs] [PATCH 5/5] sphinx-static/switchers.js.in: do not refer
 to URL_ROOT anymore
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <skandigraun@gmail.com>, <docs@lists.yoctoproject.org>
References: <20241106-pdf-xetex-v1-5-044eab7e77d3@bootlin.com>
 <3495.1759732396707921762@lists.yoctoproject.org>
In-Reply-To: <3495.1759732396707921762@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 07:55:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7645

Hi Gyorgy,

On Mon Oct 6, 2025 at 8:33 AM CEST, Gyorgy Sarvari via lists.yoctoproject.o=
rg wrote:
> It looks like that this patch got merged a while ago, but it seems that i=
t is
> not online - at least not for Bitbake documentation. The top switcher is
> complaining that ' can't access property "match", root is undefined' , an=
d
> when i inspect the issue, this commit seems to be missing from the js.

BitBake's documentation is lacking its own proper switchers.js for now. I h=
ad a
plan to fix it but I am lacking the time to finish the work.

I just pushed my local work on bitbake-contrib if you want to take a look:
https://git.openembedded.org/bitbake-contrib/log/?h=3Dcontrib/agodard/fix-s=
witchers-js

The idea is that bitbake should have its own menu with its own versions and
switchers code. Help appreciated!

Also from which version of bitbake did you get this issue? A link to BB's d=
ocs
that reproduces the issue would help.

Thanks for the report,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


