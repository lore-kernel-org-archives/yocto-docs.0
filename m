Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CE4D41C14
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 10:23:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6383.1765448625462499527
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 02:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UUzCDsmZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E9D521A20E4;
	Thu, 11 Dec 2025 10:23:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BD88560738;
	Thu, 11 Dec 2025 10:23:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C087D103C8E02;
	Thu, 11 Dec 2025 11:23:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765448623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=VzA7x9TS4HveC86JMWxzAHP4hON3AUhMgo1MdDalyks=;
	b=UUzCDsmZEkF5o6jFqB1SFuPQO299j4ToFLHuqcKjyyaJDkqpMluUZRHiYhIjSx2ZjVVf5d
	bojiKEwJwo7Arl0qufVSF+rU+8Q4iPEqP4NWh+4RjszYvFFJb6G/zSQIWa4DERRei9lzYP
	MHRINpd8/ypzZeW0f2uAkrYBiC7XprRaaMGCF3VFNEvj58eXboOfuWwJxYhm/DV4sV1PXC
	hEUZKc3mA6PqjhH20yqRrBG+o3EFiMRya3lKTBGtCgZLXE3lShmRkdLCanJJonkGAQfyme
	2sKSCh7GtbtuhVQ2SCONNSJGQhZX0exlrz63tn2VN9S5p1RgLnOP5C0jVx+OYg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 11:23:41 +0100
Message-Id: <DEVBB0EOB3KY.O2SXKMCXP0PZ@bootlin.com>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 10:23:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8250

The following changes since commit 5ca6617dcceb5f5496ac9ee5d00ee9f7d3a2d5a2=
:

  migration-guides: add release notes for 4.0.31 (2025-11-14 18:10:02 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 1be4c164a9c43070e4243d34a61d31d238cf0407:

  Add a new "Security" section (2025-12-11 10:52:23 +0100)

----------------------------------------------------------------
Antonin Godard (9):
      ref-manual/variables.rst: NVD_DB_VERSION: fix default value
      dev-manual/temporary-source-code.rst: fix definition of WORKDIR
      overview-manual/yp-intro.rst: change removed ECOSYSTEM to ABOUT
      overview-manual/yp-intro.rst: link to YP members and participants
      ref-manual/svg/releases.svg: mark styhead and walnascar EOL
      ref-manual/svg/releases.svg: mark whinlatter as current release
      contributor-guide/submit-changes.rst: remove mention of Upstream-Stat=
us
      Makefile: fix rsvg-convert --format capitalization
      Add a new "Security" section

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
 documentation/ref-manual/svg/releases.svg          |  16 +-
 documentation/ref-manual/variables.rst             |   4 +-
 documentation/security-reference/index.rst         |  14 ++
 .../reporting-vulnerabilities.rst                  |  85 +++++++++
 documentation/security-reference/security-team.rst | 110 +++++++++++
 15 files changed, 452 insertions(+), 228 deletions(-)
 delete mode 100644 documentation/dev-manual/security-subjects.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.14.rst
 create mode 100644 documentation/security-reference/index.rst
 create mode 100644 documentation/security-reference/reporting-vulnerabilit=
ies.rst
 create mode 100644 documentation/security-reference/security-team.rst

