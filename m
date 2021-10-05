Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84203C433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 16:04:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.2854.1633449864799776821
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 09:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D3F4B6000D;
	Tue,  5 Oct 2021 16:04:21 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: document DEBUG_PREFIX_MAP
Date: Tue,  5 Oct 2021 18:04:07 +0200
Message-Id: <20211005160407.899144-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Oct 2021 16:04:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1914

Fixes [YOCTO #14433]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst          | 17 +++++++++++++++++
 .../test-manual/reproducible-builds.rst         |  2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5f6f91146b..b83e9f8511 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1582,6 +1582,23 @@ system and gives an overview of their function and contents.
          by :term:`BBFILE_PRIORITY` if that variable is different between two
          layers that contain different versions of the same recipe.
 
+   :term:`DEBUG_PREFIX_MAP`
+      Allows to set C compiler options, such as ``-fdebug-prefix-map``,
+      ``-fmacro-prefix-map``, and ``-ffile-prefix-map``, which allow to
+      replace build-time paths by install-time ones in the debugging sections
+      of binaries.  This makes compiler output files location independent,
+      at the cost of having to pass an extra command to tell the debugger
+      where source files are.
+
+      This is used by the Yocto Project to guarantee
+      :doc:`/test-manual/reproducible-builds` even when the source code of
+      a package uses the ``__FILE__`` or ``assert()`` macros. See the
+      `reproducible-builds.org <https://reproducible-builds.org/docs/build-path/>`__
+      website for details.
+
+      This variable is set in the ``meta/conf/bitbake.conf`` file. It is
+      not intended to be user-configurable.
+
    :term:`DEFAULTTUNE`
       The default CPU and Application Binary Interface (ABI) tunings (i.e.
       the "tune") used by the OpenEmbedded build system. The
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 68fdf547bd..349cd1953e 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -53,7 +53,7 @@ things we do within the build system to ensure reproducibility include:
 
 -  Adding mappings to the compiler options to ensure debug filepaths are mapped
    to consistent target compatible paths. This is done through the
-   ``DEBUG_PREFIX_MAP`` variable which sets the ``-fmacro-prefix-map`` and
+   :term:`DEBUG_PREFIX_MAP` variable which sets the ``-fmacro-prefix-map`` and
    ``-fdebug-prefix-map`` compiler options correctly to map to target paths.
 -  Being explicit about recipe dependencies and their configuration (no floating
    configure options or host dependencies creeping in). In particular this means
-- 
2.25.1


