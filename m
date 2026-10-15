Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6400CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 08:01:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34668.1792051288580843244
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 01:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=D8eP9ltT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B3CF5C62202
	for <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 08:02:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68BA560360;
	Thu, 15 Oct 2026 08:01:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EDB610328B1A;
	Thu, 15 Oct 2026 10:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792051280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=6t8WFvTN2fSbrne4AXDJ53uW6A14PZqGrvIaHnMbPcc=;
	b=D8eP9ltTPYopdIbudJbZhnpl1r+HbA9bw69XkqJvU0gkF280YdFR5fggQyJG04m+DDncgF
	de1tR9I3tu2H8NKohFmx2TA6ndvpPcguQeQ6/pi4lk8pIJ3oq3DHnzsB8+M9gb7vmjnu8/
	PdIoP/CjzV4BoJOvNzmkdpwtgA+xcAG/mHPgTTdpPXcx+oROrwvQEVFb2uwCcCqghYWQnw
	c9vir2AVTAhw2K5jK9zXB2LhbOcHOMtXY5NPLwuJAdZco8IAOuOoE4F9l9K4KhR4Emn76B
	LVkReWLjm/DxrtomozanZaT3zznibpHduhVEL2tOWH5ATiH/rtuoMUov35Iemg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 10:01:15 +0200
Message-Id: <DM595QWIXNCE.1TBUQ3D0A1HKL@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 08:01:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10672

Hi Paul,

This pull request contains the latest changes needed to finalize the Blacks=
ail
release notes, which were covered by Jo=C3=A3o.


The following changes since commit f26faba8568a3c8fc81d81d3650cc419847a4e17=
:

  migration-guides/release-notes-6.1.rst: add contributors (2026-09-21 17:1=
5:14 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 04a6651f50f4c1ca9b6c566bba6465d6617a62a9:

  ref-manual: put the ARCHIVER_MODE comments on their own lines (2026-10-15=
 09:20:21 +0200)

----------------------------------------------------------------
Adrian Freihofer (1):
      dev-manual/devtool: fix non-patch local file handling docs

Jo=C3=A3o Marcos Costa (4):
      migration-guides/release-notes-6.1.rst: add recipe upgrades
      migration-guides/release-notes-6.1.rst: add CVE fixes
      migration-guides/release-notes-6.1.rst: update contributors
      migration-guides/release-notes-6.1.rst: add latest changes

Robert P. J. Day (1):
      dev-manual: correct directory name for oe-core wic files

Trevor Woerner (11):
      ref-manual: drop "partition" as a wic kickstart command
      dev-manual: indent a list continuation so the code block ends
      docs: document the conventions used in the manuals
      docs: give the root prompts a preamble
      docs: copy only the command from a console block
      docs: show a prompt on commands the reader is meant to type
      docs: write an elided passage as a comment
      docs: mark the placeholders in examples
      docs: remove real accounts from the examples
      kernel-dev: give each example block one thing to hold
      ref-manual: put the ARCHIVER_MODE comments on their own lines

 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/bsp-manual/bsp.rst                   |   4 +-
 documentation/conf.py                              |  19 ++-
 .../contributor-guide/recipe-style-guide.rst       |   2 +-
 documentation/contributor-guide/submit-changes.rst |  63 ++++-----
 documentation/conventions.rst                      |  56 ++++++++
 documentation/dev-manual/creating-fragments.rst    |   4 +-
 documentation/dev-manual/debugging.rst             |  13 +-
 documentation/dev-manual/devtool.rst               |  99 +++++++++-----
 documentation/dev-manual/disk-space.rst            |   4 +-
 documentation/dev-manual/hashequivserver.rst       |   2 +-
 documentation/dev-manual/layers.rst                |  10 +-
 documentation/dev-manual/limiting-resources.rst    |   2 +-
 documentation/dev-manual/new-recipe.rst            |   6 +-
 documentation/dev-manual/packages.rst              |   4 +-
 .../dev-manual/python-development-shell.rst        |   1 -
 documentation/dev-manual/qemu.rst                  |  10 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/dev-manual/upgrading-recipes.rst     |  18 +--
 documentation/dev-manual/wayland.rst               |   8 +-
 documentation/dev-manual/wic.rst                   |  46 +++----
 documentation/index.rst                            |   7 +
 documentation/kernel-dev/advanced.rst              | 139 ++++++++++-------=
--
 documentation/kernel-dev/common.rst                |  41 +++---
 documentation/migration-guides/migration-2.1.rst   |   4 +-
 documentation/migration-guides/migration-2.5.rst   |   4 +-
 documentation/migration-guides/migration-3.2.rst   |   2 +-
 documentation/migration-guides/migration-4.0.rst   |   2 +-
 documentation/migration-guides/migration-5.2.rst   |  16 +--
 documentation/migration-guides/migration-5.3.rst   |  10 +-
 .../migration-guides/release-notes-4.2.rst         |   2 +-
 .../migration-guides/release-notes-5.3.rst         |   2 +-
 .../migration-guides/release-notes-6.1.rst         | 149 ++++++++++++++---=
----
 documentation/overview-manual/concepts.rst         |   2 +-
 documentation/profile-manual/usage.rst             |   4 +-
 documentation/ref-manual/classes.rst               |   8 +-
 documentation/ref-manual/devtool-reference.rst     |  10 +-
 documentation/ref-manual/faq.rst                   |   6 +-
 documentation/ref-manual/fragments.rst             |  16 +--
 documentation/ref-manual/kickstart.rst             |   9 +-
 documentation/ref-manual/qa-checks.rst             |   4 +-
 documentation/ref-manual/variables.rst             |  43 +++---
 documentation/sdk-manual/extensible.rst            |   6 +-
 documentation/sphinx-static/theme_overrides.css    |  28 ++++
 documentation/test-manual/reproducible-builds.rst  |   2 +-
 documentation/test-manual/runtime-testing.rst      |   4 +-
 46 files changed, 548 insertions(+), 347 deletions(-)
 create mode 100644 documentation/conventions.rst

