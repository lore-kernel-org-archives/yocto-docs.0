Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B836CCD1A1
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3662.1760604885142259983
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k7aLrkTH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 78D3D1A140D
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4ED7F6062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1256102F22F1;
	Thu, 16 Oct 2025 10:54:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604882; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=uBloXeudd48LwX8+/A7Qag33wCD++LmS3rzqaZ198V8=;
	b=k7aLrkTHIuMuMJ/hXR9Ayh2R+r9IO2CGKv+7Qq0WQO0NIpEbzMU/uElf3oMJbWwADcEjPU
	jkH1oDq+BUDCsWrx7ivzTYUJZeTrlKu/PT7bL/luco3Lb9jHXdQqaHCJG8J6gUfOy4lHoe
	+PACdT0JaLSlb42vOWGMNbMBLUFp4jX0BAjnpIH4JT13kok6EOSczau/m+F1+SDwI8qVLO
	nv/tkwrKFgN8AZqZk4txWAiQ05dlxBg4USPYwGEztss82M1Rs/J8leZp637De5LWqMmqAa
	He6PvM2Xm09sZBp5i90Qx2ajgjlyjkJOBwOcmvpih54sxv0LZsRzFmhJLX9dMw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/17] Updates for 5.3
Date: Thu, 16 Oct 2025 10:53:50 +0200
Message-Id: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ6y8GgC/yXMQQrCMBAF0KuUWTvQRgrGq4iLZvJrRyWRTCtC6
 d2Ndvk2byVDURidm5UK3mqaU0V3aEimId3AGqvJta5vvfNc8MRg4JRncM9HNkhOkaclPThI54M
 gxpMEqsWrYNTPv79cd9sS7pD5d9K2fQG7VGFJgAAAAA==
X-Change-ID: 20250929-release-note-5-3-second-hunk-bc19bcedd8cb
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2267;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yFEpxdRm/jtsLETwU3Wqj9Fg6jEXu8xe4hdUeODi6OE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLO3yo8q5piKd+6vxODsZdGEpvVBUD9XBEgL
 RG+ny1lJMiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCyzgAKCRDRgEFAKaOo
 Nj8aD/94j884CSNDk5Z2XMKYlDMPzELYBLybIG4gJKMORkm+wgOW5iWrjkkQ5ceA80G7/Ut4TX8
 8RHrsW1IZ/U+sREP0b5GMIkByWx41FZ6+jnp5Kkp9flJWulxVkMlPQC5uqJXfrwmlxDTpjfdyhY
 au78HPr4m2+E0x1Xlo8Ps4ZUS2czCAGvg9OG9w1vrBznEoZPBXIxK3V8vE1gAbFLyPerWLJYQWR
 if29371qmOVJQ6ZX/H1wJTHQ3MaUjU/i94vNUHhMxevkuE/l4y3ltnJDU6bDGis3hWaFjo/lBs0
 mA9Gd6n0gmWs3fEIiA5HxGmaMNmO91L55QIhDtX34C3xPEwJdryNUAcwBxg1+XhuNN5Aj7O6ywn
 gdBcFBPONqlFklFuThZEOnXbgkOcQaQM7ozDXzYxE2RIR8Gvq7RbOUu+aq8YlZRRd08N/RTzPgm
 +8IGitbHmbmewvby/mHuwhwxUVnFwIrgGWzWd8Bj0H6pIyatvZWMTISPdhWuwS6LCKNcGjd26ld
 IRTD3EE8jVwJBpH3UUx639FMfBYhkIh7z43Nll3ZmbW7rVi47bvOXnmzTZ8zPHx8mpb0urccJX7
 gyGy8PJG0m5rCCbC43Z1SWA5qyjyeW03p08PQ6jo3FijRFNdt2kZoMcCg2VOL8kWhydYIhZ1Oq5
 I49AWVS5oEE9F3A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7710

Update the documentation and release notes for 5.3, covering changes
from bd4625cd4db0 ("build-appliance-image: Update to master head
revision") to 4a1f38dd8db1 ("bitbake: knotty, uihelper: Remove
running_pids and lastpids") in Poky.

Note: this is based on the current master-next as it requires the
uboot-config changes and IMAGE_EXTRA_PARTITION_FILES documented.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (17):
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
      ref-manual/variables.rst: document the FIT_LINUX_BIN variable
      ref-manual/classes.rst: document the relative_symlinks class
      ref-manual: document UBOOT_MAKE_OPTS
      migration-guides/release-notes-5.3: updates

 documentation/migration-guides/migration-5.3.rst   |  46 ++-
 .../migration-guides/release-notes-5.3.rst         | 341 +++++++++++++++++++--
 documentation/ref-manual/classes.rst               |  73 ++++-
 documentation/ref-manual/features.rst              |   8 +
 documentation/ref-manual/qa-checks.rst             |  11 -
 documentation/ref-manual/variables.rst             |  69 +++++
 6 files changed, 510 insertions(+), 38 deletions(-)
---
base-commit: d4cfec89f811113601e32132a6de35cd00c19f5c
change-id: 20250929-release-note-5-3-second-hunk-bc19bcedd8cb

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


