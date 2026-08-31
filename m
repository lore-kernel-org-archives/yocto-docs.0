Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91585C624C2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 08:18:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25150.1788164327124067171
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 01:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=F0rexcK4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D3FCC4E41464
	for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 08:18:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1926601E1;
	Mon, 31 Aug 2026 08:18:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6ECE611C783B9;
	Mon, 31 Aug 2026 10:18:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788164324; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8R0fLU9Lom+pvEdT4yk3S3VKHUtI5Zf8gUydIMFyubA=;
	b=F0rexcK43/QxgKV3NHREQmF8tY4fUxU9CrV4FFMOVkov1yBag6hLoPHkwefUab+NyEN8Y2
	JEVXzKpIhKofSOP/8iUylgQvfw47BtXdF7nUUAZ149E3uxDAF3zZyoUOVEKj5je9+CgWE9
	4HHBKLsE/xPjOyEKWoVBOicHRx4WwnMAjqHZSRtjZsYrxpdqinSxeowTJNEv1Fzngoq2U4
	otVsAL/5NIgcxWaEQ63w8hIT+P5RI+LHuSnAUsNWvU0WtH0W74bNZY+3sfYbhxpjgkOdcR
	bDKU06UzHK5aTBJ7IcRXUfCD2nCyMSUdQi3jtWn5UVC4imEC0cqOp7gO2FaG/Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 10:18:42 +0200
Message-Id: <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
Subject: Re: [docs] [PATCH] docs: document the conventions used in the
 manuals
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260831031458.4070250-1-twoerner@gmail.com>
In-Reply-To: <20260831031458.4070250-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 08:18:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10414

Hi,

On Mon Aug 31, 2026 at 5:14 AM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
> The manuals use angle brackets for placeholders and a prompt to mark a
> command, and say so nowhere. A reader can only infer both, and one
> example reads as advice to paste a line that will not parse.
>
> Include the new section from every manual, the way the boilerplate is
> included, so each is self-contained.

We already have a standard.md document that explains these kind of things. =
I
think it would be more appropriate to add these conventions there.

Thanks,
Antonin

