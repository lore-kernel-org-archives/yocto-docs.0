Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A663CC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 14:46:23 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.73947.1701355583066467892
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Nov 2023 06:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aLPHu1to;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04AFA1C000E;
	Thu, 30 Nov 2023 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701355581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XaiBp9cFor1XbfNogEX+UVnS94P4Bsc3VeHLq3V2wYE=;
	b=aLPHu1toRo8XREaa6b1oYxFy+dXCEWF4/U4yNdqB8gc70qBVeO9ppgz0R2gyHIzmFHp6VC
	EEKJX6GD6eARbLleAv2CfyOnySe3cZ7CUZsVyZzgEVb2sDKUUgR3FJYPoYzLr0rB+uHd1G
	CN9v9vdqP44LqK1xnb/W4dp5bOeMqlggG8FZDby7VF5uTvgX36v7qqEA9XR5UttSgVMHvH
	+h6KM31IFK3ZLPmx4aJuqvOLVJVtmSlowh1oyH/IPuF6eV6e7dwOMki9I/BWD12hfsnyrj
	jWSbrdchMNwJdcNw4R5bxcvsqpF9wTI2o96suXHQlC6GRBHEFnd1sxlk8SmXQw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: release 3.5 is actually 4.0
Date: Thu, 30 Nov 2023 15:46:18 +0100
Message-Id: <20231130144618.347448-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Nov 2023 14:46:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4653

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


