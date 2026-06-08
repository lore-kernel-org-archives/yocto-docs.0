Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD57FCD8CA4
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 15:49:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57877.1780933731796262191
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 08:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H9Ch19nc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA2B24E41786
	for <docs@lists.yoctoproject.org>; Mon,  8 Jun 2026 15:48:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 821835FFC2;
	Mon,  8 Jun 2026 15:48:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CFEE106A2964;
	Mon,  8 Jun 2026 17:48:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780933729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=LLMaVkkeXjgpd+YbbaEAZ9oq7Rc1lgOK8bA2iGDkGoU=;
	b=H9Ch19ncv0oZXBGbsdiHHHi3P9Ut3BGRatVyjzYiFzyFwj5NjepxeGIRwUSqGdY25V+Ba0
	2SgsqB3tsxusYpQDNeM9fMfvxrzwgY7qiaZmM7EUgx9orNBPuWNOemYv65ybRVz94qGj8p
	cqunrEqKZHkt2YdGUyU2+Kj5qFXuVLAQOgsDqjh2Mr+NlUH0j6Gp10W6bwMaYEpuDskLV8
	eAELgdBw3NszrVwYYVk7ZxArFd/Prpd4wmwzG7SMFUSK4+s9aXqLJwOamENWxD1D5XaWFB
	7Ke1uIzUf6epfwQua7VJwgbHeSWweq+g2bkD9BvbQaB/hKZ++AopUzUZwG553w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 17:48:48 +0200
Message-Id: <DJ3SBG1XMKSG.2KV5BKLFP5NCP@bootlin.com>
Subject: [wrynose] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jun 2026 15:49:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9629

