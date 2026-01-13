Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF292D29DFF
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:54:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55746.1768298049016053006
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 01:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=v6GmIs8G;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CD6164E420A0
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 09:54:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95D3B60732;
	Tue, 13 Jan 2026 09:54:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56B2B103C827B;
	Tue, 13 Jan 2026 10:54:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768298046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ogsbE0JZEdRrM3CkvjNluTb7u1noZIM0LenDdhvyTp4=;
	b=v6GmIs8GRxMTLjM9RNwo8XZ7WuKg6Ik7qF1E0nZZ7mvXHeHpUzHAZonIY9uPM0DH10yL8u
	S4pZCD1mdqXpzlxU2kTx3BM2T8YkfdBTX8mwBI8vE30hl12N4qhiMGOf5xSv2wXId4C+me
	vDBjWrc5v+DShOjcAF1sOrqG8u4lMHmfMB/BoJ5NO9Fk+H263BYgZ+I3o3dCv5Hxvb9hzj
	McAXChgTWMDpZ8KqautUIK4lgjO5FRgyE5r6wi9deZGG3oFOSmAQ21Rg9OUpxyMlubR2m0
	lnXEFDwVnDYf0rq0X7Rt/RuGokXTphfZE05U/VulMmvwIa607P375P0/PgHbMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 10:54:04 +0100
Message-Id: <DFNDCB2JZPT4.JZL02AGID4UD@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 09:54:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8477

The following changes since commit 85fb6e4a964ea2dea9c3083ba2c4ceb336f34b1a=
:

  ref-manual/classes.rst: document the image-container class (2025-12-24 09=
:57:14 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 9d586f22b04528a12e71ee4fa794d8130320515b:

  contributor-guide/recipe-style-guide.rst: explain difference between laye=
r and recipe license(s) (2026-01-13 09:59:23 +0100)

----------------------------------------------------------------
Antonin Godard (7):
      test-manual/ptest.rst: detail the exit code and output requirements
      ref-manual/release-process.rst: add a "Development Cycle" section
      overview-manual/yp-intro.rst: fix SDK type in bullet list
      overview-manual: convert YP-flow-diagram.png to SVG
      Remove diagrams directory
      ref-manual/variables.rst: document the CCACHE_TOP_DIR variable
      contributor-guide/recipe-style-guide.rst: explain difference between =
layer and recipe license(s)

 diagrams/poky-buildprocess/Pokyarch_diag.jpg       |  Bin 285707 -> 0 byte=
s
 diagrams/poky-buildprocess/Pokyarch_diag.svg       |  205 ---
 diagrams/poky-buildprocess/Pokyarch_diag2.svg      | 1544 ----------------=
----
 diagrams/poky-buildprocess/pokyarch4.dia           |  Bin 3495 -> 0 bytes
 diagrams/poky-buildprocess/pokyarch4.png           |  Bin 52531 -> 0 bytes
 .../contributor-guide/recipe-style-guide.rst       |   14 +
 documentation/overview-manual/concepts.rst         |    2 +-
 .../overview-manual/figures/YP-flow-diagram.png    |  Bin 190715 -> 0 byte=
s
 .../overview-manual/svg/yp-flow-diagram.svg        |  950 ++++++++++++
 documentation/overview-manual/yp-intro.rst         |    5 +-
 documentation/ref-manual/release-process.rst       |   39 +
 documentation/ref-manual/variables.rst             |    6 +
 documentation/test-manual/ptest.rst                |   19 +
 13 files changed, 1032 insertions(+), 1752 deletions(-)
 delete mode 100644 diagrams/poky-buildprocess/Pokyarch_diag.jpg
 delete mode 100644 diagrams/poky-buildprocess/Pokyarch_diag.svg
 delete mode 100644 diagrams/poky-buildprocess/Pokyarch_diag2.svg
 delete mode 100644 diagrams/poky-buildprocess/pokyarch4.dia
 delete mode 100644 diagrams/poky-buildprocess/pokyarch4.png
 delete mode 100644 documentation/overview-manual/figures/YP-flow-diagram.p=
ng
 create mode 100644 documentation/overview-manual/svg/yp-flow-diagram.svg

