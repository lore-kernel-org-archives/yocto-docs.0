Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D487C43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 07:49:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88318.1783064995499849700
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 00:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LU1Mtjsj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5F29F1A0E0E;
	Fri,  3 Jul 2026 07:49:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 307E86031F;
	Fri,  3 Jul 2026 07:49:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A801104C958A;
	Fri,  3 Jul 2026 09:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783064992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=LdqecMKuBHdYqlHLgvubUZYwVRQRTIduO0c4wGkeQXk=;
	b=LU1MtjsjCR4Qu/++7dYlN7FLnentp3D7N6m/2lbCHZj73ycGQSb9m3PxAyCThGHm4Mo55h
	/rOkPJoahnncrWnx+bPfLY9rmJSID0lDm+f3+8WjW45OIkHaNtRqxU3bIbMVJyxjindPKG
	EGgZRMz5Su0wBO8lzpthFOtc5jiYKXPbBAm7JtfP5COxsnWj79SDqcWzsS1nzcsQn6nzBX
	fXkeNu+an9gC3EkC0XP7BMIKrkh/FyCPGDjeR17533zt5otZk6rMehXbCz3NEfUsuZA/dt
	6wsLQ6ujPgQ0fV8rFyU64wQCwXf2JZp/5REwlaP/NIq5OleTKDETj2rysta0Hg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 09:49:51 +0200
Message-Id: <DJORSCRU5ISJ.HTESMK2BJH95@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [wrynose] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 07:49:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10005

The following changes since commit 78bd02a51fcc740180df95028c33045d23e31500=
:

  migration-guides/migration-6.0.rst: fix wks file move note (2026-06-26 10=
:20:38 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to f5979d175971b55c4653ffe5c059d4e42034b714:

  ref-manual/variables.rst: document the IMAGE_*_DEBUGFS variables (2026-07=
-03 09:33:01 +0200)

----------------------------------------------------------------
Antonin Godard (18):
      dev-manual/wic.rst: replace deprecated wks directories
      ref-manual/classes.rst: replace deprecated wks directory
      ref-manual/kickstart.rst: replace deprecated wks directory
      bsp-guide/bsp.rst: fix raspberry layer content example
      dev-manual/wic.rst: remove note on wic-tools
      dev-manual/wic.rst: remove bullet point on host requirements
      dev-manual/wic.rst: add where to set IMAGE_FSTYPES/WKS_FILE[S] from
      dev-manual/wic.rst: add a requirement to use wic from the build syste=
m
      dev-manual/wic.rst: convert code snippet to code-blocks
      ref-manual/kickstart.rst: remove note on available commands
      ref-manual/kickstart.rst: document the include directive
      ref-manual/variables.rst: document the CCACHE_NATIVE_RECIPES_ALLOWED =
variable
      ref-manual/variables.rst: document missing CONFLICT_*_FEATURES variab=
les
      ref-manual/variables.rst: document the LOCALE_PATHS variable
      ref-manual/variables.rst: document the TEST_SERIALCONTROL_CONNECT_TIM=
EOUT variable
      ref-manual/variables.rst: document the LOCALE_UTF8_IS_DEFAULT variabl=
e
      ref-manual/variables.rst: document the TEST_SERIALCONTROL_PS1 variabl=
e
      ref-manual/variables.rst: document the IMAGE_*_DEBUGFS variables

Lee Chee Yang (1):
      migration-guides: add add release notes for 6.0.1

Paul Barker (1):
      recipe-style-guide: Clarify when License-Update tag is needed

Robert P. J. Day (2):
      ref-manual: remove all traces of "kernel_menuconfig" task
      dev-manual: update bmaptool section, refer to "bmaptool" package

 documentation/bsp-guide/bsp.rst                    |   3 +-
 .../contributor-guide/recipe-style-guide.rst       |   9 +-
 documentation/dev-manual/bmaptool.rst              |  13 +-
 documentation/dev-manual/wic.rst                   | 213 ++++++++++++-----=
-
 documentation/migration-guides/release-6.0.rst     |   1 +
 .../migration-guides/release-notes-6.0.1.rst       | 249 +++++++++++++++++=
++++
 documentation/ref-manual/classes.rst               |   3 +-
 documentation/ref-manual/kickstart.rst             |  24 +-
 documentation/ref-manual/tasks.rst                 |  43 ++--
 documentation/ref-manual/variables.rst             |  83 ++++++-
 10 files changed, 522 insertions(+), 119 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-6.0.1.rst

