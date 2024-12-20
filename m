Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9B3E77193
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.150619.1734697026432956873
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S9w+Hrww;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0327F40008;
	Fri, 20 Dec 2024 12:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RwdEdEP0FpLw+Yly435wbLlLpNfjr+2UPPMLjcUg7R8=;
	b=S9w+Hrwwkx0vkE5CIUJj/KNwwpQLLZoxeNwAABpdLsdbqJ3iPIATVariOaWAoMqqvElOVT
	JIhz4KRsN/DqxW47K8ulcKuncLULcjgOCfl/wdM0i58GyKXSM278bjefJ9J4BaeCuN4kjG
	sRo7H0EYsfGgoBgQDSrT8NCLOc3Uoj1Sd+DVID5XgwOsX2QWQspV04roiKrOCX7IPmsaXi
	Y/DtgsrBr2iLbc/imsm69SjxD6V9fAhOpJBJptbX9DL8kCBqbNNrchLUK1tXLgAp6xuNb3
	sVXL1jZ+4F5gQLv+22auxb2JuY1Li41vsTpLqguuIO9tTX4wMpaHsRkVSKlAiQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [yocto-docs PATCH v2 00/14] Updates from recent core changes
Date: Fri, 20 Dec 2024 13:16:27 +0100
Message-Id: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABtgZWcC/3WNQQ6CMBBFr0K6dkynQgBX3MOwoO0gk2BL2ko0h
 LtbSVy6fC/5728iUmCK4lpsItDKkb3LoE6FMNPg7gRsMwslVYkKEQLNNEQC5xNBBQqeix0SRZB
 YGWtGrWvbiDxfAo38OtK3PvPEMfnwPp5W/NpftP4fXREkaGzasr1o1LLttPdpZnc2/iH6fd8/R
 vj778IAAAA=
X-Change-ID: 20241211-release-note-5-2-updates-015cdcfbb7d8
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3096;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=m/CGMsmIHnLLCVMNPJpoGtbryQO+1ZZATkYn4u6Qxk4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA+dmHIcaM/W6ED5t5i8u/6Va0RsZPMJhcsw
 hAFcSePhciJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPgAKCRDRgEFAKaOo
 NrAVEACBVrqQE3eaa7YhvYJChbOOouvP8MUvBlUmy0B6owJEuRj0bkDTdFiE/HKOqdktlPxWh5W
 cFVfFKhHVn7PYjRlRhMLd0emGTQRzqEphX6lUOtQdSN7pEr2Vou+yLbt1E3bPsSdejKpF+BsDV4
 W5VU6n5pIrW3FQyQ4kptROzrSywa/sYj29sED9VT448fpmkCPp9teU7x8GDn26J/5eVyaZ4IKeQ
 U1ZXLqsd0oHabS20sk7X/A4lw5ZsgAOCDlwuMb1d+5EHzqN705ooaFDIJ4GaBhuTVt0ha2KS1RD
 BiAjAr0zehjYAe90yxlYaW1hOQvKepp/DtsPqfxoVxJIDNovAbwloUZ1D1fTQtkZiQDtiDorwhj
 CzRbTCouV1d+T0StAQ+JavotHub+VEBbobJWcZSBGaCrmQUXuzFVKy28mgPN+F6zcQxcd0Ck3xt
 uaI5j6YLrsjALl/3LjGo8+f/eWZlp43HwwgYClzUrXQlGOBhV9WGKHfw8XWvMnGz8Zr222eZN7H
 Bo8lhoavFZyxY/7/3wHUW2bbDCEmOqsaaAmQ0B2LB5noFr86ay8eSt9znfhFQ+90lZUYFzlUnm4
 uI5oDUxAFUOMtn5zsi0iAOUWgkGaAwZgdrfmf7oyrH1pkx7cOOVZ+FX9gRN9PnSTaaEk8Lvm+eR
 YxoTrnH9Ow5GDSw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6002

This series updates the documentation for the changes applied to master
in openembedded-core, bitbake, meta-poky and the docs itself.

First part of the series are documentation updates (new/removed
features), while the last commit update the release note/migration
guide only.

Precisely, this represents changes between 8149e74258 and 87d7341465 in
poky.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Reviews from Quentin Schulz (thank you!):
  - KERNEL_CONSOLE: link to the kernel command line doc
  - migrate_localecount drop: add commit in oecore that drops this class
  - typo linux-firmware fixed, add kconfig opts for firmware
    compression
  - link to cython website instead of recipe. remove note on
    reproducibility
  - add additional % method to the bbappend paragraph. fix better ->
    best
  - CHECKLAYER_REQUIRED_TESTS: mention it's readonly + approval from TSC
  - Be more precide the PREFERRED_RPROVIDER doc.
  - Add BB_DANGLINGAPPENDS_WARNONLY note in the migration guide.
- Link to v1: https://lore.kernel.org/r/20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com

---
Antonin Godard (14):
      ref-manual/variables: document the KERNEL_CONSOLE variable
      ref-manual/classes: drop the migrate_localcount class
      ref-manual/variables: document the FIRMWARE_COMPRESSION variable
      ref-manual/variables: add missing entries to SDK_ARCHIVE_TYPE
      ref-manual/variables: document the WIC_SECTOR_SIZE variable
      ref-manual/variable: remove obsolete SETUPTOOLS_INSTALL_ARGS
      ref-manual/classes: document the cython class
      Remove debug-tweaks references
      Drop support for BB_DANGLINGAPPENDS_WARNONLY
      ref-manual/variables: document the CHECKLAYER_REQUIRED_TESTS variable
      ref-manual/classes: document the yocto-check-layer class
      ref-manual/variables: document the CARGO_INSTALL_LIBRARIES variable
      ref-manual/variables: document the PREFERRED_RPROVIDER variable
      migration-guides: update the release notes for 5.2

 documentation/dev-manual/build-quality.rst         |   2 +-
 documentation/dev-manual/customizing-images.rst    |   3 +-
 documentation/dev-manual/layers.rst                |  22 +-
 documentation/dev-manual/securing-images.rst       |  12 +-
 documentation/migration-guides/migration-5.2.rst   |  56 ++++
 .../migration-guides/release-notes-5.2.rst         | 345 ++++++++++++++++++++-
 documentation/profile-manual/intro.rst             |   4 +-
 documentation/profile-manual/usage.rst             |   2 +-
 documentation/ref-manual/classes.rst               |  37 ++-
 documentation/ref-manual/features.rst              |  19 +-
 documentation/ref-manual/variables.rst             | 113 +++++--
 documentation/sdk-manual/extensible.rst            |   5 +-
 12 files changed, 552 insertions(+), 68 deletions(-)
---
base-commit: 28850c974a3896895bc921c094071523218d6d07
change-id: 20241211-release-note-5-2-updates-015cdcfbb7d8

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


