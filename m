Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9141EC88E41
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6041.1769501962507210647
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sSmaFzI7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E97574E422CA;
	Tue, 27 Jan 2026 08:19:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ACA5A606F5;
	Tue, 27 Jan 2026 08:19:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39A3F119A867A;
	Tue, 27 Jan 2026 09:19:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501960; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Uuzr/IJRnEUG+NIy0WPuX0FGalueAf8EBLkowWNaR2c=;
	b=sSmaFzI7TD7o+kxxsHrZSmJbE4wSyNAACFAZDB9mUGHhKl4GZokdbd9500QcXDzIniD8JX
	haYRE4iBpb7VxkR/gDPS34nqreIme5Kb9J5RwFxtX/pCJd0yAEkXOMV4QH7bJvGK/1Yhmp
	AaMTGn/6cPNr90waIAukDSr8TQTjiiKpwkZKe06VAzGjn8hWzFZUlJjvZCe1ugrspzThTw
	dvjg+dYj7Sm2oVvUa6kgSbMCafNpcsaHaX7q8FHLBMTSsKeE3n+uj0V8ZzAZhZkHk82WKe
	ZnW5O6e4jaXVE1gX0nR/1nu8KhiCh/qL8TtaMuZ83CLin2UXwvAfpTtiBUKAOQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 00/56] Remove obsolete poky repo references
Date: Tue, 27 Jan 2026 09:18:55 +0100
Message-Id: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPB0eGkC/4WPwW7DIBBEf8XiXCqzgME+5T+qHAwsNW1tUiBWo
 8j/Xuy06rG3He3svNk7yZgCZjI0d5JwDTnEpQp4aoidxuUVaXBVE2hBMgBBE85xRXqJ77c6e0y
 4WMyUsw56YbiUypN6fKm78HUEv5wfOl/NG9qyp/04En5eK7E8bH/Ayv/FFUxz3kH1fqLWWSehR
 5StHla+x5gxI7VxnkMZGi+4MQIY8B4008ypzmtmWy44WlRKjZYJ7lqyV5pCLjHdjtdXdjT478u
 V0ZZ2Uo/SC2ccwsnEWD7C8lwbkPO2bd+L/cvGUQEAAA==
X-Change-ID: 20251224-remove-poky-references-316294b3557f
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9572;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=8oLKgOt1uFhnJk3HTZUUgd9A3geBYAnCk6PXOEKBvQE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHT+MEZPIIwwqCxBqDd3ETNaszP5jHZ+TEu2O
 YGT8AD4P8eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh0/gAKCRDRgEFAKaOo
 NuY+D/9izRUHEPg9kFWX11jQxF8XSA+ICj1EYzYiw4x5gYTPPApy8RIl8+mrFJF5pL/z2QiJ6NU
 nYgsHABEdFMbFoGSVk02SlSok+75h0GPyllx46SKk55GrAwWBdGJjGAww2bs5fcYdELfp6HWzd2
 /x3VU4VPG+CUHhse88XAgc2fLOMb3QjCEbW5rpOUFvgzJMA8WbImCRoEwIO76wPeVvniGSSExzV
 F1+DMh29yiH3czF0vpX83dT1rmay3ejtUOtJ8QX5KFzlCrNEKWrugE528g2NYQnTsNTArVNgIM9
 zTeNesZApJHeSYMmRE3pENCkknyC7gMFIjiE3hiUmDDczN/n/ntYubxVzXJIQy6mEIEg3gXTSMC
 VDJcV256EUvPn0LhDzdsCdyFDH2lEyBJhSfeIC9FxKl3R+tr/9Vf0iyd/DAyKRd9LfKIMTFfdo2
 5IvsnJ+cn4yfGstOOMWP6WdYgSMZDipFmp52kt9Yb0+GE8zQILz1JjErua4hy0bXByqG0j3tVRi
 ivtW2OjX5b7We5Q4kXmrUSbVqCF7sKUe7/C8cw65j5Z6nl/EeBgGuRhOQHwiC/dKOvVu+FqfL1L
 HPKeHDzsxEZIfD5sPSoq9M6ueuIi5rZkeYMj6p3tVBrzRtC4vnYH82N4l/qLrYx66r032UpMzrE
 oX0zweIf7jxmJeQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8662

The Poky repository's master branch is no longer updated:
https://git.yoctoproject.org/poky/tree/README

Many places in the documentation were still making references to Poky as
in the repository. Migrate the documentation in two steps:

