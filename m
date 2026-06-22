Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98D9CDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:45:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38979.1782117933879879894
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 01:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yVkh7b6o;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CC85BC6220A;
	Mon, 22 Jun 2026 08:45:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6735601C2;
	Mon, 22 Jun 2026 08:45:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C92D3106C8918;
	Mon, 22 Jun 2026 10:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782117930; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=twLxjt/5m1d5uU0JSR/FGksf1ItA5i6zYvOgpOaxbB4=;
	b=yVkh7b6o04KBNkdr8mtwlfWQ6S3geP9bUPMVCp5np1H3qKgmjiyF3BHv745dcZ3KRcjdQ0
	aZsBG33tTSMecOiOk1U61xPDTY8fYM48EQsAvGxdOjLP8jsdO8zGWQ88wSIXkUzRVmwvHR
	nJZVg1LVEufe48gGmnmGZ0rJWhtzy9VCzBe8FNLMI6VvxMT9jIky6hzH2a+iHCapbnsNRo
	Aicir/PJM+LReNATjlJ2C7cgLdKb5aDdXumLSXZ/iCtxiP9l2KNpTa0iEXMnStG7svWjlR
	7onUVMBnf+xSch8w5H2UjkR8N+ZOsc/q8xi1PhoTOA3687Zw9T9RpBJoP4Z6AA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 10:45:29 +0200
Message-Id: <DJFG2YJFWT7W.2JF07UGMTTS18@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [wrynose] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:45:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9824

The following changes since commit 768cbc95861c0da961c9f1ba77a9369caa3dce2d=
:

  migration-guide: add release notes for 5.0.18 (2026-06-08 17:25:28 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to 2c59a23fc39d92831cb55a0e5f713d20f94730d4:

  ref-manual: add more explanation to glossary variable LICENSE (2026-06-22=
 10:37:34 +0200)

----------------------------------------------------------------
Antonin Godard (1):
      Document shared state signing

Peter Marko (1):
      build-manual: update ROOTFS_POSTPROCESS_COMMAND example

Robert P. J. Day (14):
      ref-manual: clarify that PACKAGE_EXCLUDE supports DEB packaging
      dev-manual: drop "PREFERRED_VERSION" from x86-base.inc snippet
      dev-manual: change "setup" to "set up" when used as an action
      dev-manual: fix grammatical error, missing word "with"
      dev-manual: fix broken grammar in "Libraries" section
      dev-manual: fully define SOLIBS-related variables in bitbake.conf
      security-manual: some grammar and wording fixes in intro
      kernel-dev: remove references to defunct LTSI project
      dev-manual: update AUTOREV explanation to match current file
      dev-manual: SysVinit is the default init manager for Poky
      ref-manual: clarify use of "PACKAGE_ARCH" in a packagegroup
      ref-manual: document RM_WORK_EXCLUDE_ITEMS variable
      ref-manual: update glossary entries for packaging backend variables
      ref-manual: add more explanation to glossary variable LICENSE

Vyacheslav Yurkov (1):
      migration-guide: Fix migration scripts

 documentation/dev-manual/build-quality.rst       |   2 +-
 documentation/dev-manual/building.rst            |   2 +-
 documentation/dev-manual/external-scm.rst        |  45 ++--
 documentation/dev-manual/hashequivserver.rst     |   4 +-
 documentation/dev-manual/init-manager.rst        |   2 +-
 documentation/dev-manual/libraries.rst           |   2 +-
 documentation/dev-manual/new-recipe.rst          |   5 +-
 documentation/dev-manual/poky-manual-setup.rst   |  10 +-
 documentation/dev-manual/prebuilt-libraries.rst  |   4 +-
 documentation/dev-manual/start.rst               |   8 +-
 documentation/kernel-dev/concepts-appx.rst       |  16 --
 documentation/kernel-dev/intro.rst               |   6 +-
 documentation/migration-guides/migration-5.3.rst |   6 +-
 documentation/overview-manual/concepts.rst       |   6 +
 documentation/ref-manual/classes.rst             |  19 ++
 documentation/ref-manual/variables.rst           |  79 ++++++-
 documentation/security-manual/index.rst          |   1 +
 documentation/security-manual/intro.rst          |  14 +-
 documentation/security-manual/sstate-signing.rst | 285 +++++++++++++++++++=
++++
 19 files changed, 438 insertions(+), 78 deletions(-)
 create mode 100644 documentation/security-manual/sstate-signing.rst

