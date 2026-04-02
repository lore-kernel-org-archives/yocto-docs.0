Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B456D39432
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:39:05 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17272.1775140739650122342
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 07:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yAhfbKve;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 16EDFC59F4C;
	Thu,  2 Apr 2026 14:39:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CCC2603C2;
	Thu,  2 Apr 2026 14:38:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4D5B10450278;
	Thu,  2 Apr 2026 16:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775140736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=7KQn8fKGYFHLX+M7MvGnxh2FQyDMUEB7KsJuCXKcSxU=;
	b=yAhfbKveScfYOm4rWmkwhqYnEn8uVQfq5UQn53jVWQtJ1vhzd8HKrW5lNtiHfLe54jPQQR
	zh4ZYR/lbxM4VhCgjUueXCjEfEgxUyNM8my99/fgDmmCpW9z+dw179bGM9iWLlhJdz/GSu
	BWGAVTmLsQC6jddthRB/O0z+RPUkoq+FGQZRWqLB0IZJFahondY/GGxKdSEB5cqbYnvxVM
	xykVwztp1kW8HRfvYuCCCVuB0bwwqNOFF3RR648hHvOtHMEWad3G3dCAhA5S7cYi71on4p
	ebz7PWKZlzVuNRe8v6ReN1tX2HdcS0Pu4mxVhwY0XXlLAwnJiYOC7wy32Ib44Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 16:38:54 +0200
Message-Id: <DHIQVFAYDQT7.2EU1BNQ2HD15C@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [kirkstone] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 14:39:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9166

The following changes since commit 025ef10f4472082069a3237e21aa773354fa5ad9=
:

  overview-manual: escape wildcard in inline markup (2026-03-05 13:52:28 +0=
100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to ce6734c68649739c635675a133fa77edb9865028:

  migration-guide: add release notes for 4.0.33 4.0.34 (2026-04-02 15:22:08=
 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.33 4.0.34

Yanis BINARD (1):
      contributor-guide/submit-changes.rst: Added missing word

 documentation/contributor-guide/submit-changes.rst |   2 +-
 documentation/migration-guides/release-4.0.rst     |   2 +
 .../migration-guides/release-notes-4.0.33.rst      | 182 +++++++++++++++++=
+++
 .../migration-guides/release-notes-4.0.34.rst      | 191 +++++++++++++++++=
++++
 4 files changed, 376 insertions(+), 1 deletion(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.33.rst
 create mode 100644 documentation/migration-guides/release-notes-4.0.34.rst

