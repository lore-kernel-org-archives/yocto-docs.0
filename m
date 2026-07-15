Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A38C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 13:19:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5733.1784121562479605915
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 06:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OdRYAyGI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6C0DA4E40DDB
	for <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 13:19:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35DBE60360;
	Wed, 15 Jul 2026 13:19:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A588711BD1518;
	Wed, 15 Jul 2026 15:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784121559; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=xF7aPWHOxebfX/DTYVTiW7rLV6ULJqYlXTbtDJpGYOg=;
	b=OdRYAyGI5QTquSsaMX9uGh/zYaB6Lde2Ror88Vo6W3xyJQtBBAUszBqrQjlu+rcdtGs3Qd
	wVF6IaM2v4coirSLzgemPwmM+f4OqqXYWxgB+kSy6yFkhJkPNkH817A7neffWXB4s507D4
	YHVMT62FKPQwIO1Ca7Fg7ec5v5syaJuPusuoAwigys2Q45CZNHU4uu1GCBIgjt4FOtWTNe
	+nqEVguos+wBqSBSE5DKnj+7uZ8wqUa+qhbExCAfW7ReCO0BbW34Z7r6WtrZzwgv3xSWpB
	Fo1CrM8hTFMNm3qcmwzqRJtniyru18cT4yKLH3CJGn41AbNItGkeQmq9K60kzw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 15:19:18 +0200
Message-Id: <DJZ6B4X8M7TS.7IYFQY7XSN9Z@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [wrynose] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 13:19:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10074

The following changes since commit 0282c79480b88cfdc17a31b07511e9e30094f261=
:

  ref-manual/variables.rst: document the IMAGE_*_DEBUGFS variables (2026-07=
-03 11:16:03 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to e0ad133aca131941e9c8b7d66d6723762185662b:

  docs-wide: fix various broken links (2026-07-15 14:57:11 +0200)

----------------------------------------------------------------
Antonin Godard (8):
      ref-manual/variables.rst: document the LOCALE_UTF8_IS_DEFAULT variabl=
e
      brief-yoctoprojectqs/index.rst: refresh bitbake-setup outputs
      migration-guides/release-notes-3.4.2.rst: fix a broken link
      docs-wide: fix broken path links
      ref-manual/classes.rst: replace obsolete mailing list thread
      ref-manual/images.rst: update obsolete VMWare links
      migration-guides/release-notes-5.0.rst: remove broken link
      docs-wide: fix various broken links

Robert P. J. Day (2):
      ref-manual: expand on kernel "do_sizecheck" task
      ref-manual: add "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS" to variables

 documentation/brief-yoctoprojectqs/index.rst       | 53 ++++++++++--------=
----
 documentation/dev-manual/new-recipe.rst            |  2 +-
 documentation/dev-manual/start.rst                 |  2 +-
 documentation/dev-manual/x32-psabi.rst             |  4 +-
 documentation/migration-guides/migration-6.0.rst   |  4 +-
 .../migration-guides/release-notes-3.4.2.rst       |  4 +-
 .../migration-guides/release-notes-5.0.rst         |  2 +-
 .../migration-guides/release-notes-5.3.rst         |  2 +-
 .../migration-guides/release-notes-6.0.rst         |  6 +--
 .../overview-manual/development-environment.rst    |  4 +-
 documentation/profile-manual/usage.rst             | 38 +++++++---------
 documentation/ref-manual/classes.rst               | 11 ++---
 documentation/ref-manual/faq.rst                   |  2 +-
 documentation/ref-manual/images.rst                |  5 +-
 documentation/ref-manual/tasks.rst                 | 19 +++++---
 documentation/ref-manual/variables.rst             | 41 +++++++++++------
 .../yocto-project-supported-features.rst           |  2 +-
 17 files changed, 104 insertions(+), 97 deletions(-)

