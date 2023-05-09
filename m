Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E18C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 14:04:33 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.33417.1683641070798424754
 for <docs@lists.yoctoproject.org>;
 Tue, 09 May 2023 07:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <docs@lists.yoctoproject.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [PATCH] ref-manual: document devicetree class variables
Date: Tue, 9 May 2023 16:03:58 +0200
Message-ID: <20230509140358.89640-1-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 May 2023 14:04:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3929

Document the newly added DT_FILES variable and closely related
DT_FILES_PATH. Also add DT_PADDING_SIZE to the glossary.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 documentation/ref-manual/classes.rst   |  9 +++++++--
 documentation/ref-manual/variables.rst | 22 ++++++++++++++++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index ab1628401..94b6a3ebd 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -607,10 +607,15 @@ subdirectory. This avoids clashes with the :ref:`ref-classes-kernel-devicetree`
 output. Additionally, the device trees are populated into the sysroot for
 access via the sysroot from within other recipes.
 
+By default, all device tree sources located in :term:`DT_FILES_PATH` directory
+are compiled. To select only particular sources, set :term:`DT_FILES` to
+a space-separated list of files (relative to :term:`DT_FILES_PATH`). For
+convenience, both ``.dts`` and ``.dtb`` extensions can be used.
+
 An extra padding is appended to non-overlay device trees binaries. This
 can typically be used as extra space for adding extra properties at boot time.
-The padding size can be modified by setting ``DT_PADDING_SIZE`` to the desired
-size, in bytes.
+The padding size can be modified by setting :term:`DT_PADDING_SIZE`
+to the desired size, in bytes.
 
 See :oe_git:`devicetree.bbclass sources
 </openembedded-core/tree/meta/classes-recipe/devicetree.bbclass>` 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6ee65e178..4b69843d4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2247,6 +2247,28 @@ system and gives an overview of their function and contents.
       For information on policies and on how to use this variable, see the
       comments in the ``meta/classes-recipe/compress_doc.bbclass`` file.
 
+   :term:`DT_FILES`
+      Space-separated list of device tree source files to compile using
+      a recipe that inherits the :ref:`ref-classes-devicetree` class. These
+      are relative to the :term:`DT_FILES_PATH`.
+
+      For convenience, both ``.dts`` and ``.dtb`` extensions can be used.
+
+      Use an empty string (default) to build all device tree sources within
+      the :term:`DT_FILES_PATH` directory.
+
+   :term:`DT_FILES_PATH`
+      When compiling out-of-tree device tree sources using a recipe that
+      inherits the :ref:`ref-classes-devicetree` class, this variable specifies
+      the path to the directory containing dts files to build.
+
+      Defaults to the :term:`S` directory.
+
+   :term:`DT_PADDING_SIZE`
+      When inheriting the :ref:`ref-classes-devicetree` class, this variable
+      specifies the size of padding appended to the device tree blob, used as
+      extra space typically for additional properties during boot.
+
    :term:`EFI_PROVIDER`
       When building bootable images (i.e. where ``hddimg``, ``iso``, or
       ``wic.vmdk`` is in :term:`IMAGE_FSTYPES`), the
-- 
2.30.2


