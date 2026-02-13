Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD116EE369A
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:07:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67818.1770973652903464644
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 01:07:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=Mf1EPknH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2546D1A0EAB
	for <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFA6A606CC;
	Fri, 13 Feb 2026 09:07:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC645102F2783;
	Fri, 13 Feb 2026 10:07:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770973650; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r1sCKBrc8KCJ3lAxVBpYLyOkHGDqTHF/mqGWimsHGA0=;
	b=Mf1EPknH6FsIC3soXuTxVu0tGliqXT9eOpgDAzfx6aZAh6f8EIlBmnTSGtqJeJEzgs4mBo
	1ncLZTzm2wUFTNlYIwDo/h6STXi6qZXIHHao1lesQKkgWMSn8YTdLwvG7xhfU7Rohx8mNq
	kjSulHb6Qs3CzUhHZkyESbzuoP1HD5dQG1UPlZWPOhhZbwewu2awOW0gE/M3fdA/IV51Nm
	J3E84FODUwu/Vb60bNKRE0kE823M+qqdZFXEznjwgE0794QeVrdZeUN1qGbusCozCtSprw
	f6GTYAWUPywNNS4azKz8hrGzifi8jN7y+/DPK7k/Pf/eNhwobm/6xV+0ImfP6g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] brief-yoctoprojectqs/index.rst: remove extra word from text
Date: Fri, 13 Feb 2026 10:06:53 +0100
Message-ID: <177097354650.48715.16337616993811329389.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203104546.4046-1-rahimi.mhmmd@gmail.com>
References: <20260203104546.4046-1-rahimi.mhmmd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8914

Applied, thanks!

[1/1] brief-yoctoprojectqs/index.rst: remove extra word from text
      commit: 37667bcc66cb110dd48272c06e7395af4040e0cf

