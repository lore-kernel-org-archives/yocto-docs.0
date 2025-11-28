Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35200D116F6
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 15:35:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18705.1764344115321627469
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 07:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EWPi0o4M;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 132131A1DE8
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE59B60706
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A14F910B02060;
	Fri, 28 Nov 2025 16:35:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764344112; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=BnizVgUk+xmgU4AnL53nsx2RyW4Dosz3r7YAMSxwJSU=;
	b=EWPi0o4Mukta+DWTADesgn/jA1X0V5Hn/3kk95K/8EFPXaFiCEV7zHkab6k2oVyCJ8D1HR
	adPsKsM0omLGUKnScUogc9BB/37/obrRnLi/CbzuBDAbYH9cxxdEfL7MFRxg71BLiZ1oRJ
	oSqqm35Bg7/uTG23kQ5iKsWbvZBfs0DENSvDcj7sNCoRFaRli25x79+TH3MJ/2WyTxgoFF
	Kx39E4iakwEhKYNrFpIYV1FrEwDTNlbcikWKrJsW9eNZpKD1jVe1zSE6jp8cUi+lGP++8J
	ZOXdn1A5x1erU4CFSbFSE2iDNw5V1zgJbWZH8VB6QOdgeiWHWN7zF3yQLl3t1w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/9] 5.3 release updates
Date: Fri, 28 Nov 2025 16:34:57 +0100
Message-Id: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACLBKWkC/yXMQQrCMBBG4auUWTtgEqvEq0gXSfOrI5KWTCpC6
 d2NuvwW762kKAKlc7dSwUtUptxgdh2N95BvYEnNZPe2N8aeuOCJoOA8VXDPjpc5hQrlo0+H6Ly
 PyUVq+VxwlfdvfRn+1iU+MNbvj7btA84+xsJ8AAAA
X-Change-ID: 20251127-release-note-5-3-updates-69d4b399bd3b
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/rBwHEJd6FEbfbhQDswzUln/aViniTQt9vagorqVajQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKcEtcOK9stgfVg2o36Z7BBwCSxLS7Va7B7gsc
 yR62q286TmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSnBLQAKCRDRgEFAKaOo
 NnTLD/91qBzVA5Fp77qELY17x0JIrndkTXrmZ8E5Bo4rndClCK/ehvXoG6b1mpj+Zk9bgGzTiEq
 BYCyWhbU1ogzma6TSi8Jn5pgT0EgvMmmomfGxLKFYkI7yAvwKAS/7bJIoTE7cKp1I7vz/RPsyHi
 bkedtaEODqUSiHuE2yHw40jPsaqctqap389OHeLhfbCBlVqg95+0Y53mHAAAAIpYAqFaqvJ6/Jn
 RgDqst4HFLP/roZN97Ru1oUQ+rzuAglodylfDahgqqpEwrPMO056YGxFXmzLenZmAwihqu6DI7O
 0Y+rbpVHpevmRS718gQIWrbYCxLYSoPq/D1e5yS8IEOBzOdFLiTi3ebQalXvPmvRrFTlVoOulJo
 1UTGfjURm2/Zn+zavi6h3ukUP2m99mEkwqBtHmCrMx+bhxrW3LFuk1b0bMQ8bUzW9mEwql8lXp3
 Y8fyzn9uLK0e9XrVGlaGiNkA3/jWQCG0MECw4cpnrMoSGz6cuJvvutU8dIvp0+g8jVpZ/c7Z1u7
 f5SiSFQVEFHpYoW/cz5O0huWFvXHzcZ220fiRDRfv0Az0mSwBuG7WdADE9xdQDbjL62Wd22UvfW
 pNtPyhN2UBnl/DPw0AKSVZybPJvARPskCZN7YmS4rvDywbyiCDt1Q8kH/8cYNpTzK/98ecdg/1Z
 4q9FlXSFs2WPVng==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8164

This series updates the documentation with regards to changes on the
master branch of the following repositories

- openembedded-core:
  7d1d3b4958bc ("oeqa: runtime: logrotate: Fix typos and add comments")
  to
  ac7327583aef ("libdrm: upgrade 2.4.125 -> 2.4.128")

- meta-yocto:
  6257391c9594 ("yocto-bsp/6.16: specify genericarm64 SRCREV")
  to
  b3b659263566 ("local.conf.sample: comment out the root-with-empty-password setting")

- bitbake:
  b96154aeb1fc ("bitbake-setup: add the initial implementation")
  to
  720df1a53452 ("bitbake-setup: add whinlatter configs for poky and oe-nodistro")

It updates the release notes / migration guides and cleans up the
last remaining empty section of these documents.

It also adds a gen-cve-release-notes that can be used to generate the
table of fixed CVEs by parsing cve-checks JSON reports.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (9):
      dev-manual/limiting-resources.rst: update how to track pressure info
      ref-manual/tasks.rst: document the do_list_image_features task
      ref-manual/variables.rst: document WESTON_USER/WESTON_USER_HOME variables
      tools: add gen-cve-release-notes
      migration-guides/release-notes-5.3.rst: add fixed cve
      migration-guides/release-notes-5.3.rst: add recipe upgrades
      migration-guides/release-notes-5.3.rst: add license updates
      migration-guides/release-notes-5.3.rst: add contributors
      migration-guides/release-notes-5.3.rst: latest changes from master

 documentation/dev-manual/limiting-resources.rst    |   19 +-
 documentation/migration-guides/migration-5.3.rst   |   22 +-
 .../migration-guides/release-notes-5.3.rst         | 1449 +++++++++++++++++++-
 documentation/ref-manual/tasks.rst                 |    8 +
 documentation/ref-manual/variables.rst             |    8 +
 documentation/tools/gen-cve-release-notes          |   67 +
 6 files changed, 1540 insertions(+), 33 deletions(-)
---
base-commit: 0c1fbe2657d34014293b64e5e5811401544d6f56
change-id: 20251127-release-note-5-3-updates-69d4b399bd3b


