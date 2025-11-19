Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C3DCF34C1
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 14:52:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8773.1763563919141731278
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 06:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FuPlBm1b;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 019EF1A1BE0;
	Wed, 19 Nov 2025 14:51:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD38460699;
	Wed, 19 Nov 2025 14:51:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08C2310371A6A;
	Wed, 19 Nov 2025 15:51:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763563916; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RGs8RWy3k5YoKeDQsNSy00wscozDbmp1fFL0Q5Kie+w=;
	b=FuPlBm1bz9wcrghGZN3nfr+fGdtgrfoDTQPmixx2XsjRa8slgeYDTumguJsj/YbPmXUzKN
	ecwaTc4XOr0Zhbr9c8jtibL4dp78cn1qqw8iHzOVlI3WbAwdIvMrsCcW2/+MF4IoaXywqG
	aE4AIkU1iCtOpCRSO4pd2frLi1QpgBrP+z39zOnW3SzrJzYzOjykm7KHAzk2iS/EWwUaCi
	0VJev5a9hPdBmiGFpMmh3KQ7TcQ7qsmOdh26rDgL5g/BbMJuAy6LnrTHo7rS6FyuywXKQP
	JqdB5F1cPGM2FvVLiv+TBTacHgHIvYfAkJ7W5ouGdLug8n88DF43JhCmdK/7rA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 15:51:55 +0100
Message-Id: <DECR8E8M61T3.3GNZSISKZE9P@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] why is "bitbake-setup list" trying to create a
 bitbake-builds directory?
References: <dc857b9f-0da4-25f4-6cdd-14a60cb8b179@crashcourse.ca>
In-Reply-To: <dc857b9f-0da4-25f4-6cdd-14a60cb8b179@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 14:52:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8089

Hi,

The docs list is likely not the right place to report bitbake-setup bugs. C=
an
you send this to bitbake-devel@lists.openembedded.org so this can get prope=
r
attention?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


