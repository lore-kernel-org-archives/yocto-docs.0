Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A68F8A171
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 12:41:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13005.1776343308623875289
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 05:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CpB0Zdd0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6FACB4E42A29
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 12:41:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 263EE60498;
	Thu, 16 Apr 2026 12:41:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EF5C104607EE;
	Thu, 16 Apr 2026 14:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776343305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=FBv9fbvzE+F/NIqoqCL/X9MBWgZ5sq8XD7ZBqjSo72w=;
	b=CpB0Zdd08B/KJRXmajPNTz1vppOaTZO5hjxknaJHxI9gGZJYuloD+VF/xcFOCZ6gVRnA80
	uXi4gNGn9PDcbwFi07+RABC3ve/tX9J9bcSdctf39eGWWLzHVQp62bZHFnvtVP5lPL5SoT
	lk+H6X7bxQyr1AbY8UbOlf5dvkJ1Q558+VMLF39hcWJfJ7l+79ctGtu3/IXChSoXP4nQxT
	JYqHrsoJD7F25J0c8R1omBIMkc4bs/CTsNTKhgEAxSm0PgQ5gfYH6Za3xNcyvRQT9ybbPO
	Xjd3AImJW6x4DSNs11QWq3vPbAKZgQYBJUMC9hevYhHtaus3j10eqrrAsOn1Lw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 14:41:44 +0200
Message-Id: <DHUL5CBNM5A6.2H7PK6ZZZ04BE@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 12:41:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9259

The following changes since commit 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f90=
:

  migration-guide: add release notes for 5.3.3 (2026-04-02 15:21:57 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 2c12ec7bf29aedeacf82970a9d2eb262fde4670e:

  ref-manual/variables.rst: fix wording in COMPATIBLE_MACHINE note (2026-04=
-16 14:31:11 +0200)

----------------------------------------------------------------
Adam Blank (6):
      ref-manual/variables.rst: update STAGING_DIR's description
      ref-manual/variables.rst: update COMPONENTS_DIR's description
      ref-manual/variables.rst: update PKGDATA_DIR's description
      ref-manual/variables.rst: update RECIPE_SYSROOT* descriptions
      ref-manual/variables.rst: update STAGING_DIR* descriptions
      ref-manual/variables.rst: correct a reference to STAGING_DIR*

Antonin Godard (12):
      ref-manual/system-requirements: add buildtools note for Alma/CentOS/R=
ocky 9
      ref-manual/system-requirements.rst: update supported releases
      tools/build-docs-container: add ubuntu 26.04 support
      tools/build-docs-container: update fedora distros
      tools/build-docs-container: drop support for OpenSUSE Leap 15.5
      ref-manual/system-requirements.rst: add section for openSUSE Leap 16.=
0
      set_versions.py: fix seriesversion for milestone tags
      set_versions.py: use bitbake "dev" version when our series is devbran=
ch
      set_versions.py: change strategy for the default page
      set_versions.py: make active releases unique
      sphinx-static/switchers.js.in: add an "Outdated release manuals" entr=
y
      ref-manual/variables.rst: fix wording in COMPATIBLE_MACHINE note

El Mehdi YOUNES (2):
      brief-yoctoprojectqs: fix the allow root login command
      brief-yoctoprojectqs: fix runqemu command

Martin Jansa (1):
      docs: ubuntu_essential.sh: explicitly add libcrypt-dev

 documentation/brief-yoctoprojectqs/index.rst       |  4 +-
 .../ref-manual/buildtools-alma-centos-rocky-9.rst  | 11 +++
 documentation/ref-manual/system-requirements.rst   | 53 +++++++++++---
 documentation/ref-manual/variables.rst             | 82 ++++++++++--------=
----
 documentation/set_versions.py                      | 26 +++++--
 documentation/sphinx-static/switchers.js.in        | 32 ++++++---
 documentation/tools/build-docs-container           | 26 ++++---
 ...use_essential.sh =3D> opensuse_essential_15.6.sh} |  0
 .../opensuse_essential_16.0.sh                     |  1 +
 .../host_packages_scripts/ubuntu_essential.sh      |  2 +-
 10 files changed, 154 insertions(+), 83 deletions(-)
 create mode 100644 documentation/ref-manual/buildtools-alma-centos-rocky-9=
.rst
 rename documentation/tools/host_packages_scripts/{opensuse_essential.sh =
=3D> opensuse_essential_15.6.sh} (100%)
 create mode 100644 documentation/tools/host_packages_scripts/opensuse_esse=
ntial_16.0.sh

