Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700F0C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 09:02:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10557.1789549360466997593
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 02:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DuLrvCq2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 93D904E406E3
	for <docs@lists.yoctoproject.org>; Wed, 16 Sep 2026 09:02:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63D9F60337;
	Wed, 16 Sep 2026 09:02:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D913E11C7B021;
	Wed, 16 Sep 2026 11:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789549357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=iJIp9HIx4Ip1lGInAdKPV5YoHmMidxMZSlM75WmDvJI=;
	b=DuLrvCq2X7quk5LZzaoqY92WfrCj6EX7tYZswI5muL1c6uuII7n7AXLLUwVh0tH5LgGKVd
	Mq5Z9t4P7fQyY2FkKjtPSupggH4wlm+t+1BFOakM4gxLdBmn83HY0zUcPwCxwpDxBPeULJ
	U/7RZarik//4NwLbsBvl5INvk9hvgeQ9x2mPWn4tEEPvoPOwk7Qg/f8bOOTakcoWehnONy
	X65OAZlldmtAbND5HW3i+uFFGpN69jAXPlEfS/zwrxlVAK7l9//1J6djB++r7bZKijDSXb
	X+El1OE3URr6kJ2Ec2iqbWQvkMEWbqgas/OPeYvfvYNZT/F6V1yEF9SJReiMYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 11:02:36 +0200
Message-Id: <DLGMAX39UMAB.3O03RV4ZDUFJB@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Sep 2026 09:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10521

