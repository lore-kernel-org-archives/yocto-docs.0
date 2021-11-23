Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277F1C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 08:43:42 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.8676.1637657020231392993
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 00:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9EB52C001B;
	Tue, 23 Nov 2021 08:43:37 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: add hyperlinks to files in meta-skeleton
Date: Tue, 23 Nov 2021 09:43:35 +0100
Message-Id: <20211123084335.2044039-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Nov 2021 08:43:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2179

This makes the manuals easier to use.
Note the care to keep the paths visible, so that people
reading a printed version still know where to find the files.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst |  9 ++++++---
 documentation/kernel-dev/advanced.rst     | 11 +++++------
 documentation/kernel-dev/common.rst       | 20 ++++++++------------
 documentation/ref-manual/classes.rst      |  5 ++---
 4 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 3eead147a3..6454133867 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -4730,11 +4730,14 @@ optimizations.
 There are several examples in the ``meta-skeleton`` layer found in the
 :term:`Source Directory`:
 
--  ``conf/multilib-example.conf`` configuration file
+-  :oe_git:`conf/multilib-example.conf </openembedded-core/tree/meta-skeleton/conf/multilib-example.conf>`
+   configuration file.
 
--  ``conf/multilib-example2.conf`` configuration file
+-  :oe_git:`conf/multilib-example2.conf </openembedded-core/tree/meta-skeleton/conf/multilib-example2.conf>`
+   configuration file.
 
--  ``recipes-multilib/images/core-image-multilib-example.bb`` recipe
+-  :oe_git:`recipes-multilib/images/core-image-multilib-example.bb </openembedded-core/tree/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb>`
+   recipe
 
 Preparing to Use Multilib
 ~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 2dbcca60c1..5a6b466ffb 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -688,12 +688,11 @@ Recipe-Space Metadata
 ---------------------
 
 When stored in recipe-space, the kernel Metadata files reside in a
-directory hierarchy below
-:term:`FILESEXTRAPATHS`. For
-a linux-yocto recipe or for a Linux kernel recipe derived by copying and
-modifying
-``oe-core/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb`` to
-a recipe in your layer, :term:`FILESEXTRAPATHS` is typically set to
+directory hierarchy below :term:`FILESEXTRAPATHS`. For
+a linux-yocto recipe or for a Linux kernel recipe derived by copying
+:oe_git:`meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+</openembedded-core/tree/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb>`
+into your layer and modifying it, :term:`FILESEXTRAPATHS` is typically set to
 ``${``\ :term:`THISDIR`\ ``}/${``\ :term:`PN`\ ``}``.
 See the ":ref:`kernel-dev/common:modifying an existing recipe`"
 section for more information.
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index d42ca5f99a..a5dd02ccf2 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1578,13 +1578,11 @@ Maintaining format compatibility facilitates converging with linux-yocto
 on a future, mutually-supported kernel version.
 
 To help you use your own sources, the Yocto Project provides a
-linux-yocto custom recipe (``linux-yocto-custom.bb``) that uses
-``kernel.org`` sources and the Yocto Project Linux kernel tools for
-managing kernel Metadata. You can find this recipe in the ``poky`` Git
-repository of the Yocto Project :yocto_git:`Source Repository <>`
-at::
-
-   poky/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+linux-yocto custom recipe that uses ``kernel.org`` sources and
+the Yocto Project Linux kernel tools for managing kernel Metadata.
+You can find this recipe in the ``poky`` Git repository:
+:yocto_git:`meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+</poky/tree/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb>`.
 
 Here are some basic steps you can use to work with your own sources:
 
@@ -1729,11 +1727,9 @@ Linux kernel sources, if you need an external kernel module, the
 create your own out-of-tree Linux kernel module recipe.
 
 This template recipe is located in the ``poky`` Git repository of the
-Yocto Project :yocto_git:`Source Repository <>` at:
-
-.. code-block:: none
-
-   poky/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+Yocto Project:
+:yocto_git:`meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+</poky/tree/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb>`.
 
 To get started, copy this recipe to your layer and give it a meaningful
 name (e.g. ``mymodule_1.0.bb``). In the same directory, create a new
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 5bc4472e34..a33a5909ca 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2810,11 +2810,10 @@ The ``useradd*`` classes support the addition of users or groups for
 usage by the package on the target. For example, if you have packages
 that contain system services that should be run under their own user or
 group, you can use these classes to enable creation of the user or
-group. The ``meta-skeleton/recipes-skeleton/useradd/useradd-example.bb``
+group. The :oe_git:`meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+</openembedded-core/tree/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb>`
 recipe in the :term:`Source Directory` provides a simple
 example that shows how to add three users and groups to two packages.
-See the ``useradd-example.bb`` recipe for more information on how to use
-these classes.
 
 The ``useradd_base`` class provides basic functionality for user or
 groups settings.
-- 
2.25.1


