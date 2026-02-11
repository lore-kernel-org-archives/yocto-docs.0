Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6438E9E31B
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 14:41:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20483.1770820858255885018
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 06:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JelHmo0k;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 41F5AC243B1;
	Wed, 11 Feb 2026 14:41:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79526606B8;
	Wed, 11 Feb 2026 14:40:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23D1D119487A4;
	Wed, 11 Feb 2026 15:40:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770820854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=UDxlcCkbqxeIc3go6cCU0W83YxbMShkM+KeccHshBxU=;
	b=JelHmo0k00xQN3qFHLRxZ8zXMwCNaPKvxff8rCoY5mku/eTfJ5UZrr30JhSqvaTiz7Gak5
	TDnJxg0tfOtM0c94qslgkBHTrqjY5/I2M1U8AbEoKTsgHVVIPxdqgNq902Bf995LV/D8qr
	b/n0B3Jwo6LQE3KCefEWbQrKGnpDgX6dT29GzzRHEq+W3J9KfP40xe7lJMNcsvR/WrIbQk
	NTGsm0WVqVLjqkq03IQSwhx+3R7LxnerdFPbCRkTNjEryw77jR+BoDAYODeqxeHH00CERn
	ppLmyOCsV+kZuvDEHdyiFtpZi6PPzDmdoquC/JbfTQ7a+DgEW9x4sG/7OxhzBQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 15:40:53 +0100
Message-Id: <DGC7LPPOWT25.F3VZVMOPK59F@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 14:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8885

The following changes since commit 7e89c8b93f07a3a2fa50448121a6f64b1aae65f0=
:

  migration-guides: add release notes for 5.0.15 (2026-01-23 11:39:23 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 369f3307368eaea605983e80047377fd19ebd6bf:

  migration-guides: add release notes for 4.0.32 (2026-02-11 15:19:17 +0100=
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

