Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6A1C982E0
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:28 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11656.1789739661777447405
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n7a/Kn0B;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0052CC58479
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:55:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2933B60649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E56A10328EA3;
	Fri, 18 Sep 2026 15:54:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739659; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EH9scvkXFrARjnJzBbX+Uv9FSfGE1rjQNPZkt2C1odo=;
	b=n7a/Kn0BSVNpR2F9CapxlTw+651pYKsoStAGFFaw9WvSllaUlX82KCBuuRpW8iaQbbKruR
	E/MlfJ1nC3cf6rvWUvc7BT/aMSuieNHSF4BuT6GPCljU1LP4aN0bAWB3Q7VUaCNn6crmBU
	CwEr1HcdzVgbNu1O/qYSVJBy0Dmd0400N4K+9/gIrNrkqxR9uqUceg/a4nmL9ahqEZ3eC8
	ExXDalBG1OTSUjiOhp6SC0yqu/CoHGvo32+btiace7knf8SsdlN6Z8FZ9gaXvc6H0cx4L3
	PvaZZVAsrh1DfFIhtKP4TT6bgkZ/R5AVbqH+4q7czqKVCfbQEBAqc32Z6Q4UzA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:47 +0200
Subject: [PATCH 17/20] migration-guides/release-notes-6.1.rst: add license
 updates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-17-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2133;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JeAA1NPkJk0U2Kr9lxDWInm1Y4lf3MEBN48OvtEY+JU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJlhrQIxt8z/zk5FPahczZhBaAQ+ROocAdYC
 5e26a9uEqKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZQAKCRDRgEFAKaOo
 NvRDD/9LGjUYZRw3G99OU0d8UC7rzVgqcgah65X2KWQw5Bn5x1/gk1A+Z41ZdGHNGg2/TsL0m25
 C9VAQOEmzLW3zsCTIERI+MpTpNYEJhNvttJOP4dt+PdBVGWqmY+tHPAoTqXlWaTpF0ZB4n4YN7e
 ELys0TgLfkhoQHoAIeIJG7Yd8vynF5XEgox+yXcai4DdHEhc8qZeNEL30uKrorwjt2xHRjqz+Zh
 DYBh1xFTL/w5JURjFBaktgE77LM3WDahGLJOhD9rKcxDDxPRUGaZJTjO353yDduz7UNfx3wSN7T
 5RLxv282GBKS425zU3iTurMTkhGxuWZk5hL8LhZMo/KGLfcR68908HkvLSDtl7Y9aNh9AEM2TZ8
 Oq7ytNfTLwM8NUHkUEsFa3gRtU/A+bwgeVn6Nci76NWg6kcvnYQJMBnkda3BdpbDSOC47u2G8UG
 jTz1xzdOBnEtuN/HWPy+emc8YsbYEkKSceU6iD7upnFW3slyXbYORkjDYj5lX8UTMHGFfKwAd34
 APNnHU3gyidysKIk7s6vXG6g08XZc/gYIJv00rrDI1cPXZjlhaEqLwFDceAZ3Ux3e0Ikzm93rnS
 0G6Osgg7S62theAfKqGY3ckLE4eNwDE6y3xYDKGHFhpkq1CQiyX5DNrGXpu6fBSeFtf73JzOgkd
 UgXtLTC+80gRoxg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10549

Update license changes section by going through commits with
the License-Update: mentioned in the body on OE-Core since yocto-6.0.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-6.1.rst         | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.1.rst b/documentation/migration-guides/release-notes-6.1.rst
index 3632a2ab0..9b8f68f06 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -742,6 +742,34 @@ Recipe License changes in |yocto-ver|
    Going through commits on OE-Core filtered by License-Update:
    git log -U0 --patch --grep "License-Update:" yocto-6.0..origin/master
 
+The following changes have been made to the :term:`LICENSE` values set by recipes:
+
+.. list-table::
+   :widths: 20 40 40
+   :header-rows: 1
+
+   * - Recipe(s)
+     - Previous value
+     - New value
+   * - ``erofs-utils``
+     - ``GPL-2.0-or-later``
+     - ``MIT AND (GPL-2.0-or-later OR MIT)``
+   * - ``git``
+     - ``GPL-2.0-only AND GPL-2.0-or-later AND BSD-3-Clause AND MIT AND BSL-1.0 AND LGPL-2.1-or-later``
+     - ``GPL-2.0-only AND GPL-2.0-or-later AND BSD-3-Clause AND MIT AND LGPL-2.1-or-later``
+   * - ``fmt``
+     - ``MIT``
+     - ``MIT-with-fmt-exception``
+   * - ``vulkan-headers``
+     - ``Apache-2.0 AND MIT``
+     - ``Apache-2.0 AND MIT AND (Apache-2.0 OR MIT)``
+   * - ``vulkan-validation-layers``
+     - ``Apache-2.0 AND BSL-1.0 AND MIT``
+     - ``Apache-2.0 AND BSL-1.0 AND MIT AND BSD-2-Clause AND (Apache-2.0 WITH LLVM-exception)``
+   * - ``lttng-tools``
+     - ``GPL-2.0-only AND LGPL-2.1-only``
+     - ``BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND CC0-1.0 AND CC-BY-SA-4.0 AND FSFAP AND GPL-2.0-only AND GPL-2.0-or-later AND GPL-2.0-or-later WITH Autoconf-exception-2.0 AND GPL-2.0-or-later WITH Autoconf-exception-macro AND LGPL-2.1-only AND LGPL-2.1-or-later AND MIT``
+
 Security Fixes in |yocto-ver|
 -----------------------------
 

-- 
2.55.0


