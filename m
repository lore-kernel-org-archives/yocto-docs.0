Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F927CD8CAC
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73961.1780990118147572106
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=lD49/TSz;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 930A44E42C6F;
	Tue,  9 Jun 2026 07:28:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67FD65FFC1;
	Tue,  9 Jun 2026 07:28:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48C4C106A2A05;
	Tue,  9 Jun 2026 09:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KoYmuQH6x8BVRJ5WhiBC/iR152EU0dbRKzt0tfAeipI=;
	b=lD49/TSzkHu0Cm5++pTGRQ/5By9mRgNgApv6p+5L2X63GxFals4KJ7Uxa9E71O9iGnJ1PF
	rICtz2PC5vLRSgDx/go4preM//rwJdPqpnohmHKOrOCNK3tyJVAUX+Tjh7kiF1Hbisbh0L
	4Z2z3ywf1jfHXqEPlboFLADrJf+Kkr1ZkAlRMrtfcw7nZ+tP3jb6DgwNIj30CXdCGKezil
	X7tDnGPN8CHjI5Qx+nwef4gx2nG0dfRPia8mx5iA43EEKYN6fBjrYZfZuAyy9SlaDmw1OB
	S9m8wTKwYIoBPlvZgK9UOvfWenHu+yq++2Gow31/pqG9Svgm6BrdUftcByZWpg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] bsp-guide: mention bootloader and device tree in BSP intro
Date: Tue,  9 Jun 2026 09:27:05 +0200
Message-ID: <178099000071.200930.1561447179622292581.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9c88b765-1ae9-ec34-aafc-461613b132e1@crashcourse.ca>
References: <9c88b765-1ae9-ec34-aafc-461613b132e1@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9640

Applied, thanks!

[1/1] bsp-guide: mention bootloader and device tree in BSP intro
      commit: a6eca1e7c67225de8b32638b4ba10aa73efe5030

