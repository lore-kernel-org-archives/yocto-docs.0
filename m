Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEF3CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 11:07:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.16949.1758020859369713822
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 04:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MtqOSCrh;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 378FE4E40BE1
	for <docs@lists.yoctoproject.org>; Tue, 16 Sep 2025 11:07:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 066946061E;
	Tue, 16 Sep 2025 11:07:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83ADF102F16BE;
	Tue, 16 Sep 2025 13:07:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758020856; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XnINMRhimT6VdqCkN0h1R1fzuZ9abgrXD5slRPdutes=;
	b=MtqOSCrhgdfOWnhA/8HPVGSd8L5hHMC6JnPDjcASRCIFwlQrCcruRpgm+QuAjQhEyx2vKD
	gLB5Etv6jNouRnFa242lvoOu/vlKs4La81jtNFzKiQWJP5mmKI3KgdMfbWX/EFSdyuVndQ
	ehxN5mXbTxn6Og/d5AlLeOqqLh3EnO/qkuxPBW8EwTaQZx+HLNYdNJN0JKdVUwEYDMj+0p
	26eU6DhakrE9tucHdw9ltBG9nI9vray5UQHU45G92Iz68MSzYlRekP/NxoGXB7FFd1h2oj
	w0LpeNVFuixP1xItw3ghCmBMHF2v78+aseIMgp7WV48f+ivlBpVnHgpWaPHoMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 13:07:26 +0200
Message-Id: <DCU6DNL4T7FE.WWFG4H593ZJH@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <peter.marko@siemens.com>, "Quentin Schulz" <quentin.schulz@cherry.de>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] vulnerabilities: update nvdcve file name
References: <20250824145316.1098911-1-peter.marko@siemens.com>
 <44868213-2ff2-44bf-89a6-48e1dc6d3b80@cherry.de>
 <AS1PR10MB569701155DB1D9EDD00A2C2BFD14A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569701155DB1D9EDD00A2C2BFD14A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Sep 2025 11:07:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7524

On Tue Sep 16, 2025 at 12:39 PM CEST, Peter Marko via lists.yoctoproject.or=
g wrote:
> Hello,
>
> I just wanted to say that I'm back from vacation and will try to submit p=
atches for LTS branches still this week.

I backported this patch to walnascar, as part of the pull request from Frid=
ay
last week.

I think you could send a separate patch for the new fetcher on scarthgap if=
 you
have the time.

Thanks!

Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


