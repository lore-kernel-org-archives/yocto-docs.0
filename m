Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5353D49C91
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 09:35:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6993.1769765720854847880
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 01:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1sPmNRkt;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BAF581A2B1F
	for <docs@lists.yoctoproject.org>; Fri, 30 Jan 2026 09:35:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 865A36075A;
	Fri, 30 Jan 2026 09:35:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75B61119A885C;
	Fri, 30 Jan 2026 10:35:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769765718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1SPgR2LjO0xUZJ79K1EiOOw+NskADdTkAvHMjlz1AdE=;
	b=1sPmNRktoPvbtz6zolGGvJB0NTVvC96Bawv+67L1cnBpnDOOO0SzQXkqzkOuTkZKTZf0O2
	mb53HN/6R6Sac17TlSFfcN6tm6bWZ2SuuCYHRrkK1rDtohrOM51ibUny2c27OdbhMj7dgt
	Uj4HQRWrTubahhC4xVMTrVlQEqDkNGvSpJ6WErHEBh9FkO9a4tSEkPLYz/Gjmm19Lqb8MV
	qaN0QGt7BpLhdPoSvN2SSa+n3Ec3xpHZhyCk36sm48aJoR3EgQQh9ccTbUi3srNmaSRZB3
	njh+t/1ymSZ/tiprXJlZ2/k8MqvZvToCn+2eY40ZyAQO2etW3Xt/60GiAzJwlw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 10:35:16 +0100
Message-Id: <DG1TL6IEKEPC.10Q24I0791QZ6@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 30 Jan 2026 09:35:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8845

The following changes since commit 9d586f22b04528a12e71ee4fa794d8130320515b=
:

  contributor-guide/recipe-style-guide.rst: explain difference between laye=
r and recipe license(s) (2026-01-13 09:59:23 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 7e89c8b93f07a3a2fa50448121a6f64b1aae65f0:

  migration-guides: add release notes for 5.0.15 (2026-01-23 11:39:23 +0100=
)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.15

Quentin Schulz (12):
      sdk-manual: fix incorrect highlight language for text code-blocks
      sdk-manual: fix incorrect highlight language for console code-blocks
      sdk-manual: fix improper indent of general form of tarball installer =
scripts
      sdk-manual: working-projects: properly highlight code code-blocks
      sdk-manual: appending-customizing: use none lexer for BitBake code bl=
ocks
      sdk-manual: appendix-obtain: replace directory structure PNG with a p=
arsed-literal block
      sdk-manual: appendix-obtain: replace eSDK directory structure PNG wit=
h a parsed-literal block
      sdk-manual: replace sdk-environment PNG with SVG
      sdk-manual: delete sdk-title PNG
      sdk-manual: appendix-obtain: use parsed-literal block for naming conv=
ention of the installer scripts
      sdk-manual: using: fix SDK filename example
      sdk-manual: appendix-obtain: fix default path for eSDK installer scri=
pt

 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.15.rst      | 219 ++++++++++
 documentation/sdk-manual/appendix-customizing.rst  |  36 +-
 documentation/sdk-manual/appendix-obtain.rst       | 158 +++++--
 documentation/sdk-manual/extensible.rst            |  63 +--
 .../sdk-manual/figures/sdk-environment.png         | Bin 42098 -> 0 bytes
 .../sdk-installed-extensible-sdk-directory.png     | Bin 66753 -> 0 bytes
 .../sdk-installed-standard-sdk-directory.png       | Bin 39099 -> 0 bytes
 documentation/sdk-manual/figures/sdk-title.png     | Bin 31039 -> 0 bytes
 documentation/sdk-manual/intro.rst                 |   2 +-
 documentation/sdk-manual/svg/sdk-environment.svg   | 463 +++++++++++++++++=
++++
 documentation/sdk-manual/using.rst                 |  35 +-
 documentation/sdk-manual/working-projects.rst      | 112 +++--
 13 files changed, 968 insertions(+), 121 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.15.rst
 delete mode 100644 documentation/sdk-manual/figures/sdk-environment.png
 delete mode 100644 documentation/sdk-manual/figures/sdk-installed-extensib=
le-sdk-directory.png
 delete mode 100644 documentation/sdk-manual/figures/sdk-installed-standard=
-sdk-directory.png
 delete mode 100644 documentation/sdk-manual/figures/sdk-title.png
 create mode 100644 documentation/sdk-manual/svg/sdk-environment.svg

