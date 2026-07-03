Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30A6C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 07:49:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87544.1783064995725210317
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 00:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eaAb491b;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F3B6FC49F4B
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 07:50:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 381B060333;
	Fri,  3 Jul 2026 07:49:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FE20104C958F;
	Fri,  3 Jul 2026 09:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783064992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=DABWtvB8z00wlc5wuVjIz70RDShmyw4AWHDUlUfmE+0=;
	b=eaAb491b2uJ+z34T5A8L4MqsL1miQjGB3WUAzJkf/wgn/amrAcN85XYiv7OnfOPsGDDMKA
	5xP8+o72rNdxjpD8Z185UtRcQ2AyUOsgAHowhb1yMJEepCvtbIk8VT6F9vKgI+UthJAocJ
	b3rUo4cyQL3h3TFrYdjVbjvcyrZJAIvqw4Y0zYEp4WKdV+xgGpdRYh7cATMkWy2T1u1JEO
	rVka1ntGb55Buvp1ptYy0BvJ8iSDsD6Noa30W0ct0KDcANXkIpU349B7hdDY+PgSD5e7Sx
	9WXo00mgEn9U+KAZDr62Wa7KVnCdnMcExHiO6mSLHBLdZxJ/Bhn/+xSMVSFsIQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 09:49:51 +0200
Message-Id: <DJORSCZR1U0E.20MN4WJD6MOQS@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 07:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10006

The following changes since commit 4562ba19f36e54099bcae82cec8a70deb1c23aa7=
:

  migration-guides/migration-6.0.rst: fix wks file move note (2026-06-26 10=
:19:17 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to c518622d49c50844df230c8c2a8e08312104b7ad:

  migration-guides: add add release notes for 6.0.1 (2026-07-02 14:05:36 +0=
200)

----------------------------------------------------------------
Antonin Godard (28):
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
      tools/update-documentation-conf: remove
      ref-manual/variables.rst: document the USERMOD_PARAMS variable
      migration-guides/migration-6.1.rst: add USERMOD_PARAMS note
      ref-manual/variables.rst: add deprecation note for GROUPMEMS_PARAM
      ref-manual/classes.rst: document python_uv_build
      migration-guides/migration-6.1.rst: add note on oe.utils.*_distro_fea=
tures() removal
      ref-manual/variables.rst: document the UBOOT_FIT_CONF_DESC variable
      migration-guides/migration/release-notes-6.1.rst: cover recent change=
s
      ref-manual/system-requirements.rst: drop Fedora 42 support
      tools/build-docs-container: drop Fedora 42 support
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

Bruce Ashfield (1):
      kernel-dev: document patch handling for discovered BSP descriptions

Lee Chee Yang (1):
      migration-guides: add add release notes for 6.0.1

Paul Barker (1):
      recipe-style-guide: Clarify when License-Update tag is needed

Robert P. J. Day (7):
      ref-manual: warn reader about confusing DEPLOYDIR and DEPLOY_DIR
      ref-manual: render first mention of DEPLOY_DIR as a :term:
      ref-manual: add intro content to "Manually Called Tasks"
      ref-manual: mention EXTRA_IMAGE_FEATURES in task
      ref-manual: add intro content to Ref Manual "Tasks" section
      ref-manual: remove all traces of "kernel_menuconfig" task
      dev-manual: update bmaptool section, refer to "bmaptool" package

 documentation/bsp-guide/bsp.rst                    |   3 +-
 .../contributor-guide/recipe-style-guide.rst       |   9 +-
 documentation/dev-manual/bmaptool.rst              |  13 +-
 documentation/dev-manual/wic.rst                   | 213 ++++++++++++-----=
-
 documentation/kernel-dev/advanced.rst              |  58 +++++
 documentation/migration-guides/migration-6.1.rst   |  48 ++++
 documentation/migration-guides/release-6.0.rst     |   1 +
 .../migration-guides/release-notes-6.0.1.rst       | 249 +++++++++++++++++=
++++
 .../migration-guides/release-notes-6.1.rst         | 221 +++++++++++++++++=
-
 documentation/ref-manual/classes.rst               |  12 +-
 documentation/ref-manual/kickstart.rst             |  24 +-
 documentation/ref-manual/system-requirements.rst   |   1 -
 documentation/ref-manual/tasks.rst                 |  95 +++++---
 documentation/ref-manual/variables.rst             | 114 +++++++++-
 documentation/tools/build-docs-container           |   2 -
 documentation/tools/update-documentation-conf      | 158 -------------
 16 files changed, 930 insertions(+), 291 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-6.0.1.rst
 delete mode 100644 documentation/tools/update-documentation-conf

