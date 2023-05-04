Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91186C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 08:47:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.44863.1683190021796703796
 for <docs@lists.yoctoproject.org>;
 Thu, 04 May 2023 01:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jn9CbmYr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B0E35FF813;
	Thu,  4 May 2023 08:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683190019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkGKHnhwNAzsAvPHoJFTwhTtju72WQFO7tH0dk/OXGc=;
	b=Jn9CbmYrxPbANPCdEblMCMN+4hwmO+PGW2cQKlwkFfmfsjauD1BBYXO44C68oJs3RlrA1U
	eUQTkZJOp+Rjj0kUEhisc2s6tqL/j2EpxHv+snn87qy3HAw0z4cHV3+G0rpBi4BlCwAAMx
	nv+BPc7WuzPAqasRRp5SE66ZoI00a6uFUFJvb2dbwlUR+nePNgMLKhH9ZAW+v8gWSOriBX
	WWbMwEWaCU1RZM8a+v24VlKW41vm2iL/fJHMvNmDE//wpwLKplMsrmh3yOvtlxS1KJ0xt3
	ogI0+MNgXk9NF945nMKz222czIRlwYRt8m4IxojbnkkkLLVmMFdU/ddldk3hDg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	richard.purdie@linuxfoundation.org
Subject: [PATCH] migration-guides: start of 4.3 migration and release notes
Date: Thu,  4 May 2023 10:46:52 +0200
Message-Id: <20230504084652.2550468-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <83da1e5d83a06e41a00b64b0eb1a305a756ce3b2.camel@linuxfoundation.org>
References: <83da1e5d83a06e41a00b64b0eb1a305a756ce3b2.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 May 2023 08:47:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3906

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From notes from Richard Purdie

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: richard.purdie@linuxfoundation.org
---
 documentation/migration-guides/index.rst      |  1 +
 .../migration-guides/migration-4.3.rst        | 73 +++++++++++++++++++
 .../migration-guides/release-4.3.rst          |  9 +++
 .../migration-guides/release-notes-4.3.rst    | 55 ++++++++++++++
 4 files changed, 138 insertions(+)
 create mode 100644 documentation/migration-guides/migration-4.3.rst
 create mode 100644 documentation/migration-guides/release-4.3.rst
 create mode 100644 documentation/migration-guides/release-notes-4.3.rst

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index 6f7bcbef29..a3bddb3f1e 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   release-4.3
    release-4.2
    release-4.1
    release-4.0
diff --git a/documentation/migration-guides/migration-4.3.rst b/documentation/migration-guides/migration-4.3.rst
new file mode 100644
index 0000000000..914012ce69
--- /dev/null
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release 4.3 (nanbield)
+========================
+
+Migration notes for 4.3 (nanbield)
+------------------------------------
+
+This section provides migration information for moving to the Yocto
+Project 4.3 Release (codename "nanbield") from the prior release.
+
+.. _migration-4.3-supported-distributions:
+
+Supported distributions
+~~~~~~~~~~~~~~~~~~~~~~~
+
+This release supports running BitBake on new GNU/Linux distributions:
+
+On the other hand, some earlier distributions are no longer supported:
+
+See :ref:`all supported distributions <system-requirements-supported-distros>`.
+
+.. _migration-4.3-go-changes:
+
+Go language changes
+~~~~~~~~~~~~~~~~~~~
+
+-  Support for the Glide package manager has been removed, as ``go mod``
+   has become the standard.
+  
+.. _migration-4.3-recipe-changes:
+
+Recipe changes
+~~~~~~~~~~~~~~
+
+-  Runtime testing of ptest now fails if no test results are returned by
+   any given ptest.
+
+.. _migration-4.3-removed-variables:
+
+Removed variables
+~~~~~~~~~~~~~~~~~
+
+The following variables have been removed:
+
+.. _migration-4.3-removed-recipes:
+
+Removed recipes
+~~~~~~~~~~~~~~~
+
+The following recipes have been removed in this release:
+
+-  ``glide``, as explained in :ref:`migration-4.3-go-changes`.
+
+.. _migration-4.3-removed-classes:
+
+Removed classes
+~~~~~~~~~~~~~~~
+
+The following classes have been removed in this release:
+
+
+.. _migration-4.3-misc-changes:
+
+Miscellaneous changes
+~~~~~~~~~~~~~~~~~~~~~
+
+-  The ``-crosssdk`` suffix and any :term:`MLPREFIX` were removed from
+   ``virtual/XXX`` provider/dependencies where a ``PREFIX`` was used as well,
+   as we don't need both and it made automated dependency rewriting
+   unnecessarily complex. In general this only affects internal toolchain
+   dependencies so isn't end user visible.
+
diff --git a/documentation/migration-guides/release-4.3.rst b/documentation/migration-guides/release-4.3.rst
new file mode 100644
index 0000000000..92516ae8f5
--- /dev/null
+++ b/documentation/migration-guides/release-4.3.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release 4.3 (nanbield)
+========================
+
+.. toctree::
+
+   migration-4.3
+   release-notes-4.3
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
new file mode 100644
index 0000000000..16320d3db2
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -0,0 +1,55 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for 4.3 (nandbield)
+----------------------------------
+
+New Features / Enhancements in 4.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Linux kernel 6.x, glibc 2.xx and ~xxx other recipe upgrades
+
+-  New variables:
+
+-  Architecture-specific enhancements:
+
+-  Kernel-related enhancements:
+
+-  New core recipes:
+
+-  QEMU/runqemu enhancements:
+
+-  Image-related enhancements:
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
+   -  The BitBake Cooker log now contains notes when the caches are
+      invalidated which is useful for memory resident bitbake debugging.
+
+-  Packaging changes:
+
+-  Miscellaneous changes:
+
+Known Issues in 4.3
+~~~~~~~~~~~~~~~~~~~
+
+Recipe License changes in 4.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The following corrections have been made to the :term:`LICENSE` values set by recipes:
+
+Security Fixes in 4.3
+~~~~~~~~~~~~~~~~~~~~~
+
+Recipe Upgrades in 4.3
+~~~~~~~~~~~~~~~~~~~~~~
+
+Contributors to 4.3
+~~~~~~~~~~~~~~~~~~~
-- 
2.34.1


