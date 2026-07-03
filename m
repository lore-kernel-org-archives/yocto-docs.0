Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD545C44500
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90611.1783079100299587147
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Uh1a0OKU;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E40A3C49F4B
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0FEEC60300
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:44:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55903104C949F;
	Fri,  3 Jul 2026 13:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079097; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QGN+YFxPIHbLpOkjZ0Hc5XlpiwHR3eIhCu2N/U79JWs=;
	b=Uh1a0OKUzC2L71JALnmlHvSnfRo7lf8NN85fUC4APUUeFfp1j0hZ3OauRpQdw3ChjafHCY
	PVW9/LlDy/Ix8vkZvIflLHSp4LT9WtOI7joJooqfP/QZBaXDE82a/CdPH33eOuuxKnEM1u
	jJjL4MxbBm7boSHvIqkpCAp+kGa8u7PeTfQy3mP/SL5IQa9wc8bfY9C8GKDAVgMburzdH9
	hWIvznI+kpO7DxCLYiLbaIWeyz8SuZdLHGaF1LGLev4U7GvDoiufHs5oIdDhSzVUDGUQzU
	2wSldTTvwbaTkNcX0xDeC6XoWxi5AZb7T5tUgoTJz4ZSOfvh5TPka9FIbFre/A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 00/11] Migrate WIC documentation
Date: Fri,  3 Jul 2026 13:43:31 +0200
Message-ID: <178307887472.248663.12376542386011255.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
References: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10018

Applied, thanks!

[01/11] dev-manual/wic.rst: replace deprecated wks directories
        commit: b981528424e6e33b8f226e81a5d2345fae4dd055
[02/11] ref-manual/classes.rst: replace deprecated wks directory
        commit: 70bcb62f02b9b21030b914bc54405ce10d3402b4
[03/11] ref-manual/kickstart.rst: replace deprecated wks directory
        commit: b314c7724fd365a19feb9458614d995d14a20910
[04/11] bsp-guide/bsp.rst: fix raspberry layer content example
        commit: 2e713eb4777e661348e3e6fd8b2cf00040be4c1a
[05/11] dev-manual/wic.rst: remove note on wic-tools
        commit: 92fe43d5bfc561e43ea114773bc2cd5829e4c320
[06/11] dev-manual/wic.rst: remove bullet point on host requirements
        commit: ea695e36da61e3aa427d6007436012254527b8a3
[07/11] dev-manual/wic.rst: add where to set IMAGE_FSTYPES/WKS_FILE[S] fr=
om
        commit: 2c781592db342521201d93c384f9e03594db90d2
[08/11] dev-manual/wic.rst: add a requirement to use wic from the build s=
ystem
        commit: 733993507402a886acc48c383e279be2ec521862
[09/11] dev-manual/wic.rst: convert code snippet to code-blocks
        commit: ee085e35789fa706cf302ff26f030e56bb174146
[10/11] ref-manual/kickstart.rst: remove note on available commands
        commit: fa821e93abff3d811ce9f9093310b7c139e46eea
[11/11] ref-manual/kickstart.rst: document the include directive
        commit: 6553c3c8d85c31ecbd66455657735840fe567ac3

