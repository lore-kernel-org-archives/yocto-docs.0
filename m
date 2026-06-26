Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58402CDE00E
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 08:24:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31002.1782462258230876465
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 01:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ShzLBWC8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 246731A08F4
	for <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 08:24:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3CF46025A;
	Fri, 26 Jun 2026 08:24:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2360A104C8390;
	Fri, 26 Jun 2026 10:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782462255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=I8XW9b8iuSwBAGEt+qAKkWjYuASyJoYMA50jXS4Ayw0=;
	b=ShzLBWC89jSLJf8uRXlwwxRPYyl1A2MVW+84NzwqRN3cdisgHwymeYwYD8fT6qjUhWgp5j
	yaNFvGSpgj+1A3+glw1Xtm4EkJ3LxoouV7uYJKN7u6WjWpRosxJG2FLZVR8ZkDXd9joP+a
	K1sde441tW+QF8rRlWlAJoCBTm5Ro3jZw7KTWzSx07OaqCPsDUyxvQMZDOpISRM2aQCmvc
	xSoEK5iBp+ZQPH0s0ghzfoFJQDZVujY4JwvLStbVij+PWcV74xdWSWT2PWHqO5yckjTBLW
	1R7zRXbRz7SVa5j6uww4kPKNyTWZ9H2R6Y2BpPINwAEdria6NQhbjMWJcLy51w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 10:24:14 +0200
Message-Id: <DJIU4VG6H1XB.2DGNL4VTPX21J@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 08:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9905

The following changes since commit 47f0f69651280151a52f41fd6b425d55427401e9=
:

  host_packages_scripts/ubuntu_docs.sh: remove python3-saneyaml (2026-06-22=
 10:18:23 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 4562ba19f36e54099bcae82cec8a70deb1c23aa7:

  migration-guides/migration-6.0.rst: fix wks file move note (2026-06-26 10=
:19:17 +0200)

----------------------------------------------------------------
Antonin Godard (2):
      tools/build-docs-container: add debian 11
      migration-guides/migration-6.0.rst: fix wks file move note

Quentin Schulz (1):
      poky.yaml.in: bump min git version

Robert P. J. Day (7):
      dev-manual: mention bitbake-layers "--example-recipe-version" option
      ref-manual: fix incorrect heading level for site.conf section
      test-manual: grammatical and URL tweaks/additions in "Welcome" sectio=
n
      ref-manual: under meta/files entry, mention Wic files
      ref-manual: add missing entry for build/tmp/deploy/spdx
      dev-manual: rename Build Quality section to mention "buildhistory"
      test-manual: clarify that ptest-runner is added automatically

jaekyu.lee (1):
      migration-guide: 5.1: Fix typo

 documentation/dev-manual/build-quality.rst         |  4 ++--
 documentation/dev-manual/building.rst              |  2 +-
 documentation/dev-manual/layers.rst                |  4 ++--
 documentation/dev-manual/packages.rst              |  2 +-
 documentation/dev-manual/upgrading-recipes.rst     |  2 +-
 documentation/migration-guides/migration-1.5.rst   |  2 +-
 documentation/migration-guides/migration-1.7.rst   |  2 +-
 documentation/migration-guides/migration-5.1.rst   |  2 +-
 documentation/migration-guides/migration-6.0.rst   | 13 ++++++-----
 .../migration-guides/migration-general.rst         |  2 +-
 documentation/poky.yaml.in                         |  2 +-
 documentation/ref-manual/classes.rst               |  2 +-
 documentation/ref-manual/structure.rst             | 19 +++++++++++++---
 documentation/ref-manual/variables.rst             |  2 +-
 documentation/test-manual/intro.rst                | 25 +++++++++++-------=
----
 documentation/test-manual/ptest.rst                |  4 ++--
 documentation/tools/build-docs-container           |  3 ++-
 17 files changed, 55 insertions(+), 37 deletions(-)

