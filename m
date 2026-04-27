Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08083FF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 08:30:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38510.1777278605953207928
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 01:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qGhnSWo+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3DF6B1A343D;
	Mon, 27 Apr 2026 08:30:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13B99600D1;
	Mon, 27 Apr 2026 08:30:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 245D010722377;
	Mon, 27 Apr 2026 10:30:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777278603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=NeTWD4nsFKq/ETsegjCEec6emBzYCRNHRg4VERdUOFc=;
	b=qGhnSWo+FFeo8v0Nh7Rk/38W5gMT93mVPkcdLdJyv920jo0a0LhyelwkOeosqfFnZci9TL
	GNPaCvixCXnXPXJEO1ORtNOU5/mUPZT+DXWOoyZahJiwHcaqss10vZnTncGN/+d6e4E/MB
	ogQcphr0yEK24AeeJ48XJg4ijeqvKkNFhsTe5+hvuqZxy+Xr5DIJgeppTwJhdZIXoldmpf
	99ofwUvoxG18zY9Fi/j8FGON4fN1FcqvRFQT38+6UI0K5S6J2mKhUDn7uI8QzbvhGPba4Q
	YYBMC7ZUAahHD3FJjdxiCUFso0biCZIBvsXn+PAALrdqdbQOxBG/1bXD2R2Afw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 10:30:02 +0200
Message-Id: <DI3SOMN1OBHU.16HTQGPE80IZL@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Apr 2026 08:30:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9368

The following changes since commit 2c80b891d85e0a7d9b70fc7b4a9c032325b56eca=
:

  variables.rst: expand explanation of RSUGGESTS (2026-04-21 15:17:53 +0200=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 1c5e7f136d7460fa5ad4c8a49ab1de31bd670e59:

  overview-manual/concepts.rst: fix do_prepare_recipe_sysroot task descript=
ion (2026-04-27 10:22:28 +0200)

----------------------------------------------------------------
Dawid Bijak (1):
      overview-manual/concepts.rst: fix do_prepare_recipe_sysroot task desc=
ription

Robert P. J. Day (1):
      dev-manual: "--runonly" should be "--runall"

 documentation/dev-manual/building.rst      |  2 +-
 documentation/overview-manual/concepts.rst | 29 ++++++++++++++++----------=
---
 2 files changed, 17 insertions(+), 14 deletions(-)

