Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC6EC41513
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:20:31 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.3518.1713118830806101349
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 11:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eNnUgnou;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6FE8240003;
	Sun, 14 Apr 2024 18:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713118829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rWrG3iZzxptx/SOg6uu/GdskibyvC5AvwRoQiayaQI=;
	b=eNnUgnou6ihAJ1eHSTb1usE19iWyKdZNVzRtNLPkcg5e9ooUXawyhDWlSh3uIwZNTnsBws
	kk8NXv5dGhSuesvS1S4AHB4f4OQWdMUjYYV9BE/fVr+jptmJW9VMpJBVXQouMfyI6QTObu
	2pWYVwD7Btcj4U2zIJ75g2VaFYjutCO8r95F9ZCD/SXiAA5ju6GN1/Uvow7T652fR7wnYP
	HBkQzKc2FtybbO9jJkdTAIJR9yYCAigGoZemgAilqYCR+jGGMux1bykLQafbWakvk2Jt7G
	aCYHHpbV4+DlBuIx76Up/a5bhK4qKgGr5Teo54hbHLRPXgkE7GhKaUYYkyPUVg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 6/9] manuals: fix trailing spaces
Date: Sun, 14 Apr 2024 20:20:08 +0200
Message-Id: <20240414182011.994356-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
References: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 18:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5130

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fixing errors reported by "make sphinx-lint"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/init-manager.rst     |  2 +-
 documentation/dev-manual/start.rst            | 12 +++++++----
 documentation/dev-manual/wic.rst              |  4 ++--
 .../migration-guides/migration-4.0.rst        | 20 +++++++++----------
 .../migration-guides/release-notes-4.0.5.rst  |  2 +-
 .../migration-guides/release-notes-4.0.rst    | 17 ++++++++--------
 documentation/overview-manual/intro.rst       |  2 +-
 documentation/ref-manual/classes.rst          |  2 +-
 documentation/ref-manual/tasks.rst            |  2 +-
 documentation/ref-manual/variables.rst        |  2 +-
 10 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index 20d61ea830..ddce82b81f 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -121,7 +121,7 @@ increasing levels of complexity and functionality:
    :widths: 40 20 20 20
    :header-rows: 1
 
-   * - 
+   * -
      - BusyBox init
      - SysVinit
      - systemd
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 7b6026cf42..aec39b02a9 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -612,10 +612,14 @@ Use the following procedure to locate the latest upstream copy of the
 Accessing Index of Releases
 ---------------------------
 
-Yocto Project maintains an Index of Releases area that contains related
-files that contribute to the Yocto Project. Rather than Git
-repositories, these files are tarballs that represent snapshots in time
-of a given component.
+The Yocto Project also provides source archives of its releases, which
+are available on :yocto_dl:`/releases/yocto/`. Then, choose the subdirectory
+containing the release you wish to use, for example
+:yocto_dl:`yocto-&DISTRO; </releases/yocto/yocto-&DISTRO;/>`.
+
+You will find there source archives of individual components (if you wish
+to use them individually), and of the corresponding Poky release bundling
+a selection of these components.
 
 .. note::
 
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index f794693c50..687c9e6580 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -146,7 +146,7 @@ command to return the available Wic images as follows::
      mkefidisk                     		Create an EFI disk image
      directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
      directdisk                    		Create a 'pcbios' direct disk image
-     efi-bootdisk                  		
+     efi-bootdisk
      mkhybridiso                   		Create a hybrid ISO image
      directdisk-gpt                		Create a 'pcbios' direct disk image
      systemd-bootdisk              		Create an EFI disk image with systemd-boot
@@ -290,7 +290,7 @@ Use the following command to list the available kickstart files::
      mkefidisk                     		Create an EFI disk image
      directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
      directdisk                    		Create a 'pcbios' direct disk image
-     efi-bootdisk                  		
+     efi-bootdisk
      mkhybridiso                   		Create a hybrid ISO image
      directdisk-gpt                		Create a 'pcbios' direct disk image
      systemd-bootdisk              		Create an EFI disk image with systemd-boot
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index 93576d4538..5e240457c0 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -66,7 +66,7 @@ changes and you need to review them before committing. An example warning
 looks like::
 
     poky/scripts/lib/devtool/upgrade.py needs further work at line 275 since it contains abort
-    
+
 Fetching changes
 ~~~~~~~~~~~~~~~~
 
@@ -109,7 +109,7 @@ License changes
   If they do not, by default a warning will be shown. A
   :oe_git:`convert-spdx-licenses.py </openembedded-core/tree/scripts/contrib/convert-spdx-licenses.py>`
   script can be used to update your recipes.
