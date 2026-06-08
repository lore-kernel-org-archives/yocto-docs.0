Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E8BCD8C92
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 15:49:01 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57877.1780933731476733177
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 08:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vRGJRqlb;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81E99C5147D
	for <docs@lists.yoctoproject.org>; Mon,  8 Jun 2026 15:48:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65EC55FFB7;
	Mon,  8 Jun 2026 15:48:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 257DA106A1172;
	Mon,  8 Jun 2026 17:48:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780933728; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=n/y5JcCB+q0m5ejoLW5rHb/CMqDydY3cpMa1EFErxi0=;
	b=vRGJRqlbWiMk1jNNfTTaDReGjk3tYraiFVqMyqzHoArT/NOmrUO6gP2oGQGKExpf6dWsXL
	n+jeuBrQjgjZYsIQkK4PB7S2Hn8wxRoL18Jeo7Af8U9bhkIasqfAyo+bPgoHKjxzOilPj1
	9IoT+8xPKAKhoWE4+qOlj+1CPpMBS5s9UNTm+bIkVyOcsGugiNHjtCh4IbanOoVXraGnR8
	lXUaOiD6yUC/yg03/H36M795V7v5L5SNvmjZQEQ0FFGz+F5Sl6sg2vpoBan9eL5a509359
	blc16llKJsEPC5a5Enas1p3n6ZwKliKEan/nG0Gfun1gmOx6eW3Ab69wIm39ZQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 17:48:47 +0200
Message-Id: <DJ3SBFUPW8VI.3LFE1LDK5DUEE@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jun 2026 15:49:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9628

The following changes since commit f39ba5141cd518f08d491b2255a4acd74442e87b=
:

  contributor-guide: fix type "maintainance" to "maintenance" (2026-05-19 1=
5:39:35 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 76f4b5ded4aa04ca1404510f0232593a968e0f66:

  migration-guide: add release notes for 5.0.18 (2026-06-08 17:30:57 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      conf.py: define new {oecore,bitbake,meta_yocto}_rev roles
      conf.py: define new *_path roles
      conf.py: add a :yocto_bug: role
      ref-manual/variables.rst: link *MIRRORS definitions to the BitBake ma=
nual

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

Robert P. J. Day (13):
      overview-manual: remind reader that meta-poky is a distro layer
      overview-manual: fix typo, "semi-colon" -> "colon"
      overview-manual: hyphens not allowed in file version
      recipe-style-guide.rst: two minor grammatical tweaks
      bsp-guide: mention bootloader and device tree in BSP intro
      bsp-guide: update guide to reflect newer beaglebone
      overview-manual: inform the reader early of "bitbake-getvar"
      overview-manual: add ":term:" for OE Build System
      overview-manual: provide a more expansive definition of "layer"
      overview-manual: mention that patch files can be compressed
      overview-manual: use correct spelling "counterpart"
      overview-manual: update deploy.bbclass snippet
      contributor-guide: couple minor typo/grammar fixes

 documentation/bsp-guide/bsp.rst                    |   42 +-
 documentation/conf.py                              |   23 +-
 .../contributor-guide/recipe-style-guide.rst       |    8 +-
 documentation/dev-manual/build-quality.rst         |    4 +-
 documentation/migration-guides/release-5.0.rst     |    1 +
 .../migration-guides/release-notes-5.0.18.rst      | 2644 ++++++++++++++++=
++++
 documentation/overview-manual/concepts.rst         |   36 +-
 documentation/overview-manual/intro.rst            |    2 +-
 documentation/overview-manual/yp-intro.rst         |    4 +-
 documentation/ref-manual/variables.rst             |    6 +
 documentation/security-reference/security-team.rst |   52 +-
 11 files changed, 2756 insertions(+), 66 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.18.rst

