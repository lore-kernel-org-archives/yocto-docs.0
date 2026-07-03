Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016EFC44500
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 07:49:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88319.1783064995542282228
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 00:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0yJBrG8o;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4E8BF4E40C55
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 07:49:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18FF660300;
	Fri,  3 Jul 2026 07:49:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D7B7104C8399;
	Fri,  3 Jul 2026 09:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783064992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=MKuVDP2TST6IekyehDYvWmxorn7ye3ukqbbyEUYgHg4=;
	b=0yJBrG8o/U0n7HvjxteoagybIX7uBYWqgJAViJClWGu2BqOUOPTrxfXdWcPS0ZIItyqBHS
	D0ihCpV9mzumhoAlhqFVo571FlZQRazt9GSJ801VySexlv0mQ/SskP5tigs08hXUE9M0xh
	4guF+Qme345iXkIjO8tQpDIY07HULaUFgU4ooTFSoH/GU+NJdiIHK8wBY/qGNOxGSBx2GW
	1IvWAfGZzGuBO3kSdydLO6rN9tgYoiLTMf0VziqHu6TJQ7mjrtzT6FGM0U6/5qOlxsG4qR
	eswsctMuAKUIBSiqU/ZOr8hSGAuCradf5uEim4LkIh7oZbiRRX+xPmGlslH8ew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 09:49:50 +0200
Message-Id: <DJORSCEZ9B0F.3MEWDPI8801ZB@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 07:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10004

The following changes since commit 1b819d324780a699d9307a2d4e68c69b576ab748=
:

  ref-manual: add more explanation to glossary variable LICENSE (2026-06-22=
 10:39:37 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to d9ab7e1ddda625839f359fdf15328e83efb4fa5e:

  ref-manual/variables.rst: document the IMAGE_*_DEBUGFS variables (2026-07=
-03 09:33:01 +0200)

----------------------------------------------------------------
Antonin Godard (5):
      ref-manual/variables.rst: document the CCACHE_NATIVE_RECIPES_ALLOWED =
variable
      ref-manual/variables.rst: document missing CONFLICT_*_FEATURES variab=
les
      ref-manual/variables.rst: document the LOCALE_PATHS variable
      ref-manual/variables.rst: document the LOCALE_UTF8_IS_DEFAULT variabl=
e
      ref-manual/variables.rst: document the IMAGE_*_DEBUGFS variables

Paul Barker (1):
      recipe-style-guide: Clarify when License-Update tag is needed

Robert P. J. Day (1):
      ref-manual: remove all traces of "kernel_menuconfig" task

 .../contributor-guide/recipe-style-guide.rst       |  9 ++-
 documentation/ref-manual/tasks.rst                 | 43 +++++--------
 documentation/ref-manual/variables.rst             | 72 ++++++++++++++++++=
+++-
 3 files changed, 94 insertions(+), 30 deletions(-)