-  
+
 - :term:`INCOMPATIBLE_LICENSE` should now use `SPDX identifiers <https://spdx.org/licenses/>`__.
   Additionally, wildcarding is now limited to specifically supported values -
   see the :term:`INCOMPATIBLE_LICENSE` documentation for further information.
@@ -119,7 +119,7 @@ License changes
   which can cause signature issues for users. In addition the ``available_licenses()``
   function has been removed from the :ref:`license <ref-classes-license>` class as
   it is no longer needed.
-  
+
 Removed recipes
 ~~~~~~~~~~~~~~~
 
@@ -134,11 +134,11 @@ The following recipes have been removed in this release:
 
 Python changes
 ~~~~~~~~~~~~~~
-     
+
 - ``distutils`` has been deprecated upstream in Python 3.10 and thus the ``distutils*``
   classes have been moved to ``meta-python``. Recipes that inherit the ``distutils*``
   classes should be updated to inherit ``setuptools*`` equivalents instead.
-  
+
 - The Python package build process is now based on `wheels <https://pythonwheels.com/>`__.
   The new Python packaging classes that should be used are
   :ref:`python_flit_core <ref-classes-python_flit_core>`,
@@ -158,7 +158,7 @@ Prelink removed
 Prelink has been dropped by ``glibc`` upstream in 2.36. It already caused issues with
 binary corruption, has a number of open bugs and is of questionable benefit
 without disabling load address randomization and PIE executables.
-    
+
 We disabled prelinking by default in the honister (3.4) release, but left it able
 to be enabled if desired. However, without glibc support it cannot be maintained
 any further, so all of the prelinking functionality has been removed in this release.
@@ -169,7 +169,7 @@ reference(s).
 Reproducible as standard
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
-Reproducibility is now considered as standard functionality, thus the 
+Reproducibility is now considered as standard functionality, thus the
 ``reproducible`` class has been removed and its previous contents merged into the
 :ref:`base <ref-classes-base>` class. If you have references in your configuration to
 ``reproducible`` in :term:`INHERIT`, :term:`USER_CLASSES` etc. then they should be
