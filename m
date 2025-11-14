Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E46CE8D60
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 17:16:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3592.1763140613672699816
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 09:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=o223eTkG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01FF91A1AAD
	for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 17:16:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C55FD6060E;
	Fri, 14 Nov 2025 17:16:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6542310371CD9;
	Fri, 14 Nov 2025 18:16:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763140611; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=EB4b1rNGwfhv/0IO02/rMOdm7h/0w6wSso/1qijeJmc=;
	b=o223eTkGyZk2lu0fa/TDBPw3+uiD6AHPYP4E25m9l8oxO2Rw2wKGVpAzAYX2j7YMRIbrSz
	ST2wfgqmgLA2cngjAQ3LGe4JngLZKGx5BEijt2QsiSgUi7yk43qU8GXZnkFt+o4+Pj6gWR
	EeBUtER6A3VlbumKLpxcd0vyDxXnAfv+gLjViKFDyTJlU4UGU5IJJ6ZQ0f6aKM3Rw7fJh0
	xQepQomR8oNzIVXErM/NvawQCIDCFkqDN1DJPhjmh5u9KMg69Jj1fpd0kX+5xomBnLpeI6
	8ZUVnnLR/nMsq8OZTO/acr5xOj+kAFi2wxMZ92MSemw04xIYpJSQtoCgZaVYKg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 18:16:49 +0100
Message-Id: <DE8L6MC9L8SP.3L7FCCQDFN208@bootlin.com>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 17:16:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8050

The following changes since commit aef25e0ba434384a60b3e9733040ab266e0429c3=
:

  ref-manual/classes,variables: document the CCACHE_DISABLE variable (2025-=
10-27 17:04:52 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 5ca6617dcceb5f5496ac9ee5d00ee9f7d3a2d5a2:

  migration-guides: add release notes for 4.0.31 (2025-11-14 18:10:02 +0100=
)

----------------------------------------------------------------
Enrico J=C3=B6rns (1):
      dev-manual/sbom.rst: reflect that create-spdx is enabled by default

Lee Chee Yang (2):
      migration-guides: add release notes for 5.0.13
      migration-guides: add release notes for 4.0.31

Quentin Schulz (4):
      kernel-dev: common: migrate bitbake -e to bitbake-getvar
      ref-manual: variables: migrate the OVERRIDES note to bitbake-getvar
      dev-manual: debugging: use bitbake-getvar in Viewing Variable Values =
section
      overview-manual: migrate to SVG + fix typo

Robert P. J. Day (4):
      dev-manual/layers.rst: document "bitbake-layers show-machines"
      dev-manual/new-recipe.rst: update "recipetool -h" output
      dev-manual/new-recipe.rst: replace 'bitbake -e' with 'bitbake-getvar'
      dev-manual/new-recipe.rst: typo, "whith" -> "which"

Ross Burton (1):
      documentation: link to the Releases page on yoctoproject.org instead =
of wiki

Walter Werner SCHNEIDER (1):
      kernel-dev: add disable config example

 documentation/contributor-guide/submit-changes.rst |   4 +-
 documentation/dev-manual/debugging.rst             |  34 +--
 documentation/dev-manual/layers.rst                |   9 +-
 documentation/dev-manual/new-recipe.rst            |  29 +--
 documentation/dev-manual/sbom.rst                  |  15 +-
 documentation/dev-manual/security-subjects.rst     |   8 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/kernel-dev/common.rst                |  20 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.31.rst      | 210 +++++++++++++++++=
+
 .../migration-guides/release-notes-5.0.13.rst      | 241 +++++++++++++++++=
++++
 .../overview-manual/figures/key-dev-elements.png   | Bin 20424 -> 0 bytes
 .../overview-manual/svg/key-dev-elements.svg       | 172 +++++++++++++++
 documentation/overview-manual/yp-intro.rst         |   2 +-
 documentation/ref-manual/release-process.rst       |   3 +-
 documentation/ref-manual/variables.rst             |   4 +-
 17 files changed, 691 insertions(+), 64 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.31.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.13.rst
 delete mode 100644 documentation/overview-manual/figures/key-dev-elements.=
png
 create mode 100644 documentation/overview-manual/svg/key-dev-elements.svg

