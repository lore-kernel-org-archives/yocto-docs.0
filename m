Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBCEC982D9
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:30:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42508.1789659051002065102
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 08:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=HCRSTQac;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1A43DC5CD78
	for <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 15:31:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A57995FAA3;
	Thu, 17 Sep 2026 15:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7182811C7B08E;
	Thu, 17 Sep 2026 17:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789659048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SwZc0dCp8Fs6lQajDFGbu/G3/DxBUlXDY+HSdbyQg5k=;
	b=HCRSTQac0vjLRgJ9QlWAURgOkzkchoJHtCWxvzkcMjJfP7X2kjk7ILYoQuFwE/56UHr3Mu
	F+PA1K2Tkw6wfZB1iNafy0wiSqZ9nx2QwHDgEg8GmGFL6S4yyZmE9FzOpnW4rtKLcU5o3k
	g29De/3QREaak7B0Pqch8K9Zj9VN76A75bFsoO0GhG3PVR0/c8LkiRMix4zNw6KEhxxyjb
	T9TWr9H4HgJKC4/Kpn7HJNHlGaW2tM4ciF+f2OyTOiLMGJsEQ9cw0jT3VKsiLYjpJQP/iF
	UccbE2ue3Cc2XAyytc/XN339hDaDORj+r5YMCTrEPpclbf2Ofk/7xDwMxfVsfA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] migration-guide: add release notes for 5.0.20
Date: Thu, 17 Sep 2026 16:52:40 +0200
Message-ID: <178965649675.302216.7210791607215620103.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916074108.2073689-1-chee.yang.lee@intel.com>
References: <20260916074108.2073689-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 15:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10526

Applied to master (and duely backported), thanks!

[1/2] migration-guide: add release notes for 5.0.20
      https://git.yoctoproject.org/yocto-docs/commit/?id=3Dee480d4f5539
[2/2] migration-guide: add release notes for 6.0.3
      https://git.yoctoproject.org/yocto-docs/commit/?id=3Ded7422fb45e7

