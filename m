Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8800.1795189320342211160
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 07:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JeNTOMJs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F8721A174F
	for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 15:41:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF812603CF;
	Fri, 20 Nov 2026 15:41:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A1A811BC03A7;
	Fri, 20 Nov 2026 16:41:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795189313; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=F+eP5mGPowrOpCrYwq4cRA5N5P9XODUlK54mTWPQn2Q=;
	b=JeNTOMJs5LJbNyWKINt1s6sBGSsB/xTrJjPLFfaE4op1XP7RL0N9oSiLzMHZktw/PApXcx
	fokfHOzMhJd7s86/DJfM153fEmhc+32kmxtbK85oQLlXwalClxrWyUgUfyvl5c6EeSngMp
	jR0IM3efRXUCWakRd60sPHSc3M1TDZUDFX4v29p/QajBbDTiNPpSPkxXQ1W+mXsYuE6ZEf
	tDewu+5V0hSza6JpKhxNj9T2uUvIHf1x17VR7qHJMIiEmGhDtNHv9IrfAcixx60DVQXXin
	8Q4jIxhwGhGxc0xgfhTBoVHHBmd4WPxYl2vxaaQTFbo2rMypUdY8W59bqLPxBA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 16:41:51 +0100
Message-Id: <DN05I0LGHDJR.23COGN9IA437K@bootlin.com>
Subject: [wrynose] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 15:42:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10818

The following changes since commit a361ccfc75eb853805e5acd4ab32b439f6d0af06=
:

  contributor-guide: Adopt new AI-Assisted Contribution Policy (2026-11-06 =
09:49:56 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to 3f1ac4dc4fd3055888000f2fbb72b3f7becc76c6:

  migration-guides/release-notes-5.0.17.rst: fix the oecore download URL (2=
026-11-20 13:22:13 +0100)

----------------------------------------------------------------
Antonin Godard (3):
      ref-manual/kickstart.rst: add a section for commands and directives
      ref-manual/kickstart.rst: warn about the include directive only worki=
ng for .wks
      ref-manual/kickstart.rst: document location and variable expansion

Erik Lindsten (2):
      kernel-dev/maint-appx.rst: fix the kernel cache repository name
      migration-guides/release-notes-5.0.17.rst: fix the oecore download UR=
L

Robert P. J. Day (1):
      ref-manual: add a terms entry for Wic

 documentation/kernel-dev/maint-appx.rst            |   4 +-
 .../migration-guides/release-notes-5.0.17.rst      |   2 +-
 documentation/ref-manual/kickstart.rst             | 140 +++++++++++++++++=
+++-
 documentation/ref-manual/terms.rst                 |   6 +
 documentation/ref-manual/variables.rst             |   8 ++
 5 files changed, 153 insertions(+), 7 deletions(-)
