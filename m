Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930EBCD5BB1
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31077.1779347241580425027
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=m+Aq3Ytr;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D7F6D4E429D9
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD3A660495;
	Thu, 21 May 2026 07:07:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAD71107EA6C5;
	Thu, 21 May 2026 09:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JcINksKHHEEQGV7d97sTC6D7xXShyoISjH/4Yo4KEwg=;
	b=m+Aq3YtrhY7Fs0FlvR6X69EmRmLfXMI3lh9Hqd0Nztxa3/OhAUTBbpFAx/W/6dE4YVRXsj
	V79qcuUQucByZp8t9sJBgjZRWHy6BOA+CTLGZ6/oPBvLWTmGZ+34hDfiK5rk1owm44rIKX
	HL9J+t1JGbd5YCmVJRsXd8GYaeJXsgqukvTxrq1PWGN6OYel7Rn2c1UKs1sPXC0AXvGgVa
	V93ZF6JSI86paYGF6U3FeykaVKgpGpNDeAei6TYS4hm7loTvITKhOhPK/Oij7HlqIf4AGz
	Y34OwFwvMjGWbRldy2BdvlN/ngHUcl/NzK4EYT3tDGKle6+NS8qn5x12yKPx6A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] contributor-guide: fix type "maintainance" to "maintenance"
Date: Thu, 21 May 2026 09:06:22 +0200
Message-ID: <177934712561.33890.13477033330378262095.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <3b6ae4f4-b7c8-e196-ccf2-eba99097d5af@crashcourse.ca>
References: <3b6ae4f4-b7c8-e196-ccf2-eba99097d5af@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9502

Applied, thanks!

[1/1] contributor-guide: fix type "maintainance" to "maintenance"
      commit: d7376cca64a0784e59d4fd60b9baefb4da2ce289

