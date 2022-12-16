Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAFAC4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 10:12:43 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.9786.1671185562924501220
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 02:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fEPjnIGG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C8F2420010;
	Fri, 16 Dec 2022 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671185560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=afwoc5S9RYEsKi68G2OEfrU8CMMYYD3Xw1ntkgfCtco=;
	b=fEPjnIGG1A4Ap6UIjkp+PT2eoP13DQRQpPuQrOAFkYJ7jCKcSPNjcF1ZgH8qvMrNd1J7Bs
	QCrX0WfId7/TmhBgvYpjojP1uCO8Ur50Ow55W+/CuIo/GGfjEoE7mz6wAAG9x5yt9jm0DO
	vUxJKvUGgiI8TUuxitaFR39eCAD+ftzgGZA+1fyQdE1dqKjnnW34rV3TQrE7kq1rA2C4/h
	NuNCr37k1mmbNNdfI8sNpdZELb17L2fmjPTXc4uFSSUfbKvvEA9smwzzWIdKkdsNqzSa4b
	0feJW/+gmXHH4FElJbSk07iYj6nnmzRyx5u8Z8HLffgE90hE6bARg71KHmZM4g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: prepare 4.2 migration notes
Date: Fri, 16 Dec 2022 11:12:32 +0100
Message-Id: <20221216101232.356972-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Dec 2022 10:12:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3556

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/index.rst      |  1 +
 .../migration-guides/migration-4.2.rst        | 48 +++++++++++++++++++
 .../migration-guides/release-4.2.rst          |  9 ++++
 .../migration-guides/release-notes-4.2.rst    | 28 +++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 documentation/migration-guides/migration-4.2.rst
 create mode 100644 documentation/migration-guides/release-4.2.rst
 create mode 100644 documentation/migration-guides/release-notes-4.2.rst

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index ce0ca8c659..6f7bcbef29 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   release-4.2
    release-4.1
    release-4.0
    release-3.4
diff --git a/documentation/migration-guides/migration-4.2.rst b/documentation/migration-guides/migration-4.2.rst
new file mode 100644
index 0000000000..944ad31a4c
--- /dev/null
+++ b/documentation/migration-guides/migration-4.2.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release 4.2 (mickledore)
+========================
+
+Migration notes for 4.2 (mickledore)
+------------------------------------
+
+This section provides migration information for moving to the Yocto
+Project 4.2 Release (codename "mickledore") from the prior release.
+
+.. _migration-4.2-python-3.8:
+
+Python 3.8 is now the minimum required Python version version
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~------------
+
+BitBake and OpenEmbedded-Core are now relying on Python 3.8,
+making it a requirement to use a distribution providing at least this
+version, or to use :term:`buildtools`.
+
+.. _migration-4.2-qa-checks:
+
+QA check changes
+~~~~~~~~~~~~~~~~
+
+.. _migration-4.2-misc-changes:
+
+Miscellaneous changes
+~~~~~~~~~~~~~~~~~~~~~
+
+- The ``OEBasic`` signature handler (see :term:`BB_SIGNATURE_HANDLER`) has been
+  removed.
+
+.. _migration-4.2-removed-variables:
+
+Removed variables
+~~~~~~~~~~~~~~~~~
+
+The following variables have been removed:
+- ``SERIAL_CONSOLE``, deprecated since version 2.6, replaced by :term:``SERIAL_CONSOLES``.
+
+.. _migration-4.2-removed-recipes:
+
+Removed recipes
+~~~~~~~~~~~~~~~
+
+The following recipes have been removed in this release:
+
diff --git a/documentation/migration-guides/release-4.2.rst b/documentation/migration-guides/release-4.2.rst
new file mode 100644
index 0000000000..ae52d939c8
--- /dev/null
+++ b/documentation/migration-guides/release-4.2.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release 4.2 (mickledore)
+========================
+
+.. toctree::
+
+   migration-4.2
+   release-notes-4.2
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
new file mode 100644
index 0000000000..f3d69d98cc
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for 4.2 (mickledore)
+---------------------------------
+
+New Features / Enhancements in 4.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- Python 3.8 s the minimum Python version required on the build host.
+  For host distros that do not provide it, this is included as part of the
+  :term:`buildtools` tarball.
+
+- This release now supports a new ``addpylib`` directive to enable
+  Python libraries within layers.
+
+  This directive should be added to your layer configuration,
+  as in the below example from ``meta/conf/layer.conf``::
+
+     addpylib ${LAYERDIR}/lib oe
+
+-  Architecture-specific enhancements:
+
+-  Kernel-related enhancements:
+
+-  QEMU/runqemu enhancements:
+
+-  Image-related enhancements:
+
-- 
2.37.2