The following changes since commit e35e86e9aea4e4ae12e8e0ba8a6391f2b2555b63=
:

  ref-manual/system-requirements.rst: drop ccache in distros (2026-09-01 15=
:39:08 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to e9fd43e2584fa793dbdbe1545c3c67c41f7d3ef7:

  ref-manual/variables.rst: Document SPDX_AUTHORS (2026-09-16 10:41:14 +020=
0)

----------------------------------------------------------------
Andrei Lalaev (1):
      ref-manual: update DEBUG_OPTIMIZATION/FULL_OPTIMIZATION

Antonin Godard (20):
      ref-manual/variables.rst: remove CVSDIR
      ref-manual/variables.rst: drop documentation for FIT_KERNEL_COMP_ALG_=
EXTENSION
      security-manual/securing-images.rst: remove "your" in "your OE-Core"
      bsp-manual/bsp.rst: fix a "local.conf" -> "layer.conf" typo
      ref-manual/structure.rst: fix a "local.conf" -> "layer.conf" typo
      ref-manual/varlocality.rst: mention built-in fragments for distro/mac=
hine
      ref-manual/varlocality.rst: remove BBFILES from local configuration a=
ssignments
      ref-manual/features.rst: add tools-profile
      ref-manual/variables.rst: BBMULTICONFIG: fix a typo
      dev-manual/poky-manual-setup.rst: suggest use of fragment instead of =
assignments
      ref-manual/variables.rst: fix local.conf.extended obsolete path
      ref-manual/variables.rst: mention built-in fragments for MACHINE/DIST=
RO
      ref-manual/terms.rst: Configuration File: precise machine conf files =
location
      ref-manual/terms.rst: Configuration File: split paragraph in a list
      ref-manual/terms.rst: Configuration File: use a link to local.conf
      ref-manual/classes.rst: buildstats: remove local.conf default value
      dev-manual/wic.rst: remove local.conf mentions
      ref-manual/variables.rst: GCCVERSION: replace local.conf and mention =
recipe existence
      docs-wide: advise setting global changes in the proper place
      docs-wide: replace hardcoded conf paths to structure.rst refs

Joshua Watt (2):
      ref-manual/variables.rst: Fix the documentation for the SPDX agent va=
riables
      ref-manual/variables.rst: Document SPDX_AUTHORS

Lee Chee Yang (2):
      migration-guide: add release notes for 5.0.20
      migration-guide: add release notes for 6.0.3

Robert P. J. Day (3):
      system-requirements.txt: use proper "openSUSE"
      dev-manual: drop link to out-of-date wiki page
      dev-manual: correct OVERRIDES to FILESOVERRIDES for FILESPATH

 documentation/brief-yoctoprojectqs/index.rst       |   4 +-
 documentation/bsp-manual/bsp.rst                   |   8 +-
 documentation/dev-manual/bblock.rst                |   2 +-
 documentation/dev-manual/bmaptool.rst              |   5 +-
 documentation/dev-manual/build-quality.rst         |  15 +-
 documentation/dev-manual/building.rst              |  33 +-
 documentation/dev-manual/custom-distribution.rst   |  14 +-
 .../custom-template-configuration-directory.rst    |   8 +-
 documentation/dev-manual/customizing-images.rst    |  11 +-
 documentation/dev-manual/debugging.rst             |  16 +-
 documentation/dev-manual/device-manager.rst        |   8 +-
 documentation/dev-manual/devtool.rst               |   4 +-
 documentation/dev-manual/disk-space.rst            |   2 +-
 .../dev-manual/efficiently-fetching-sources.rst    |   2 +-
 documentation/dev-manual/error-reporting-tool.rst  |   6 +-
 documentation/dev-manual/external-scm.rst          |   2 +-
 documentation/dev-manual/external-toolchain.rst    |   8 +-
 documentation/dev-manual/layers.rst                |  26 +-
 documentation/dev-manual/libraries.rst             |   7 +-
 documentation/dev-manual/licenses.rst              |  11 +-
 documentation/dev-manual/limiting-resources.rst    |   2 +-
 documentation/dev-manual/multiconfig.rst           |  10 +-
 documentation/dev-manual/new-recipe.rst            |   9 +-
 documentation/dev-manual/packages.rst              |  20 +-
 documentation/dev-manual/poky-manual-setup.rst     |  12 +-
 documentation/dev-manual/start.rst                 |   3 +-
 documentation/dev-manual/upgrading-recipes.rst     |  12 +-
 documentation/dev-manual/wayland.rst               |   4 +-
 documentation/dev-manual/wic.rst                   |   9 +-
 documentation/dev-manual/x32-psabi.rst             |   2 +-
 documentation/kernel-dev/common.rst                |  25 +-
 documentation/migration-guides/migration-1.3.rst   |   4 +-
 documentation/migration-guides/migration-1.6.rst   |   6 +-
 documentation/migration-guides/migration-1.7.rst   |   4 +-
 documentation/migration-guides/migration-2.0.rst   |   2 +-
 documentation/migration-guides/migration-2.1.rst   |   2 +-
 documentation/migration-guides/migration-4.1.rst   |   2 +-
 documentation/migration-guides/migration-4.2.rst   |   4 +-
 documentation/migration-guides/release-5.0.rst     |   1 +
 documentation/migration-guides/release-6.0.rst     |   1 +
 .../migration-guides/release-notes-4.2.rst         |   2 +-
 .../migration-guides/release-notes-5.0.20.rst      | 779 +++++++++++++++++=
++++
 .../migration-guides/release-notes-5.2.rst         |   2 +-
 .../migration-guides/release-notes-6.0.3.rst       | 336 +++++++++
 .../migration-guides/release-notes-6.0.rst         |   2 +-
 documentation/overview-manual/concepts.rst         |  45 +-
 documentation/profile-manual/intro.rst             |  12 +-
 documentation/profile-manual/usage.rst             |  15 +-
 documentation/ref-manual/classes.rst               |  30 +-
 documentation/ref-manual/devtool-reference.rst     |   2 +-
 documentation/ref-manual/faq.rst                   |   8 +-
 documentation/ref-manual/features.rst              |   4 +
 documentation/ref-manual/images.rst                |   5 +-
 documentation/ref-manual/structure.rst             |  14 +-
 documentation/ref-manual/system-requirements.rst   |   8 +-
 documentation/ref-manual/terms.rst                 |  44 +-
 documentation/ref-manual/variables.rst             | 282 ++++----
 documentation/ref-manual/varlocality.rst           |  10 +-
 documentation/sdk-manual/appendix-customizing.rst  |   9 +-
 documentation/sdk-manual/appendix-obtain.rst       |  15 +-
 documentation/security-manual/read-only-rootfs.rst |   2 +-
 documentation/security-manual/securing-images.rst  |   8 +-
 documentation/test-manual/reproducible-builds.rst  |   6 +-
 documentation/test-manual/runtime-testing.rst      |  16 +-
 .../test-manual/understand-autobuilder.rst         |   4 +-
 documentation/toaster-manual/reference.rst         |   2 +-
 .../transitioning-to-a-custom-environment.rst      |   4 +-
 67 files changed, 1576 insertions(+), 416 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.20.rst
 create mode 100644 documentation/migration-guides/release-notes-6.0.3.rst

