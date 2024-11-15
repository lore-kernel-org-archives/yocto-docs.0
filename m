Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20213D6DDE8
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 08:04:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.15566.1731657890163184931
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Nov 2024 00:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lcQ8M96Z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FC8DC0005;
	Fri, 15 Nov 2024 08:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731657888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v7Q2jotSydgLNedyN16TrJ95On2KIc/ftve0tkoJOVM=;
	b=lcQ8M96ZvUSsJi7P6W+x1qTcp06DWgs1H4xKG96FbPBO8rVlXhVWMxENlB1AmaogTaTgMM
	fM+oJzFFFb6lt8jtUsFpQ7nHETfOdMXjraHjZCERjTtZWHtKD2mkl5i6PA+NJCnSPHOaYH
	7KBhd3DXGenfvgvs7bNP/BG9giWyePsy7a27Q0Fz6tZ/Vcyy+KJw6Gf7x5xy2QQX4P4y9Q
	WRML4EKM5EDVLs4nIAYAgSctnyQ6UoWkjuR4cKZFUlEDWjx+s4fSPFa+U1K/T70dK1/1qe
	9nJiOJrnucAgGTKdHECPuuPLUBT+OgU0JjgkKaf7HHPzrYLIB6Y2HQ+AH755KQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Nov 2024 09:04:47 +0100
Message-Id: <D5MLHNHP65VV.KWWAUZMUY945@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 15 Nov 2024 08:04:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5749

Hi Richard,

The following changes since commit 1f61cd4a3e9c5bf75910559ddf2372f921c2a4ef=
:

  ref-manual: variables: add SIGGEN_LOCKEDSIGS* variables (2024-11-06 16:40=
:47 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to e49111c280927c922ab40547c02c11772787b731:

  dev-manual: document how to provide confs from layer.conf (2024-11-13 17:=
03:13 +0100)

----------------------------------------------------------------
Antonin Godard (6):
      doc: Makefile: remove inkscape, replace by rsvg-convert
      doc: Makefile: add support for xelatex
      doc: add a download page for epub and pdf
      sphinx-static/switchers.js.in: do not refer to URL_ROOT anymore
      conf.py: add a bitbake_git extlink
      dev-manual: document how to provide confs from layer.conf

Michael Opdenacker (2):
      doc/Makefile: fix epub and latexpdf targets
      doc: Makefile: publish pdf and epub versions too

Talel BELHAJSALEM (1):
      contributor-guide: Remove duplicated words

 documentation/Makefile                             | 19 +++--
 documentation/conf.py                              |  8 +-
 documentation/contributor-guide/submit-changes.rst |  2 +-
 documentation/dev-manual/layers.rst                | 90 ++++++++++++++++++=
++++
 documentation/downloads.rst                        | 11 +++
 documentation/index.rst                            |  7 ++
 documentation/sphinx-static/switchers.js.in        |  6 ++
 7 files changed, 135 insertions(+), 8 deletions(-)
 create mode 100644 documentation/downloads.rst

