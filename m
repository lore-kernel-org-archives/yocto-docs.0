Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A860D10F33
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 12:24:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11869.1764159871740578150
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 04:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EjYqVcnd;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 91420C15D73;
	Wed, 26 Nov 2025 12:24:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C00060721;
	Wed, 26 Nov 2025 12:24:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AFD7102F08E8;
	Wed, 26 Nov 2025 13:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764159868; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fm8EXxvj/8IMxHpndWt91kN4KZMq4cdknzIkrNJHnEQ=;
	b=EjYqVcndaTnA9xpjzLOdF72nKjxhge567On3TV3xTAzJbCiAwteHAu3YzAWUHo2alJZ5c8
	gTizir8tEAT52455hgBUKpyv2ULDG3QD/yVuHqaSdc+84fpbnUR/2+TVclyHyEKfbQnlxz
	K3M7/Yne8Y9jZWqoY9IGWLmyVz0+7GmZnUY5JdW4g623Z6xoOdL/MSPhO1LasBegUGGFVm
	pT6ofKH+SJ4ErXS22blNrJDX8Wu2zI7ZX/XeQbZm6X85AnM5iC3rS2NHAuKMV5rsRZdeU5
	Xpjrxia4t6Kmag4BJFDzjv+CIwl3T/XEF4Y690iwG74SOlefhoxbt8dStTg7wA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 13:24:26 +0100
Message-Id: <DEIMHA9D2QJK.337TAM5EX1ME1@bootlin.com>
Subject: Re: [PATCH v5] ref-manual: Document SPDX 3.0.1 variables
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, "Freihofer, Adrian"
 <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Tondo, Stefano" <stefano.tondo.ext@siemens.com>, "stondo@gmail.com"
 <stondo@gmail.com>, "docs@lists.yoctoproject.org"
 <docs@lists.yoctoproject.org>
References: <20251125100114.24243-1-stondo@gmail.com>
 <DEHSVACWEQGR.3LSFE5DPMX6O8@bootlin.com>
 <AS4PR10MB51507872845B518128E53BFEACD1A@AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS4PR10MB51507872845B518128E53BFEACD1A@AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 12:24:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8124

Hi,

On Tue Nov 25, 2025 at 2:41 PM CET, Stefano Tondo wrote:
> Hi,
>
> Given what I was currently working on and the state of my local repo, I t=
hought it was smart for me to create a small script to automate the fixing =
and it ended up in a huge mess, sorry.

I use b4 to manage patches/patch series which has been working well for me:
https://b4.docs.kernel.org/en/latest/

> Now I manually checked and it seems fine. I really hope I didn't miss any=
thing else anymore.
> V6 is going to be submitted soon..

Thanks, received, I'll take a look.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


