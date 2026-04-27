Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3E1FF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 08:30:15 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38922.1777278604997733886
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 01:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Qxuo9Ppt;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 48CC5C5CD44
	for <docs@lists.yoctoproject.org>; Mon, 27 Apr 2026 08:30:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2AC2B600D1;
	Mon, 27 Apr 2026 08:30:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3D5E10722248;
	Mon, 27 Apr 2026 10:30:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777278601; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cN5QIwi7LRPgA9TlO7ULgjtunUd7+0WU1LFt7p8Z96g=;
	b=Qxuo9Ppt11ge9JDvikOs3MesHrjLPxhaJWQy181b+A4cO2cfUBzSxAcIRndVsX8X1g6e9n
	G4n+QYZgs3AB3nzYwomHLImn70qjM5d4psh9C2BYXt+rQcGFySXSMeCQSzDhd7h51k/ixd
	od/boo0cmSnHmEivJP4ZGcgfNyJ8Waz1XD7mS3LZzU2zzp7OhSi60lujs4Ds90yJZFNTv1
	62SwVWa6F1L1X+fLmFmfQCZ24oeIzWmCnLAMDiG19++oQ5hXAKmVseQ3ESsgm74T4SDgyq
	lCcIVKfNXIbNC7AybpoW4/Wlyl8gAIJ6CoFk17j++6Cb2v8K330qJSSUuwzJcg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 10:29:59 +0200
Message-Id: <DI3SOL8SD9WE.32QG7M9UI0EH4@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Apr 2026 08:30:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9369

The following changes since commit eb74fdfd9e5e579a65e8872d1a73b51e77b14f63=
:

  ref-manual/system-requirements.rst: instruct to install a buildtools tarb=
all for leap 15.6 (2026-04-21 15:25:47 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 6b78593bed7174245fd7f6861263c69a3c439a74:

  ref-manual/variables: IMAGE_TYPES: add new wicenv type (2026-04-27 10:27:=
34 +0200)

----------------------------------------------------------------
Antonin Godard (18):
      conf.py: add a :yocto_bug: role
      migration-guides/release-notes-6.0.rst: add known KVM issue
      migration-guides/migration-6.0.rst: document the CVE_PRODUCT behavior=
 change
      tools/build-docs-container: add missing leap 16.0 in help message
      tools/build-docs-container: add CentOS 10 support
      ref-manual/system-requirements.rst: add CentOS 10 as a supported dist=
ro
      docs-wide: drop documentation for cve-check and variables
      ref-manual/variables.rst: document the SBOM_CVE_CHECK_SHOW_WARNINGS v=
ariable
      security-manual/vulnerabilities.rst: require Upstream-Status, not rec=
ommend
      security-manual/vulnerabilities.rst: refresh the document after cve-c=
heck removal
      migration-guides/migration-6.0.rst: add migration notes on cve-check =
removal
      migration-guides/release-notes-6.0.rst: cover recent changes
      migration-guides/release-notes-6.0.rst: add license changes
      migration-guides/release-notes-6.0.rst: update CVE fixes
      migration-guides/release-notes-6.0.rst: add recipe version changes
      migration-guides/migration-6.0.rst: mention python3-roman-numerals-py=
 rename
      migration-guides/release-notes-6.0.rst: add contributors
      ref-manual/variables: IMAGE_TYPES: add new wicenv type

Dawid Bijak (1):
      overview-manual/concepts.rst: fix do_prepare_recipe_sysroot task desc=
ription

Robert P. J. Day (1):
      dev-manual: "--runonly" should be "--runall"

 documentation/conf.py                              |    4 +-
 documentation/dev-manual/building.rst              |    2 +-
 documentation/migration-guides/migration-3.0.rst   |    4 +-
 documentation/migration-guides/migration-5.0.rst   |    2 +-
 documentation/migration-guides/migration-6.0.rst   |   96 ++
 .../migration-guides/release-notes-4.0.23.rst      |    2 +-
 .../migration-guides/release-notes-4.1.1.rst       |    4 +-
 .../migration-guides/release-notes-4.1.rst         |    4 +-
 .../migration-guides/release-notes-5.0.5.rst       |    2 +-
 .../migration-guides/release-notes-5.0.rst         |    4 +-
 .../migration-guides/release-notes-5.1.3.rst       |    2 +-
 .../migration-guides/release-notes-5.1.rst         |    8 +-
 .../migration-guides/release-notes-5.2.rst         |   24 +-
 .../migration-guides/release-notes-5.3.rst         |    2 +-
 .../migration-guides/release-notes-6.0.rst         | 1471 ++++++++++++++++=
+++-
 documentation/overview-manual/concepts.rst         |   29 +-
 documentation/ref-manual/classes.rst               |   78 +-
 documentation/ref-manual/system-requirements.rst   |    1 +
 documentation/ref-manual/variables.rst             |   91 +-
 documentation/security-manual/vulnerabilities.rst  |  223 ++-
 documentation/tools/build-docs-container           |    5 +-
 21 files changed, 1728 insertions(+), 330 deletions(-)

