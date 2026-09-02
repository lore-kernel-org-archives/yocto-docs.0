Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4462C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:01:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11932.1788354094932855275
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 06:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Qu+NSFCE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 94D414E414C6;
	Wed,  2 Sep 2026 13:01:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 683926053C;
	Wed,  2 Sep 2026 13:01:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C27B11C79881;
	Wed,  2 Sep 2026 15:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788354086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GbFkg/xBKY6+IV6zOIK5eTTY4iGEpSyOol/nGr5+M48=;
	b=Qu+NSFCEu66Loa2iVrsmueBHlFmhAeTwr17eSwH06JVdxlMXE1dfaoZrL8BS7qFs18Bdnc
	fBvzdiKgCMrCSrGjaoraMLFcKG4rQgfRxtZ/56yXoJtaLf2s/82u8PJ0du87PxsVfiolvp
	09IPfnC5Ht/6nBnF9buEfHXILC4A9StGa97alXFxX0ZYBkXimJ+M1Rn2wgz3E9Yn/qTZjo
	fQgaLh/sDm/aLMjJfWWAtoiCR7M6KCCv8IRUzbRgMV751XEiTf8znBDgUTnuQic1k16WS+
	0Ni9kodxZtDLNBvomsgz3E0kyTS5n2s19XvLBtvdFcH71azhB0xH8apMzYvDdw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 15:01:23 +0200
Message-Id: <DL4UM4FYDU9E.2T8Y3KN5MSTCQ@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Sep 2026 13:01:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10435

The following changes since commit 9955b0f099b6b42a9750f0d544944a2d8e5a39b2=
:

  README: update instructions for installing vale and sphinx-lint (2026-08-=
21 14:47:36 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to e35e86e9aea4e4ae12e8e0ba8a6391f2b2555b63:

  ref-manual/system-requirements.rst: drop ccache in distros (2026-09-01 15=
:39:08 +0200)

----------------------------------------------------------------
Antonin Godard (5):
      Makefile: remove unused O variable
      docs-wide: fix USERMOD_PARAMS -> USERMOD_PARAM
      conf.py: move and sort imports
      conf.py: use importlib to check that sphinx_rtd_theme exists
      conf.py: reorganize options

Jose Quaresma (1):
      ref-manual/system-requirements.rst: drop ccache in distros

Peter Kjellerstedt (1):
      ref-manual: Remove the documentation of the GROUPMEMS_PARAM variable

Robert P. J. Day (3):
      documentation: use "https" protocol for git.yoctoproject.org
      README: add references to recent security documents
      README: Correct capitalization, "Docbook" to "DocBook"

Trevor Woerner (5):
      docs: state the language of nine literal blocks explicitly
      ref-manual: drop the full stop from the QB_SMP example
      ref-manual: fix a typo in the QB_SMP description
      dev-manual: quote the values in two recipe examples
      toaster-manual: spell the json code-block language in lower case

 documentation/Makefile                             |   8 +-
 documentation/README                               |  14 +-
 documentation/bsp-manual/bsp.rst                   |   6 +-
 documentation/conf.py                              | 263 +++++++++++------=
----
 documentation/dev-manual/layers.rst                |   4 +-
 documentation/dev-manual/new-recipe.rst            |   4 +-
 documentation/dev-manual/upgrading-recipes.rst     |   2 +-
 documentation/kernel-dev/advanced.rst              |   4 +-
 documentation/kernel-dev/common.rst                |   4 +-
 documentation/kernel-dev/maint-appx.rst            |   4 +-
 documentation/migration-guides/migration-6.1.rst   |   8 +-
 .../migration-guides/release-notes-6.1.rst         |   6 +-
 documentation/overview-manual/concepts.rst         |   4 +-
 .../overview-manual/development-environment.rst    |   4 +-
 documentation/ref-manual/classes.rst               |   2 +-
 documentation/ref-manual/variables.rst             |  24 +-
 documentation/test-manual/intro.rst                |  20 +-
 documentation/toaster-manual/reference.rst         |  10 +-
 documentation/toaster-manual/setup-and-use.rst     |   2 +-
 .../host_packages_scripts/almalinux_essential.sh   |   2 +-
 .../host_packages_scripts/fedora_essential.sh      |   2 +-
 21 files changed, 211 insertions(+), 186 deletions(-)

