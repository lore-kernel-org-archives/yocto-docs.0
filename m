Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4353D49C90
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 09:35:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6992.1769765720854701118
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 01:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JPTXPM/B;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 563981A2B24
	for <docs@lists.yoctoproject.org>; Fri, 30 Jan 2026 09:35:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C1066075A;
	Fri, 30 Jan 2026 09:35:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9EAF3119A885C;
	Fri, 30 Jan 2026 10:35:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769765718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Kk7GC91e5bPzoA9Jxafcsu2PxUPuehnlOopgJ3Ayids=;
	b=JPTXPM/BM/YukhQUq/276RRxZ5hATEThfKB+KcZtl8QxWrb9QdH7dd8qQvPKV8g+sF3lsQ
	IyAPcnOZriZVTeSk/KOozKtvEq3ts6Rh2q6ogNVg1k3fO9k4begl8pIq5pndrkJ6lFEKAr
	p013uqIScCpXUptZomwDFmXBt1YeA8qO7YZ/rTdegYKHetHOe6vWHGLtT+x3xgwdLvpmrN
	/yD4X5yYu0osXGp3sGK6MjvliwKdzAcQHLxjue3reHS4iIm+8DiLAInAfXCQj4oAq18n76
	OSnzNQzyTkxmeqMRLdm8jOdPFDWTy9f8fMMRVPDb6jOwwz26MukQmvvKE/QBHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 10:35:18 +0100
Message-Id: <DG1TL75U90CW.21N3OPUR6OJGK@bootlin.com>
Subject: [whinlatter] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 30 Jan 2026 09:35:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8846

The following changes since commit ea0501a135043aefc7c6049be811f4c1277f1f8b=
:

  contributor-guide/recipe-style-guide.rst: explain difference between laye=
