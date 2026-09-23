Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5B1C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 08:59:03 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2782.1790153937565298782
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 01:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NOmnzHul;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2A4B9C21A95
	for <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 08:59:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 288B360580;
	Wed, 23 Sep 2026 08:58:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2C43103293F1;
	Wed, 23 Sep 2026 10:58:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790153934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ksjebnQlLFyAK7MWxdg4fgRR/XFZolf3iAEoPOpIAdw=;
	b=NOmnzHulCYHlnxlUOfgQ5Q3y77T04pQOXCvPYKy87vfhU4GDFVxQJq8j89iyegXdy+1jSV
	Mxgg/3Sb5mvHrmsJxf2Ai7phTN3jZAU5G4s3aikVXnMC9bR6FxiIkLf5nV3ISCbiB/SkAF
	+dNQn4UwRXEbAcD8k//m0NA/9WnMaABX34l6TedsTR6/ENVvXCVyBIpfuxUFtzUxJleNqP
	yjKdI9vw6i/zhfKDJMgSzUvEC8yVefxx47MqCwnHDxihpZhTn8dhxjU6e6VqTwo4svtqyo
	9Y9IdZ7miBSkdva8v+qsI+5NiExx6DbmtqKPuRoUHiHcrvtSDxDpmVulx+bPDw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 10:58:53 +0200
Message-Id: <DLMKLVQWGLWE.Y89J0YSG5CSH@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 08:59:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10598

Hi Paul,

These changes only include the release notes for 6.1.

The following changes since commit e9fd43e2584fa793dbdbe1545c3c67c41f7d3ef7=
:

  ref-manual/variables.rst: Document SPDX_AUTHORS (2026-09-16 10:41:14 +020=
0)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to f26faba8568a3c8fc81d81d3650cc419847a4e17:

  migration-guides/release-notes-6.1.rst: add contributors (2026-09-21 17:1=
5:14 +0200)

----------------------------------------------------------------
Antonin Godard (20):
      ref-manual/fragments.rst: document core/yocto/monitor-disk-space
      ref-manual/system-requirements.rst: refresh our supported distro list
      migration-guides/release-notes-6.{0,1}.rst: update path to check_sani=
ty_everybuild
      ref-manual/classes.rst: linux-kernel-base: drop the class documentati=
on
      ref-manual,dev-manual: remove srpm mode archiver class mentions
      migration-guides/migration-6.1.rst: add tip to use convert-spdx-licen=
ses.py
      ref-manual/variables.rst: document the KERNEL_TOOLCHAIN variable
      ref-manual/variables.rst: document the FIT_OS variable
      ref-manual/variables.rst: document the CARGO_PROFILE variable
      ref-manual/features.rst: add section for SDK features
      ref-manual/variables.rst: drop documentation for SDK_TOOLCHAIN_LANGS
      ref-manual/classes.rst: document the python_pbr class
      ref-manual/variables.rst: document RETAIN_IGNORE_TASKS
      ref-manual/variables.rst: document the KERNEL_MODULE_INSTALL_PREFIX v=
ariable
      migration-guides/migration/migration-6.1.rst: add note on moved class=
 functions
      migration-guides/migration/release-notes-6.1.rst: cover recent change=
s
      migration-guides/release-notes-6.1.rst: add license updates
      migration-guides/release-notes-6.1.rst: add CVE fixes
      migration-guides/release-notes-6.1.rst: add recipe upgrades
      migration-guides/release-notes-6.1.rst: add contributors

 documentation/dev-manual/licenses.rst              |    4 +-
 documentation/migration-guides/migration-6.1.rst   |   80 +-
 .../migration-guides/release-notes-4.1.1.rst       |    2 +-
 .../migration-guides/release-notes-4.1.rst         |    2 +-
 .../migration-guides/release-notes-5.3.rst         |    4 +-
 .../migration-guides/release-notes-6.0.rst         |    2 +-
 .../migration-guides/release-notes-6.1.rst         | 2065 ++++++++++++++++=
+++-
 documentation/ref-manual/classes.rst               |   25 +-
 documentation/ref-manual/features.rst              |   21 +
 documentation/ref-manual/fragments.rst             |   10 +
 documentation/ref-manual/system-requirements.rst   |    8 +-
 documentation/ref-manual/variables.rst             |   41 +-
 12 files changed, 2150 insertions(+), 114 deletions(-)

