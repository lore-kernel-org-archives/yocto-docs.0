Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46440C79FA7
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:31:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30380.1788769876539481903
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=zmcT+Whm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CF88E4E4155F;
	Mon,  7 Sep 2026 08:31:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3D8360383;
	Mon,  7 Sep 2026 08:31:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AACDD11C7AF0C;
	Mon,  7 Sep 2026 10:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788769874; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ki7gmfhG3bqsLrhKYIgECxIWE+CCBDJrEAxd+9hvPSY=;
	b=zmcT+Whm4ZeVySnTMte69YjdopK7c/EAaiUImRTyxBt2jN0bQoGBei9+Xh244hH7m1Mx4Q
	6WmUoKXhgXrezkUiF5wRWiA+Gr3hPdTeDlx8oQ+t7cy2GF7Y29D40ZuMqDLI86ezr3xsB3
	qOphCHmQ/SU9g4leyPieoRwGn0l207deo5VSNZTR9amkxGzOpTXYoGlalP8nss4wU9GLuo
	G8pT6l38FWK0x0BJz+V8Fd+0V1Q4t+iA7jjH26dIgLku5IObbM91mo3wyONGQApSnzagYz
	52trNinGXJ0iFHn6u9IrfcjQ9L3wnRCSySm+lHPGC3CYdKaYrCqXox3jgNzNmA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [PATCH] Makefile: remove unused O variable
Date: Mon,  7 Sep 2026 10:30:20 +0200
Message-ID: <178876977223.61738.7028234106609708133.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821-remove-o-makefile-v1-1-fe61b5cf7fe1@bootlin.com>
References: <20260821-remove-o-makefile-v1-1-fe61b5cf7fe1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:31:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10438

Applied, thanks!

[1/1] Makefile: remove unused O variable
      commit: 95cd0999707926ce1e1cae6c4f58caee7286ac36

