Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19218CCF9F3
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 08:36:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.2522.1761726973630089265
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 01:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tiJyZS1g;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DAB6B4E413CC;
	Wed, 29 Oct 2025 08:36:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1A2160710;
	Wed, 29 Oct 2025 08:36:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C61C610311E57;
	Wed, 29 Oct 2025 09:36:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761726971; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CrDO5BO9YVoMwKK7a6rBOLdZlBHqvr0Rfof1mESrG+8=;
	b=tiJyZS1gDdPX7+MO6sx5CIAiE/liFBDWew5Sm7HR9vx0o0A05d0rikCw3JK0D9KP/K2rup
	lJNcRi+Fb8WhK4OWZogPSNDXC8F6thMp/D6BF4mHMn0vg7hu6ZS7cwZ86Ivs33BSpZy+yx
	1CJdBQkUNRBMvKMM8oc6NyaeyQQp4Fuy7L1YbhJy/XPe+oM/ma/+VNqqofPJjyjkw6JDDa
	lXvEfChTGAZDcFpiS6EO1JcM/Hf8etALq1qWGY2Pf8OBOOqnT6ERiO5wJb52F6w99G/cD4
	qRy4sWxyC+WsD8OAcV/iJPjXIN1kImvItoLDGStrjAiV/K3xc/arwVpVDJkDmg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 09:36:10 +0100
Message-Id: <DDUO39BNMLAD.1LT45L9389L6L@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 08:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7889

The following changes since commit 8b85245490ae0b19a9c3880ec31e55b42e19d094=
:

  ref-manual/variables.rst: add note about PSEUDO ignore/include precedence=
 (2025-10-13 17:08:12 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 5cb37206ca0dfaa0dafabb28ebd546b591c88486:

  migration-guides/release-notes-5.3: updates (2025-10-27 17:20:11 +0100)

----------------------------------------------------------------
Antonin Godard (20):
      ref-manual/variables.rst: document UNINATIVE_URL/CHECKSUM
      ref-manual/classes.rst: extend the uninative class documentation
      ref-manual/variables.rst: fix a typo in UNPACKDIR description
      ref-manual/classes.rst: uboot-config: improve documentation
      ref-manual/qa-checks.rst: drop var-undefined
      ref-manual/features.rst: add new opencl feature
      ref-manual/classes.rst: document the python_pdm class
      ref-manual/classes.rst: ccache: mention that the host's ccache can be=
 used
      ref-manual/classes,variables: document the CCACHE_DISABLE variable
      ref-manual/variables.rst: document the REQUIRED_TUNE_FEATURES variabl=
e
      ref-manual/variables.rst: document the REQUIRED_MACHINE_FEATURES vari=
able
      ref-manual/variables.rst: document the REQUIRED_COMBINED_FEATURES var=
iable
      ref-manual/variables.rst: document the REQUIRED_IMAGE_FEATURES variab=
le
      ref-manual/variables.rst: document the USE_NLS variable
      ref-manual/classes.rst: gettext: extend the documentation of the clas=
s
      ref-manual/classes.rst: document the rust-target-config class
      ref-manual/features.rst: add entry for the coresight machine feature
      ref-manual/classes.rst: document the relative_symlinks class
      ref-manual: document UBOOT_MAKE_OPTS
      migration-guides/release-notes-5.3: updates

Jo=C3=A3o Marcos Costa (1):
      variables.rst: fix LAYERDEPENDS description

Lee Chee Yang (1):
      migration-guides: add release notes for 5.2.4

Paul Barker (1):
      dev-manual, test-manual: Update autobuilder output links

Pierre-Loup GOSSE (2):
      ref-manual/variables.rst: document IMAGE_EXTRA_PARTITION_FILES
      migration-guides/release-notes-5.3.rst: new wic extra_partition plugi=
n

Robert P. J. Day (2):
      dev-manual/start.rst: fix typo "RELEASE" -> "RELEASES"
      overview-manual/yp-intro.rst: update on-target packaging info

 documentation/dev-manual/start.rst                 |   4 +-
 documentation/dev-manual/vulnerabilities.rst       |   2 +-
 documentation/migration-guides/migration-5.3.rst   |  47 ++-
 documentation/migration-guides/release-5.2.rst     |   2 +-
 .../migration-guides/release-notes-5.2.4.rst       | 320 +++++++++++++++++=
+++
 .../migration-guides/release-notes-5.3.rst         | 336 +++++++++++++++++=
++--
 documentation/overview-manual/yp-intro.rst         |  11 +-
 documentation/ref-manual/classes.rst               | 191 ++++++++++--
 documentation/ref-manual/features.rst              |   8 +
 documentation/ref-manual/qa-checks.rst             |  11 -
 documentation/ref-manual/variables.rst             | 152 +++++++++-
 documentation/test-manual/reproducible-builds.rst  |   2 +-
 documentation/test-manual/test-process.rst         |   2 +-
 13 files changed, 1016 insertions(+), 72 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.2.4.rst