r and recipe license(s) (2026-01-13 09:59:23 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs whinlatter-next

for you to fetch changes up to 3ea1c74cc56bb271f8460ab851f6b2983b83358f:

  what-i-wish-id-known.rst: remove obsolete poky repo references (2026-01-2=
9 16:28:34 +0100)

----------------------------------------------------------------
Antonin Godard (62):
      ref-manual/terms.rst: refresh the Build Directory definition
      ref-manual/terms.rst: refresh the OpenEmbedded-Core definition
      ref-manual/terms.rst: simplify the Source Directory definition
      dev-manual/poky-manual-setup.rst: mention the Source Directory
      ref-manual/terms.rst: refresh the OpenEmbedded build system definitio=
n
      transitioning-to-a-custom-environment.rst: remove obsolete poky repo =
references
      dev-manual/poky-manual-setup.rst: remove obsolete poky repo reference=
s
      dev-manual/start.rst: remove obsolete poky repo references
      bsp-guide/bsp.rst: remove obsolete poky repo references
      kernel-dev/advanced.rst: remove obsolete poky repo references
      contributor-guide/submit-changes.rst: remove obsolete poky repo refer=
ences
      dev-manual/building.rst: remove obsolete poky repo references
      dev-manual/debugging.rst: remove obsolete poky repo references
      dev-manual/error-reporting-tool.rst: remove obsolete poky repo refere=
nces
      dev-manual/external-toolchain.rst: remove obsolete poky repo referenc=
es
      dev-manual/layers.rst: re-organize the document
      dev-manual/layers.rst: remove obsolete poky repo references
      dev-manual/libraries.rst: remove obsolete poky repo references
      dev-manual/new-recipe.rst: remove obsolete poky repo references
      dev-manual/securing-images.rst: remove obsolete poky repo references
      dev-manual/temporary-source-code.rst: remove obsolete poky repo refer=
ences
      dev-manual/wayland.rst: remove obsolete poky repo references
      dev-manual/wic.rst: remove obsolete poky repo references
      kernel-dev/common.rst: remove obsolete poky repo references
      migration-guides/migration-1.4.rst: remove obsolete poky repo referen=
ces
      overview-manual/concepts.rst: remove obsolete poky repo references
      overview-manual/development-environment.rst: remove obsolete poky rep=
o references
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
      contributor-guide/identify-component.rst: remove obsolete poky repo r=
eferences
      dev-manual/build-quality.rst: remove obsolete poky repo references
      dev-manual/custom-distribution.rst: remove obsolete poky repo referen=
ces
      dev-manual/custom-template-configuration-directory.rst: remove obsole=
te poky repo references
      dev-manual/init-manager.rst: remove obsolete poky repo references
      dev-manual/licenses.rst: remove obsolete poky repo references
      dev-manual/licenses.rst: instruct to use git-archive instead of remov=
ing .git
      dev-manual/packages.rst: remove obsolete poky repo references
      dev-manual/python-development-shell.rst: remove obsolete poky repo re=
ferences
      dev-manual/qemu.rst: remove obsolete poky repo references
      dev-manual/upgrading-recipes.rst: remove obsolete poky repo reference=
s
      dev-manual/upgrading-recipes.rst: move meta-openembedded to bitbake-b=
uilds/layers
      dev-manual/vulnerabilities.rst: remove obsolete poky repo references
      ref-manual/devtool-reference.rst: remove obsolete poky repo reference=
s
      ref-manual/faq.rst: remove obsolete poky repo references
      ref-manual/features.rst: remove obsolete poky repo references
      ref-manual/release-process.rst: remove obsolete poky repo references
      ref-manual/release-process.rst: remove repeated "in the"
      ref-manual/system-requirements.rst: remove obsolete poky repo referen=
ces
      ref-manual/system-requirements.rst: fix wrong path to install-buildto=
ols
      ref-manual/yocto-project-supported-features.rst: remove obsolete poky=
 repo reference
      test-manual/reproducible-builds.rst: remove obsolete poky repo refere=
nces
      test-manual/understand-autobuilder.rst: remove obsolete poky repo ref=
erences
      what-i-wish-id-known.rst: remove obsolete poky repo references

Lee Chee Yang (2):
      migration-guides: add release notes for 5.0.14
      migration-guides: add release notes for 5.0.15

Quentin Schulz (13):
      sdk-manual: fix incorrect highlight language for text code-blocks
      sdk-manual: fix incorrect highlight language for console code-blocks
      sdk-manual: fix improper indent of general form of tarball installer =
scripts
      sdk-manual: working-projects: properly highlight code code-blocks
      sdk-manual: appending-customizing: use none lexer for BitBake code bl=
ocks
      sdk-manual: appendix-obtain: replace directory structure PNG with a p=
arsed-literal block
      sdk-manual: appendix-obtain: replace eSDK directory structure PNG wit=
h a parsed-literal block
      sdk-manual: replace sdk-environment PNG with SVG
      sdk-manual: delete sdk-title PNG
      sdk-manual: appendix-obtain: use parsed-literal block for naming conv=
ention of the installer scripts
      sdk-manual: using: fix SDK filename example
      sdk-manual: appendix-obtain: fix default path for eSDK installer scri=
pt
      tree-wide: figures: remove title PNGs

 documentation/README                               |  43 +-
 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/bsp-guide/bsp.rst                    | 165 +++-----
 documentation/bsp-guide/figures/bsp-title.png      | Bin 17388 -> 0 bytes
 .../contributor-guide/identify-component.rst       |   9 -
 documentation/contributor-guide/submit-changes.rst |  60 +--
 documentation/dev-manual/build-quality.rst         |   2 +-
 documentation/dev-manual/building.rst              |  40 +-
 documentation/dev-manual/custom-distribution.rst   |   8 +-
 .../custom-template-configuration-directory.rst    |   8 +-
 documentation/dev-manual/debugging.rst             |  16 +-
 documentation/dev-manual/error-reporting-tool.rst  |   3 +-
 documentation/dev-manual/external-toolchain.rst    |   2 +-
 documentation/dev-manual/figures/dev-title.png     | Bin 15950 -> 0 bytes
 documentation/dev-manual/init-manager.rst          |   6 +-
 documentation/dev-manual/layers.rst                | 308 ++++++--------
 documentation/dev-manual/libraries.rst             |   8 +-
 documentation/dev-manual/licenses.rst              |  32 +-
 documentation/dev-manual/new-recipe.rst            |  25 +-
 documentation/dev-manual/packages.rst              |  11 +-
 documentation/dev-manual/poky-manual-setup.rst     |  40 +-
 .../dev-manual/python-development-shell.rst        |   2 +-
 documentation/dev-manual/qemu.rst                  |  11 +-
 documentation/dev-manual/start.rst                 | 324 ++------------
 documentation/dev-manual/temporary-source-code.rst |   4 +-
 documentation/dev-manual/upgrading-recipes.rst     |  28 +-
 documentation/dev-manual/wayland.rst               |   2 +-
 documentation/dev-manual/wic.rst                   |  20 +-
 documentation/kernel-dev/advanced.rst              |  12 +-
 documentation/kernel-dev/common.rst                | 158 +++----
 .../kernel-dev/figures/kernel-dev-title.png        | Bin 13453 -> 0 bytes
 documentation/migration-guides/migration-1.4.rst   |   2 +-
 documentation/migration-guides/release-5.0.rst     |   2 +
 .../migration-guides/release-notes-5.0.14.rst      | 211 ++++++++++
 .../migration-guides/release-notes-5.0.15.rst      | 219 ++++++++++
 documentation/overview-manual/concepts.rst         |  76 +---
 .../overview-manual/development-environment.rst    | 108 ++---
 .../figures/overview-manual-title.png              | Bin 17387 -> 0 bytes
 .../figures/poky-reference-distribution.png        | Bin 23784 -> 0 bytes
 documentation/overview-manual/yp-intro.rst         | 155 +------
 .../profile-manual/figures/profile-title.png       | Bin 12799 -> 0 bytes
 documentation/ref-manual/classes.rst               |  34 +-
 documentation/ref-manual/devtool-reference.rst     |  10 +-
 documentation/ref-manual/faq.rst                   |  45 +-
 documentation/ref-manual/features.rst              |   2 +-
 documentation/ref-manual/figures/poky-title.png    | Bin 11592 -> 0 bytes
 documentation/ref-manual/fragments.rst             |   2 +
 documentation/ref-manual/images.rst                |   5 +-
 documentation/ref-manual/release-process.rst       |   8 +-
 documentation/ref-manual/structure.rst             | 170 +++++---
 documentation/ref-manual/system-requirements.rst   |  16 +-
 documentation/ref-manual/tasks.rst                 |  10 +-
 documentation/ref-manual/terms.rst                 | 144 +++----
 documentation/ref-manual/variables.rst             | 149 ++++---
 .../yocto-project-supported-features.rst           |   2 +-
 documentation/sdk-manual/appendix-customizing.rst  |  36 +-
 documentation/sdk-manual/appendix-obtain.rst       | 181 +++++---
 documentation/sdk-manual/extensible.rst            |  63 +--
 .../sdk-manual/figures/sdk-environment.png         | Bin 42098 -> 0 bytes
 .../sdk-installed-extensible-sdk-directory.png     | Bin 66753 -> 0 bytes
 .../sdk-installed-standard-sdk-directory.png       | Bin 39099 -> 0 bytes
 documentation/sdk-manual/figures/sdk-title.png     | Bin 31039 -> 0 bytes
 documentation/sdk-manual/intro.rst                 |  10 +-
 documentation/sdk-manual/svg/sdk-environment.svg   | 463 +++++++++++++++++=
++++
 documentation/sdk-manual/using.rst                 |  35 +-
 documentation/sdk-manual/working-projects.rst      | 112 +++--
 documentation/security-manual/securing-images.rst  |   9 +-
 documentation/security-manual/vulnerabilities.rst  |  20 +-
 .../test-manual/figures/test-manual-title.png      | Bin 15382 -> 0 bytes
 documentation/test-manual/reproducible-builds.rst  |   8 +-
 documentation/test-manual/runtime-testing.rst      |   4 +-
 .../test-manual/understand-autobuilder.rst         |   6 +-
 .../toaster-manual/figures/toaster-title.png       | Bin 9277 -> 0 bytes
 .../transitioning-to-a-custom-environment.rst      |  21 +-
 documentation/what-i-wish-id-known.rst             |   5 +-
 75 files changed, 2067 insertions(+), 1625 deletions(-)
 delete mode 100644 documentation/bsp-guide/figures/bsp-title.png
 delete mode 100644 documentation/dev-manual/figures/dev-title.png
 delete mode 100644 documentation/kernel-dev/figures/kernel-dev-title.png
 create mode 100644 documentation/migration-guides/release-notes-5.0.14.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.15.rst
 delete mode 100644 documentation/overview-manual/figures/overview-manual-t=
itle.png
 delete mode 100644 documentation/overview-manual/figures/poky-reference-di=
stribution.png
 delete mode 100644 documentation/profile-manual/figures/profile-title.png
 delete mode 100644 documentation/ref-manual/figures/poky-title.png
 delete mode 100644 documentation/sdk-manual/figures/sdk-environment.png
 delete mode 100644 documentation/sdk-manual/figures/sdk-installed-extensib=
le-sdk-directory.png
 delete mode 100644 documentation/sdk-manual/figures/sdk-installed-standard=
-sdk-directory.png
 delete mode 100644 documentation/sdk-manual/figures/sdk-title.png
 create mode 100644 documentation/sdk-manual/svg/sdk-environment.svg
 delete mode 100644 documentation/test-manual/figures/test-manual-title.png
 delete mode 100644 documentation/toaster-manual/figures/toaster-title.png

