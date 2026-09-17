Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4D3C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:30:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42790.1789659051571852456
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 08:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=YT4vK7Ru;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E594E4E407AD;
	Thu, 17 Sep 2026 15:30:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA09B5FAA3;
	Thu, 17 Sep 2026 15:30:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 915F111C7B08F;
	Thu, 17 Sep 2026 17:30:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789659049; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Tm+b0SmoveU5yZBtJouCwzYuC8Mnt5YNFamBD/+iwcc=;
	b=YT4vK7Ruy4AtINJGua4oP3Ve6is5vDD0e579uXZ6M/XW9nl2YKbyK4U22q2gRP1ge7hp2b
	W5tgz5zFKMHjvVKUIJ+8uVkNaduOp+Y0TwwpdMgsmHU+XkxnOE/rUDTLJ5tkzhRdB8FNtV
	SdwTmu0ITMRt5Of8N0uuHX2V9RJGgVcHv2ECcjbQ6RhlmBdqklcwNpELlWlwuV5oT+AY67
	dVk1MP1w4HzTXll98EEW+Vlq6o/bRfYRdLKHqFiIEAW+JHDIBFE3iabzF5QiNq3udRIW7+
	7JP5TIPChoYfXfjo93OF31ksIiLJGSsvagSEUG/ECAnIyA93XQTz2BPFyvZuxw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Joshua Watt <jpewhacker@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [docs][PATCH 1/2] ref-manual/variables.rst: Fix the documentation for the SPDX agent variables
Date: Thu, 17 Sep 2026 16:52:41 +0200
Message-ID: <178965649678.302216.14961936677481018944.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914160836.1673868-1-JPEWhacker@gmail.com>
References: <20260914160836.1673868-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 15:30:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10527

Applied to master, thanks!

[1/2] ref-manual/variables.rst: Fix the documentation for the SPDX agent =
variables
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D2f81bceda58c
[2/2] ref-manual/variables.rst: Document SPDX_AUTHORS
      https://git.yoctoproject.org/yocto-docs/commit/?id=3De9fd43e2584f

