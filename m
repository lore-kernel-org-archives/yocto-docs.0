Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDACAC5DF89
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 14:45:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9053.1787323544250126051
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 07:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=K6d4Mgu4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 60C424E41307;
	Fri, 21 Aug 2026 14:45:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35F0C604C4;
	Fri, 21 Aug 2026 14:45:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A50511C77295;
	Fri, 21 Aug 2026 16:45:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787323537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ZdncKX3hZpsw6tSn6bo1xh8a+5gBRK0xeAPVvxYhhZU=;
	b=K6d4Mgu4Eu0dRPTZoyFkLDf6QpOclCd+/2oIF4bh8RBBQAmwEl2nsDmqmyBR0Ld7pWtqcu
	yqZhDgBDsyNSTJkwRuV4OrpuWihgke23mkrgrtkgPCw1uU47CsMKtBo8TgVCIbOWt+6y73
	LWL7Z4JMUzrhjvF2EinJVlABVvxFCqT07fmmBeESvvFNrKU4mKFH3Px5U7QUXMJ0FRiTmv
	TuG+vAQM4Qbbvy0yzHKOKfhrhWZ8s8RxJKOYrZwGHFQbV6i1I8MPkTU9dpknXGPS4NjPdp
	dLGGXEkgynwBkjj80uYl6QM7/QvEvJU0TDcEC5o6dmUNQNSavVsvIn09XXInQQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 16:45:35 +0200
Message-Id: <DKUPBCWV5O3W.1MKW930ZC8SVR@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [scarthgap] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 14:45:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10311

The following changes since commit dc9a5aa19ca2a0b5ad866f0329b8a030542ca0c6=
:

  ref-manual/variables.rst: document the QB_DEFAULT_BIOS variable (2026-08-=
13 10:29:21 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to c197e0c022549b4a787b0f1ed23f0d978539c673:

  README: update instructions for installing vale and sphinx-lint (2026-08-=
21 16:39:51 +0200)

----------------------------------------------------------------
Antonin Godard (12):
      index.rst: add introduction paragraphs
      index.rst: move the contributor guide out of the Manuals section
      index.rst: move the "Overview and Concepts" manual in the "Introducti=
on and Overview" section
      index.rst: move external links to the bottom of the intro section
      overview-manual: move the intro content in the index
      bsp-guide: rename to bsp-manual
      contributor-guide/identify-component.rst: use the same tense as other=
 section
      bitbake.rst: rename section to "BitBake User Manual"
      index.rst: move release notes in their own section
      index.rst: show the intro paragraph only for html-based docs
      ref-manual/variables.rst: document the PACKAGE_NO_LOCALE variable
      ref-manual/variables.rst: document the PACKAGEFUNCS variable

Daiane Angolini (2):
      ref-manual/features.rst: fix some cross references
      docs-wide: fix manual names in cross references

Quentin Schulz (1):
      README: update instructions for installing vale and sphinx-lint

 documentation/Pipfile                              |   2 +
 documentation/README                               |  29 +++++----
 documentation/bitbake.rst                          |   6 +-
 documentation/bsp-guide/figures/bsp-title.png      | Bin 17388 -> 0 bytes
 documentation/bsp-guide/index.rst                  |  15 -----
 documentation/{bsp-guide =3D> bsp-manual}/bsp.rst    |  34 +++++-----
 .../figures/bsp-dev-flow.png                       | Bin
 documentation/bsp-manual/index.rst                 |  15 +++++
 .../contributor-guide/identify-component.rst       |   4 +-
 documentation/dev-manual/layers.rst                |   6 +-
 documentation/dev-manual/new-machine.rst           |   2 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/dev-manual/upgrading-recipes.rst     |   2 +-
 documentation/index.rst                            |  70 +++++++++++++++++=
+---
 documentation/kernel-dev/advanced.rst              |   2 +-
 documentation/kernel-dev/common.rst                |   6 +-
 documentation/migration-guides/migration-2.5.rst   |   2 +-
 documentation/overview-manual/concepts.rst         |   2 +-
 .../overview-manual/development-environment.rst    |   4 +-
 documentation/overview-manual/index.rst            |  59 ++++++++++++++++-
 documentation/overview-manual/intro.rst            |  69 -----------------=
---
 documentation/overview-manual/yp-intro.rst         |   4 +-
 documentation/ref-manual/classes.rst               |   6 +-
 documentation/ref-manual/faq.rst                   |   6 +-
 documentation/ref-manual/features.rst              |   4 +-
 documentation/ref-manual/resources.rst             |   2 +-
 documentation/ref-manual/structure.rst             |   2 +-
 documentation/ref-manual/terms.rst                 |   4 +-
 documentation/ref-manual/variables.rst             |  59 ++++++++++++++++-
 documentation/sphinx-static/theme_overrides.css    |   4 ++
 documentation/test-manual/intro.rst                |   2 +-
 .../transitioning-to-a-custom-environment.rst      |   2 +-
 documentation/what-i-wish-id-known.rst             |   6 +-
 33 files changed, 269 insertions(+), 163 deletions(-)
 delete mode 100644 documentation/bsp-guide/figures/bsp-title.png
 delete mode 100644 documentation/bsp-guide/index.rst
 rename documentation/{bsp-guide =3D> bsp-manual}/bsp.rst (98%)
 rename documentation/{bsp-guide =3D> bsp-manual}/figures/bsp-dev-flow.png =
(100%)
 create mode 100644 documentation/bsp-manual/index.rst
 delete mode 100644 documentation/overview-manual/intro.rst

