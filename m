Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668E1C46CD7
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.3164.1702935909832891775
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B72E81E/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EFDA1C0004;
	Mon, 18 Dec 2023 21:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+Vk0zMq6+bkoD6OVhLpulkEvQ245vV87EPiO2zpAGU=;
	b=B72E81E/kzysiJEKDROHwRYUKrvjvw8U7v6l3lEc9+011Hj3BmN/Hn3GdKiX4jGtG/9Wkr
	sxJ2nGVMCfPzqmlkwElFITYM+S7Kkivsrr8+J6HjUgNwpxzWNquQ9dzwpLAW34z/wO2MoA
	a1xyhZYXL3Z71FueeGTxehjE9D6BLanckQ5uGqv1exfb42MVRGzNigFFk8ljNAUugFC0hb
	6zqn2xf9mMFBndib/he46HtrorYEI4e0n4bukBTjQamk9hjxu4NYp2DPBl9A2vqhNBP5U9
	WjarIUHcd/A6WpnvCZ1O+6zBFxSbYPPEe8l/MN8xx2ICiFSJllmKjFDgSuwGzw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 08/18] migration-guides: release 3.5 is actually 4.0
Date: Mon, 18 Dec 2023 22:44:32 +0100
Message-Id: <20231218214442.147385-9-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4715

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-2.2.rst | 2 +-
 documentation/migration-guides/migration-3.0.rst | 2 +-
 documentation/migration-guides/migration-3.4.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 3803dea832..40e3b5cb2b 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -27,7 +27,7 @@ Staging Directories in Sysroot Has Been Simplified
 The way directories are staged in sysroot has been simplified and
 introduces the new :term:`SYSROOT_DIRS`,
 :term:`SYSROOT_DIRS_NATIVE`, and ``SYSROOT_DIRS_BLACKLIST``
-(replaced by :term:`SYSROOT_DIRS_IGNORE` in version 3.5). See the
+(replaced by :term:`SYSROOT_DIRS_IGNORE` in version 4.0). See the
 :oe_lists:`v2 patch series on the OE-Core Mailing List
 </pipermail/openembedded-core/2016-May/121365.html>`
 for additional information.
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 50d6758e71..7fa6d39b84 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -148,7 +148,7 @@ XML feeds that ``cve-check-tool`` was using, supports CVSSv3 scoring,
 and makes other improvements.
 
 Additionally, the ``CVE_CHECK_CVE_WHITELIST`` variable has been replaced
-by ``CVE_CHECK_WHITELIST`` (replaced by :term:`CVE_CHECK_IGNORE` in version 3.5).
+by ``CVE_CHECK_WHITELIST`` (replaced by :term:`CVE_CHECK_IGNORE` in version 4.0).
 
 .. _migration-3.0-bitbake-changes:
 
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 5fc2ef78fe..b184dde41e 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -253,7 +253,7 @@ Miscellaneous
 - The previously deprecated ``COMPRESS_CMD`` and
   ``CVE_CHECK_CVE_WHITELIST`` variables have been removed. Use
   :term:`CONVERSION_CMD` and ``CVE_CHECK_WHITELIST`` (replaced by
-  :term:`CVE_CHECK_IGNORE` in version 3.5) respectively
+  :term:`CVE_CHECK_IGNORE` in version 4.0) respectively
   instead.
 
 - The obsolete ``oe_machinstall`` function previously provided in the
-- 
2.34.1


