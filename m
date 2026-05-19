Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE32CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 13:52:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21644.1779198717289245600
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 06:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L9PBrBOr;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EF4BCC2B9E9;
	Tue, 19 May 2026 13:52:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B64655FFC8;
	Tue, 19 May 2026 13:51:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE814107E92A9;
	Tue, 19 May 2026 15:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779198714; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=PpwBMGVKCANwM0ayzMMEx0Vq0yHyzBxLnDfQXYHBy6k=;
	b=L9PBrBOrGW9tt3aWyNgbXKKm6MrG4CUdFjv8gtL3OueL0vPkfGMQ1uAbqI9JSSflLSlUq8
	9PWsEKXLl/+gPZSCwzqKpHXuBJbYP5QVuMNhJ9nBOicdBGZ8BoS3rQDZ0soRL6KaVb8lfH
	fOtWqCnCNhw5RqoXyHc+iEfq/zITUyphzp4Oyicdk7QuVIZTHk2FcUa0b/bMZivnOVHn2g
	yM+pJnrMcqUqJ5SNpLCVGlVRyNokJsxd9UFGNPiWmnI32e/Fxd4zGSXNDUOs5LYQ6BX88L
	eFAuhQhSqKjfdtA0qxU2xrLFQWhtRXTLIj7Cvbq/dxZ4ZZmm9BjP1deYyBayaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 15:51:53 +0200
Message-Id: <DIMPB1ACCICC.1RXBNT6A7HB8X@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [scarthgap] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 13:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9488

The following changes since commit 1c5e7f136d7460fa5ad4c8a49ab1de31bd670e59=
:

  overview-manual/concepts.rst: fix do_prepare_recipe_sysroot task descript=
ion (2026-04-27 10:22:28 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to f39ba5141cd518f08d491b2255a4acd74442e87b:

  contributor-guide: fix type "maintainance" to "maintenance" (2026-05-19 1=
5:39:35 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.35

Robert P. J. Day (8):
      index.rst: update "Software Overview" to "Technical Overview"
      yp-intro.rst: delete really old references
      yp-intro.rst: add link to "buildbot"
      YP Quick Build: delete extraneous periods in list
      "Transitioning ..." doc: Various pedantic cleanups
      What I Wish I'd KNown: Various pedantic cleanups
      overview-manual: fix "checkout" versus "check out"
      contributor-guide: fix type "maintainance" to "maintenance"

 documentation/brief-yoctoprojectqs/index.rst       |   4 +-
 .../contributor-guide/recipe-style-guide.rst       |   4 +-
 documentation/index.rst                            |   2 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.35.rst      | 198 +++++++++++++++++=
++++
 .../overview-manual/development-environment.rst    |  10 +-
 documentation/overview-manual/yp-intro.rst         |   8 +-
 .../transitioning-to-a-custom-environment.rst      |  16 +-
 documentation/what-i-wish-id-known.rst             |  18 +-
 9 files changed, 227 insertions(+), 34 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.35.rst

