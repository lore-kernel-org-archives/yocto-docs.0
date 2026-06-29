Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEAEC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:04:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87404.1782720281007179685
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ezeO4Npv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3A81D1A0CA9
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10F6D5FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13AE4106F1572;
	Mon, 29 Jun 2026 10:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r1d19bULBa5reMO91wCsTAe6X4S9T3KBW9CCgcO774k=;
	b=ezeO4NpvvlD2rDHT1L7oFp+dRQ7N+uzdPPFh2GJv3u3t0zgCbm0jtRbAJIHrdmVa4Z7LYb
	pOnvrhmZS/yYoNSPPqiY763DFXQvSOFyhPk/qQsU+XsU354MhZkvvyp1VFk/kyNr+45XdF
	NT17AG5q6F+qCmGF4KAPidtyq0RwDLKmNfEWmdReMKib9pMoSaBczbzV2ANpAdA3BDRIrK
	FjHvz5WSd5wfNYoqatwHeKgy62V7K4vYNbMRxxYX6cFpHtIrcbbUCFRMjCZymRGYI7bRJH
	9JeBtuHX1GB/KTztL9kZ8dOYWpGfr5QhCXWEpWMlsy+KOMSR0oicMYCC4Gwyog==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] Document shared state signing
Date: Mon, 29 Jun 2026 10:02:55 +0200
Message-ID: <178272012309.45179.10854169177577629766.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com>
References: <20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9925

Applied, thanks!

[1/1] Document shared state signing
      commit: f3d78e68f74f2b37d5e7207e01e723ce4dae6441

