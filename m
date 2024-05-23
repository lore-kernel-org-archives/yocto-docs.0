Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D25AC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:56:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.17704.1716472598388292370
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 06:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OUrTHuMB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96C391BF208;
	Thu, 23 May 2024 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716472596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Y70d8GkuJBvmfU2h+wbZX5MQebzfD0G70fHoi0kS3o=;
	b=OUrTHuMBaTXIKl5uLE3PmYDRmDu7rkYup1mTya90RajQgCRWfM8ARLeUj17X6+F2ncsG6u
	PUazaRDffa3MVYEriQrK9JydcXQKM/DixnTkyX3KVwvxqaZdngebwe+HVKyJjBXjKnhuP1
	AJuIM0LqV2IGAcALB91EIoGRrbVV4WvAECIxBcyUW4W6tDxZkWntkWSOOuDQLw6SXfIGDY
	iCJh/yH32m8abNlb3bGDGvAi7Resqw1JgmvFNs44yYHsj61sHOg+zAvn6ZjomZXT16aly3
	Q7sfqEZ14aMnkMdL2UHUNEVGynkoPyRoIfgKR1G2g9XglSWf3pECOg2IN1RARg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/3] migration-guides: placeholder files for 5.1
Date: Thu, 23 May 2024 15:56:26 +0200
Message-Id: <20240523135628.3076018-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 13:56:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5243

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/index.rst      |  1 +
 .../migration-guides/migration-5.1.rst        | 83 +++++++++++++++++++
 .../migration-guides/release-5.1.rst          |  9 ++
 .../migration-guides/release-notes-5.1.rst    | 67 +++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 documentation/migration-guides/migration-5.1.rst
 create mode 100644 documentation/migration-guides/release-5.1.rst
 create mode 100644 documentation/migration-guides/release-notes-5.1.rst

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index d8edd05b89..e9d7f72809 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   release-5.1
    release-5.0
    release-4.3
    release-4.2
diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
new file mode 100644
index 0000000000..b4db04bcee
--- /dev/null
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -0,0 +1,83 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release 5.1 LTS (styhead)
+===========================
+
+Migration notes for 5.1 (styhead)
+------------------------------------
+
+This section provides migration information for moving to the Yocto
+Project 5.1 Release (codename "styhead") from the prior release.
+
+.. _migration-5.1-supported-kernel-versions:
+
+Supported kernel versions
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The :term:`OLDEST_KERNEL` setting is still "5.15" in this release, meaning that
+out the box, older kernels are not supported. See :ref:`4.3 migration notes
+<migration-4.3-supported-kernel-versions>` for details.
+
+.. _migration-5.1-supported-distributions:
+
+Supported distributions
+~~~~~~~~~~~~~~~~~~~~~~~
+
+Compared to the previous releases, running BitBake is supported on new
+GNU/Linux distributions:
+
+On the other hand, some earlier distributions are no longer supported:
+
+See :ref:`all supported distributions <system-requirements-supported-distros>`.
+
+.. _migration-5.1-go-changes:
+
+Go language changes
+~~~~~~~~~~~~~~~~~~~
+
+.. _migration-5.1-systemd-changes:
+
+systemd changes
+~~~~~~~~~~~~~~~
+
+.. _migration-5.1-recipe-changes:
+
+Recipe changes
+~~~~~~~~~~~~~~
+
+.. _migration-5.1-deprecated-variables:
+
+Deprecated variables
+~~~~~~~~~~~~~~~~~~~~
+
+.. _migration-5.1-removed-variables:
+
+Removed variables
+~~~~~~~~~~~~~~~~~
+
+The following variables have been removed:
+
+.. _migration-5.1-removed-recipes:
+
+Removed recipes
+~~~~~~~~~~~~~~~
+
+The following recipes have been removed in this release:
+
+.. _migration-5.1-removed-classes:
+
+Removed classes
+~~~~~~~~~~~~~~~
+
+No classes have been removed in this release.
+
+.. _migration-5.1-qemu-changes:
+
+QEMU changes
+~~~~~~~~~~~~
+
+.. _migration-5.1-misc-changes:
+
+Miscellaneous changes
+~~~~~~~~~~~~~~~~~~~~~
+
diff --git a/documentation/migration-guides/release-5.1.rst b/documentation/migration-guides/release-5.1.rst
new file mode 100644
index 0000000000..768edfa2b0
--- /dev/null
+++ b/documentation/migration-guides/release-5.1.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release 5.1 (styhead)
+=======================
+
+.. toctree::
+
+   migration-5.1
+   release-notes-5.1
diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
new file mode 100644
index 0000000000..32cb2de2b4
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for 5.1 (styhead)
+---------------------------------
+
+New Features / Enhancements in 5.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Linux kernel 6.X, gcc 14.X, glibc 2.X, LLVM 18.X, and over XXX other recipe upgrades
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
+-  Rust improvements:
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
+-  devtool improvements:
+
+-  recipetool improvements:
+
+-  Packaging changes:
+
+-  Security improvements:
+
+-  Toaster Web UI improvements:
+
+-  Prominent documentation updates:
+
+-  Miscellaneous changes:
+
+Known Issues in 5.1
+~~~~~~~~~~~~~~~~~~~
+
+Recipe License changes in 5.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The following corrections have been made to the :term:`LICENSE` values set by recipes:
+
+Security Fixes in 5.1
+~~~~~~~~~~~~~~~~~~~~~
+
+Recipe Upgrades in 5.1
+~~~~~~~~~~~~~~~~~~~~~~
+
+Contributors to 5.1
+~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+
+Repositories / Downloads for Yocto-5.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.34.1


