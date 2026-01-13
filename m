Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F91D29DFD
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:54:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55509.1768298049078131041
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 01:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AFjV5iR1;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F54B1A282F
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 09:54:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED5B660732;
	Tue, 13 Jan 2026 09:54:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DBA9103C92D2;
	Tue, 13 Jan 2026 10:54:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768298046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=hxXWFd5VPX3Go9pBGOehSGvZ37Gjo23OLSM0M0Lfw3g=;
	b=AFjV5iR1BsnPiXfW52JaxpJFIC6y8QPlwo87eegJhlKZHsqU5vbuzaiDXqVKdGtehF1jLD
	uE41OcYEhwjk/Juq1JQQ/5KrFJXcGbc+/TRYLtMGy9N7k20OPxb0eby8xvwtStTeaSHY87
	XmWCYfkif8EwJALO9KWMNXlIWCbc0WeYflj13WUoj3jVXEvIcn6Qor8TuTuobP2/l4PCyj
	F6tZAU9tbEB4V08i2/YcLH2+2MWUMjx0LBggWt9Vyklx6b85AghstD2ezncXCEgfizWCjH
	suyOY69yRzMEJ/TcoRyI/kb4a7vjYyvYnpPd6psI+3XJHFwsSCzolwi9anrLvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 10:54:03 +0100
Message-Id: <DFNDCAUD8PKL.1EKQD2WJTH0AI@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 09:54:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8475

The following changes since commit cebe8ff0508e0fc2de8378a1cf93eb8054e12699=
:

  ref-manual/classes.rst: document the image-container class (2025-12-24 09=
:57:14 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 6799b1be5d48f4bf5dcd0b16c2dbc2e297d4ecd9:

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

