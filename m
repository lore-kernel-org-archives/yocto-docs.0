Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FFAD6DDEC
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 08:04:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.15322.1731657887420759013
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Nov 2024 00:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GsRssR2+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EA40E0004;
	Fri, 15 Nov 2024 08:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731657885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G6wGueNWXLSCMMNZetbV1UVPfYYZnTCXiyNhUkapfnA=;
	b=GsRssR2+RsLp3aGp6dAms7lcebH6T+oXGnq5hqpRnvG7p3UDplSgh8nOo4OsGlMxg44S33
	bkgzHJoOlM0zOWVGEDbZOjCGvFiA7SVlLYqot1rHa8eB69UoLgaz//qJ3r1FObpiPdpvA7
	fR+ZolvQ2mSuLd/IpR7zrHzXcmxcbl4a7ZdFoU6z47KmlH643cZDaaXROh0KDVHA/RoMEU
	v6YXK2ceof8ZxYZj3pQaB7WhlqgMLojXaeZBOsy0YhQ5fiodRaOt4WQYpYMpERUycxSSu9
	xwlZLwoWCYDQzB2bUwMu2qJDI8ZmLFzU9I5xOR5dsgGlC1J/MHTrvXLQKfqpew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Nov 2024 09:04:43 +0100
Message-Id: <D5MLHLHN83SD.S5379VL1P484@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 15 Nov 2024 08:04:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5748

Hi Richard,

The following changes since commit e882cb3e5816d081eb05cb83488f286cca70e0c6=
:

  dev-manual: add bblock documentation (2024-11-06 16:39:13 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to cafa551d0927f56854f823e51f3de690f17423cd:

  dev-manual: bblock: use warning block instead of attention (2024-11-15 08=
:14:44 +0100)

----------------------------------------------------------------
Antonin Godard (7):
      doc: Makefile: remove inkscape, replace by rsvg-convert
      doc: Makefile: add support for xelatex
      doc: add a download page for epub and pdf
      sphinx-static/switchers.js.in: do not refer to URL_ROOT anymore
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
 documentation/sphinx-static/switchers.js.in        |  6 ++
 8 files changed, 134 insertions(+), 9 deletions(-)
 create mode 100644 documentation/downloads.rst

