Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50539D39433
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:39:05 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17271.1775140739258248031
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 07:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tqsd5f53;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F8074E428B6
	for <docs@lists.yoctoproject.org>; Thu,  2 Apr 2026 14:38:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E3E55FDEB;
	Thu,  2 Apr 2026 14:38:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E78CB1045026F;
	Thu,  2 Apr 2026 16:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775140736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2kxmEqU+ucbv3dbUpvkaAlkrAF3SHOgF86+ngcjDkzU=;
	b=tqsd5f53LjDFO47PLYgbcGC0TKNqfmlvE09rVrjtEHw8mIIhm+6CyLEWa9Vp2Gt2N1KYuv
	Ie0JbdHDW0jdJZ8lLgTZynrxWnCkIds81VCXVbdDDgF7KnIQ/eP2FZ2UMs2AL5wgIm70ik
	XzMm9oclTU22uR3U7XQXaEnQHabAcu2i4W6qDOwA3tDa7Ths3Aif5Z3DRHrkuKl5QDSCt9
	r/78vv3ltS2q/qpt5fLbd+bBql5N7cRi8a8s9X29/R9CX9tsLpsMi7hCVWya+xJY0fQrX9
	27m7tekXhf04+y5Anq88larZkWuuCTiztRHwTlNgC9rU5Z8rqoES/Owne5LGEQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 16:38:55 +0200
Message-Id: <DHIQVFZX6K7D.1SG0R2OURPUPS@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 14:39:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9168

Hi Paul,

You'll notice a short time between the last PR and this one, mainly because
my two commits below are fixing local docs builds on master, so I think it'=
d be
good to have them.

It also includes the latest release notes and adds a missing word to the
contributor guide.

Antonin

The following changes since commit dc1574b9f71532c469f355af2ff5ff5664083e48=
:

  ref-manual: document the usage of FIT_LOADABLES (2026-03-30 10:40:23 +020=
0)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f90:

  migration-guide: add release notes for 5.3.3 (2026-04-02 15:21:57 +0200)

----------------------------------------------------------------
Antonin Godard (2):
      set_versions.py: skip laverne branch for closest branch
      set_versions.py: fix get_latest_tag and milestone tags

Lee Chee Yang (2):
      migration-guide: add release notes for 4.0.33 4.0.34
      migration-guide: add release notes for 5.3.3

Yanis BINARD (1):
      contributor-guide/submit-changes.rst: Added missing word

 documentation/contributor-guide/submit-changes.rst |   2 +-
 documentation/migration-guides/release-4.0.rst     |   2 +
 documentation/migration-guides/release-5.3.rst     |   1 +
 .../migration-guides/release-notes-4.0.33.rst      | 182 +++++++++++++++++=
+++
 .../migration-guides/release-notes-4.0.34.rst      | 191 +++++++++++++++++=
++++
 .../migration-guides/release-notes-5.3.3.rst       | 175 +++++++++++++++++=
++
 documentation/set_versions.py                      |  11 +-
 7 files changed, 562 insertions(+), 2 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.33.rst
 create mode 100644 documentation/migration-guides/release-notes-4.0.34.rst
 create mode 100644 documentation/migration-guides/release-notes-5.3.3.rst

