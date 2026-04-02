Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9CFD39434
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:39:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17270.1775140739140745004
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 07:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vGbBs2dG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F15341A30FF
	for <docs@lists.yoctoproject.org>; Thu,  2 Apr 2026 14:38:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8E945FDEB;
	Thu,  2 Apr 2026 14:38:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A4011045027A;
	Thu,  2 Apr 2026 16:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775140736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=hFMbBRpB4kpXCfkVBgX6nZ/Skpz4QaPhUiGevsPuWJY=;
	b=vGbBs2dGlyFnjOpt5zs5lV6+7dcgHyG4hMsWGo7iOrWtCKRo1ifNj7rpHdaYuuHeTvX+cJ
	1j4qp0SlEzG2UVnUcyYzQpQcNw5CmNzZZqt7/32sUzxz6OVwcOjDFixI78/NjZorIfqFu3
	PdjWE42YPS/VlMXw44ZcgRRA6ps4fZxN7CrwrfcOy5GlGvNYxKgulhRxHBtOEWJX/f6qsL
	4TpVqbAFd8r2FtRR85MjNFtSGOBlVKewjMn13bLZ4ILLQ8K/utnPDlJVjOJpQvyK8obR1J
	/gODNNgoTO54xVEJtlnI9iNkiBpeKfG3xNLVLptJLb/6n9+b/7HjIPWPK2fYeQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 16:38:55 +0200
Message-Id: <DHIQVFRL51MR.2CI8LDS6GLX0D@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [whinlatter] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 14:39:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9167

The following changes since commit 351f86e67db6f42cf385cf3d002ad41dc294e54e=
:

  migration-guides: add release notes for 5.0.16 (2026-03-18 11:21:58 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs whinlatter-next

for you to fetch changes up to b3966fa5ab7ee4653124badba3d2c54f0e5797aa:

  migration-guide: add release notes for 5.3.3 (2026-04-02 15:22:19 +0200)

----------------------------------------------------------------
Lee Chee Yang (2):
      migration-guide: add release notes for 4.0.33 4.0.34
      migration-guide: add release notes for 5.3.3

Yanis BINARD (1):
      contributor-guide/submit-changes.rst: Added missing word

 documentation/contributor-guide/submit-changes.rst |   2 +-
 documentation/migration-guides/release-4.0.rst     |   2 +
 documentation/migration-guides/release-5.3.rst     |   1 +
 .../migration-guides/release-notes-4.0.33.rst      | 182 +++++++++++++++++=
+++
 .../migration-guides/release-notes-4.0.34.rst      | 191 +++++++++++++++++=
++++
 .../migration-guides/release-notes-5.3.3.rst       | 175 +++++++++++++++++=
++
 6 files changed, 552 insertions(+), 1 deletion(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.33.rst
 create mode 100644 documentation/migration-guides/release-notes-4.0.34.rst
 create mode 100644 documentation/migration-guides/release-notes-5.3.3.rst

