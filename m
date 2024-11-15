Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1DBD6DDEA
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 08:04:51 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.15565.1731657881246659402
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Nov 2024 00:04:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=exnXNYq1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21869240005;
	Fri, 15 Nov 2024 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731657879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iILIP959BFj4uOEmecBz+Z6hsnwcZ2EVlnaZIkuhblc=;
	b=exnXNYq1m5cprMwpDVbNr+qZ3jYofx0na137EYOeW78cO81WUkGJfsaX0Peiq9MY1dX4Pt
	TyVsE/wtKgJti3jmmsD+lDoOVAloES7UdmH0q7gz49gLm64sCboPVlh36JFNpkLVwYpnZU
	qdqgVW6BXWii+7Oko5VjXHFTzu/lbdPcyOEHKcPqh2IQ/H2Ol/NtxCAQPV48CGeJjI2J/q
	FlKV0WaNGr9kHq53/7Hgm572veycX5DDaIhTLbMUHEz354/CtMNbvwSzUm/dB70N+H88pQ
	SRfH+AIhGrjEfy4Uaf8rBkgif6LVc1vXpWH80nKe8miWA3PEPMHtxitVG8bdxw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Nov 2024 09:04:38 +0100
Message-Id: <D5MLHJDDXE3X.11SIWSY7M7LS0@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 15 Nov 2024 08:04:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5747

Hi Richard,

The following changes since commit 5692ad6f023289dda63567c1f79132854ae3899d=
:

  dev-manual: add bblock documentation (2024-11-06 16:39:02 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 8288c8cae7fe7303e89d8ed286de91fc26ce6cc3:

  dev-manual: bblock: use warning block instead of attention (2024-11-15 08=
:14:39 +0100)

----------------------------------------------------------------
Antonin Godard (8):
      doc: Makefile: remove inkscape, replace by rsvg-convert
      doc: Makefile: add support for xelatex
      doc: add a download page for epub and pdf
      sphinx-static/switchers.js.in: do not refer to URL_ROOT anymore
      migration-guides: 5.1: fix titles
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
 documentation/migration-guides/migration-5.1.rst   |  8 +-
 documentation/sphinx-static/switchers.js.in        |  6 ++
 9 files changed, 139 insertions(+), 12 deletions(-)
 create mode 100644 documentation/downloads.rst