@@ -211,7 +211,7 @@ and :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:removal (over
 
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
-  
+
 - ``blacklist.bbclass`` is removed and the functionality moved to the
   :ref:`base <ref-classes-base>` class with a more descriptive
   ``varflag`` variable named :term:`SKIP_RECIPE` which will use the `bb.parse.SkipRecipe()`
@@ -251,7 +251,7 @@ Miscellaneous changes
 - The ``cortexa72-crc`` and ``cortexa72-crc-crypto`` tunes have been removed since
   the crc extension is now enabled by default for cortexa72. Replace any references to
   these with ``cortexa72`` and ``cortexa72-crypto`` respectively.
-  
+
 - The Python development shell (previously known as ``devpyshell``) feature has been
   renamed to ``pydevshell``. To start it you should now run::
 
@@ -260,7 +260,7 @@ Miscellaneous changes
 - The ``packagegroups-core-full-cmdline-libs`` packagegroup is no longer produced, as
   libraries should normally be brought in via dependencies. If you have any references
   to this then remove them.
-  
+
 - The :term:`TOPDIR` variable and the current working directory are no longer modified
   when parsing recipes. Any code depending on the previous behaviour will no longer
   work - change any such code to explicitly use appropriate path variables instead.
diff --git a/documentation/migration-guides/release-notes-4.0.5.rst b/documentation/migration-guides/release-notes-4.0.5.rst
index ea0280b03c..95cc6f6d30 100644
--- a/documentation/migration-guides/release-notes-4.0.5.rst
+++ b/documentation/migration-guides/release-notes-4.0.5.rst
@@ -81,7 +81,7 @@ Fixes in Yocto-4.0.5
 Known Issues in Yocto-4.0.5
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- There are recent CVEs in key components such as openssl. They are not included in this release as it was built before the issues were known and fixes were available but these are now available on the kirkstone branch. 
+- There are recent CVEs in key components such as openssl. They are not included in this release as it was built before the issues were known and fixes were available but these are now available on the kirkstone branch.
 
 
 Contributors to Yocto-4.0.5
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index b675cae217..11206072a0 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -36,7 +36,7 @@ New Features / Enhancements in 4.0
 
 - Inclusive language adjustments to some variable names - see the
   :ref:`4.0 migration guide <migration-4.0-inclusive-language>` for details.
-  
+
 - New recipes:
 
    - ``buildtools-docs-tarball``
@@ -112,8 +112,7 @@ New Features / Enhancements in 4.0
 - BitBake enhancements:
 
    - Fetcher enhancements:
-   
-      - New :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:crate fetcher (\`\`crate://\`\`)` for Rust packages
+      - New :ref:`bitbake-user-manual/bitbake-user-manual-fetching:crate fetcher (\`\`crate://\`\`)` for Rust packages
       - Added striplevel support to unpack
       - git: Add a warning asking users to set a branch in git urls
       - git: Allow git fetcher to support subdir param
@@ -125,7 +124,7 @@ New Features / Enhancements in 4.0
       - ssh: now supports checkstatus, allows : in URLs (both required for use with sstate) and no longer requires username
       - wget: add redirectauth parameter
       - wget: add 30s timeout for checkstatus calls
-   
+
    - Show warnings for append/prepend/remove operators combined with +=/.=
    - Add bb.warnonce() and bb.erroronce() log methods
    - Improved setscene task display
@@ -138,7 +137,7 @@ New Features / Enhancements in 4.0
 -  Architecture-specific enhancements:
 
    - ARM:
-  
+
       - tune-cortexa72: Enable the crc extension by default for cortexa72
       - qemuarm64: Add tiny ktype to qemuarm64 bsp
       - armv9a/tune: Add the support for the Neoverse N2 core
@@ -161,7 +160,7 @@ New Features / Enhancements in 4.0
       - linux-yocto-dev: add qemuriscv32
       - packagegroup-core-tools-profile: Enable systemtap for riscv64
       - qemuriscv: Use virtio-tablet-pci for mouse
-  
+
    - x86:
 
       - kernel-yocto: conditionally enable stack protection checking on x86-64
@@ -197,7 +196,7 @@ New Features / Enhancements in 4.0
 - yocto-check-layer: improved README checks
 - cve-check: add json output format
 - cve-check: add coverage statistics on recipes with/without CVEs
-- Added mirrors for kernel sources and uninative binaries on kernel.org 
+- Added mirrors for kernel sources and uninative binaries on kernel.org
 - glibc and binutils recipes now use shallow mirror tarballs for faster fetching
 - When patching fails, show more information on the fatal error
 
@@ -232,7 +231,7 @@ New Features / Enhancements in 4.0
    - Detect more known licenses in Python code
    - Move license md5sums data into CSV files
    - npm: Use README as license fallback
-   
+
 - SDK-related enhancements:
 
    - Extended recipes to ``nativesdk``: ``cargo``, ``librsvg``, ``libstd-rs``, ``libva``, ``python3-docutil``, ``python3-packaging``
@@ -240,7 +239,7 @@ New Features / Enhancements in 4.0
    - Support creating per-toolchain cmake file in SDK
 
 - Rust enhancements:
-   
+
    - New python_setuptools3_rust class to enable building python extensions in Rust
    - classes/meson: Add optional rust definitions
 
diff --git a/documentation/overview-manual/intro.rst b/documentation/overview-manual/intro.rst
index a8091771f4..80446b3810 100644
--- a/documentation/overview-manual/intro.rst
+++ b/documentation/overview-manual/intro.rst
@@ -38,7 +38,7 @@ This manual does not give you the following:
    procedures reside in other manuals within the Yocto Project
    documentation set. For example, the :doc:`/dev-manual/index`
    provides examples on how to perform
-   various development tasks. As another example, the 
+   various development tasks. As another example, the
    :doc:`/sdk-manual/index` manual contains detailed
    instructions on how to install an SDK, which is used to develop
    applications for target hardware.
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index e7bf5e9a6e..43bdc8bd25 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -588,7 +588,7 @@ The padding size can be modified by setting :term:`DT_PADDING_SIZE`
 to the desired size, in bytes.
 
 See :oe_git:`devicetree.bbclass sources
-</openembedded-core/tree/meta/classes-recipe/devicetree.bbclass>` 
+</openembedded-core/tree/meta/classes-recipe/devicetree.bbclass>`
 for further variables controlling this class.
 
 Here is an excerpt of an example ``recipes-kernel/linux/devicetree-acme.bb``
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 0f1f95b9ff..346e9491f3 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -369,7 +369,7 @@ information.
 ``do_populate_sdk_ext``
 -----------------------
 
-Creates the file and directory structure for an installable extensible 
+Creates the file and directory structure for an installable extensible
 SDK (eSDK). See the ":ref:`overview-manual/concepts:sdk generation`"
 section in the Yocto Project Overview and Concepts Manual for more
 information.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5e5b688878..c2a6566341 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7601,7 +7601,7 @@ system and gives an overview of their function and contents.
       The name of keys used by the :ref:`ref-classes-kernel-fitimage` class
       for signing U-Boot FIT image stored in the :term:`SPL_SIGN_KEYDIR`
       directory. If we have for example a ``dev.key`` key and a ``dev.crt``
-      certificate stored in the :term:`SPL_SIGN_KEYDIR` directory, you will 
+      certificate stored in the :term:`SPL_SIGN_KEYDIR` directory, you will
       have to set :term:`SPL_SIGN_KEYNAME` to ``dev``.
 
    :term:`SPLASH`
-- 
2.34.1


