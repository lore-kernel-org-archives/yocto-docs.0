Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F7CEA8114
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 13:07:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19155.1770728825805679086
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 05:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=A9fxHFdb;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 19A51C8F445
	for <docs@lists.yoctoproject.org>; Tue, 10 Feb 2026 13:07:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1BDE606BD;
	Tue, 10 Feb 2026 13:07:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2595119D0B2E;
	Tue, 10 Feb 2026 14:07:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770728823; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2Z67gNXA0U+YpoHNALsw689V4oBmFi0Ki3vydh3nALY=;
	b=A9fxHFdbut6PfCo22AQvaVkacwjTfW5Vjg5C2hW0KBPVM34CpGnIlum24JMJRBpnBwKQDy
	KiliO5a8jpp1fbDcMNkNTsVdQ9de7GvajjM9OyG/djDduxt9ie/2zZWyNTQnworabm0AQw
	5KXQdq5nlpr3OMApkwYfB6grCvkwSaB7P6OQCPtEn1EgyqKdm+P9Rmts5tU5yCZZ9Bgw36
	AWkxtkP49xrOsyM74He2Iats0CoKFDB17srew4WMVVogjQPJ78f5rTHSr4Te8h2P/eXCxB
	YFd6PshH4RzG/xCXpV6YY9KvPf7IT2idOd4l8YW1BSQZui4vDCyC427kyg1Msw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 0/9] sdk-manual: fix code-blocks, migrate one PNG to SVG, remove unused PNG
Date: Tue, 10 Feb 2026 14:06:54 +0100
Message-ID: <177072734077.453512.13846021179058159260.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114-code-block-misc-20260114-v1-0-174a6e5dba69@cherry.de>
References: <20260114-code-block-misc-20260114-v1-0-174a6e5dba69@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Feb 2026 13:07:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8878

Applied, thanks!

[1/9] sdk-manual: fix incorrect highlight language for text code-blocks
      commit: 72354c27000aba3ae583894ff6112a1a017e33d5
[2/9] sdk-manual: fix incorrect highlight language for console code-block=
s
      commit: c6039ce11d638a0b64844480e51d126fcda304b4
[3/9] sdk-manual: fix improper indent of general form of tarball installe=
r script
      (no commit info)
[4/9] sdk-manual: working-projects: properly highlight code code-blocks
      commit: 10d40604cb4affb17dda2253f82a2422d5a9bcf6
[5/9] sdk-manual: appending-customizing: use none lexer for BitBake code =
blocks
      commit: d682bce63cdc5aad9c2d3b932a6ba2d27ecfe107
[6/9] sdk-manual: appendix-obtain: replace directory structure PNG with a=
 code-block
      (no commit info)
[7/9] sdk-manual: appendix-obtain: replace eSDK directory structure PNG w=
ith a code-block
      (no commit info)
[8/9] sdk-manual: replace sdk-environment PNG with SVG
      commit: 39fb148792cd6b8e567a496bdbe63a50759eef36
[9/9] sdk-manual: delete sdk-title PNG
      commit: ffaea8391b3d78c2ccf964474e03c50a1c043c6c

