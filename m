Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB33CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.5035.1761294030893851616
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mrYcVrGl;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BB49BC0C41B;
	Fri, 24 Oct 2025 08:20:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9408B60703;
	Fri, 24 Oct 2025 08:20:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30565102F247A;
	Fri, 24 Oct 2025 10:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294028; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=84cHZs2TRRWXxak5FSG6qAGKglGY9Lr0dihD6j1KGRY=;
	b=mrYcVrGlovCn5MeZyBDw8ceroLv/4MS8+rxHwc2TR6ZLQ0qR9nFx4XhqPVsQdw8whovbjk
	ej4ZhzgxEKYCPTxWEDLHpfuA/RnQUu6CO3iwIO0CM9Hgm8GmMcnjPVazrUgp102YdD8La9
	LFtV2Iaa6WRw9fpU7cC7adFwq2H6rYcP6RjmMFpjrP/8oQgJxnZHu0+IM12NYK553hW+57
	N2zPvB0JQqaum0lv808ChL8Af7qnOxQ1DaUfUfnpVxHZnJa+P22b2Tc6BRtmHYK96iGh8v
	cwXhUgHgdbs3tGZJIG0AT5tYKEImdBQFd6wpj8gznjJ+8qS/nwvLLCIstXF/XA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 00/16] Updates for 5.3
Date: Fri, 24 Oct 2025 10:19:49 +0200
Message-Id: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKY2+2gC/32NQQ6CMBAAv0J6dk1bgrGe/IfhQLeLVLFL2kI0h
 L8LePc4yWRmFomipyQuxSwiTT55DivoQyGwa8KdwLuVhZa6kkYbiNRTkwgCZ4IKSkiEHBx0Y3i
 CRWUsknNntGJNDJFa/97zt/rHabQPwrw1N6PzKXP87P9Jbd6+UlKd/q8mBRK0bLVyVrWmxKtlz
 r0PR+SXqJdl+QILEc3U3AAAAA==
X-Change-ID: 20250929-release-note-5-3-second-hunk-bc19bcedd8cb
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2511;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BIjRKgtpkNEfz/t+PO1QsBsxLhc1I+aVBV8fha3ipO0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbHiRvXb169ZIxvNvi02kzJQW6Qb7jf/cXSG
 Dd9zCuXvoKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2xwAKCRDRgEFAKaOo
 NoE3D/oDIpJhtyJ8GtxhFGw6IhG9ICn0wRhzd5oU4eJSlfUlvjcPKAh5YOwaemieEFgbxmb6Xjt
 s9vKo4fzSq5UIqQLLvJFJ2TieNyWVXdxKJUwzTIXcNpLbDBVqofBbe+UpuizT8v0yo4gZDNKUnX
 i2kK+pjH6+zHS9rYfNUbxdDDL+ElGLhV04IzpCJYtX/Ss3Vi9r6tMBqEMNLM2x8dc9qyS//ldh/
 slxZESNdxJfn26MhwQONnPle8+kKWfooR5PrF/9NlgvtaJsYFpXM8PbhXjwuwdu+9b+4GJhTOS+
 EpMtat/s38Go13AKNrC4QpVmnFoOJ18IG9OOUAArlqU8yXJY/7cYVlZiyctzZOW/6IfP4k6QbD3
 IDEocpxUE5NrvbjYRQ385unJI2iyfDggxLhJsei/J2IB+gna5dOLz17aLro1wyiQSQ958rsZFhf
 z1CNfxHH/2RULE6tvLx8jWhFJU4GaAzJtO0h+Sa5N2LnCF7Q9oMnMtKMbPYJj3tWgF8OwVwaRT/
 3RxONNC0csLW9O4GZZJrFA49Qr5WWJK1D/HLAXcIGDww/5VrttebXimux7YHp+p+yI+BCZsIO+w
 YDMADzTg8z9O0GUuD3Pfg1wliV64rqVPVyNW5AH7KDuArQCVTdY+S/DYuKd+B84Ga5Hc907NcwQ
 DjOADZPqRLpKe0A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7789

Update the documentation and release notes for 5.3, covering changes
from bd4625cd4db0 ("build-appliance-image: Update to master head
revision") to 4a1f38dd8db1 ("bitbake: knotty, uihelper: Remove
running_pids and lastpids") in Poky.

Note: this is based on the current master-next as it requires the
uboot-config changes.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
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
 .../migration-guides/release-notes-5.3.rst         | 331 +++++++++++++++++++--
 documentation/ref-manual/classes.rst               |  80 ++++-
 documentation/ref-manual/features.rst              |   8 +
 documentation/ref-manual/qa-checks.rst             |  11 -
 documentation/ref-manual/variables.rst             |  66 ++++
 6 files changed, 500 insertions(+), 43 deletions(-)
---
base-commit: 3bbd85798f4c9a8b7f930e9f156cf6e970593da0
change-id: 20250929-release-note-5-3-second-hunk-bc19bcedd8cb

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


