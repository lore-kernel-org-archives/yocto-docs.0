Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F84EF8FA7B
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 13:44:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30007.1776779093922381649
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 06:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Bx01Vjja;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 55C531A338A;
	Tue, 21 Apr 2026 13:44:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2CF27600D2;
	Tue, 21 Apr 2026 13:44:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AC6F10460872;
	Tue, 21 Apr 2026 15:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776779091; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HAhy4f5inOSztXKBNIYLdV3ouPtIjqbh6zVS7BnCSao=;
	b=Bx01Vjjavbn2qVqeIh9BwmL6TGNR2px6P4I+0arX+AKK4FVZ5CZt0FouAKK/Ln7TF9gJD+
	B4boeHiSqse2GM5TTHe4rKRFrom/puI4wUueVP4xmmBUYZB+C5jswMYfEmCmQO8GrFPDPM
	pSE5MaOQPFW45HjNp7tbMKe09kfxSIXwcquef/FkgS/7753SNgLIgY5scR09vxJo5wKM+Q
	gW2kwxdiTZHmAG8Fd/Z2JakBhHuovyorvCA88LhUjm7v8OlLhQ2g+gSO7mxmvgz2NnZIW/
	9GAIh4RVn02R3zxJBkuG+pJWxap/W2nR1E3wplqB2ybFQ3P9ohm3hHzjFFEYPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 15:44:51 +0200
Message-Id: <DHYVME7JZ0Z3.5SQMYFN5Z4DK@bootlin.com>
Subject: [whinlatter] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 13:44:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9299

The following changes since commit b3966fa5ab7ee4653124badba3d2c54f0e5797aa=
:

  migration-guide: add release notes for 5.3.3 (2026-04-02 15:22:19 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs whinlatter-next

for you to fetch changes up to 10818445a22c524de0934901547cf676256c2b9d:

  dev-manual/new-recipe.rst: rework Unpacking Code section (2026-04-21 15:1=
9:46 +0200)

----------------------------------------------------------------
Antonin Godard (2):
      sphinx-static/theme_overrides.css: switch to a fixed width documentat=
ion
      dev-manual/new-recipe.rst: rework Unpacking Code section

Lee Chee Yang (1):
      migration-guide: add release notes for 5.0.17

 documentation/dev-manual/new-recipe.rst            |  24 +-
 documentation/migration-guides/migration-5.3.rst   |   2 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.17.rst      | 263 +++++++++++++++++=
++++
 documentation/sphinx-static/theme_overrides.css    |  17 +-
 5 files changed, 290 insertions(+), 17 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.17.rst

