Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6D6CD5BA0
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 08:42:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19384.1763023345665810376
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 00:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lWwcqL3e;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A25BF1A1A71
	for <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 08:42:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 797506068C;
	Thu, 13 Nov 2025 08:42:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D992102F1BFF;
	Thu, 13 Nov 2025 09:42:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763023343; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1J5GSA++MgNwOrwmh7AAi/uSQjmvq326P993Tmd8GCA=;
	b=lWwcqL3eLNzrZ/5qnX7QbnVfTVJIQZpMjdWSokVXux2E8FzYlbRpk9jUcHZhTwANYgLkku
	TlARGZ59Mjb/LEc51XPo0VZumExBCyxg738KQOUBzQieWJtihLoPPFbDnXurbrnZroqeO1
	NxFOFVnCfjyhgiHYlqao1YQgeUoKHRC79Sczqhx6gtPdTR8QfMmldMqz2Yzezezhs1y3mk
	od41G1mzRz8TwfzsskD0V74YQKt0lReko1hU7OFa0vyOVpCJ+ciPKa7yZgEAjZZGLNtHmV
	vsz2PrYUy2YNCcCul/UEYPt6W52uDVLBRwBtZ4OekfHiB3Ai+fAqMh7qakJJuA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Nov 2025 09:42:21 +0100
Message-Id: <DE7FM5UY8B22.3BSZWV4MP4558@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <daniel.turull@ericsson.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] vulnerabilities: add section for kernel CVEs
 vulnerabilities
References: <20251110084548.3333453-1-daniel.turull@ericsson.com>
In-Reply-To: <20251110084548.3333453-1-daniel.turull@ericsson.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 08:42:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8026

Hi,

Thanks for the revised patch. I've noticed some minor formatting/spelling f=
ixes
I've pushed here:
https://git.yoctoproject.org/yocto-docs/commit/?id=3D70cb90312e23b4b1a531b3=
ec9bd03232ab116e99

Let me know if they make sense to you, I'll just integrate them in your pat=
ch if
they do.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


