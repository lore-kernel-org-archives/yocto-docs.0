Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC30C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:06:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.1285.1710349581807115328
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 10:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nF3m78wj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5ADF3E0008;
	Wed, 13 Mar 2024 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710349580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j3ejMQpWxbzaMVYAaVATjrDZdeUXG3afLdobpc9fL9o=;
	b=nF3m78wjQRTnFwWp92rW3zcOzJK0Zion5jWh9iyhIxEk9Q6GpBnh8oJKbhhXXzGqFD1t6c
	lQ85g0cwKrUmzpkNLhJKy6QFt4BfsyZ8zi448nl4ZBaDugm1QEGZR1Ali2co86Bdeihuam
	FaaqW2mq4YwPO0dtwGEY5WeUeIilTDz89GNTtFE4TpxUJYWTlaTKCUjb/tHn9RwpoeX583
	CUnSofUFRMzQ1MZ44kJlXS/EfcCAPiYRtg/XuTMYNvsXbvkEkxDV7N80ehyjTvzRgVI4RD
	oq3+IUEG7KfwbM2au632zkKkd+Ksy5eQlisNwz4gOTsJrxSTdRDBvbmTIxN2og==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: draft notes for upcoming release 5.0
Date: Wed, 13 Mar 2024 18:06:09 +0100
Message-Id: <20240313170609.64241-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Mar 2024 17:06:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4954

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/index.rst      |   1 +
 .../migration-guides/migration-5.0.rst        | 105 ++++++++++++++++++
 .../migration-guides/release-5.0.rst          |   9 ++
 .../migration-guides/release-notes-5.0.rst    |  66 +++++++++++
 4 files changed, 181 insertions(+)
 create mode 100644 documentation/migration-guides/migration-5.0.rst
 create mode 100644 documentation/migration-guides/release-5.0.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.rst

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index a3bddb3f1e..d8edd05b89 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   release-5.0
    release-4.3
    release-4.2
    release-4.1
diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
new file mode 100644
index 0000000000..32581d750b
--- /dev/null
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -0,0 +1,105 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release 5.0 LTS (scarthgap)
+===========================
+
+Migration notes for 5.0 (scarthgap)
+------------------------------------
+
+This section provides migration information for moving to the Yocto
+Project 5.0 Release (codename "scarthgap") from the prior release.
+
+To migrate from an earlier LTS release, you **also** need to check all
+the previous migration notes from your release to this new one:
+
+-  :doc:`/migration-guides/migration-4.3`
+-  :doc:`/migration-guides/migration-4.2`
+-  :doc:`/migration-guides/migration-4.1`
+-  :doc:`/migration-guides/migration-4.0`
+-  :doc:`/migration-guides/migration-3.4`
+-  :doc:`/migration-guides/migration-3.3`
+-  :doc:`/migration-guides/migration-3.2`
+
+.. _migration-5.0-supported-kernel-versions:
+
+Supported kernel versions
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The :term:`OLDEST_KERNEL` setting is still "5.15" in this release, meaning that
+out the box, older kernels are not supported. See :ref:`4.3 migration notes
+<migration-4.3-supported-kernel-versions>` for details.
+
+.. _migration-5.0-supported-distributions:
+
+Supported distributions
+~~~~~~~~~~~~~~~~~~~~~~~
+
+Compared to the previous releases, running BitBake is supported on new
+GNU/Linux distributions:
+
+-  Rocky 9
+
+On the other hand, some earlier distributions are no longer supported:
+
+-  Fedora 37
+-  Ubuntu 22.10
+-  OpenSUSE Leap 15.3
+
+See :ref:`all supported distributions <system-requirements-supported-distros>`.
+
+.. _migration-5.0-go-changes:
+
+Go language changes
+~~~~~~~~~~~~~~~~~~~
+
+.. _migration-5.0-systemd-changes:
+
+systemd changes
+~~~~~~~~~~~~~~~
+
+.. _migration-5.0-recipe-changes:
+
+Recipe changes
+~~~~~~~~~~~~~~
+
+-  Runtime testing of ptest now fails if no test results are returned by
+   any given ptest.
+
+.. _migration-5.0-deprecated-variables:
+
+Deprecated variables
+~~~~~~~~~~~~~~~~~~~~
+
+The following variables have been deprecated:
+
+.. _migration-5.0-removed-variables:
+
+Removed variables
+~~~~~~~~~~~~~~~~~
+
+The following variables have been removed:
+
+.. _migration-5.0-removed-recipes:
+
+Removed recipes
+~~~~~~~~~~~~~~~
+
+The following recipes have been removed in this release:
+
+.. _migration-5.0-removed-classes:
+
+Removed classes
+~~~~~~~~~~~~~~~
+
+The following classes have been removed in this release:
+
+.. _migration-5.0-qemu-changes:
+
+QEMU changes
+~~~~~~~~~~~~
+
+.. _migration-5.0-misc-changes:
+
+Miscellaneous changes
+~~~~~~~~~~~~~~~~~~~~~
+
diff --git a/documentation/migration-guides/release-5.0.rst b/documentation/migration-guides/release-5.0.rst
new file mode 100644
index 0000000000..bd19b707f6
--- /dev/null
+++ b/documentation/migration-guides/release-5.0.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release 5.0 (scarthgap)
+=======================
+
+.. toctree::
+
+   migration-5.0
+   release-notes-5.0
diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
new file mode 100644
index 0000000000..e5cdd87d1d
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -0,0 +1,66 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for 5.0 (scarthgap)
+---------------------------------
+
+New Features / Enhancements in 5.0
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Linux kernel 6.6, gcc 13.2, glibc 2.39, LLVM 18.1, and over XXX other recipe upgrades
+
+-  New variables:
+
+-  Architecture-specific enhancements:
+
+-  Kernel-related enhancements:
+
+-  New core recipes:
+
+-  QEMU / ``runqemu`` enhancements:
+
+   -  QEMU has been upgraded to version 8.2.1
+
+-  Rust improvements:
+
+   -  Rust has been upgraded to version 1.75
+
+-  wic Image Creator enhancements:
+
+-  SDK-related improvements:
+
+-  Testing:
+
+-  Utility script changes:
+
+-  BitBake improvements:
+
+-  Packaging changes:
+
+-  Security improvements:
+
+-  Prominent documentation updates:
+
+-  Miscellaneous changes:
+
+Known Issues in 5.0
+~~~~~~~~~~~~~~~~~~~
+
+-  N/A
+
+Recipe License changes in 5.0
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Security Fixes in 5.0
+~~~~~~~~~~~~~~~~~~~~~
+
+Recipe Upgrades in 5.0
+~~~~~~~~~~~~~~~~~~~~~~
+
+Contributors to 5.0
+~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+
+Repositories / Downloads for Yocto-5.0
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
-- 
2.34.1