Check all occurrences of "poky" or "source directory"
(case-insensitive/multiline match), and reformulate/adapt.

Most of the occurrences will usually be a path in Poky that can be
replaced by OE-Core/meta-yocto.

Some others are more tricky, and needed some re-organization / rework.
For that reason, patch were split by files, to make reviewing/merging
easier and incremental.

This series depends on the "Redefine terms now that the Poky repository is
obsolete" series which redefines terms used to replaces occurrences
here.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Rename "project" to "bitbake-builds" across the whole series, to match
  the default naming of bitbake-setup.
- Apply Reviewed-by trailers from Quentin on patches with no
  modifications. Reviewed-by trailers on modified patches were not
  applied.
- Apply the suggestions from Quentin on the v1. Thanks a lot Quentin for
  the thorough review.
- Link to v1: https://patch.msgid.link/20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com

---
Antonin Godard (56):
      transitioning-to-a-custom-environment.rst: remove obsolete poky repo references
      dev-manual/poky-manual-setup.rst: remove obsolete poky repo references
      dev-manual/start.rst: remove obsolete poky repo references
      bsp-guide/bsp.rst: remove obsolete poky repo references
      kernel-dev/advanced.rst: remove obsolete poky repo references
      contributor-guide/submit-changes.rst: remove obsolete poky repo references
      dev-manual/building.rst: remove obsolete poky repo references
      dev-manual/debugging.rst: remove obsolete poky repo references
      dev-manual/error-reporting-tool.rst: remove obsolete poky repo references
      dev-manual/external-toolchain.rst: remove obsolete poky repo references
      dev-manual/layers.rst: remove obsolete poky repo references
      dev-manual/layers.rst: remove obsolete poky repo references
      dev-manual/libraries.rst: remove obsolete poky repo references
      dev-manual/new-recipe.rst: remove obsolete poky repo references
      dev-manual/securing-images.rst: remove obsolete poky repo references
      dev-manual/temporary-source-code.rst: remove obsolete poky repo references
      dev-manual/wayland.rst: remove obsolete poky repo references
      dev-manual/wic.rst: remove obsolete poky repo references
      kernel-dev/common.rst: remove obsolete poky repo references
      migration-guides/migration-1.4.rst: remove obsolete poky repo references
      overview-manual/concepts.rst: remove obsolete poky repo references
      overview-manual/development-environment.rst: remove obsolete poky repo references
      overview-manual/yp-intro.rst: remove obsolete poky repo references
      ref-manual/classes.rst: remove obsolete poky repo references
      ref-manual/images.rst: remove obsolete poky repo references
      ref-manual/structure.rst: remove obsolete poky repo references
      ref-manual/tasks.rst: remove obsolete poky repo references
      ref-manual/variables.rst: remove obsolete poky repo references
      sdk-manual/appendix-obtain.rst: remove obsolete poky repo references
      sdk-manual/intro.rst: remove obsolete poky repo references
      test-manual/runtime-testing.rst: remove obsolete poky repo references
      README: remove obsolete poky repo references
      README: replace obsolete substitution variables
      contributor-guide/identify-component.rst: remove obsolete poky repo references
      dev-manual/build-quality.rst: remove obsolete poky repo references
      dev-manual/custom-distribution.rst: remove obsolete poky repo references
      dev-manual/custom-template-configuration-directory.rst: remove obsolete poky repo references
      dev-manual/init-manager.rst: remove obsolete poky repo references
      dev-manual/licenses.rst: remove obsolete poky repo references
      dev-manual/licenses.rst: instruct to use git-archive instead of removing .git
      dev-manual/packages.rst: remove obsolete poky repo references
      dev-manual/python-development-shell.rst: remove obsolete poky repo references
      dev-manual/qemu.rst: remove obsolete poky repo references
      dev-manual/upgrading-recipes.rst: remove obsolete poky repo references
      dev-manual/vulnerabilities.rst: remove obsolete poky repo references
      ref-manual/devtool-reference.rst: remove obsolete poky repo references
      ref-manual/faq.rst: remove obsolete poky repo references
      ref-manual/features.rst: remove obsolete poky repo references
      ref-manual/release-process.rst: remove obsolete poky repo references
      ref-manual/release-process.rst: remove repeated "in the"
      ref-manual/system-requirements.rst: remove obsolete poky repo references
      ref-manual/system-requirements.rst: fix wrong path to install-buildtools
      ref-manual/yocto-project-supported-features.rst: remove obsolete poky repo reference
      test-manual/reproducible-builds.rst: remove obsolete poky repo references
      test-manual/understand-autobuilder.rst: remove obsolete poky repo references
      what-i-wish-id-known.rst: remove obsolete poky repo references

 documentation/README                               |  43 +--
 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/bsp-guide/bsp.rst                    | 165 ++++-------
 .../contributor-guide/identify-component.rst       |   9 -
 documentation/contributor-guide/submit-changes.rst |  57 +---
 documentation/dev-manual/build-quality.rst         |   2 +-
 documentation/dev-manual/building.rst              |  40 +--
 documentation/dev-manual/custom-distribution.rst   |   8 +-
 .../custom-template-configuration-directory.rst    |   8 +-
 documentation/dev-manual/debugging.rst             |  16 +-
 documentation/dev-manual/error-reporting-tool.rst  |   3 +-
 documentation/dev-manual/external-toolchain.rst    |   2 +-
 documentation/dev-manual/init-manager.rst          |   6 +-
 documentation/dev-manual/layers.rst                | 308 ++++++++------------
 documentation/dev-manual/libraries.rst             |   8 +-
 documentation/dev-manual/licenses.rst              |  32 +-
 documentation/dev-manual/new-recipe.rst            |  25 +-
 documentation/dev-manual/packages.rst              |  11 +-
 documentation/dev-manual/poky-manual-setup.rst     |  29 +-
 .../dev-manual/python-development-shell.rst        |   2 +-
 documentation/dev-manual/qemu.rst                  |  11 +-
 documentation/dev-manual/start.rst                 | 324 +++------------------
 documentation/dev-manual/temporary-source-code.rst |   4 +-
 documentation/dev-manual/upgrading-recipes.rst     |  22 +-
 documentation/dev-manual/wayland.rst               |   2 +-
 documentation/dev-manual/wic.rst                   |  20 +-
 documentation/kernel-dev/advanced.rst              |  12 +-
 documentation/kernel-dev/common.rst                | 154 ++++------
 documentation/migration-guides/migration-1.4.rst   |   2 +-
 documentation/overview-manual/concepts.rst         |  76 ++---
 .../overview-manual/development-environment.rst    | 104 +++----
 .../figures/poky-reference-distribution.png        | Bin 23784 -> 0 bytes
 documentation/overview-manual/yp-intro.rst         | 155 ++--------
 documentation/ref-manual/classes.rst               |  34 ++-
 documentation/ref-manual/devtool-reference.rst     |  10 +-
 documentation/ref-manual/faq.rst                   |  43 ++-
 documentation/ref-manual/features.rst              |   2 +-
 documentation/ref-manual/fragments.rst             |   2 +
 documentation/ref-manual/images.rst                |   5 +-
 documentation/ref-manual/release-process.rst       |   8 +-
 documentation/ref-manual/structure.rst             | 174 ++++++-----
 documentation/ref-manual/system-requirements.rst   |  16 +-
 documentation/ref-manual/tasks.rst                 |  10 +-
 documentation/ref-manual/terms.rst                 |   2 +-
 documentation/ref-manual/variables.rst             | 149 +++++-----
 .../yocto-project-supported-features.rst           |   2 +-
 documentation/sdk-manual/appendix-obtain.rst       |  29 +-
 documentation/sdk-manual/intro.rst                 |   8 +-
 documentation/security-manual/securing-images.rst  |   9 +-
 documentation/security-manual/vulnerabilities.rst  |  20 +-
 documentation/test-manual/reproducible-builds.rst  |   8 +-
 documentation/test-manual/runtime-testing.rst      |   4 +-
 .../test-manual/understand-autobuilder.rst         |   6 +-
 .../transitioning-to-a-custom-environment.rst      |  21 +-
 documentation/what-i-wish-id-known.rst             |   5 +-
 55 files changed, 807 insertions(+), 1422 deletions(-)
---
base-commit: f43bb42123928181d76f81c0343ece777ac143d0
change-id: 20251224-remove-poky-references-316294b3557f
prerequisite-change-id: 20251224-terms-refresh-cdcd529ee508:v3
prerequisite-patch-id: 28a8d58b852a13391a97f6488bc59721f5efda86
prerequisite-patch-id: 39e885d60801727fff2c835f0c1904287a8223ad
prerequisite-patch-id: 60b57a0baefe0536612ed8c9dff680234c52eed6
prerequisite-patch-id: ef2fccb1181fd736f5713197040c52667c4b469e
prerequisite-patch-id: d641f824c2d4e7ff9506f9007102ebf3b112564f


