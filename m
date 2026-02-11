Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95010E9E319
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 14:41:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20361.1770820857635869694
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 06:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kNCEzZI8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B8EEE4E40C65
	for <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 14:40:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A0F3606B8;
	Wed, 11 Feb 2026 14:40:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A206211948E05;
	Wed, 11 Feb 2026 15:40:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770820854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=eh1YNS+1HczPVVJfF0okBW8eYjvDO6eFOV19ODpebE4=;
	b=kNCEzZI8SWP7GbwYHreYxSChgEszTYKlXr7I3R6Nc1791334iHIIfjtlkSu9GjgX3F4+CX
	MrZxo9DpFI9xJwjbXK/WWYQWVhco5nQTXbkMT23/wLSYtJSSk6aAQWFXtSKDRjYm8uRP0e
	kITSNJ+3EW//t+u44+DGDCafP3+XtsUgfKBTySn8Y2I/Ve9tZL2x61I5gBO9e9O1Tpp+Ss
	Co5/FrCzbp3NBJ8C1JSxh2WU5GYNV7AR1FAd4zaDdJiE+cgACFg6ixVxmj5AYV+t5wd7LT
	aSmpEWydIHYnrdBBxupKPxl7egJP/TcnVRMtv5S0G1QUzFEqDw/c6SrazN3/Fw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 15:40:54 +0100
Message-Id: <DGC7LPXHOYHJ.AEWLO5OWGSEG@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [whinlatter] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 14:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8882

The following changes since commit 3ea1c74cc56bb271f8460ab851f6b2983b83358f=
:

  what-i-wish-id-known.rst: remove obsolete poky repo references (2026-01-2=
9 16:28:34 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs whinlatter-next

for you to fetch changes up to 9c363d270ab45f3443391fb7275817db69d8a5d4:

  migration-guides/migration-5.3.rst: add note on *FLAGS behavior change (2=
026-02-11 15:19:36 +0100)

----------------------------------------------------------------
Antonin Godard (4):
      dev-manual/packages.rst: pr server: fix and explain why r0.X incremen=
ts on SRCREV change
      dev-manual/packages.rst: rename r0.0 to r0 when PR server is not enab=
led
      dev-manual/packages.rst: fix example recipe version
      migration-guides/migration-5.3.rst: add note on *FLAGS behavior chang=
e

Lee Chee Yang (2):
      migration-guides: add release notes for 5.3.1
      migration-guides: add release notes for 4.0.32

Mohammad Rahimi (1):
      brief-yoctoprojectqs/index.rst: remove extra word from text

 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/dev-manual/packages.rst              |  23 +-
 documentation/migration-guides/migration-5.3.rst   |  42 ++++
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.3.rst     |   1 +
 .../migration-guides/release-notes-4.0.32.rst      | 194 +++++++++++++++
 .../migration-guides/release-notes-5.3.1.rst       | 262 +++++++++++++++++=
++++
 7 files changed, 520 insertions(+), 5 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.32.rst
 create mode 100644 documentation/migration-guides/release-notes-5.3.1.rst

