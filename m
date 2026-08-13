Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F98C5DF65
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 08:48:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14634.1786610921734457869
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 01:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nMQcnZsl;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9F1264E411EA;
	Thu, 13 Aug 2026 08:48:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60E366046D;
	Thu, 13 Aug 2026 08:48:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8081511C4DB89;
	Thu, 13 Aug 2026 10:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786610918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=odcjF/WbbzZlrhO1byiHS9joAu+bKb0aj/eIeiXTDt0=;
	b=nMQcnZslonMa6gVsNsIHMcHR2S5Yt0WqulLozItFw/J8L6nEL4EmlGre3jNA6TV0+XU+EH
	P5BL3KcJh/5n6e4YyOQI5lTfsO0ZAPmRHFMkemkmubwQpkeQR39dSPXuuL+BGycJlKhMGT
	/BLjDR4tb719stjlR3H7AQhAUPCDseX/6jf4r+2qtr6CTNfoojeTCVjPWQN9B56oTwVLmE
	M6LafA7eYAxOzHmpYpDTl4wGS+SrBqZPYcSQk0bANt0UBubxNPhoDEjzNgyN7097yfYjSQ
	H8yARiyJn/xlRtk130yYxNQ8iou4mk2+ccYV2pns66ncwIevSVwx+L2Kuqmv3w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 10:48:37 +0200
Message-Id: <DKNOPOLY0DJW.3I6YMWN83CK78@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 08:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10277

The following changes since commit 41dae3c3da3ada1745fc60228ff6269c64ee2361=
:

  ref-manual/variables.rst: SSTATE_MIRRORS: link to the new sstate-mirrors-=
setup doc (2026-07-29 10:47:14 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 3660b8085a5e790c1ea8bf75236fff4b216fe19c:

  brief-yoctoprojectqs/index.rst: fix a replacement typo (2026-08-13 10:19:=
54 +0200)

----------------------------------------------------------------
Antonin Godard (9):
      sdk-manual/appendix-customizing-standard.rst: use code block for bitb=
ake assignment
      sdk-manual/intro.rst: remove a confusing sentence
      sdk-manual/intro.rst: link to sysroot term
      sdk-manual: rename the section to remove "extensible"
      sdk-manual/intro.rst: detail differences between standard and extensi=
ble sysroots
      docs-wide: remove CROPS references
      ref-manual/variables.rst: document the QB_DEFAULT_BIOS variable
      brief-yoctoprojectqs/index.rst: use pip to install bitbake-setup
      brief-yoctoprojectqs/index.rst: fix a replacement typo

J=C3=B6rg Sommer (1):
      features: Add distro feature "audit"

Niko Mauno (2):
      documentation: Replace non-ASCII confusable characters with ASCII
      tools: Add check-confusables pre-commit hook

Paul Barker (1):
      contributor-guide: Note patch complexity requirements for stable bran=
ches

Richard Purdie (1):
      security-manual: Add information about how security is handled in bui=
lds

Ulrich =C3=96lmann (1):
      dev-manual/creating-fragments.rst: fix typos

 .pre-commit-config.yaml                            |   5 +
 documentation/Makefile                             |   1 +
 documentation/brief-yoctoprojectqs/index.rst       |  39 ++++---
 documentation/bsp-manual/bsp.rst                   |   3 +-
 documentation/contributor-guide/index.rst          |   4 +-
 .../contributor-guide/recipe-style-guide.rst       |   8 +-
 documentation/contributor-guide/submit-changes.rst |  10 +-
 documentation/dev-manual/build-quality.rst         |   2 +-
 documentation/dev-manual/creating-fragments.rst    |   4 +-
 documentation/dev-manual/debugging.rst             |  14 +--
 documentation/dev-manual/new-recipe.rst            |   4 +-
 documentation/dev-manual/start.rst                 | 104 +----------------=
-
 documentation/index.rst                            |   2 +-
 documentation/kernel-dev/common.rst                |  10 +-
 .../migration-guides/release-notes-4.1.rst         |   2 +-
 .../overview-manual/development-environment.rst    |  16 +--
 documentation/overview-manual/yp-intro.rst         |  36 ++----
 documentation/ref-manual/classes.rst               |   4 +-
 documentation/ref-manual/devtool-reference.rst     |   4 +-
 documentation/ref-manual/features.rst              |   8 ++
 documentation/ref-manual/variables.rst             |  19 ++++
 .../yocto-project-supported-features.rst           |  10 +-
 .../sdk-manual/appendix-customizing-standard.rst   |  11 +-
 documentation/sdk-manual/appendix-obtain.rst       |   3 +-
 documentation/sdk-manual/index.rst                 |   6 +-
 documentation/sdk-manual/intro.rst                 |  35 ++++--
 .../security-manual/build-process-security.rst     |  50 +++++++++
 documentation/security-manual/index.rst            |   1 +
 .../test-manual/yocto-project-compatible.rst       |   2 +-
 documentation/tools/check-confusables              | 121 +++++++++++++++++=
++++
 .../transitioning-to-a-custom-environment.rst      |   2 +-
 documentation/what-i-wish-id-known.rst             |  14 +--
 32 files changed, 334 insertions(+), 220 deletions(-)
 create mode 100644 documentation/security-manual/build-process-security.rs=
t
 create mode 100755 documentation/tools/check-confusables

