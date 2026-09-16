Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5284EC88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 09:02:50 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10558.1789549360658114217
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 02:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MlW6QXKC;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 68757C5CD58;
	Wed, 16 Sep 2026 09:03:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E4F460649;
	Wed, 16 Sep 2026 09:02:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 739F411C7B015;
	Wed, 16 Sep 2026 11:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789549357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=PvUwRZ1oSsTPHoEqPWXNTOPPbdWQz/y4Q9E6bFFkTxY=;
	b=MlW6QXKCLMS57UdvX1t6b2lyP8s9o7nOz374XnlA/9JUS/EvdzxDaeKv8Hcgdtq7qqzhsw
	xjEXrh0WpJv640MJOjL6qRISLLfYODBoMTEGn3sEaEz5JboRMDQ6RB+B4GnJPrpJvSL38t
	EYthic/erzhEmxbGl0Z8cWKrgPhbpOGCHI0AwtNq8G2XR4gUBDxoKjggaVjCq+CE4FNr48
	ZMhV3bJThbE98buVOXz6Ks+47Gf+mLC0KzQGJWvbkFkAy0/PJq204VDa4oKA6POJV+E56v
	+s0u4c4KJ961Da0q/f9G2PkQQTTPV9sNymmlhjRxtDC5XQ9Mp95vHkqixiVmFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 11:02:36 +0200
Message-Id: <DLGMAWVZGKJ2.2AW6YNDVZ47P7@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [wrynose] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Sep 2026 09:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10520

The following changes since commit d4a5167233032f63826ad33f7b3a718d9a274a02=
:

  ref-manual/system-requirements.rst: drop ccache in distros (2026-09-02 14=
:52:40 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to a2cc1f5b86f3cdc9ad3257a2545322c5169da3ca:

  ref-manual/variables.rst: Document SPDX_AUTHORS (2026-09-16 10:41:42 +020=
0)

----------------------------------------------------------------
Andrei Lalaev (1):
      ref-manual: update DEBUG_OPTIMIZATION/FULL_OPTIMIZATION

Antonin Godard (13):
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
      ref-manual/classes.rst: buildstats: remove local.conf default value
      dev-manual/wic.rst: remove local.conf mentions
      ref-manual/variables.rst: GCCVERSION: replace local.conf and mention =
recipe existence

Joshua Watt (2):
      ref-manual/variables.rst: Fix the documentation for the SPDX agent va=
riables
      ref-manual/variables.rst: Document SPDX_AUTHORS

Lee Chee Yang (2):
      migration-guide: add release notes for 5.0.20
      migration-guide: add release notes for 6.0.3

Robert P. J. Day (2):
      dev-manual: drop link to out-of-date wiki page
      dev-manual: correct OVERRIDES to FILESOVERRIDES for FILESPATH

 documentation/bsp-guide/bsp.rst                    |   2 +-
 documentation/dev-manual/layers.rst                |   4 +-
 documentation/dev-manual/poky-manual-setup.rst     |  10 +-
 documentation/dev-manual/start.rst                 |   3 +-
 documentation/dev-manual/wic.rst                   |   9 +-
 documentation/migration-guides/release-5.0.rst     |   1 +
 documentation/migration-guides/release-6.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.20.rst      | 779 +++++++++++++++++=
++++
 .../migration-guides/release-notes-6.0.3.rst       | 336 +++++++++
 documentation/ref-manual/classes.rst               |   7 +-
 documentation/ref-manual/features.rst              |   4 +
 documentation/ref-manual/structure.rst             |   2 +-
 documentation/ref-manual/variables.rst             | 115 +--
 documentation/ref-manual/varlocality.rst           |   8 +-
 documentation/security-manual/securing-images.rst  |   2 +-
 15 files changed, 1213 insertions(+), 70 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.20.rst
 create mode 100644 documentation/migration-guides/release-notes-6.0.3.rst

