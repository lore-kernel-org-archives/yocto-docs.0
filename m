Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CADC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.2895.1702935238034376651
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ye2STXCN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1352E20004;
	Mon, 18 Dec 2023 21:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XaiBp9cFor1XbfNogEX+UVnS94P4Bsc3VeHLq3V2wYE=;
	b=Ye2STXCNOoXUeJkJZ+9jnYmrFuTC7cjzKy2N7r4cwFXIZ+0pGmVMoto9vxWOeCUI2XiZcw
	gfMdpN73xLnjsc8WoOZx5VZTTqozA2qT3OD08YjcBGn5QOgZaP53+OmGsqmHNbKF9bn2/v
	Kh1UulyH4t/PrkrNfCPkVGNpc2Ghcxsk1I7guDBHNewnRvwQGMHSPrm7ApkTswWJwRnm0u
	LjRUCcFUhgTw9VlAA9aFlvqJsRpCJ+8XO6lMi0R3DCre7f7WVVBT/NA1pu9GqGtI3xyvjG
	NSoPGogDVP7dUaRu6ew7eWzSIBu6FQ5jwaSwvvOCrRTuvOzzm2YlBFUUhb5mkw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 01/20] migration-guides: release 3.5 is actually 4.0
Date: Mon, 18 Dec 2023 22:33:15 +0100
Message-Id: <20231218213334.146370-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
References: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4687

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-2.2.rst | 2 +-
 documentation/migration-guides/migration-3.0.rst | 2 +-
 documentation/migration-guides/migration-3.4.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 5435835102..3932792c78 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -29,7 +29,7 @@ Staging Directories in Sysroot Has Been Simplified
 The way directories are staged in sysroot has been simplified and
 introduces the new :term:`SYSROOT_DIRS`,
 :term:`SYSROOT_DIRS_NATIVE`, and ``SYSROOT_DIRS_BLACKLIST``
-(replaced by :term:`SYSROOT_DIRS_IGNORE` in version 3.5). See the
+(replaced by :term:`SYSROOT_DIRS_IGNORE` in version 4.0). See the
 :oe_lists:`v2 patch series on the OE-Core Mailing List
 </pipermail/openembedded-core/2016-May/121365.html>`
 for additional information.
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 8e7a58e74d..67fcac41f7 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -150,7 +150,7 @@ XML feeds that ``cve-check-tool`` was using, supports CVSSv3 scoring,
 and makes other improvements.
 
 Additionally, the ``CVE_CHECK_CVE_WHITELIST`` variable has been replaced
-by ``CVE_CHECK_WHITELIST`` (replaced by :term:`CVE_CHECK_IGNORE` in version 3.5).
+by ``CVE_CHECK_WHITELIST`` (replaced by :term:`CVE_CHECK_IGNORE` in version 4.0).
 
 .. _migration-3.0-bitbake-changes:
 
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index f50fe5ee04..a9b1057206 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -255,7 +255,7 @@ Miscellaneous
 - The previously deprecated ``COMPRESS_CMD`` and
   ``CVE_CHECK_CVE_WHITELIST`` variables have been removed. Use
   :term:`CONVERSION_CMD` and ``CVE_CHECK_WHITELIST`` (replaced by
-  :term:`CVE_CHECK_IGNORE` in version 3.5) respectively
+  :term:`CVE_CHECK_IGNORE` in version 4.0) respectively
   instead.
 
 - The obsolete ``oe_machinstall`` function previously provided in the
-- 
2.34.1


