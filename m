Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132BFC02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:39:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.32987.1737362365751702786
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jan 2025 00:39:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C1DVZAtk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 748941BF204;
	Mon, 20 Jan 2025 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737362363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9Y4YEfD0D9qd9IKreY6McI5nt+lKW9a3XfQnhBxdJNs=;
	b=C1DVZAtkGiXgMCTnL0ejDhbYaaBkPu0rEuUTgXMOTqQw/Ou6wd6M/fHyJ7pDgsuCeNr3RI
	b2vNIt8c3V8Hh6XkRB7yZArRbdtIoAe+AVREdk0gAz5m/42PN+ArbqctxgUaYLSv/cWw7b
	XbI+q/jO5M5fLzdJwl2ZpqwgOWJ0V/7XJjXTfQ9xgd3hdow+n/4bttgbPP3PlFxICnNfeL
	YNK1JJeBjgblmmZsko4RXE7R85fzI46Lag+2f9eVcUHfg+gTsIpg/NC9hNYHnJ8Tw5LPbF
	ACHrEhiLuJ85U6DsvO6aYsIu2DpTs8HFbzwNTo1PxCpvbhDfnhZZaOlicWuphg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jan 2025 09:39:23 +0100
Message-Id: <D76RK397N87N.XMR9UL6X5JPR@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jan 2025 08:39:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6148

The following changes since commit 6b44257874858db3aa426d3e84a79c41cb4937a3=
:

  ref-manual: move runtime-testing section to the test-manual (2025-01-08 1=
1:41:59 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 8bd2bc3c00ca80f4c000a2a8d618a9f8ea3aa54b:

  test-manual/reproducible-builds: fix reproducible links (2025-01-17 17:26=
:48 +0100)

----------------------------------------------------------------
Adrian Freihofer (4):
      migration-guides: systemd.bbclass do not add Also services for 5.2
      sdk-manual: extensible.rst: update devtool ide-sdk
      sdk-manual: extensible.rst: remove confusing post-install-logging
      release-notes-5.2: cover devtool modify --debug-build

Antonin Godard (2):
      Update autobuilder URLs to valkyrie
      test-manual/reproducible-builds: fix reproducible links

Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.6

 documentation/migration-guides/migration-5.2.rst   |  20 ++
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.6.rst       | 223 +++++++++++++++++=
++++
 .../migration-guides/release-notes-5.2.rst         |   6 +
 documentation/poky.yaml.in                         |   1 -
 documentation/ref-manual/release-process.rst       |   2 +-
 documentation/sdk-manual/extensible.rst            |   8 +-
 documentation/test-manual/reproducible-builds.rst  |   8 +-
 documentation/test-manual/test-process.rst         |   2 +-
 .../test-manual/understand-autobuilder.rst         |   2 +-
 10 files changed, 259 insertions(+), 14 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.6.rst

