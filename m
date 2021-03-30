Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.3603.1617106564056415554
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 05:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from localhost (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3BC5D1C000C;
	Tue, 30 Mar 2021 12:16:01 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] Fix suspicious newlines
Date: Tue, 30 Mar 2021 14:15:40 +0200
Message-Id: <20210330121540.10101-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330121540.10101-1-michael.opdenacker@bootlin.com>
References: <20210330121540.10101-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- That could originate from documentation migration issues
- Checked that the corresponding links still exist

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst     | 19 +++++++-----------
 documentation/overview-manual/concepts.rst    |  3 +--
 documentation/overview-manual/yp-intro.rst    | 20 ++++++++-----------
 documentation/ref-manual/variables.rst        |  4 +---
 documentation/sdk-manual/working-projects.rst |  9 ++-------
 5 files changed, 19 insertions(+), 36 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index e5a90e15d..3f35dc636 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2061,16 +2061,12 @@ sysroot are cataloged in manifests in order to ensure the files can be
 removed later when a recipe is either modified or removed. Thus, the
 sysroot is able to remain free from stale files.
 
-A subset of the files installed by the
-:ref:`ref-tasks-install` task are
-used by the
-:ref:`ref-tasks-populate_sysroot`
-task as defined by the
-:term:`SYSROOT_DIRS` variable to
-automatically populate the sysroot. It is possible to modify the list of
-directories that populate the sysroot. The following example shows how
-you could add the ``/opt`` directory to the list of directories within a
-recipe:
+A subset of the files installed by the :ref:`ref-tasks-install` task are
+used by the :ref:`ref-tasks-populate_sysroot` task as defined by the the
+:term:`SYSROOT_DIRS` variable to automatically populate the sysroot. It
+is possible to modify the list of directories that populate the sysroot.
+The following example shows how you could add the ``/opt`` directory to
+the list of directories within a recipe:
 ::
 
    SYSROOT_DIRS += "/opt"
@@ -2081,8 +2077,7 @@ recipe:
    that are not included in the target filesystem, allowing them to share
    these artifacts without needing to use the ``DEPLOY_DIR``.
 
-For a more complete description of the
-:ref:`ref-tasks-populate_sysroot`
+For a more complete description of the :ref:`ref-tasks-populate_sysroot`
 task and its associated functions, see the
 :ref:`staging <ref-classes-staging>` class.
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 257de44ec..f0c7dab4c 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -2111,8 +2111,7 @@ accomplished using fakeroot.
    under fakeroot. Otherwise, the task cannot run root-only operations,
    and cannot see the fake file ownership and permissions set by the
    other task. You need to also add a dependency on
-   virtual/fakeroot-native:do_populate_sysroot
-   , giving the following:
+   ``virtual/fakeroot-native:do_populate_sysroot``, giving the following:
    ::
 
       fakeroot do_mytask () {
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 176e5b24c..95e55fac4 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -262,8 +262,7 @@ with the string ``meta-``.
 .. note::
 
    It is not a requirement that a layer name begin with the prefix
-   meta-
-   , but it is a commonly accepted standard in the Yocto Project
+   ``meta-``, but it is a commonly accepted standard in the Yocto Project
    community.
 
 For example, if you were to examine the :yocto_git:`tree view </poky/tree/>`
@@ -283,8 +282,7 @@ The Yocto Project employs a collection of components and tools used by
 the project itself, by project developers, and by those using the Yocto
 Project. These components and tools are open source projects and
 metadata that are separate from the reference distribution
-(:term:`Poky`) and the
-:term:`OpenEmbedded Build System`. Most of the
+(:term:`Poky`) and the :term:`OpenEmbedded Build System`. Most of the
 components and tools are downloaded separately.
 
 This section provides brief overviews of the components and tools
@@ -654,14 +652,12 @@ Reference Embedded Distribution (Poky)
 
 "Poky", which is pronounced *Pock*-ee, is the name of the Yocto
 Project's reference distribution or Reference OS Kit. Poky contains the
-:term:`OpenEmbedded Build System`
-(:term:`BitBake` and
-:term:`OpenEmbedded-Core (OE-Core)`) as well as a set
-of :term:`Metadata` to get you started
-building your own distro. In other words, Poky is a base specification
-of the functionality needed for a typical embedded system as well as the
-components from the Yocto Project that allow you to build a distribution
-into a usable binary image.
+:term:`OpenEmbedded Build System` (:term:`BitBake` and
+:term:`OpenEmbedded-Core (OE-Core)`) as well as a set of
+:term:`Metadata` to get you started building your own distro. In other
+words, Poky is a base specification of the functionality needed for a
+typical embedded system as well as the components from the Yocto Project
+that allow you to build a distribution into a usable binary image.
 
 Poky is a combined repository of BitBake, OpenEmbedded-Core (which is
 found in ``meta``), ``meta-poky``, ``meta-yocto-bsp``, and documentation
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6a9fed0c6..19f5e34c5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -768,9 +768,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          If you run BitBake from a directory outside of the
-         Build Directory
-         , you must be sure to set
-         BBPATH
+         :term:`Build Directory`, you must be sure to set ``BBPATH``
          to point to the Build Directory. Set the variable as you would any
          environment variable and then run BitBake:
          ::
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index bddf00a7d..f880cbe0d 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -104,10 +104,7 @@ project:
 
    .. note::
 
-      If you get errors from
-      configure.ac
-      , which
-      autoreconf
+      If you get errors from ``configure.ac``, which ``autoreconf``
       runs, that indicate missing files, you can use the "-i" option,
       which ensures missing auxiliary files are copied to the build
       host.
@@ -206,9 +203,7 @@ regarding variable behavior:
 .. note::
 
    Regardless of how you set your variables, if you use the "-e" option
-   with
-   make
-   , the variables from the SDK setup script take precedence:
+   with ``make``, the variables from the SDK setup script take precedence:
    ::
 
       $ make -e target
-- 
2.25.1

