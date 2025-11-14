Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC20CE8D62
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 17:16:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3594.1763140613764117110
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 09:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V0mww76M;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 37973C10F6B;
	Fri, 14 Nov 2025 17:16:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0DC8E6060E;
	Fri, 14 Nov 2025 17:16:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 553CB10371CD7;
	Fri, 14 Nov 2025 18:16:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763140611; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=PLIbGOdLQjSjuLnNVxpz0pcTAA2t3J9BWb6GbdZV8dU=;
	b=V0mww76MeeSCVEGW712ukODO10ybQwacbKM2Ga+F5QuavRZx2de5mJDlsMn+TV2K7s64a3
	QxeohP1UwTF6oi047JavovS4uhe/QL0RtkFGOfEs27POH0EOFOuQ2ja/HAsglmbjSHfmqv
	p2G/ZMho3eUhrvCyqw42wXr+OUmQF6XsJBAJSZ/FQSzpRdevBzxh0i+glEssHqH4MAtT5Q
	IFXR01Pb+c60Pk4yZDBzoPj6ju+GLDZ2dmZctZxnBQgQDaUG87K7sg/uDIHwApuRSDj6Yg
	2GHGPfA2icCuT7RJKoeaDSf1i3k3Qk6XX4sSM5Ktn2tEGey540+OVHNaY5AR8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 18:16:49 +0100
Message-Id: <DE8L6M2X831Y.324NIC5CAQA3M@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 17:16:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8051

The following changes since commit 073f3bca4c374b03398317e7f445d2440a287741=
:

  ref-manual/classes.rst: document the relative_symlinks class (2025-10-27 =
17:09:19 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 4b9df539fa06fb19ed8b51ef2d46e5c56779de81:

  migration-guides: add release notes for 4.0.31 (2025-11-14 18:10:02 +0100=
)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.31

Quentin Schulz (4):
      kernel-dev: common: migrate bitbake -e to bitbake-getvar
      ref-manual: variables: migrate the OVERRIDES note to bitbake-getvar
      dev-manual: debugging: use bitbake-getvar in Viewing Variable Values =
section
      overview-manual: migrate to SVG + fix typo

Robert P. J. Day (4):
      dev-manual/new-recipe.rst: update "recipetool -h" output
      dev-manual/layers.rst: document "bitbake-layers show-machines"
      dev-manual/new-recipe.rst: replace 'bitbake -e' with 'bitbake-getvar'
      dev-manual/new-recipe.rst: typo, "whith" -> "which"

Ross Burton (1):
      documentation: link to the Releases page on yoctoproject.org instead =
of wiki

Walter Werner SCHNEIDER (1):
      kernel-dev: add disable config example

 documentation/contributor-guide/submit-changes.rst |   4 +-
 documentation/dev-manual/debugging.rst             |  34 ++--
 documentation/dev-manual/layers.rst                |   9 +-
 documentation/dev-manual/new-recipe.rst            |  29 +--
 documentation/dev-manual/security-subjects.rst     |   8 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/kernel-dev/common.rst                |  20 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.31.rst      | 210 +++++++++++++++++=
++++
 .../overview-manual/figures/key-dev-elements.png   | Bin 20424 -> 0 bytes
 .../overview-manual/svg/key-dev-elements.svg       | 172 +++++++++++++++++
 documentation/overview-manual/yp-intro.rst         |   4 +-
 documentation/ref-manual/release-process.rst       |   3 +-
 documentation/ref-manual/variables.rst             |   4 +-
 14 files changed, 446 insertions(+), 54 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.31.rst
 delete mode 100644 documentation/overview-manual/figures/key-dev-elements.=
png
 create mode 100644 documentation/overview-manual/svg/key-dev-elements.svg

