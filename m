Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667AEE7718B
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 08:47:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.148384.1734684418740853561
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 00:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g7mVUfqr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2C651BF203;
	Fri, 20 Dec 2024 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734684417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xSarv3CZOVobOSvo7EQF5QktZLPBWMDhN6JokE9d/h4=;
	b=g7mVUfqr/Yx9Ln3gxkQ8IbHEpbHiRFJLx/TOAwGEdYUN3+S4DqV/hDOEQ5DjmelhCch8Uu
	ua9hEXsgRyAZZBeQP3I4pqlwYaKtioMMUILM8KhFSdNZKVivB9f09sSuItfnn8/A1HfX3t
	fbl9CqbP/Y6yJZkWAUTICZJ8lBZrxGEWha7oPe17ltLaD0JyeaG04h81Z7Pf4IldNQe+IU
	mXBv4qd2ONCKhECbSEmRLhUVvOl607lA6a+QKQtc2dkqD/W0PIQ4vHVwT59HpVzktv2p+8
	LwrMX0fHN+Pa9VJt9zT5VUtOrLo5HySpZTca7KxvlQ/JqAwpDLiEIKY5iTcYKQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 09:46:56 +0100
Message-Id: <D6GEAZNYGLRC.35J6GMQPSENH8@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 08:47:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5990

The following changes since commit 804240fa86fee63d0d2dd029d941cf14b23bd730=
:

  system-requirements.rst: add dependencies for pdf builds (2024-12-16 09:1=
5:37 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to a1e4f18af6b0b10cece83c53ebb14052a0b94314:

  dev-manual/bmaptool.rst: simplify and fix instructions (2024-12-20 09:27:=
12 +0100)

----------------------------------------------------------------
Antonin Godard (1):
      Update the documentation for SRCPV

Michael Opdenacker (3):
      dev-manual: fix styling of references to bmaptool
      dev-manual/bmaptool.rst: correct command for bmaptool-native
      dev-manual/bmaptool.rst: simplify and fix instructions

 .../contributor-guide/recipe-style-guide.rst       |  6 +--
 documentation/dev-manual/bmaptool.rst              | 29 +++++------
 documentation/dev-manual/external-scm.rst          |  9 ++--
 documentation/dev-manual/new-recipe.rst            | 10 ++--
 documentation/dev-manual/packages.rst              | 13 ++---
 documentation/dev-manual/wic.rst                   |  4 +-
 documentation/kernel-dev/common.rst                | 13 ++---
 documentation/ref-manual/variables.rst             | 59 ++++++++++--------=
----
 8 files changed, 63 insertions(+), 80 deletions(-)

