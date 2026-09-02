Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44BAC624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:01:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11931.1788354094859737517
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 06:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=S/Q0y+sH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3A10D1A18D9
	for <docs@lists.yoctoproject.org>; Wed,  2 Sep 2026 13:01:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0EFCD6054B;
	Wed,  2 Sep 2026 13:01:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C16F11C79348;
	Wed,  2 Sep 2026 15:01:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788354086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=riltRK83hQibzbUn6J3KS6Lofn5FGLrvLg+awftNYrY=;
	b=S/Q0y+sH/ayDtzqAx2n8X+bKdOC+IfaihT+83idDKIMvkTSuU6KEGidf0n+2/u4n+mbXvV
	lueJzfBmCMlamK1WHI5oJqpBEjUunBQeuyqpFFpDhTTAPLqD16ScQai5Jgll8x7Pi93vPW
	zcelqjc5oxQDfskluh8v5MXKeW6XxTreeTCFP7pGvEYh0MCkurmn13qfBsp0fbGf2xOamO
	HYlHAPy6LJnByySuuobQDTal9ZQaUuSsuvWPtBcqOMIfIh+syVQzwph8vpKVLIXHvAGbeZ
	mARIif0ziw9ejm+KCBrvwsx/vujmtqDNODQmFPWpA4eupLQeEFBcq5WGlsB+9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 15:01:22 +0200
Message-Id: <DL4UM3RARUU5.2XPVJ2SEFBG0W@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Sep 2026 13:01:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10434

The following changes since commit fe46d5de41930a2762a9ad2543d50e0f4e10463b=
:

  README: update instructions for installing vale and sphinx-lint (2026-08-=
24 14:48:34 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 728c63c050c22ad1469d9efa5d81e96c42f83c93:

  toaster-manual: spell the json code-block language in lower case (2026-09=
-02 14:52:28 +0200)

----------------------------------------------------------------
Antonin Godard (1):
      ref-manual: add new vex class

Robert P. J. Day (1):
      documentation: use "https" protocol for git.yoctoproject.org

Trevor Woerner (4):
      ref-manual: drop the full stop from the QB_SMP example
      ref-manual: fix a typo in the QB_SMP description
      dev-manual: quote the values in two recipe examples
      toaster-manual: spell the json code-block language in lower case

 documentation/README                               |  2 +-
 documentation/bsp-guide/bsp.rst                    |  6 +++---
 documentation/dev-manual/layers.rst                |  4 ++--
 documentation/dev-manual/new-recipe.rst            |  4 ++--
 documentation/dev-manual/upgrading-recipes.rst     |  2 +-
 documentation/kernel-dev/advanced.rst              |  4 ++--
 documentation/kernel-dev/common.rst                |  4 ++--
 documentation/kernel-dev/maint-appx.rst            |  4 ++--
 .../overview-manual/development-environment.rst    |  4 ++--
 documentation/ref-manual/classes.rst               | 25 ++++++++++++++++++=
++++
 documentation/ref-manual/variables.rst             |  4 ++--
 documentation/toaster-manual/reference.rst         | 10 ++++-----
 documentation/toaster-manual/setup-and-use.rst     |  2 +-
 13 files changed, 50 insertions(+), 25 deletions(-)

