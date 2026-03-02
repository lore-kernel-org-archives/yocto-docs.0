Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CDAE9B347
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:54:23 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157076.1772445262941703095
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=YJ6AyV2/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 792951A1F34
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 504F85FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E36F10369549;
	Mon,  2 Mar 2026 10:54:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qRamDMYuk/ATjNzyEYXJzwT955dHQMgRYPa01HeemTA=;
	b=YJ6AyV2/suGcDZRtgF+PzhoKcYxURQStlsr+2Ph4tXxweurilhPFIY+5iIvfiYRW6KopuI
	Qbq6/zT2EY2hJ4gZ17ITpxkdeVhPpdnYTfHrDabzcQR2Zcw7GQVWrlPplgQEa5DkfnfvGi
	WZL3DjANzkp8yyZIc5JwT+UHJy/uWZdOUl2fI0CdxOSz/OrEFK56RL/jHBEhgmxaccQFjC
	2Bj2tawjO3qZhOQNy0utrGY7otQf8jWHC0kvqN+nBGEQWWm35JFaYbolpCvogYTE/RunMv
	Rl1SELGLi5Z/I++XM6Whm8FwSK0ICETTIGnnsEiNt5U+0ngJYqlz4C3n+PqnpQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: add SPDX_INCLUDE_KERNEL_CONFIG and SPDX_INCLUDE_PACKAGECONFIG
Date: Mon,  2 Mar 2026 10:53:40 +0100
Message-ID: <177244519662.106718.13868610437279189599.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225110800.126491-1-kamel.bouhara@bootlin.com>
References: <20260225110800.126491-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:54:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9034

Applied, thanks!

[1/1] ref-manual: add SPDX_INCLUDE_KERNEL_CONFIG and SPDX_INCLUDE_PACKAGE=
CONFIG
      commit: ff3cfb0ed3515fe42ef25f055e039ebdfe66dac0

