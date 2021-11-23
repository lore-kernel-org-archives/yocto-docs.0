Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FE0C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 18:12:50 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.15242.1637691169089928384
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 10:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id E7D85240006;
	Tue, 23 Nov 2021 18:12:46 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/3] migration-guides: add more class references
Date: Tue, 23 Nov 2021 19:12:37 +0100
Message-Id: <20211123181239.2057168-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123181239.2057168-1-michael.opdenacker@bootlin.com>
References: <20211123181239.2057168-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Nov 2021 18:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2181

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-1.5.rst | 3 ++-
 documentation/migration-guides/migration-1.7.rst | 6 ++++--
 documentation/migration-guides/migration-2.1.rst | 6 +++---
 documentation/migration-guides/migration-2.2.rst | 2 +-
 documentation/migration-guides/migration-2.3.rst | 2 +-
 documentation/migration-guides/migration-2.4.rst | 2 +-
 documentation/migration-guides/migration-2.5.rst | 8 ++++----
 documentation/migration-guides/migration-3.0.rst | 4 ++--
 documentation/migration-guides/migration-3.1.rst | 4 ++--
 documentation/migration-guides/migration-3.2.rst | 2 +-
 documentation/migration-guides/migration-3.3.rst | 2 +-
 11 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 11c821265c..15b0b43092 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -95,7 +95,8 @@ The following changes have been made to the package QA checks:
    this file within :ref:`ref-tasks-install` if "make
    install" is installing it.
 
--  If you are using the ``buildhistory`` class, the check for the package
+-  If you are using the :ref:`buildhistory <ref-classes-buildhistory>` class,
+   the check for the package
    version going backwards is now controlled using a standard QA check.
    Thus, if you have customized your :term:`ERROR_QA` or :term:`WARN_QA` values
    and still wish to have this check performed, you should add
diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index 8c642da202..88a6855d50 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -43,7 +43,8 @@ The following :ref:`autotools <ref-classes-autotools>` class changes
 occurred:
 
 -  *A separate build directory is now used by default:* The
-   ``autotools`` class has been changed to use a directory for building
+   :ref:`autotools <ref-classes-autotools>` class has been
+   changed to use a directory for building
    (:term:`B`), which is separate from the source directory
    (:term:`S`). This is commonly referred to as ``B != S``, or
    an out-of-tree build.
@@ -54,7 +55,8 @@ occurred:
    manner, you will need to either patch the software so that it can
    build separately, or you will need to change the recipe to inherit
    the :ref:`autotools-brokensep <ref-classes-autotools>` class
-   instead of the ``autotools`` or ``autotools_stage`` classes.
+   instead of the :ref:`autotools <ref-classes-autotools>`
+   or ``autotools_stage`` classes.
 
 -  The ``--foreign`` option is no longer passed to ``automake`` when
    running ``autoconf``: This option tells ``automake`` that a
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index 3135d69caa..eb29694bb5 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -106,12 +106,12 @@ as was previously assumed. Rather, the value changes based on whether
 large file support is enabled. For most software that uses ``autoconf``,
 this change should not be a problem. However, if you have a recipe that
 bypasses the standard :ref:`ref-tasks-configure` task
-from the ``autotools`` class and the software the recipe is building
+from the :ref:`autotools <ref-classes-autotools>` class and the software the recipe is building
 uses a very old version of ``autoconf``, the recipe might be incapable
 of determining the correct size of ``off_t`` during ``do_configure``.
 
 The best course of action is to patch the software as necessary to allow
-the default implementation from the ``autotools`` class to work such
+the default implementation from the :ref:`autotools <ref-classes-autotools>` class to work such
 that ``autoreconf`` succeeds and produces a working configure script,
 and to remove the overridden ``do_configure`` task such that the default
 implementation does get used.
@@ -262,7 +262,7 @@ The following changes have been made for the Poky distribution:
    With this class enabled, a tarball containing a pre-built C library
    is downloaded at the start of the build.
 
