Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF1EEDF023
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:07:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67816.1770973651420681616
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 01:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=jF/VAhhi;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E09484E40D2E
	for <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7D39606CC;
	Fri, 13 Feb 2026 09:07:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 498B810368E28;
	Fri, 13 Feb 2026 10:07:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770973649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rAkbyfbCB+XmGOs46wqlUNcyB0mM2ZoG6yjWDcF0CzY=;
	b=jF/VAhhiPsZB9SeRzXcWnm9SxdviWW63r7KE9nY7Xz+TOy9VymgmvE0OrLJXWAGnc+6St3
	kwHxfEZtTVIG3SuWOf0zMJm+ab+PMUA1faQA5dq5o3O1g8EhTicxhcjxdJZP2+gua83RqO
	yoxS3Vj1mqp/YxdZ8c55qCnPaJq2pztaGE/4vst5AVPByEALhf+qYXnB881YxOXpj3R7Ft
	CI0xd6nwjg0sv6qxEPi8x6Xm54mqerqocEiw+Kwz6wACnl6KOo7dGP1MK3vEyWvX53pZg4
	6l+if6+DIqDHDJILVgQgUr9P78DvOUn7jwQ67I9yfWvh1kIT5YPEf89NX3GGvQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	paul@pbarker.dev
Subject: Re: [PATCH] document the OPENSSH_HOST_KEY_DIR and OPENSSH_HOST_KEY_DIR_READONLY_CONFIG variable
Date: Fri, 13 Feb 2026 10:06:52 +0100
Message-ID: <177097354654.48715.10905716083167032246.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205211834.12440-1-patrick.vogelaar.dev@mailbox.org>
References: <20260205211834.12440-1-patrick.vogelaar.dev@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8913

Applied, thanks!

[1/1] document the OPENSSH_HOST_KEY_DIR and OPENSSH_HOST_KEY_DIR_READONLY=
_CONFIG variable
      commit: 5fd9d1602e9cbd17ca12cac1bd2f5798e7c6eacf

