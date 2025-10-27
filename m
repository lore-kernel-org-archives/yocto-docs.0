Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F06CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.31553.1761569049916054327
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ifUkH485;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4F44C1A16B1
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25FD16062C;
	Mon, 27 Oct 2025 12:44:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3553C102F24FE;
	Mon, 27 Oct 2025 13:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=NHAGVO+NdVoIM4J3LtsOyF79XuwVY0oBZJ5FKT12pec=;
	b=ifUkH485A75p48/zS1JbNXudoslCn88ow3POaW02AgM9qTujfVWGGBWmo04Xb5TtdSSvqZ
	cnXIMxVJ9sQR3dNlJd7xelECj2oFKRUDkFn6V5DmV2NZOCHcUxHinHmxSvACx84vmACN7a
	cTSw0RhkQd7jNyjpo4443xmiPBPmDG4huAugTFcoRUQHqGeDh+6iPR7LQFWWIc9YaSHkHP
	0gdSr1ZsePXx061pBzFLxIEeem/ppM9/X5/yFKSYoXIIXbZeiA0wsnPfj+NUF4IDTMrT8T
	PPrRaMqvJ5LdSMvffGnHngGMzPSAKLKYOwiluvl3fDMHYddRyS4fI/pJOg5J7w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 00/16] Updates for 5.3
Date: Mon, 27 Oct 2025 13:43:32 +0100
Message-Id: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPRo/2gC/4XNQQ7CIBCF4as0rB0DVIy48h7GRRmmFq1goG00T
 e9uqRvd6PIlL98/skTRUWL7YmSRBpdc8PMoVwXDpvJnAmfnzSSXimupIVJLVSLwoSNQUEIiDN5
 C0/srGBTaIFm7Q8Nm4h6pdo+FP57eO/XmQthlMz8al7oQn0t/EPm3pAQX29+pQQAHyWsprBG1L
 vFgQuha59cYbizHBvnByc0fTs6cFcpWBrlWln9z0zS9AGhH9I8rAQAA
X-Change-ID: 20250929-release-note-5-3-second-hunk-bc19bcedd8cb
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BbAzUgzr2VA87p/7Qn+uCOGy4sJYcE56/qi/yUwRxlM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kEGjVgMLRsOU16Iq4P+GzCgBEIy6sYFcMtb
 mB94x9LrYyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBAAKCRDRgEFAKaOo
 NqyVEACM9G2Pd+Yhua3PfkFY09axnSi/GAbXW6Xu5P8TVprro++zMSU8T1rr6U6wKawGRuQitwg
 xmePWascp5Q8FjzppmQrh9c3FiYVmlti7xMtOFWu4y7WY7d+HNQesui6Cx9fCjlrBilYCSr9OQe
 WBcKqNFb/MzcpFCteGc+6M43dwrfwBj1cXc6raGXpePK4Klq97FfUZJu9N7G04RYXhFAeMd8DOw
 pDUysMs+pEq3W2vdF/fVRrV8WMSCM1ZqPNVj5vkdomYFdA2W8X9C+PNykEhpNSmriYNzffqhT7B
 3Ux/OfIAABgWcJnVtnL3rjHEY6ZMShEFlYbaEevVPkUW9/UorOcQBTYG6qBraijUfnPGz3BYxrN
 icrUYAyU94oRKCAE0cn+A1rRGpvHAoLiE1UGlPfLf7EQgRQIDBIAO/IU8QABuKpI1Qm6HQ9Pe9U
 DbGAG9/nUvByX+IpVNE3IH0eqpBhGmenHsNxiLYTf+TpIX0b0s84G7+NXp0YRFqBv/5ubop9qTE
 sA7xtIHLIhaS0N8JlrHoZXi7C3bczk4Tl5cGnKyOMxRmD14/5vlPZOuaih8UH41UhVHxZv1bk0e
 dgoULA2/a5H9Noe2aCRf46uzsnDUKDdpuRmpm+anR1zC/fRsNR0SWUEbktARFH01nlMLpWEp3gG
 n+qU9Qunw7VeWCQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7849

Update the documentation and release notes for 5.3, covering changes
from bd4625cd4db0 ("build-appliance-image: Update to master head
revision") to 4a1f38dd8db1 ("bitbake: knotty, uihelper: Remove
running_pids and lastpids") in Poky.

Note: this is based on the current master-next as it requires the
uboot-config changes.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Apply suggestions/rewordings/formatting from Quentin and Gyorgy (thanks!)
- Link to v2: https://lore.kernel.org/r/20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com

Changes in v2:
- Corrections based on the comments of v1. Thanks Paul and Quentin!
- Drop the FIT_LINUX_BIN patch for now as it may be reverted on OE-Core.
- Remove mention of IMAGE_EXTRA_PARTITION_FILES for now as a v2 will be
  sent.
- Link to v1: https://lore.kernel.org/r/20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com

---
Antonin Godard (16):
      ref-manual/qa-checks.rst: drop var-undefined
      ref-manual/features.rst: add new opencl feature
      ref-manual/classes.rst: document the python_pdm class
      ref-manual/classes.rst: ccache: mention that the host's ccache can be used
      ref-manual/classes,variables: document the CCACHE_DISABLE variable
      ref-manual/variables.rst: document the REQUIRED_TUNE_FEATURES variable
      ref-manual/variables.rst: document the REQUIRED_MACHINE_FEATURES variable
      ref-manual/variables.rst: document the REQUIRED_COMBINED_FEATURES variable
      ref-manual/variables.rst: document the REQUIRED_IMAGE_FEATURES variable
      ref-manual/variables.rst: document the USE_NLS variable
      ref-manual/classes.rst: gettext: extend the documentation of the class
      ref-manual/classes.rst: document the rust-target-config class
      ref-manual/features.rst: add entry for the coresight machine feature
      ref-manual/classes.rst: document the relative_symlinks class
      ref-manual: document UBOOT_MAKE_OPTS
      migration-guides/release-notes-5.3: updates

 documentation/migration-guides/migration-5.3.rst   |  47 ++-
 .../migration-guides/release-notes-5.3.rst         | 335 +++++++++++++++++++--
 documentation/ref-manual/classes.rst               |  76 ++++-
 documentation/ref-manual/features.rst              |   8 +
 documentation/ref-manual/qa-checks.rst             |  11 -
 documentation/ref-manual/variables.rst             |  68 +++++
 6 files changed, 505 insertions(+), 40 deletions(-)
---
base-commit: 05b96f7b0e092b32a88b769d747df05135fc9522
change-id: 20250929-release-note-5-3-second-hunk-bc19bcedd8cb

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