The following changes since commit 7ac955621b36a221126cd40f12c41fa98c213a24=
:

  contributor-guide: fix type "maintainance" to "maintenance" (2026-05-19 1=
5:39:56 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to 768cbc95861c0da961c9f1ba77a9369caa3dce2d:

  migration-guide: add release notes for 5.0.18 (2026-06-08 17:25:28 +0200)

----------------------------------------------------------------
Antonin Godard (11):
      ref-manual/variables.rst: link *MIRRORS definitions to the BitBake ma=
nual
      overview-manual/concepts: image-generation.png: convert to SVG
      overview-manual/concepts: sdk-generation.png: convert to SVG
      overview-manual/concepts: images.png: convert to SVG
      overview-manual/concepts: sdk.png: convert to SVG
      overview-manual/concepts: cross-development-toolchains.png: convert t=
o SVG
      overview-manual/concepts: user-configuration.png: convert to SVG
      overview-manual/concepts: layer-input.png: convert to SVG
      overview-manual/concepts: source-input.png: convert to SVG
      overview-manual/concepts: package-feeds.png: convert to SVG
      overview-manual/svg: remove white backgrounds

Lee Chee Yang (1):
      migration-guide: add release notes for 5.0.18

Marta Rybczynska (1):
      security-team.rst: update my email address and key

Paul Barker (3):
      security-team: Update membership list
      security-team: Tidy and update section on security team operations
      security-team: Add section on multi-project embargoes

Peter Marko (1):
      dev-manual: remove semicolons for rootfs commands

Robert P. J. Day (16):
      overview-manual: remind reader that meta-poky is a distro layer
      overview-manual: fix typo, "semi-colon" -> "colon"
      overview-manual: hyphens not allowed in file version
      recipe-style-guide.rst: two minor grammatical tweaks
      bsp-guide: mention bootloader and device tree in BSP intro
      bsp-guide: update guide to reflect newer beaglebone
      overview-manual: inform the reader early of "bitbake-getvar"
      bsp-guide: simplify example of structure of BSP layer
      overview-manual: add ":term:" for OE Build System
      overview-manual: explain "ODM" and "OSV" acronyms
      overview-manual: provide a more expansive definition of "layer"
      overview-manual: correct that "conf" is a subdir of build dir
      overview-manual: mention that patch files can be compressed
      overview-manual: use correct spelling "counterpart"
      overview-manual: update deploy.bbclass snippet
      contributor-guide: couple minor typo/grammar fixes

 documentation/bsp-guide/bsp.rst                    |   70 +-
 .../contributor-guide/recipe-style-guide.rst       |    8 +-
 documentation/dev-manual/build-quality.rst         |    4 +-
 documentation/migration-guides/release-5.0.rst     |    1 +
 .../migration-guides/release-notes-5.0.18.rst      | 2644 ++++++++++++++++=
++++
 documentation/overview-manual/concepts.rst         |   63 +-
 .../figures/cross-development-toolchains.png       |  Bin 82633 -> 0 bytes
 .../overview-manual/figures/image-generation.png   |  Bin 123348 -> 0 byte=
s
 documentation/overview-manual/figures/images.png   |  Bin 32674 -> 0 bytes
 .../overview-manual/figures/layer-input.png        |  Bin 62330 -> 0 bytes
 .../overview-manual/figures/package-feeds.png      |  Bin 42239 -> 0 bytes
 .../overview-manual/figures/sdk-generation.png     |  Bin 60574 -> 0 bytes
 documentation/overview-manual/figures/sdk.png      |  Bin 49804 -> 0 bytes
 .../overview-manual/figures/source-input.png       |  Bin 51170 -> 0 bytes
 .../overview-manual/figures/user-configuration.png |  Bin 51171 -> 0 bytes
 documentation/overview-manual/intro.rst            |    2 +-
 .../svg/analysis-for-package-splitting.svg         |   19 +-
 .../svg/configuration-compile-autoreconf.svg       |   21 +-
 .../svg/cross-development-toolchains.svg           | 2136 ++++++++++++++++
 .../overview-manual/svg/image-generation.svg       | 1820 ++++++++++++++
 documentation/overview-manual/svg/images.svg       | 1346 ++++++++++
 documentation/overview-manual/svg/layer-input.svg  | 1375 ++++++++++
 .../overview-manual/svg/package-feeds.svg          | 1257 ++++++++++
 documentation/overview-manual/svg/patching.svg     |   19 +-
 .../overview-manual/svg/sdk-generation.svg         | 2020 +++++++++++++++
 documentation/overview-manual/svg/sdk.svg          | 1461 +++++++++++
 .../overview-manual/svg/source-fetching.svg        |   21 +-
 documentation/overview-manual/svg/source-input.svg | 1751 +++++++++++++
 .../overview-manual/svg/user-configuration.svg     | 1162 +++++++++
 documentation/overview-manual/yp-intro.rst         |    7 +-
 documentation/ref-manual/variables.rst             |    6 +
 documentation/security-reference/security-team.rst |   52 +-
 32 files changed, 17124 insertions(+), 141 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.18.rst
 delete mode 100644 documentation/overview-manual/figures/cross-development=
-toolchains.png
 delete mode 100644 documentation/overview-manual/figures/image-generation.=
png
 delete mode 100644 documentation/overview-manual/figures/images.png
 delete mode 100644 documentation/overview-manual/figures/layer-input.png
 delete mode 100755 documentation/overview-manual/figures/package-feeds.png
 delete mode 100644 documentation/overview-manual/figures/sdk-generation.pn=
g
 delete mode 100644 documentation/overview-manual/figures/sdk.png
 delete mode 100644 documentation/overview-manual/figures/source-input.png
 delete mode 100644 documentation/overview-manual/figures/user-configuratio=
n.png
 create mode 100644 documentation/overview-manual/svg/cross-development-too=
lchains.svg
 create mode 100644 documentation/overview-manual/svg/image-generation.svg
 create mode 100644 documentation/overview-manual/svg/images.svg
 create mode 100644 documentation/overview-manual/svg/layer-input.svg
 create mode 100644 documentation/overview-manual/svg/package-feeds.svg
 create mode 100644 documentation/overview-manual/svg/sdk-generation.svg
 create mode 100644 documentation/overview-manual/svg/sdk.svg
 create mode 100644 documentation/overview-manual/svg/source-input.svg
 create mode 100644 documentation/overview-manual/svg/user-configuration.sv=
g

