Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D18C4450A
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 13:19:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5734.1784121562597509247
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 06:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2bXiBXvl;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EE775C2B9CC
	for <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 13:19:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A5CE6035C;
	Wed, 15 Jul 2026 13:19:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7D1411BD3C51;
	Wed, 15 Jul 2026 15:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784121559; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cjqF0LT/vGdoKRbez6UneAcOI/rI5Yn32/H//3z1pmo=;
	b=2bXiBXvlKAMpgyIO9I1rw6NiBk5P9kxLoZAW4JijI1S2O7ySlkWf7cLQLw4jHBHAWb1vrg
	mn3Txs6ZZOtLKOIhtfJnVFrDRXD5rfAh900gIddW/4xRKT/fIe0qbPsp+KWEePqDMDZsRR
	Kg4f4Hga5zvaDY7H0jByeQQnCHGFY6p9AzAVbw3n5tyBCR/6pma1RXfrpCyiv4bfwHldk9
	cByTSmlIqFnfYabEd4W5VVDilHaNWq7MkFuVpBKaUaJTw2h89VsQq6dxZeR0RzPoUXhJbS
	DhYfJdHzXehDa6jI74R2Fn/MojTW5cb+avjPCNqrJFNnN+glmIgR0d0qA3dFrA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 15:19:18 +0200
Message-Id: <DJZ6B54ZHKMU.3ISRUJDZTSEXW@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 13:19:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10076

The following changes since commit def10b40398732ff73f23bf9cb8c0288a8ad7640=
:

  migration-guides: add add release notes for 6.0.1 (2026-07-03 11:09:56 +0=
100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 358519ca6406a89fee42c45dcaf63a37a374f33c:

  docs-wide: fix various broken links (2026-07-15 14:31:33 +0200)

----------------------------------------------------------------
Antonin Godard (12):
      ref-manual/variables.rst: document the LOCALE_UTF8_IS_DEFAULT variabl=
e
      tools/check-glossaries: return 1 in case of failure
      tools/check-glossaries: fix default doc path
      Add a pre-commit hook to check the glossaries
      ref-manual: fix some repeated strings
      brief-yoctoprojectqs/index.rst: refresh bitbake-setup outputs
      migration-guides/release-notes-3.4.2.rst: fix a broken link
      docs-wide: fix broken path links
      ref-manual/classes.rst: replace obsolete mailing list thread
      ref-manual/images.rst: update obsolete VMWare links
      migration-guides/release-notes-5.0.rst: remove broken link
      docs-wide: fix various broken links

Lian Wang (1):
      fix multiple typo and grammar issues

Robert P. J. Day (2):
      ref-manual: expand on kernel "do_sizecheck" task
      ref-manual: add "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS" to variables

 .pre-commit-config.yaml                            |  8 ++++
 documentation/README                               | 10 ++++
 documentation/brief-yoctoprojectqs/index.rst       | 53 ++++++++++--------=
----
 documentation/contributor-guide/submit-changes.rst |  2 +-
 documentation/dev-manual/new-recipe.rst            |  2 +-
 documentation/dev-manual/start.rst                 |  2 +-
 documentation/dev-manual/x32-psabi.rst             |  4 +-
 documentation/migration-guides/migration-6.0.rst   |  4 +-
 .../migration-guides/release-notes-3.4.2.rst       |  6 +--
 .../migration-guides/release-notes-5.0.rst         |  4 +-
 .../migration-guides/release-notes-5.1.rst         |  8 ++--
 .../migration-guides/release-notes-5.3.rst         |  2 +-
 .../migration-guides/release-notes-6.0.rst         |  6 +--
 .../overview-manual/development-environment.rst    |  4 +-
 documentation/profile-manual/usage.rst             | 38 +++++++---------
 documentation/ref-manual/classes.rst               | 13 ++----
 documentation/ref-manual/faq.rst                   |  2 +-
 documentation/ref-manual/images.rst                |  5 +-
 documentation/ref-manual/release-process.rst       |  4 +-
 documentation/ref-manual/system-requirements.rst   |  6 +--
 documentation/ref-manual/tasks.rst                 | 19 +++++---
 documentation/ref-manual/variables.rst             | 41 +++++++++++------
 .../yocto-project-supported-features.rst           |  2 +-
 documentation/tools/check-glossaries               | 10 +++-
 24 files changed, 143 insertions(+), 112 deletions(-)
 create mode 100644 .pre-commit-config.yaml

