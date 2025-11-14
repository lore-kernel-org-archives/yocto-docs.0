Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E0ACE8D5E
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 17:16:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3512.1763140613764374997
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 09:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vNqKfv/s;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CEA8AC10F69;
	Fri, 14 Nov 2025 17:16:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A28306060E;
	Fri, 14 Nov 2025 17:16:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C046910371CD4;
	Fri, 14 Nov 2025 18:16:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763140611; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Hhc3pL/nJ3g0oS0PVcky9eo5snYfYdls9aL7V3OAc2Q=;
	b=vNqKfv/ssGOtiCY/A1+duk6hzcABNxPPuBhvMWzB6Y8yhTsySw8ZwxS+PQyOiNRYkcStKl
	kuqtkjgcSrbgCshNKjQULMjY+7x8ne+F/BEXXJbCw7J/MFD8ZE+ges/qsSuz1LXDWXdowT
	aA7lECrEcwlWggh9DEzSMULkUnwtqU+fxT2+Y736WWljvmSEMj3/in+j6MqoxY7ieBcxfw
	7fkplTn3q4hixprfz+waFOyqahQ74LLW5Srclwk8DByblyFIn1G1WzBwycX4Pbm9Uv/h88
	ss3q3SllAz2iA5MhwpeZ1b/gGjpmArGcNGsAIVaZWNOA1nx8zgwA29g0ziyQKw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 18:16:50 +0100
Message-Id: <DE8L6MGTEMRC.1B5MHJLDN9JKL@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 17:16:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8049

The following changes since commit 650d5a2c8e64958c53b26f37164d90e9ee997187=
:

  brief-yoctoprojectqs/index.rst: refresh after bitbake-setup updates (2025=
-11-14 16:29:33 +0000)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 992d0725e8b4fdcdc2e9a101ce51ebef94a00112:

  migration-guides: add release notes for 4.0.31 (2025-11-14 17:49:35 +0100=
)

----------------------------------------------------------------
Adrian Freihofer (1):
      ref-manual/variables.rst: cover new FIT_KERNEL variables

Ahmad Fatoum (1):
      migration-guides: 5.3: mention barebox migration guides

Antonin Godard (2):
      tools/build-docs-container: add support for ubuntu 25.10
      ref-manual/system-requirements.rst: add ubuntu 25.10 to supported dis=
tros

Daniel Turull (1):
      vulnerabilities: add section for kernel CVEs vulnerabilities

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

Robert P. J. Day (5):
      dev-manual/layers.rst: document "bitbake-layers show-machines"
      dev-manual/new-recipe.rst: update "recipetool -h" output
      dev-manual/new-recipe.rst: replace 'bitbake -e' with 'bitbake-getvar'
      dev-manual/new-recipe.rst: typo, "whith" -> "which"
      dev-manual/new-recipe.rst: update code snippet from sed recipe

Ross Burton (1):
      documentation: link to the Releases page on yoctoproject.org instead =
of wiki

Walter Werner SCHNEIDER (1):
      kernel-dev: add disable config example

 documentation/contributor-guide/submit-changes.rst |   4 +-
 documentation/dev-manual/debugging.rst             |  34 +--
 documentation/dev-manual/layers.rst                |   9 +-
 documentation/dev-manual/new-recipe.rst            |  35 +--
 documentation/dev-manual/poky-manual-setup.rst     |   2 +-
 documentation/dev-manual/sbom.rst                  |  15 +-
 documentation/dev-manual/security-subjects.rst     |   8 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/dev-manual/vulnerabilities.rst       | 199 +++++++++++++++++
 documentation/kernel-dev/common.rst                |  20 +-
 documentation/migration-guides/migration-5.3.rst   |   4 +
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
 documentation/ref-manual/system-requirements.rst   |   1 +
 documentation/ref-manual/variables.rst             |  68 +++++-
 documentation/tools/build-docs-container           |   4 +-
 22 files changed, 962 insertions(+), 73 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.31.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.13.rst
 delete mode 100644 documentation/overview-manual/figures/key-dev-elements.=
png
 create mode 100644 documentation/overview-manual/svg/key-dev-elements.svg

