Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAD2C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 20:59:10 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.2162.1648587549188255719
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 13:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UOVMO3If;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AA1E740002;
	Tue, 29 Mar 2022 20:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648587546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MFLC/UZCwnSWCaGbwkOxAcr7g2Q7MDmAtPqYgXsEl/A=;
	b=UOVMO3IfaZJGiEpctgze+mqHOs45hXnutTkW9H2hmkt4O7Ux8kgRscmgr5CwZKfUIqJCk6
	6HPppg3OOAaEVB80KMXpvAMqGerLmqmbizf0hnF/QFZZmO2tmjYQcC5Le7Dwglx49LNQ6D
	pQ3gWXhK/vYvseQR+u5Ui8/gdXFYUyFQZZQrtIH/FCMyXk9jWjJ1I9VKLQfj0KT6BG6KUC
	dffvdZzGzvgj1PHDOEvDwicLwQ/Xl8bemh61ZHieeeNJ3PLCTmp/TVgrfhrh0jAyaaFOa6
	Wzq8vEnUiZpwqZQU1FRaiPFV4Xn2pdCXKmY+wZjxMZIP14FddKq0ad+9e0/+2w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: preliminary description for 3.5
Date: Tue, 29 Mar 2022 22:59:04 +0200
Message-Id: <20220329205904.393673-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Mar 2022 20:59:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2735

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/migration-3.5.rst        | 54 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
index 8ce2306e42..269e0fab2f 100644
--- a/documentation/migration-guides/migration-3.5.rst
+++ b/documentation/migration-guides/migration-3.5.rst
@@ -64,10 +64,17 @@ Recipe changes
 - :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
   which use :term:`PKG` renaming such as :ref:`ref-classes-debian`.
 
+- :term:`LICENSE` definitions now have to use `SPDX identifiers <https://spdx.org/licenses/>`__.
+  A :oe_git:`convert-spdx-licenses.py </openembedded-core/tree/scripts/contrib/convert-spdx-licenses.py>`
+  script can be used to update your recipes.
+
+- :term:`SRC_URI`: a new :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:crate fetcher (\`\`crate://\`\`)`
+  is available for Rust packages.
+
 Class changes
 -------------
 
-- The `distutils*.bbclasses` have been moved to `meta-python`. The classes and
+- The ``distutils*.bbclasses`` have been moved to ``meta-python``. The classes and
   `DISTUTILS*` variables have been removed from the documentation.
 
 - ``blacklist.bbclass`` is removed and the functionality moved to the
@@ -76,3 +83,48 @@ Class changes
   function. The usage will remain the same::
 
      SKIP_RECIPE[my-recipe] = "Reason for skipping recipe"
+
+- The Python package build process based on `wheels <https://pythonwheels.com/>`__.
+  Here are the new Python packaging classes that should be used:
+  :ref:`python-flit_core <ref-classes-python_flit_core>`,
+  :ref:`setuptools_python-build_meta <ref-classes-python_setuptools_build_meta>`
+  and :ref:`python_poetry_core <ref-classes-python_poetry_core>`.
+
+- ``image-prelink.bbclass`` class is removed.
+
+- New :ref:`overlayfs <ref-classes-overlayfs>` and
+  :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` classes are available
+  to make it easier to overlay read-only filesystems (for example)
+  with `OverlayFS <https://en.wikipedia.org/wiki/OverlayFS>`__.
+
+Configuration changes
+---------------------
+
+- The Yocto Project now allows to reuse Shared State from its autobuilder.
+  If the network connection between our server and your machine is faster
+  than you would build recipes, you can try to speed up your builds
+  by using such Share State and Hash Equivalence by setting::
+
+     BB_SIGNATURE_HANDLER = "OEEquivHash"
+     BB_HASHSERVE = "auto"
+     BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
+     SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
+
+Supported host distribution changes
+-----------------------------------
+
+- New support for `AlmaLinux <https://en.wikipedia.org/wiki/AlmaLinux>`__
+  hosts replacing `CentOS <https://en.wikipedia.org/wiki/CentOS>`__.
+  The following distribution versions were dropped: CentOS 8, Ubuntu 16.04 and Fedora 30, 31 and 32.
+
+Changes for release notes
+-------------------------
+
+- Share State cache: now using `ZStandard (zstd) <https://en.wikipedia.org/wiki/Zstd>`__
+  instead of Gzip compression, for better performance.
+
+- BitBake has an improved ``setscene`` task display.
+
+- This release fixes the reproducibility issues with ``rust-llvm`` and ``golang``.
+  Recipes in OpenEmbedded-Core are now fully reproducible.
+
-- 
2.25.1


