Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73F9C5DF95
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 14:45:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9052.1787323544024866554
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 07:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QcktSseT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 47CA51A1780;
	Fri, 21 Aug 2026 14:45:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C9F7604AA;
	Fri, 21 Aug 2026 14:45:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 657D711C77292;
	Fri, 21 Aug 2026 16:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787323537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8gh8aKFKrR/aRghKjbG4QF24Ku/HPW5LZhKkHOWA8DI=;
	b=QcktSseTSB4cNgsYCVi+QO/WQ0rhfequjniAgyOuEQRZCr6PzQXn1m+amzVmwYOcC8vXsT
	qCxvPRjCW0HNKtRd2WiIEsitpKOXlvKfv6LqxbSIcmAfNxo1nU8S2nx+8foXCcOEjC73Yg
	Cp7YOsh2DtnbKFA58Gvij+HggejJwkco8ECqhyJCBFlP/i/nsOWhVqBl47rVeH9F1LEruL
	JVYOzX5PrjaJdrMqUE/ptUpf0EDOL+Aw47qCxvrxxp5htSI5E6VyBHpMcVtw4a2/QMs36Q
	a9ZvikYr/+W1/rXA0dG9ipx6wuc2V2aNXWBdO6e+Vryw19tq1jkMJ/rssP/SOg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 16:45:35 +0200
Message-Id: <DKUPBD5JQA0B.2YZC84NQ1DL4E@bootlin.com>
Subject: [wrynose] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 14:45:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10312

The following changes since commit 5b1ff88511d90634bb3077b878176de577464e12=
:

  brief-yoctoprojectqs/index.rst: fix a replacement typo (2026-08-13 10:39:=
52 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to 026924a74741307bec398662c146edf77a597b1c:

  README: update instructions for installing vale and sphinx-lint (2026-08-=
21 16:36:26 +0200)

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
 documentation/README                               |  35 ++++++-----
 documentation/bitbake.rst                          |   6 +-
 documentation/bsp-guide/index.rst                  |  15 -----
 documentation/{bsp-guide =3D> bsp-manual}/bsp.rst    |  34 +++++-----
 .../figures/bsp-dev-flow.png                       | Bin
 documentation/bsp-manual/index.rst                 |  15 +++++
 .../contributor-guide/identify-component.rst       |   4 +-
 documentation/dev-manual/layers.rst                |   4 +-
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
 documentation/ref-manual/features.rst              |   6 +-
 documentation/ref-manual/qa-checks.rst             |   2 +-
 documentation/ref-manual/resources.rst             |   2 +-
 documentation/ref-manual/structure.rst             |   2 +-
 documentation/ref-manual/terms.rst                 |   4 +-
 documentation/ref-manual/variables.rst             |  61 +++++++++++++++++=
-
 documentation/sphinx-static/theme_overrides.css    |   4 ++
 documentation/standards.md                         |   6 +-
 documentation/test-manual/intro.rst                |   2 +-
 .../transitioning-to-a-custom-environment.rst      |   2 +-
 documentation/what-i-wish-id-known.rst             |   6 +-
 34 files changed, 277 insertions(+), 171 deletions(-)
 delete mode 100644 documentation/bsp-guide/index.rst
 rename documentation/{bsp-guide =3D> bsp-manual}/bsp.rst (98%)
 rename documentation/{bsp-guide =3D> bsp-manual}/figures/bsp-dev-flow.png =
(100%)
 create mode 100644 documentation/bsp-manual/index.rst
 delete mode 100644 documentation/overview-manual/intro.rst

