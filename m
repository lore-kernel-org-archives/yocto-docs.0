Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB96F36B98
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157875.1775832226603384976
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EVYEIRQp;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6B48BC5C1A4
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3485F603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31F7810450025;
	Fri, 10 Apr 2026 16:43:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2TwjbjjcaW3jFxHowG6tUUfnkJXSiEaLVF6y/SUKC6U=;
	b=EVYEIRQpe4D84RZ8INjz+uIfMIW0ki35xN/o/OhURPO5ZWJ2K4ebhhlW5nIMpjtsxmb8AU
	7nEZRpLhaM7WFdmcVOFILsw/lMZ1ariyw0iT/ZM66hjva5q8cqU1U8WjXgf5+OFZrCpmz6
	j9PJzBxdJu+j/E2PV+vWo4XhBYKpRkaQVSOvaQ9rWBvIrCnI63WQqTN7AjuVLbeg7TMixQ
	AmPOl7gIS7L6ni3/300JQLc5ZVRyb3YEv5ik/55NMSk8bNwCW+zyjN4TSJG12TH/YCdooK
	Q8frG9x17xxISg7ct7tBhaoMVJAq6MsrFpCqtdAvzYdN1IJAdhv7EU1mG5LICg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/18] Updates for upcoming Wrynose release
Date: Fri, 10 Apr 2026 16:43:24 +0200
Message-Id: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTswjhLFq4iLNP2rI5JIphWh9
 O5GXX6L9xZyVIPTqVuo4mVuJTdsNx2lW8xXsA3NpKJBdnpgRyp54IoHooNzmeAcWBh9RNjrUWR
 UavmzYrT3b32+/O1zf0eavj9a1w9/cWjXfAAAAA==
X-Change-ID: 20260327-second-release-notes-6-0-ebae642800f2
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2685;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3weAshG5A0YquN5yrICeEQBevMAfWFNrAv8wHIVDF1c=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyWG+SL1LtR4LlYjELtkJmXJkQa30emAUh1o
 1BHQP4nYgSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMlgAKCRDRgEFAKaOo
 NgEzD/41l08qdc5ey2E4tO5IOdsIt14+QMVsLm4XVQt0hY8Dh9iEBOVQrQbpK0srB7E3xArHSi8
 lssn8IkiCEkPUavPBx3y2ZbISBSyM4QbFjLS52XM6me7nawcFG/5XPoit0r107G/wOVDDwBp7PV
 4Lpi0pF2uCg5ky1SerfL7k0pT2eJsaah2zz7z4M4HX0Vehn9lQTZLTe8gVSi2Ze+CEX+vFRSQrz
 1FqNpKs44CJJtJrUtd6ZkwRrYWQcn1j0cG0oNkRfxZTas09dFkY7eNH60RyJClmK0d+0p63AHYf
 ZcGiLxnnFl7R8Dz20+Xe3DMxHrjEmX3mAth1lOwAYdSCVw3xivkLT6MoiDBCxupiRtTw3Mrng54
 /HcC/bmoaj8IVxBMiwfbg+PBuWod03HJDoIy4fkyx7SqQoVevVmpgdT3YTADJPyzcNcNL6Oq1nO
 EyWLeReWMuVmVVw/GM+ykBhXXCQfK4ozAOKSLx7PbLkW0pwX1QwNJVZE4AwDg2yWmT5DZ1Z5Bnb
 XSgJNyleu3AhATvJEaZtQvb08kCR8diD/8ebT9VSOQ5NqkHh7U2BEvkCX0MWCXf5b65NygyFvD5
 Lp8cXg/Iyrl+VO77sMW4HYoJ+MzcYo9XYviqde3kb9XWe09q1QW8xVOCAZ2b5SlE3T3bY3M4axX
 gc2Uva5DCq4gCrw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9233

Updates to the docs with Wrynose coming soon. The last two patches
update the release notes themselves. The patches before that add or
remove pieces of documentation to be in sync with master.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (18):
      conf.py: define new *_path roles
      ref-manual/classes.rst: document the kernel-yocto-rust class
      ref-manual/classes.rst: document the module-rust class
      ref-manual/classes.rst: document the KCONFIG_CONFIG_ROOTDIR variable
      ref-manual/variables.rst: document the UKI_DEVICETREE variable
      docs-wide: refresh SBOM documentation after SPDX2.2 removal
      dev-manual/sbom.rst: add bullet point on recipe SBOM
      ref-manual/variables.rst: document the SPDX_PACKAGE_URLS variable
      ref-manual/variables.rst: document the SPDX_GIT_PURL_MAPPINGS variable
      ref-manual/variables.rst: document the SPDX_INCLUDE_VEX variable
      migration-guides/migration-6.0.rst: add note on WIC_SECTOR_SIZE
      ref-manual: document the sbom-cve-check class, fragment, and variables
      docs-wide: adapt to the new {DISTRO,MACHINE}_FEATURES mechanism
      ref-manual/features.rst: drop pcmcia from DISTRO_FEATURES
      ref-manual/features.rst: drop usbhost/usbgadget from DISTRO_FEATURES
      docs-wide: replace meta-poky/conf/templates/default by oecore's templates
      migration-guides: update 6.0 (Wrynose) release notes
      migration-guides/migration-6.0.rst: tidy up the file

 documentation/conf.py                              |   3 +
 .../custom-template-configuration-directory.rst    |   2 +-
 documentation/dev-manual/gobject-introspection.rst |  12 +-
 documentation/dev-manual/licenses.rst              |   4 +-
 documentation/dev-manual/poky-manual-setup.rst     |   2 +-
 documentation/dev-manual/sbom.rst                  |  43 ++--
 documentation/migration-guides/migration-6.0.rst   | 207 +++++++++++++++--
 .../migration-guides/release-notes-6.0.rst         | 256 +++++++++++++++++++--
 documentation/overview-manual/concepts.rst         |   5 +-
 documentation/ref-manual/classes.rst               |  94 +++++++-
 documentation/ref-manual/faq.rst                   |   2 +-
 documentation/ref-manual/features.rst              | 109 +++++----
 documentation/ref-manual/fragments.rst             |  20 ++
 documentation/ref-manual/structure.rst             |  18 +-
 documentation/ref-manual/variables.rst             | 232 ++++++++++---------
 15 files changed, 752 insertions(+), 257 deletions(-)
---
base-commit: 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f90
change-id: 20260327-second-release-notes-6-0-ebae642800f2


