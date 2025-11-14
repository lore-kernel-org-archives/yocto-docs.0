Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22213CE8D65
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 17:16:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3593.1763140613701220855
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 09:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JLJ08FsN;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 44A074E416B7
	for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 17:16:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19D536060E;
	Fri, 14 Nov 2025 17:16:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45B4F10371CCB;
	Fri, 14 Nov 2025 18:16:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763140611; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cHx73lyDi7Ljvn8UOKxTMHmCo5npQKLktRDLEyKKrlY=;
	b=JLJ08FsNNGjmrvNctZyblLIFyEtJhcIBl4U63ooRHq6wsM+5wG5OWSfhxOF1PMADzIlPxV
	vzgr7WHqzWXRxWhQsYUUok8gvP7BWG2zZFVG0JG0ahIpxiJmaBYmAngTdLm+fWgS7jIx7s
	iF6rOiXi1uHhP6FoGrfu2DeX2dyjg0LSi139wBu/GNQ1eLfOm42SOjoETyV0q3VDTLyiQT
	QyiMr6rCgGtZ8MOhdwrWAcE68xpvnCRqlgnH8gu9qdv4AGaUbmgO4h5+81K0p0rBwWKZAr
	xi3MjmciyAdJZiOWOOS7BLeVqwWXhDDXAHerOU4uc4PdceTv69bgYAr9lai/KQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 18:16:49 +0100
Message-Id: <DE8L6M7JVBYW.1AB82FR18R3M8@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 17:16:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8052

The following changes since commit a8687e4bb2e822670b6ad110613a12fa02943d3d=
:

  ref-manual/classes.rst: document the relative_symlinks class (2025-10-27 =
17:07:07 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to b0f5cc276639916df197435780b3e94accd4af41:

  migration-guides: add release notes for 4.0.31 (2025-11-14 18:10:02 +0100=
)

----------------------------------------------------------------
Enrico J=C3=B6rns (1):
      dev-manual/sbom.rst: reflect that create-spdx is enabled by default

Lee Chee Yang (2):
      migration-guides: add release notes for 5.0.13
      migration-guides: add release notes for 4.0.31

Quentin Schulz (4):
      kernel-dev: common: migrate bitbake -e to bitbake-getvar
      ref-manual: variables: migrate the OVERRIDES note to bitbake-getvar
      dev-manual: debugging: use bitbake-getvar in Viewing Variable Values =
section
      overview-manual: migrate to SVG + fix typo

Robert P. J. Day (4):
      dev-manual/layers.rst: document "bitbake-layers show-machines"
      dev-manual/new-recipe.rst: update "recipetool -h" output
      dev-manual/new-recipe.rst: replace 'bitbake -e' with 'bitbake-getvar'
      dev-manual/new-recipe.rst: typo, "whith" -> "which"

Ross Burton (1):
      documentation: link to the Releases page on yoctoproject.org instead =
of wiki

Walter Werner SCHNEIDER (1):
      kernel-dev: add disable config example

 documentation/contributor-guide/submit-changes.rst |   4 +-
 documentation/dev-manual/debugging.rst             |  34 +--
 documentation/dev-manual/layers.rst                |   9 +-
 documentation/dev-manual/new-recipe.rst            |  29 +--
 documentation/dev-manual/sbom.rst                  |   9 +-
 documentation/dev-manual/security-subjects.rst     |   8 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/kernel-dev/common.rst                |  20 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.31.rst      | 210 +++++++++++++++++=
+
 .../migration-guides/release-notes-5.0.13.rst      | 241 +++++++++++++++++=
++++
 .../overview-manual/figures/key-dev-elements.png   | Bin 20424 -> 0 bytes
 .../overview-manual/svg/key-dev-elements.svg       | 172 +++++++++++++++
 documentation/overview-manual/yp-intro.rst         |   2 +-
 documentation/ref-manual/release-process.rst       |   3 +-
 documentation/ref-manual/variables.rst             |   4 +-
 17 files changed, 692 insertions(+), 57 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.31.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.13.rst
 delete mode 100644 documentation/overview-manual/figures/key-dev-elements.=
png
 create mode 100644 documentation/overview-manual/svg/key-dev-elements.svg

