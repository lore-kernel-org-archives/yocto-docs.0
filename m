Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E43C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:48:31 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.13451.1737647305769641486
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 07:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m4ry8yOe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CE22240007;
	Thu, 23 Jan 2025 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737647303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mcrku4KBci4Ghkro6PJb+WKx9XND2YaLC9Q3O94bYIs=;
	b=m4ry8yOe5XYgK8hpiwUvAD8bUXlW3NM5LvLURz4YZXB68Mlr5EdS2TZG4eQQwC5ewkZh6y
	vmcm2pdGINLFKnBAgf1D4tOymZoPUN43Yx2RWmT+vUQzW9dbftqGyX3EZaZbNV/6mQjqkI
	puDboGRm5wFS0jEWTCn4usuOGAHx7gxDglZlUcCaiix3wYGwknKplegaP8kIZgE2ihGg1H
	gIdQ7nOUbO3zITiETNjTNDbiYLIVwXX6nIq0TKy/olJGzSA+kPLx3+l04cQtXb3miHnlo/
	y+GE8Wd0wCFCZ7BmDPirJx6tcdWlfwr9DyuCRFgbIJAfetnmK3AcwCSKAKKP+Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 23 Jan 2025 16:48:03 +0100
Subject: [yocto-docs][PATCH v2] test-manual/ptest: link to common framework
 ptest classes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-ptest-common-classes-v2-1-71d6f80573b9@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALJkkmcC/4WNTQ6CMBCFr2Jm7Zi28iOuvIdhAe0gk0BLOg3RE
 O5u5QIuv5f3vreBUGQSuJ82iLSycPAZzPkEduz8i5BdZjDKlErrGpdEktCGeQ4e7dSJkKApqek
 LZ1VT3SBPl0gDvw/ts808sqQQP8fLqn/pH+GqUaMqrrYeXFG5rnz0IaSJ/SUXod33/QtMIOrRu
 gAAAA==
X-Change-ID: 20250117-ptest-common-classes-25e9b4dc0968
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2019;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tvsFOJsgORjtJl51hLnTQF8PYETDre48JnpOYtGFWQk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnkmTHb1AI67QRFzn6uoD5dkXUroUiIJH88Qikx
 MRRLRBvDU6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5JkxwAKCRDRgEFAKaOo
 Nk9HD/45DV9elV/QoNmXYSoUVxL1gm8rKVVJp94UTeLh2m/nAVanf7L4+QccCvFV5lPI0amLVLx
 jzv2HTjkO8nWEbZOHa7Cay8kfx0WYx3AWxiBO8AQZjuQ6kaUBnoebR5t4jXzXknAaI113y3i9mF
 MhpftHd5OAxnuFcHjB8gDwNp5yzXuvyyNpuRcMQlXdUzzGnJpZWyR0/F9z5QxcF77LChFVkXOZH
 APqiNIOcxIyNRcUTb+0besC9Qu71PCv95HlbR7cgCKJ+VKeEhbx/ZwYmoLz0hyOLAuaeUXBhLTZ
 J6TM/rZTJspxRTQQGKPb/FcnF/EZo366dXWVfi164HaLJfDuleKbhCjjdt4Cz2BQxhRjfqrXKUW
 f8HTaltN+ni7xTvFmMHDVW+z6H6VTygXI9JHU5GVm7KximPDODN+14CJRixYi0FMwCxo0Ec+pfH
 TtWjoSpTblOZ++wtp0PwGP5x9UnyIz6wPFNJgGQFTc/54RS3LPbDV3nEPGIGDD1SWzVTI4gAL2Y
 dlWB0AEZZRisGKmBTuMJB83kXJbA6ai8NLmODNmMDlvIzz9axseKDYjeuxr76DFazKTsy38qMmj
 MqDaU3O1OUu3/eT05Dmud0OjiQG6NpDs0ZpY4JixlJBOZ+UZji4NY3ItSAL6TRib1lmdWybcbFq
 wUhaNhgmuCwhkcQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jan 2025 15:48:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6164

We document how to add ptest support for a recipe by inheriting the
ptest class. We may as well tell the user to inherit a ptest class for a
common framework which does most of the job for you.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Fix typo reported by Quentin Schulz
- When possible, link to ref-classes-ptest-*
- Add link to ptest-gnome
- Use :term: for oecore
- Link to v1: https://lore.kernel.org/r/20250117-ptest-common-classes-v1-1-043c7fd46da5@bootlin.com
---
 documentation/test-manual/ptest.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index dea1bad23bd98817a2020030efdad7ce4e4b36c0..2c021af5151a1d0269d99a51b7ec0a98d78b4f82 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -61,6 +61,20 @@ test. Here is what you have to do for each recipe:
 
       inherit ptest
 
+   .. note::
+
+      Classes for common frameworks already exist in :term:`OpenEmbedded-Core
+      (OE-Core)`, such as:
+
+      -  :oe_git:`go-ptest </openembedded-core/tree/meta/classes-recipe/go-ptest.bbclass>`
+      -  :ref:`ref-classes-ptest-cargo`
+      -  :ref:`ref-classes-ptest-gnome`
+      -  :oe_git:`ptest-perl </openembedded-core/tree/meta/classes-recipe/ptest-perl.bbclass>`
+      -  :oe_git:`ptest-python-pytest </openembedded-core/tree/meta/classes-recipe/ptest-python-pytest.bbclass>`
+
+      Inheriting these classes with the ``inherit`` keyword in your recipe will
+      make the next steps automatic.
+
 -  *Create run-ptest:* This script starts your test. Locate the
    script where you will refer to it using
    :term:`SRC_URI`. Here is an

---
base-commit: 8bd2bc3c00ca80f4c000a2a8d618a9f8ea3aa54b
change-id: 20250117-ptest-common-classes-25e9b4dc0968

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


