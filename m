Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEF6E7542B
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:04:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117599.1766567074638579187
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 01:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dztotQCw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DF2354E41D81
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 09:04:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B506D60742;
	Wed, 24 Dec 2025 09:04:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E50A10AB1003;
	Wed, 24 Dec 2025 10:04:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766567071; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Gl8BszUDBPhdRywv46mfU/rojeCGuu8GP0eDY1gV2wQ=;
	b=dztotQCw6gviaCj5+nUgL7OQPO4NaTqhru+zGjfdkA1j4/Nx7oH7PFM3Z0feZa2hxOcIBs
	/x7hfOyg24rbKNerINivwmU+BRJr+JEUg5jE5sTqCe/8MJfzsICN/5AV+iNnLQU7mJRf22
	rSHdb9aBX2HGL/inwCnHj2U/qCU4f+9XS4V/Nni3GE92j7cwdx96M1WmWM8eDbbuu7nQtv
	TLDwfYAcDtxHKZQF16yo4kfRZx8OcUgttRslVmJa708kbGNxITzohXVOTloKJ8OhZhSr9u
	NE7iQZIymVZlAaVzarUSwIUyv6Ol6M2C8uc4XGDCX1pX4Hyz0k4QXJIsCD3JQA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Dec 2025 10:04:30 +0100
Message-Id: <DF6BRGPPBIZ3.1Y4N4U293JIZK@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 09:04:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8319

The following changes since commit b0f5cc276639916df197435780b3e94accd4af41=
:

  migration-guides: add release notes for 4.0.31 (2025-11-14 18:10:02 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 85fb6e4a964ea2dea9c3083ba2c4ceb336f34b1a:

  ref-manual/classes.rst: document the image-container class (2025-12-24 09=
:57:14 +0100)

----------------------------------------------------------------
Antonin Godard (9):
      dev-manual/temporary-source-code.rst: fix definition of WORKDIR
      overview-manual/yp-intro.rst: change removed ECOSYSTEM to ABOUT
      overview-manual/yp-intro.rst: link to YP members and participants
      ref-manual/svg/releases.svg: mark styhead and walnascar EOL
      ref-manual/svg/releases.svg: mark whinlatter as current release
      contributor-guide/submit-changes.rst: remove mention of Upstream-Stat=
us
      Makefile: fix rsvg-convert --format capitalization
      Add a new "Security" section
      ref-manual/classes.rst: document the image-container class

Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.14

 documentation/Makefile                             |   4 +-
 documentation/contributor-guide/submit-changes.rst |   8 +-
 documentation/dev-manual/index.rst                 |   1 -
 documentation/dev-manual/security-subjects.rst     | 194 -----------------=
--
 documentation/dev-manual/temporary-source-code.rst |  14 +-
 documentation/index.rst                            |   7 +-
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.3.rst         |   2 +-
 .../migration-guides/release-notes-5.0.14.rst      | 211 +++++++++++++++++=
++++
 documentation/overview-manual/yp-intro.rst         |   9 +-
 documentation/ref-manual/classes.rst               |  47 +++++
 documentation/ref-manual/svg/releases.svg          |  16 +-
 documentation/ref-manual/variables.rst             |  18 ++
 documentation/security-reference/index.rst         |  14 ++
 .../reporting-vulnerabilities.rst                  |  85 +++++++++
 documentation/security-reference/security-team.rst | 110 +++++++++++
 16 files changed, 515 insertions(+), 226 deletions(-)
 delete mode 100644 documentation/dev-manual/security-subjects.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.14.rst
 create mode 100644 documentation/security-reference/index.rst
 create mode 100644 documentation/security-reference/reporting-vulnerabilit=
ies.rst
 create mode 100644 documentation/security-reference/security-team.rst

