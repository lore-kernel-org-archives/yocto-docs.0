Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A249CF9EDDC
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:22:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83809.1776867775471477982
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MRaKI28G;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7C171C5C3C8
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A68B05FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D986E104609BF;
	Wed, 22 Apr 2026 16:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=LZ+XuczzO5Fk8Ned+ngVoI5q1a4w0k2r1aJBTpP807k=;
	b=MRaKI28Gt1PirKVqQ6V7ByPq+oF7RRH3E2ZXcckTI9z0AMESjxTNhFKxrMClNHM9kIB3rf
	lxTWXPmEV+W1p2alOSpFaXRKZzGal4stmmW2gso/Su0YP55NNCGskCeerFdJqcydOG7mW/
	gRjEDcb/2W2O4YxvRXJtbBODshzV5SFHo1DX3wpJQu83Paa0Ehk42J3UkUJW52y1JICK4J
	aXo1svBvFc86Gw9Z3D55aJVJJFQKCq6hvl9EOLqGG7VRR/mNfMb2xgd+QPXBrD76IhB5kd
	bXkRLsTXTfQno56i9bj47UMmTndGSpfiNw89Luk5bQUCVypi2M75UJcduJ45GQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/16] Updates for upcoming Wrynose release (2)
Date: Wed, 22 Apr 2026 16:22:33 +0200
Message-Id: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJbaAEr2JcUPiRMaaYmWJMC
 Hen6vJbvLeRQQVGl2ojxVtMllRwPlU0zH26g2UsJu98cLV3nGfRkRVP9AZOS4ZxYMdtU8cwtV2
 M6KjUL8Ukn9/5evvb1vjAkL872vcD5zT1IHsAAAA=
X-Change-ID: 20260420-third-release-notes-6-0-754b6f79bbe9
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2701;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PC1ZeunT2wT0JYcXgWvbEcmvoTx3GoLs6O4s4+jWogQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm3hT9C2ybw92zpyqGjEGsEk5/PhOLMGVrUs
 ldK/fiwppKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZtwAKCRDRgEFAKaOo
 Nv8KD/9Ahb+3nuv/4y6qCOAnC3MW1fGKRVSFHtu5YqLLoOjjPiJzbSpsJuzPy52cQgxhD8/GrWD
 QP4kWBvMrruFAb5NSxOqnk58RDp6M5ea+EpQWU9LMaq565wFbjs5UauO/UWPLAgKtH00SkrvuMZ
 9LNLND4kPAnFUC2i/JG2uHqObm+ZilxBnjAUixImlUfhbIrnP2fNbb7MAjW/45Lqd+zNaTr6rxS
 oJBBu4skrhCvk/6g25TylFVyXiIwdcDd9JyIMaS42kxSpLuj+jbJyZPQcC8Wz6HDsOgIkZrks8l
 VzF4ToWhF/W9SMIwAbewxSvtDsxzmVRRQtPnUlA4906Pv2nXHkkLj04vd5WX7+EWH3jJdFPNsHo
 RkbcXuvNK0OyZUj9yA9fJOx4vngOEenIcog7W91Ww31tP5TReN2j6T6NEImFzgkRnA8YTHFuhaV
 c9jGVoe32t+JNw2GyF/L/u4Y7EZuv05S1CTFqHCjuq/G2PULB3DezcW41oyHgeVX1QqqfWpLI2w
 nGitKh6DGJECnixGGslN2UNR67FIhwahcap+3+NobbD2l5XyXPVtlyt4/iHepwsgYFe658E3j5f
 0xXbF2qyiNSDFeGiRCPFC95/mMrekh8IKgk2iUb8OhbsREnjICzKk19cpWXNDLlPxHAiIjvUFtQ
 hHcRdGCFCMUUbBA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9312

Another set of patches to prepare the docs for the upcoming Wrynose
release.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (16):
      conf.py: add a :yocto_bug: role
      migration-guides/release-notes-6.0.rst: add known KVM issue
      migration-guides/migration-6.0.rst: document the CVE_PRODUCT behavior change
      tools/build-docs-container: add missing leap 16.0 in help message
      tools/build-docs-container: add CentOS 10 support
      ref-manual/system-requirements.rst: add CentOS 10 as a supported distro
      docs-wide: drop documentation for cve-check and variables
      security-manual/vulnerabilities.rst: require Upstream-Status, not recommend
      security-manual/vulnerabilities.rst: refresh the document after cve-check removal
      migration-guides/migration-6.0.rst: add migration notes on cve-check removal
      migration-guides/release-notes-6.0.rst: cover recent changes
      migration-guides/release-notes-6.0.rst: add license changes
      migration-guides/release-notes-6.0.rst: update CFE fixes
      migration-guides/release-notes-6.0.rst: add recipe version changes
      migration-guides/migration-6.0.rst: mention python3-roman-numerals-py rename
      migration-guides/release-notes-6.0.rst: add contributors

 documentation/conf.py                              |    4 +-
 documentation/migration-guides/migration-3.0.rst   |    4 +-
 documentation/migration-guides/migration-5.0.rst   |    2 +-
 documentation/migration-guides/migration-6.0.rst   |   91 ++
 .../migration-guides/release-notes-4.0.23.rst      |    2 +-
 .../migration-guides/release-notes-4.1.1.rst       |    4 +-
 .../migration-guides/release-notes-4.1.rst         |    4 +-
 .../migration-guides/release-notes-5.0.5.rst       |    2 +-
 .../migration-guides/release-notes-5.0.rst         |    4 +-
 .../migration-guides/release-notes-5.1.3.rst       |    2 +-
 .../migration-guides/release-notes-5.1.rst         |    8 +-
 .../migration-guides/release-notes-5.2.rst         |   24 +-
 .../migration-guides/release-notes-5.3.rst         |    2 +-
 .../migration-guides/release-notes-6.0.rst         | 1451 +++++++++++++++++++-
 documentation/ref-manual/classes.rst               |   78 +-
 documentation/ref-manual/system-requirements.rst   |    1 +
 documentation/ref-manual/variables.rst             |   77 +-
 documentation/security-manual/vulnerabilities.rst  |  222 ++-
 documentation/tools/build-docs-container           |    5 +-
 19 files changed, 1666 insertions(+), 321 deletions(-)
---
base-commit: eb74fdfd9e5e579a65e8872d1a73b51e77b14f63
change-id: 20260420-third-release-notes-6-0-754b6f79bbe9


