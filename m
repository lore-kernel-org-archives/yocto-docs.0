Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8464CDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:45:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38820.1782117933082611596
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 01:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hYo4qY1K;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 689694E405EA
	for <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:45:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 386E3601BB;
	Mon, 22 Jun 2026 08:45:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C6D1106C89C2;
	Mon, 22 Jun 2026 10:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782117930; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=SqPvY3DxoOAcal1CbMbeWk6RsX2Q7i2ffBD9Uf3bcPc=;
	b=hYo4qY1Kn+v/Zw7DyjW4eaKljV+qajHkwTh9OUE4MX263ULAwGi3/KMCsothtgA98LJlc+
	LdIY8sVwmR6XV3W69OhukCjkCLi68kpaLUSlFkHon1SNcn4L2I6Uh1FbAKJy7ulvSEUEt/
	NAUFfh/xDSktzY5T8CskA5EGIvOb39tJ7+6pTlubIyhMIj28GEAqh0w3SVh6f2ag1AYoSY
	2SyQzum3G1jwzHLhUZENp5mPhRHqHEHnVbslT8qJj1w3WgPpd1S5F9qmAI8aHz0bpBMeh6
	ulC3844RIjyd6G5Tu85FGIupPtN1WKKArTfs3KMUhgNi1gKe9THv/X7HrNPvQw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 10:45:29 +0200
Message-Id: <DJFG2YQXG0MV.MUH09BGETTJI@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:45:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9822

The following changes since commit be424bf52cd3ac9c83a4617d0b06afe8cde055be=
:

  migration-guide: add release notes for 5.0.18 (2026-06-08 17:24:13 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 47f0f69651280151a52f41fd6b425d55427401e9:

  host_packages_scripts/ubuntu_docs.sh: remove python3-saneyaml (2026-06-22=
 10:18:23 +0200)

----------------------------------------------------------------
Antonin Godard (2):
      Document shared state signing
      host_packages_scripts/ubuntu_docs.sh: remove python3-saneyaml

Chen Qi (3):
      ref-manual/variables.rst: add UPSTREAM_STABLE_RELEASE_REGEX and STABL=
E_VERSION_PARTS
      ref-manual/classes.rst: add upstream-stable-release-point class docum=
entation
      ref-manual/release-process.rst: add patch acceptance policies and sta=
ble point release upgrades

Peter Marko (1):
      build-manual: update ROOTFS_POSTPROCESS_COMMAND example

Robert P. J. Day (23):
      ref-manual: clarify that PACKAGE_EXCLUDE supports DEB packaging
      dev-manual: correct example of "bitbake-layers"
      dev-manual: explain how to properly call "bitbake-layers"
      dev-manual: replace period with comma in list
      dev-manual: drop "PREFERRED_VERSION" from x86-base.inc snippet
      dev-manual: change "setup" to "set up" when used as an action
      dev-manual: for testing local changes, refer to devtool section
      dev-manual: fix grammatical error, missing word "with"
      dev-manual: use "trade-off" as the noun
      dev-manual: fix broken grammar in "Libraries" section
      dev-manual: fully define SOLIBS-related variables in bitbake.conf
      security-manual: some grammar and wording fixes in intro
      kernel-dev: break a paragraph into a bullet list
      kernel-dev: remove references to defunct LTSI project
      dev-manual: update AUTOREV explanation to match current file
      dev-manual: SysVinit is the default init manager for Poky
      test-manual: add more detail to the ptest section
      ref-manual: clarify use of "PACKAGE_ARCH" in a packagegroup
      ref-manual: document RM_WORK_EXCLUDE_ITEMS variable
      ref-manual: update glossary entries for packaging backend variables
      ref-manual: add more explanation to glossary variable LICENSE
      ref-manual: explain default value used for SUMMARY
      security-manual: clarify text on avoiding root logins, empty password=
s

Vyacheslav Yurkov (1):
      migration-guide: Fix migration scripts

 documentation/dev-manual/build-quality.rst         |   2 +-
 documentation/dev-manual/building.rst              |   2 +-
 documentation/dev-manual/external-scm.rst          |  45 ++--
 documentation/dev-manual/hashequivserver.rst       |   4 +-
 documentation/dev-manual/init-manager.rst          |   2 +-
 documentation/dev-manual/layers.rst                |   9 +-
 documentation/dev-manual/libraries.rst             |   2 +-
 documentation/dev-manual/new-recipe.rst            |   7 +-
 documentation/dev-manual/poky-manual-setup.rst     |  10 +-
 documentation/dev-manual/prebuilt-libraries.rst    |   4 +-
 documentation/dev-manual/speeding-up-build.rst     |   2 +-
 documentation/dev-manual/start.rst                 |   8 +-
 documentation/dev-manual/temporary-source-code.rst |   8 +
 documentation/kernel-dev/concepts-appx.rst         |  16 --
 documentation/kernel-dev/intro.rst                 |  29 ++-
 documentation/migration-guides/migration-5.3.rst   |   6 +-
 documentation/overview-manual/concepts.rst         |   6 +
 documentation/ref-manual/classes.rst               |  43 ++++
 documentation/ref-manual/release-process.rst       | 120 +++++++++
 documentation/ref-manual/variables.rst             | 111 +++++++-
 documentation/security-manual/index.rst            |   1 +
 documentation/security-manual/intro.rst            |  14 +-
 documentation/security-manual/securing-images.rst  |  23 +-
 documentation/security-manual/sstate-signing.rst   | 285 +++++++++++++++++=
++++
 documentation/test-manual/ptest.rst                |  40 ++-
 documentation/tools/build-docs-container           |   1 -
 .../tools/host_packages_scripts/ubuntu_docs.sh     |   2 +-
 27 files changed, 695 insertions(+), 107 deletions(-)
 create mode 100644 documentation/security-manual/sstate-signing.rst

