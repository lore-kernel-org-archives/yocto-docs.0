Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D82E9E316
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 14:41:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20481.1770820857640024347
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 06:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rPUY9XCV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 80B344E40C64
	for <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 14:40:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 574EC606B1;
	Wed, 11 Feb 2026 14:40:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D733811948F10;
	Wed, 11 Feb 2026 15:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770820854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/QMj8P16XTqHbdrENk/atZWtKRrMNRghRRpE5fP3buQ=;
	b=rPUY9XCVr4s3iCBs137hZe6Yrt5ebRO5ukBZh2S23XySqjBpAqIdDdbr1cZN7Sjw8BR34Q
	0WYVqt2i2q3f86DZRkfFElYfdMw7JF2BIf/FqzFFcvD9kUAZyPFhALiSxuczCEF1sb/hiu
	HRDbwoXYfRz2K+9Pfq5dHiE0YXQKHFbetBeHDCEc3/vLG0+lRm5nWKgnbLw+hykFg4WhQX
	19Ely2I8OusiJ0csmZQ1X5lEeqCLmCt6bVwgvxS/1Bb/mZSB9Ho+sE6C58Z2OEk3SxD1+q
	xc4LaH6RdBx8zTT5Cqx1ObS+xEIlKEYy/RSDVhIJbIGfH7v2mcTpeOBP+ixGvA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 15:40:53 +0100
Message-Id: <DGC7LPHDXK2Z.VGP66MZR31MA@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 14:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8883

The following changes since commit 6799b1be5d48f4bf5dcd0b16c2dbc2e297d4ecd9=
:

  contributor-guide/recipe-style-guide.rst: explain difference between laye=
r and recipe license(s) (2026-01-13 09:59:23 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 398a2a080361eb22b9c447dbde31fca58bf4e0bb:

  migration-guides: add release notes for 4.0.32 (2026-02-11 15:19:18 +0100=
)

----------------------------------------------------------------
Antonin Godard (3):
      dev-manual/packages.rst: pr server: fix and explain why r0.X incremen=
ts on SRCREV change
      dev-manual/packages.rst: rename r0.0 to r0 when PR server is not enab=
led
      dev-manual/packages.rst: fix example recipe version

Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.32

 documentation/dev-manual/packages.rst              |  23 ++-
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.32.rst      | 194 +++++++++++++++++=
++++
 3 files changed, 214 insertions(+), 4 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.32.rst