-   The ``uninative`` class is enabled through the
+   The :ref:`uninative <ref-classes-uninative>` class is enabled through the
    ``meta/conf/distro/include/yocto-uninative.inc`` file, which for
    those not using the Poky distribution, can include to easily enable
    the same functionality.
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index cbdc6a739e..c063deb44b 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -439,7 +439,7 @@ The following miscellaneous changes have occurred:
 
 -  ``packagegroup-core-tools-testapps``: Removed Piglit.
 
--  ``image.bbclass``: Renamed COMPRESS(ION) to CONVERSION. This change
+-  :ref:`image.bbclass <ref-classes-image>`: Renamed COMPRESS(ION) to CONVERSION. This change
    means that ``COMPRESSIONTYPES``, ``COMPRESS_DEPENDS`` and
    ``COMPRESS_CMD`` are deprecated in favor of ``CONVERSIONTYPES``,
    ``CONVERSION_DEPENDS`` and ``CONVERSION_CMD``. The ``COMPRESS*``
diff --git a/documentation/migration-guides/migration-2.3.rst b/documentation/migration-guides/migration-2.3.rst
index b79bc541c5..0b6b33d2cb 100644
--- a/documentation/migration-guides/migration-2.3.rst
+++ b/documentation/migration-guides/migration-2.3.rst
@@ -50,7 +50,7 @@ Consider the following:
    post-installation script that is installed by a function added to
    :term:`SYSROOT_PREPROCESS_FUNCS`.
 
-   For an example, see the ``pixbufcache`` class in ``meta/classes/`` in
+   For an example, see the :ref:`pixbufcache <ref-classes-pixbufcache>` class in ``meta/classes/`` in
    the :ref:`overview-manual/development-environment:yocto project source repositories`.
 
    .. note::
diff --git a/documentation/migration-guides/migration-2.4.rst b/documentation/migration-guides/migration-2.4.rst
index ae1a212b5d..ef5f32e6ef 100644
--- a/documentation/migration-guides/migration-2.4.rst
+++ b/documentation/migration-guides/migration-2.4.rst
@@ -273,7 +273,7 @@ The following are additional changes:
    a single commit per build rather than one commit per subdirectory in
    the repository. This behavior assumes the commits are enabled with
    :term:`BUILDHISTORY_COMMIT` = "1", which
-   is typical. Previously, the ``buildhistory`` class made one commit
+   is typical. Previously, the :ref:`buildhistory <ref-classes-buildhistory>` class made one commit
    per subdirectory in the repository in order to make it easier to see
    the changes for a particular subdirectory. To view a particular
    change, specify that subdirectory as the last parameter on the
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index 79f804fa1d..bd75522773 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -137,7 +137,7 @@ The following are BitBake changes:
 -  Several explicit "run this task for all recipes in the dependency
    tree" tasks have been removed (e.g. ``fetchall``, ``checkuriall``,
    and the ``*all`` tasks provided by the ``distrodata`` and
-   ``archiver`` classes). There is a BitBake option to complete this for
+   :ref:`archiver <ref-classes-archiver>` classes). There is a BitBake option to complete this for
    any arbitrary task. For example::
 
       bitbake <target> -c fetchall
@@ -187,7 +187,7 @@ Miscellaneous Changes
 
 The following are additional changes:
 
--  The ``kernel`` class supports building packages for multiple kernels.
+-  The :ref:`kernel <ref-classes-kernel>` class supports building packages for multiple kernels.
    If your kernel recipe or ``.bbappend`` file mentions packaging at
    all, you should replace references to the kernel in package names
    with ``${KERNEL_PACKAGE_NAME}``. For example, if you disable
@@ -195,7 +195,7 @@ The following are additional changes:
    ``RDEPENDS_kernel-base = ""`` you can avoid warnings using
    ``RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""`` instead.
 
--  The ``buildhistory`` class commits changes to the repository by
+-  The :ref:`buildhistory <ref-classes-buildhistory>` class commits changes to the repository by
    default so you no longer need to set ``BUILDHISTORY_COMMIT = "1"``.
    If you want to disable commits you need to set
    ``BUILDHISTORY_COMMIT = "0"`` in your configuration.
