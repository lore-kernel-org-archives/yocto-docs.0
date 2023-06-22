Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB46EB64DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:51:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.16875.1687452684277304535
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 09:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201, mailfrom: foss+yocto@0leil.net)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46B351BF20B;
	Thu, 22 Jun 2023 16:51:22 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 3/4] docs: fix unnecessary double white space
Date: Thu, 22 Jun 2023 18:51:05 +0200
Message-ID: <20230622-typos-202306-v1-3-68489d7f23f2@theobroma-systems.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622-typos-202306-v1-0-68489d7f23f2@theobroma-systems.com>
References: <20230622-typos-202306-v1-0-68489d7f23f2@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.2
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 16:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4030

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

There's no need for double white spaces here so let's just remove them.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/dev-manual/init-manager.rst              | 2 +-
 documentation/dev-manual/new-recipe.rst                | 2 +-
 documentation/dev-manual/upgrading-recipes.rst         | 2 +-
 documentation/migration-guides/migration-3.4.rst       | 2 +-
 documentation/migration-guides/release-notes-4.0.9.rst | 2 +-
 documentation/overview-manual/concepts.rst             | 2 +-
 documentation/ref-manual/release-process.rst           | 2 +-
 documentation/ref-manual/terms.rst                     | 2 +-
 documentation/ref-manual/variables.rst                 | 4 ++--
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index b96e011eb..20d61ea83 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -53,7 +53,7 @@ The ":ref:`device-manager`" chapter has more details about device managers.
 Using SysVinit with udev
 =========================
 
-SysVinit with  the udev device manager corresponds to the
+SysVinit with the udev device manager corresponds to the
 default setting in Poky. This corresponds to setting::
 
    INIT_MANAGER = "sysvinit"
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index ab3e193aa..1be04a765 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1603,7 +1603,7 @@ in the BitBake User Manual.
    space. Also, the operator is applied after all the ``+=``, and ``=+``
    operators have been applied and after all ``=`` assignments have
    occurred. This means that if ``:append`` is used in a recipe, it can
-   only be overridden by another layer using the  special ``:remove``
+   only be overridden by another layer using the special ``:remove``
    operator, which in turn will prevent further layers from adding it back.
 
    The following example shows the space being explicitly added to the
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index 13133fddc..947ef138a 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -73,7 +73,7 @@ The following steps describe how to set up the AUH utility:
    onto your development host. The following command uses Git to create
    a local copy of the repository on your system::
 
-      $ git clone  git://git.yoctoproject.org/auto-upgrade-helper
+      $ git clone git://git.yoctoproject.org/auto-upgrade-helper
       Cloning into 'auto-upgrade-helper'... remote: Counting objects: 768, done.
       remote: Compressing objects: 100% (300/300), done.
       remote: Total 768 (delta 499), reused 703 (delta 434)
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index a80d43a86..f50fe5ee0 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -197,7 +197,7 @@ Package/recipe splitting
   then you may now need to add it explicitly.
 
 - The ``rpm`` package no longer has ``rpm-build`` in its :term:`RRECOMMENDS`;
-  if by chance  you still need rpm package building functionality in
+  if by chance you still need rpm package building functionality in
   your image and you have not already done so then you should add
   ``rpm-build`` to your image explicitly.
 
diff --git a/documentation/migration-guides/release-notes-4.0.9.rst b/documentation/migration-guides/release-notes-4.0.9.rst
index 7c35b8581..236477443 100644
--- a/documentation/migration-guides/release-notes-4.0.9.rst
+++ b/documentation/migration-guides/release-notes-4.0.9.rst
@@ -54,7 +54,7 @@ Fixes in Yocto-4.0.9
 -  gcc-shared-source: do not use ${S}/.. in deploy_source_date_epoch
 -  glibc: Add missing binutils dependency
 -  image_types: fix multiubi var init
--  iso-codes: upgrade to  4.13.0
+-  iso-codes: upgrade to 4.13.0
 -  json-c: Add ptest for json-c
 -  kernel-yocto: fix kernel-meta data detection
 -  lib/buildstats: handle tasks that never finished
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 668e00256..af825a98c 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1989,7 +1989,7 @@ variables:
 -  :term:`BB_HASHSERVE_UPSTREAM`, when ``BB_HASHSERVE = "auto"``,
    allowing to connect the local server to an upstream one.
 
--  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set  to ``OEEquivHash``.
+-  :term:`bitbake:BB_SIGNATURE_HANDLER`, which must be set to ``OEEquivHash``.
 
 Therefore, the default configuration in Poky corresponds to the
 below settings::
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 2ffbd935c..50e7d3962 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -122,7 +122,7 @@ of stable and :term:`LTS` releases.
 
    In some circumstances, a layer can be created by the community in order to
    add a specific feature or support a new version of some package for an :term:`LTS`
-   release.  This is called a :term:`Mixin` layer. These are thin and specific
+   release. This is called a :term:`Mixin` layer. These are thin and specific
    purpose layers which can be stacked with an :term:`LTS` release to "mix" a specific
    feature into that build. These are created on an as-needed basis and
    maintained by the people who need them.
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 8f7281676..bdb4f934c 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -235,7 +235,7 @@ universal, the list includes them just in case:
 
       -  For booting the same kernel binary on multiple systems requiring
          different device drivers. The :term:`Initramfs` image is then customized
-	 for each type of system, to include the specific  kernel modules
+	 for each type of system, to include the specific kernel modules
          necessary to access the final root filesystem. This technique
 	 is used on all GNU / Linux distributions for desktops and servers.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cba3cf5d0..afbb8bf82 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1320,7 +1320,7 @@ system and gives an overview of their function and contents.
       This variable is specific to the :yocto_git:`GStreamer recipes
       </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
       It allows to build the GStreamer `"ugly"
-      <https://github.com/GStreamer/gst-plugins-ugly>`__  and
+      <https://github.com/GStreamer/gst-plugins-ugly>`__ and
       `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ audio plugins.
 
       See the :ref:`dev-manual/licenses:other variables related to commercial licenses`
@@ -1330,7 +1330,7 @@ system and gives an overview of their function and contents.
       This variable is specific to the :yocto_git:`GStreamer recipes
       </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
       It allows to build the GStreamer `"ugly"
-      <https://github.com/GStreamer/gst-plugins-ugly>`__  and
+      <https://github.com/GStreamer/gst-plugins-ugly>`__ and
       `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ video plugins.
 
       See the :ref:`dev-manual/licenses:other variables related to commercial licenses`

-- 
2.41.0


