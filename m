Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42426D6DDE7
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 08:04:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.15320.1731657867668517883
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Nov 2024 00:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cZ+Pun/x;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3B8E1BF207;
	Fri, 15 Nov 2024 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731657866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L5jh5GvWF5/hR6QQicDABqMJ9IdD57izv0bI/bn2slk=;
	b=cZ+Pun/x8b4IGUYUvvQVbaa5pxATbvGPGlFZbPA4a0RTOqGf9P5jGeNTCbRbwV8ID5CXNc
	uWBJ6IlPHJQp/k1rLiHeMG+0gEKjuWJk7nxGOiQlhcHdaUg7EAWlEtnvPqM108NiNX7a4D
	0fJaumh3RKqGDUu3eMAJhmfMklTTb8dXaU8JVe7ScD0Rl1/Pg6P7WBkIW39lpFJ8RGncMZ
	FjInT/ccC5F0t5Ao4HRXzAV2glxcOL2SEuZ9Oi0GjfOROJP2k3HegvyZg/Ldd4KkWUyqVI
	v0n+gxo8uM7lgF5TnQoy7r8EnlYG7WXETcRx0CehpGs8WRT6JzEPyW+8VUEtqg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Nov 2024 09:04:25 +0100
Message-Id: <D5MLHD9WG5BS.3J8X738I5L6I4@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 15 Nov 2024 08:04:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5746

Hi Richard,

The following changes since commit a082aa39840587d3af6c3f4a2c2747564ca37414=
:

  dev-manual: add bblock documentation (2024-11-06 16:37:06 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to ed49067f172637d38d470a864feed2a02bd84c66:

  dev-manual: bblock: use warning block instead of attention (2024-11-15 08=
:12:31 +0100)

----------------------------------------------------------------
Antonin Godard (9):
      doc: Makefile: remove inkscape, replace by rsvg-convert
      doc: Makefile: add support for xelatex
      doc: add a download page for epub and pdf
      sphinx-static/switchers.js.in: do not refer to URL_ROOT anymore
      migration-guides: 5.1: fix titles
      migration-guides: add placeholder files for next release
      conf.py: add a bitbake_git extlink
      dev-manual: document how to provide confs from layer.conf
      dev-manual: bblock: use warning block instead of attention

Michael Opdenacker (1):
      doc: Makefile: publish pdf and epub versions too

Talel BELHAJSALEM (1):
      contributor-guide: Remove duplicated words

 documentation/Makefile                             | 17 ++--
 documentation/conf.py                              |  8 +-
 documentation/contributor-guide/submit-changes.rst |  2 +-
 documentation/dev-manual/bblock.rst                |  2 +-
 documentation/dev-manual/layers.rst                | 90 ++++++++++++++++++=
++++
 documentation/downloads.rst                        | 11 +++
 documentation/index.rst                            |  7 ++
 documentation/migration-guides/index.rst           |  1 +
 documentation/migration-guides/migration-5.1.rst   |  8 +-
 documentation/migration-guides/migration-5.2.rst   | 59 ++++++++++++++
 documentation/migration-guides/release-5.2.rst     |  9 +++
 .../migration-guides/release-notes-5.2.rst         | 65 ++++++++++++++++
 documentation/sphinx-static/switchers.js.in        |  6 ++
 13 files changed, 273 insertions(+), 12 deletions(-)
 create mode 100644 documentation/downloads.rst
 create mode 100644 documentation/migration-guides/migration-5.2.rst
 create mode 100644 documentation/migration-guides/release-5.2.rst
 create mode 100644 documentation/migration-guides/release-notes-5.2.rst