@@ -207,7 +207,7 @@ The following are additional changes:
    maintains a full-featured BSP in the ``meta-ti`` layer. This rename
    avoids the previous name clash that existed between the two BSPs.
 
--  The ``update-alternatives`` class no longer works with SysV ``init``
+-  The :ref:`update-alternatives <ref-classes-update-alternatives>` class no longer works with SysV ``init``
    scripts because this usage has been problematic. Also, the
    ``sysklogd`` recipe no longer uses ``update-alternatives`` because it
    is incompatible with other implementations.
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 9a5f5714bd..610298bda6 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -47,7 +47,7 @@ The following recipes have been removed.
 -  ``core-image-lsb-sdk``: Part of removed LSB support.
 
 -  ``cve-check-tool``: Functionally replaced by the ``cve-update-db``
-   recipe and ``cve-check`` class.
+   recipe and :ref:`cve-check <ref-classes-cve-check>` class.
 
 -  ``eglinfo``: No longer maintained. ``eglinfo`` from ``mesa-demos`` is
    an adequate and maintained alternative.
@@ -142,7 +142,7 @@ CVE Checking
 ------------
 
 ``cve-check-tool`` has been functionally replaced by a new
-``cve-update-db`` recipe and functionality built into the ``cve-check``
+``cve-update-db`` recipe and functionality built into the :ref:`cve-check <ref-classes-cve-check>`
 class. The result uses NVD JSON data feeds rather than the deprecated
 XML feeds that ``cve-check-tool`` was using, supports CVSSv3 scoring,
 and makes other improvements.
diff --git a/documentation/migration-guides/migration-3.1.rst b/documentation/migration-guides/migration-3.1.rst
index 80b8f6baa5..cb0296717e 100644
--- a/documentation/migration-guides/migration-3.1.rst
+++ b/documentation/migration-guides/migration-3.1.rst
@@ -125,7 +125,7 @@ renamed to ``features_check``; the ``distro_features_check`` class still
 exists but generates a warning and redirects to the new class. In
 preparation for a future removal of the old class it is recommended that
 you update recipes currently inheriting ``distro_features_check`` to
-inherit ``features_check`` instead.
+inherit :ref:`features_check <ref-classes-features_check>` instead.
 
 .. _migration-3.1-removed-classes:
 
@@ -241,7 +241,7 @@ circumstances:
    does not inherit the new ``mime-xdg`` class
 
 -  A recipe installs ``.xml`` files into ``${datadir}/mime/packages``
-   but does not inherit the ``mime`` class
+   but does not inherit the :ref:`mime <ref-classes-mime>` class
 
 .. _migration-3.1-x86-live-wic:
 
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index a940f23238..d593effe97 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -209,7 +209,7 @@ deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
 
 ``do_deploy`` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as ``do_install`` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
 
-Most recipes and classes that inherit the ``deploy`` class or interact with ``do_deploy`` are unlikely to be affected by this unless they add ``prefuncs`` to ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` - these should be refactored to use ``do_deploy_prepend`` instead.
+Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` class or interact with ``do_deploy`` are unlikely to be affected by this unless they add ``prefuncs`` to ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` - these should be refactored to use ``do_deploy_prepend`` instead.
 
 
 .. _migration-3.2-nativesdk-sdk-provides-dummy:
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index 28857e820b..f065a17e68 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -64,7 +64,7 @@ New ``python3targetconfig`` class
 
 A new :ref:`python3targetconfig <ref-classes-python3targetconfig>` class has been
 created for situations where you would previously have inherited the
-``python3native`` class but need access to target configuration data (such as
+:ref:`python3native <ref-classes-python3native>` class but need access to target configuration data (such as
 correct installation directories). Recipes where this situation applies should
 be changed to inherit ``python3targetconfig`` instead of ``python3native``. This
 also adds a dependency on target ``python3``, so it should only be used where
-- 
2.25.1


