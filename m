Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E290CD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 13:52:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21646.1779198717630287827
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 06:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vu0ZrLJT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 180DD4E42CF0;
	Tue, 19 May 2026 13:51:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0D635FFC8;
	Tue, 19 May 2026 13:51:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F45B107E92AB;
	Tue, 19 May 2026 15:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779198714; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fo+gx8V1zw/L3x0J4GFnAL5S5pml/XqRmtllqFpdXCc=;
	b=vu0ZrLJTlRi5fPudmf30mvGtx0PVtOXlH56c6VWV+HgvN5a2YIMyy97A/GZqOZYafM+3EA
	r3a3qSPRWuslFMSqekI3Skd7O30Kva2wFBwyuRx//LH+nk6+OAioTIbbuOeEBXN7Zlxcqi
	J82aGTJ5dOWnpdsB7G+X3s3skKSNysDShh6nrSqNysEpCA+sfZJgI3lymH7eKdbyh0EQL4
	LadGhfXfuSCR5GDSU2DA0backV4hpdG49T9eM7SqD0nRkCyFvGiW87qaJddZ9FNNix8hMg
	PD5nvx84rRNG6PqsEEGcHay9GR3MNfANpz6MkjHNeiiCXkNazakft5r/qdrxmg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 15:51:53 +0200
Message-Id: <DIMPB1F9USKI.2077RLM8P9IJ3@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [whinlatter] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 13:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9490

The following changes since commit 10818445a22c524de0934901547cf676256c2b9d=
:

  dev-manual/new-recipe.rst: rework Unpacking Code section (2026-04-21 15:1=
9:46 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs whinlatter-next

for you to fetch changes up to c89f336e505dda33d7d99cc3279d2fb905855db9:

  migration-guide: add release notes for 5.3.4 (2026-05-19 11:15:36 +0200)

----------------------------------------------------------------
Lee Chee Yang (2):
      migration-guide: add release notes for 4.0.35
      migration-guide: add release notes for 5.3.4

 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.3.rst     |   1 +
 .../migration-guides/release-notes-4.0.35.rst      | 198 +++++++++++++++++=
++
 .../migration-guides/release-notes-5.3.4.rst       | 218 +++++++++++++++++=
++++
 4 files changed, 418 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.35.rst
 create mode 100644 documentation/migration-guides/release-notes-5.3.4.rst

