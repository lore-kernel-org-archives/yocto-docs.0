Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD3DCCFA0C
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:33:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1840.1762187618037444601
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 08:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H6rzZWhr;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B77AB1A184F
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8BC8260628
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1B6B10B501AA
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 17:33:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187616; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding; bh=5IGNL41671Zds/8EMVc0fr1nzRu6Eo9WLDGtkukiZhk=;
	b=H6rzZWhrBjJOgM3vpftzQIRJGkirUhYHSN5R+L+rxpqYCeFbR+LpgUsIXmC5pnME56czuN
	K2w3pYzoFBGen9BTrF4DsU//ATx5c3vWhpRRhzqwLHIrarJXruJAhmCBVDdiXPW5wrEbGZ
	L3n1fPe0o6qzr4XfruTXa0OmZy8tgVzEm+oyN6L7LZAs0NYCoCP4uWJangLDcJOMlcE/J4
	cEQKuA1u9TF65+wAQXCOfLUkEkVQE+L4HPQ7OheW/G+eAsa9k6TGcqImL2BMZkGewNwhg5
	iymkO2Rwsvjwty9M1Qll0voierGq9d5HKIlq8LrWVypFYDMjC7jUpk87RDz7eg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/6] Start switching the documentation to bitbake-setup
Date: Mon, 03 Nov 2025 17:33:04 +0100
Message-Id: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEDZCGkC/12Nyw6CMBBFf4XM2ppSEIgr/sOw6JRBxkdL2kI0h
 H8X0JXLk5x77gyBPFOAczKDp4kDO7uCOiRgem2vJLhdGZRUp1SqUiBH1HcSgeI4iLbqsgpVUWD
 ewroZPHX82nuX5sthxBuZuEU2o+cQnX/vh1O6eb92Jv/aUyqk6PJcV1phaSTW6Fx8sD0a94RmW
 ZYPfDNXsL4AAAA=
X-Change-ID: 20251027-bitbake-setup-d8f38b266b4d
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2383;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vINRl+q8S8nWmGi/qV/czgajtxo12zQSCiv/XIuhpxQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpCNle8c/epDo7+D3x0G5xSpxRF/52iQKdN8mJF
 Pwefw+Bg36JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQjZXgAKCRDRgEFAKaOo
 NqLNEACSsQh0NSwVtsqBlsOa01/KzpT5T1pfSbUWGrX/Uc1WD8Pys93OfY7Cb20qTuEpB+21sU3
 lfeLteCOuqEzeQtpyEIIwv5Bq2YePHRz8u/TJxjLAEl/YGTQ2+mMhpoBN29riz/NKmAReFKLN4M
 XC2RYkCG7aPKWqw+8uxIV9wmW1e+RmoFlRY9auIYThoJk8c4JTAxWN6ah7pGlupCg/DFv9u6NN8
 wh1t6ucLvLUOW7GMJKm+/Ke7ulOKPz+3Fc2LqppRevJlZRB3d0CiwYk5D7hVVylOw8YNM4nnsPP
 M8UrrF6bKPEONv3QhO2Nr6DMSqHUakbzQdHil11nJpMq+oYbuN7szu2t632ikymcqUfczjfn4p4
 qj37aiChyU3PWAemR7xO7bsi+EN+PpKWlNww5PHh0yXnzCTKx2aKa2qjvh7LxBoB3YFo5wXVFOi
 +yJiHxCeM1DV0njG57sfxpCTHhWGefbsd/PDximSxzXa2z4Q0rkMotVbAfG6Xjo4t1r0tyGSIXb
 dART+ytWQrrYm4TAKDpKCyAuB/IJALCtg+WgOfMrNQKOhJa/X1942rTSVdkXMkQRaJYBg/j4ats
 G4Bq2Alo+Px5QLDVB2c+wf7H3keRMYYR/h+ndwGOUqEXEB/8Nn/u56FSb2420RKhGciQ8rHv8lO
 BB/MWLBNKxKAFdA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 16:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7975

This series is a start for transitioning the documentation on instructing how
to build the reference poky distro with bitbake-setup instead of the
poky repository.

What this series does:

- Refreshing the local.conf and bblayers.conf documentation.
- Adding documentation for site.conf.
- Migrating the Quick Start Guide to bitbake-setup (thank you Tim Orling
  for the first iteration of this).
- Adding a new document to instruct how to set things up manually, using
  the different repositories that used to be part of the Poky
  repository.

There are still references to the poky repository in places in the
documentation. I will send updates to this series (or another one) as I
make progress on this. First, let's have some documentation on how to
use bitbake-setup, as a starting point.

Depends on: https://lists.openembedded.org/g/bitbake-devel/message/18241.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Apply suggestions from Alex's reviews on v1 (thanks!):
  - change local.conf description
  - configure root login in local.conf
- Update references to use new bitbake documentation on bitbake-setup.
- Link to v1: https://lore.kernel.org/r/20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com

---
Antonin Godard (6):
      ref-manual/structure.rst: update the description of local.conf and bblayers.conf
      ref-manual/structure.rst: document the site.conf file
      brief-yoctoprojectqs: delete unused figures
      brief-yoctoprojectqs: switch to bitbake-setup
      dev-manual: add a document to setup poky manually
      ref-manual/terms.rst: update Poky description

 .../brief-yoctoprojectqs/figures/bypqs-title.png   | Bin 14312 -> 0 bytes
 .../figures/yocto-project-transp.png               | Bin 8626 -> 0 bytes
 documentation/brief-yoctoprojectqs/index.rst       | 399 +++++++++++----------
 documentation/dev-manual/index.rst                 |   1 +
 documentation/dev-manual/poky-manual-setup.rst     | 125 +++++++
 documentation/ref-manual/structure.rst             |  70 ++--
 documentation/ref-manual/terms.rst                 |  19 +-
 7 files changed, 395 insertions(+), 219 deletions(-)
---
base-commit: 6ee2a9a04a4c8201a96a1173cf00aa7d206170df
change-id: 20251027-bitbake-setup-d8f38b266b4d

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


