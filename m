Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6BDE7718A
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 08:47:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.148383.1734684418642147022
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 00:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iSF4Hm/R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5DD61C000F;
	Fri, 20 Dec 2024 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734684417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gdFMEFg/W9phfSie9+OHm12JiQEWfFhgfmcbKuX0ZCc=;
	b=iSF4Hm/RLS75e/ipWd/jbn613qpBgQC1Pdpj+3QXvk7DRnKFrkA6OHwdVLwuFz9Ya0ERAU
	NjqBkhty9Zj5UmoIKzAjgOqBaU6iBejjTEJp/i53F+aP8nUE2MV9STKL6v976DyR5SIY3v
	ikct+B86CnLcPiGA8847cg6nEg867KF2YThMOyiQW6r/UZs95qaggDo3iJN84XLe4a0NY3
	ONIYsw+Ae7PHgjxlTRM3TQRd7rO5EcesplyApuIdw074Z0C7Z+g6VE1Rw2S1HhCh34zk/C
	mXn+Pe+CJO4hKCfDyoIejRst5brpWF/6Fi/nt8tC4foFJuh8HjOBMsHmfzvmZA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 09:46:56 +0100
Message-Id: <D6GEAZL23FV9.20659SPW3025X@bootlin.com>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 08:47:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5989

The following changes since commit 01048d7de570a9d896c5aab294008396e2d78607=
:

  system-requirements.rst: add dependencies for pdf builds (2024-12-16 09:0=
3:51 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 8e6b07ffcc3aacee2244e064e09c27418017e414:

  dev-manual/bmaptool.rst: simplify and fix instructions (2024-12-20 09:24:=
18 +0100)

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

