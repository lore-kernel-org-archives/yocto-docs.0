Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7484C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 18:08:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.2693.1711822118606719767
 for <docs@lists.yoctoproject.org>;
 Sat, 30 Mar 2024 11:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GlEyVotw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5647E40007;
	Sat, 30 Mar 2024 18:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711822116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k8uBxqZpULzcIeJ8jvdTm8lIexZC1Nd6QbJ3fiaKdN8=;
	b=GlEyVotwkyAT+GGLmIrg0KH8L61ww3Yj+U7QETRCvECsjwvpixmQQU3D1y56jNEMnzoASQ
	vSO7yZgGq7Rk1orLH74JKGwmOvmDZG2vxpmKlyyHWl20kbYZaa+ESBZLzcEVXeX5RVWHS8
	xiuCyNDPPb4+sojXSSZzox7hSvc5bRfk5xHf61EB1wK7tPb7IlyES/y4YKCqDhAEG12DMW
	hMqsuzy5sdXrtCBs/Cjv1VzMm5UzDYUtCPNIaTb9eDwNS6qV0Mo5EgxoQOLABHUHF6ggme
	CwL+Sl/OtraxU5BRkG7srhCFH31OhpaYcFHTKD7K/nb7VCjmgq59nvx25EZ4WQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/4] manuals: fix trailing spaces
Date: Sat, 30 Mar 2024 19:08:26 +0100
Message-Id: <20240330180829.1749526-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 30 Mar 2024 18:08:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5034

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fixing errors reported by "make sphinx-lint"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/init-manager.rst     |  2 +-
 documentation/dev-manual/start.rst            |  2 +-
 documentation/dev-manual/wic.rst              |  4 +--
 .../migration-guides/migration-4.0.rst        | 20 ++++++------
 .../migration-guides/release-notes-4.0.5.rst  |  2 +-
 .../migration-guides/release-notes-4.0.rst    | 16 +++++-----
 .../migration-guides/release-notes-4.2.rst    |  4 +--
 documentation/overview-manual/intro.rst       |  2 +-
 documentation/ref-manual/classes.rst          |  4 +--
 documentation/ref-manual/tasks.rst            |  2 +-
 documentation/ref-manual/variables.rst        | 32 +++++++++----------
 11 files changed, 45 insertions(+), 45 deletions(-)

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
index 8539bc0889..386e5f5d29 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -619,7 +619,7 @@ containing the release you wish to use, for example
 
 You will find there source archives of individual components (if you wish
 to use them individually), and of the corresponding Poky release bundling
-a selection of these components. 
+a selection of these components.
 
 .. note::
 
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 05e9cb381b..aeecd0dd3e 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -146,7 +146,7 @@ command to return the available Wic images as follows::
      qemuloongarch                 		Create qcow2 image for LoongArch QEMU machines
      directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
      directdisk                    		Create a 'pcbios' direct disk image
-     efi-bootdisk                  		
+     efi-bootdisk
      mkhybridiso                   		Create a hybrid ISO image
      directdisk-gpt                		Create a 'pcbios' direct disk image
      systemd-bootdisk              		Create an EFI disk image with systemd-boot
@@ -289,7 +289,7 @@ Use the following command to list the available kickstart files::
      qemuloongarch                 		Create qcow2 image for LoongArch QEMU machines
      directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
      directdisk                    		Create a 'pcbios' direct disk image
-     efi-bootdisk                  		
+     efi-bootdisk
      mkhybridiso                   		Create a hybrid ISO image
      directdisk-gpt                		Create a 'pcbios' direct disk image
      systemd-bootdisk              		Create an EFI disk image with systemd-boot
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index b5bd57c312..0e9e741458 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -68,7 +68,7 @@ changes and you need to review them before committing. An example warning
 looks like::
 
     poky/scripts/lib/devtool/upgrade.py needs further work at line 275 since it contains abort
-    
+
 Fetching changes
 ~~~~~~~~~~~~~~~~
 
@@ -111,7 +111,7 @@ License changes
   If they do not, by default a warning will be shown. A
   :oe_git:`convert-spdx-licenses.py </openembedded-core/tree/scripts/contrib/convert-spdx-licenses.py>`
   script can be used to update your recipes.
-  
+
 - :term:`INCOMPATIBLE_LICENSE` should now use `SPDX identifiers <https://spdx.org/licenses/>`__.
   Additionally, wildcarding is now limited to specifically supported values -
   see the :term:`INCOMPATIBLE_LICENSE` documentation for further information.
@@ -121,7 +121,7 @@ License changes
   which can cause signature issues for users. In addition the ``available_licenses()``
   function has been removed from the :ref:`ref-classes-license` class as
   it is no longer needed.
-  
+
 Removed recipes
 ~~~~~~~~~~~~~~~
 
@@ -136,11 +136,11 @@ The following recipes have been removed in this release:
 
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
   :ref:`ref-classes-python_flit_core`, :ref:`ref-classes-python_setuptools_build_meta`
@@ -159,7 +159,7 @@ Prelink removed
 Prelink has been dropped by ``glibc`` upstream in 2.36. It already caused issues with
 binary corruption, has a number of open bugs and is of questionable benefit
 without disabling load address randomization and PIE executables.
-    
+
 We disabled prelinking by default in the honister (3.4) release, but left it able
 to be enabled if desired. However, without glibc support it cannot be maintained
 any further, so all of the prelinking functionality has been removed in this release.
@@ -170,7 +170,7 @@ reference(s).
 Reproducible as standard
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
-Reproducibility is now considered as standard functionality, thus the 
+Reproducibility is now considered as standard functionality, thus the
 ``reproducible`` class has been removed and its previous contents merged into the
 :ref:`ref-classes-base` class. If you have references in your configuration to
 ``reproducible`` in :term:`INHERIT`, :term:`USER_CLASSES` etc. then they should be
@@ -212,7 +212,7 @@ and :ref:`bitbake-user-manual/bitbake-user-manual-metadata:removal (override sty
 
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
-  
+
 - ``blacklist.bbclass`` is removed and the functionality moved to the
   :ref:`ref-classes-base` class with a more descriptive
   ``varflag`` variable named :term:`SKIP_RECIPE` which will use the `bb.parse.SkipRecipe()`
@@ -252,7 +252,7 @@ Miscellaneous changes
 - The ``cortexa72-crc`` and ``cortexa72-crc-crypto`` tunes have been removed since
   the crc extension is now enabled by default for cortexa72. Replace any references to
   these with ``cortexa72`` and ``cortexa72-crypto`` respectively.
-  
+
 - The Python development shell (previously known as ``devpyshell``) feature has been
   renamed to ``pydevshell``. To start it you should now run::
 
@@ -261,7 +261,7 @@ Miscellaneous changes
 - The ``packagegroups-core-full-cmdline-libs`` packagegroup is no longer produced, as
   libraries should normally be brought in via dependencies. If you have any references
   to this then remove them.
-  
+
 - The :term:`TOPDIR` variable and the current working directory are no longer modified
   when parsing recipes. Any code depending on the previous behaviour will no longer
   work - change any such code to explicitly use appropriate path variables instead.
diff --git a/documentation/migration-guides/release-notes-4.0.5.rst b/documentation/migration-guides/release-notes-4.0.5.rst
index 172b8b800d..cdfe85b750 100644
--- a/documentation/migration-guides/release-notes-4.0.5.rst
+++ b/documentation/migration-guides/release-notes-4.0.5.rst
@@ -83,7 +83,7 @@ Fixes in Yocto-4.0.5
 Known Issues in Yocto-4.0.5
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- There are recent CVEs in key components such as openssl. They are not included in this release as it was built before the issues were known and fixes were available but these are now available on the kirkstone branch. 
+- There are recent CVEs in key components such as openssl. They are not included in this release as it was built before the issues were known and fixes were available but these are now available on the kirkstone branch.
 
 
 Contributors to Yocto-4.0.5
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 6eb5f807de..a5d66c0410 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -38,7 +38,7 @@ New Features / Enhancements in 4.0
 
 - Inclusive language adjustments to some variable names - see the
   :ref:`4.0 migration guide <migration-4.0-inclusive-language>` for details.
-  
+
 - New recipes:
 
    - ``buildtools-docs-tarball``
@@ -114,7 +114,7 @@ New Features / Enhancements in 4.0
 - BitBake enhancements:
 
    - Fetcher enhancements:
-   
+
       - New :ref:`bitbake-user-manual/bitbake-user-manual-fetching:crate fetcher (\`\`crate://\`\`)` for Rust packages
       - Added striplevel support to unpack
       - git: Add a warning asking users to set a branch in git urls
@@ -127,7 +127,7 @@ New Features / Enhancements in 4.0
       - ssh: now supports checkstatus, allows : in URLs (both required for use with sstate) and no longer requires username
       - wget: add redirectauth parameter
       - wget: add 30s timeout for checkstatus calls
-   
+
    - Show warnings for append/prepend/remove operators combined with +=/.=
    - Add bb.warnonce() and bb.erroronce() log methods
    - Improved setscene task display
@@ -140,7 +140,7 @@ New Features / Enhancements in 4.0
 -  Architecture-specific enhancements:
 
    - ARM:
-  
+
       - tune-cortexa72: Enable the crc extension by default for cortexa72
       - qemuarm64: Add tiny ktype to qemuarm64 bsp
       - armv9a/tune: Add the support for the Neoverse N2 core
@@ -163,7 +163,7 @@ New Features / Enhancements in 4.0
       - linux-yocto-dev: add qemuriscv32
       - packagegroup-core-tools-profile: Enable systemtap for riscv64
       - qemuriscv: Use virtio-tablet-pci for mouse
-  
+
    - x86:
 
       - kernel-yocto: conditionally enable stack protection checking on x86-64
@@ -199,7 +199,7 @@ New Features / Enhancements in 4.0
 - yocto-check-layer: improved README checks
 - cve-check: add json output format
 - cve-check: add coverage statistics on recipes with/without CVEs
-- Added mirrors for kernel sources and uninative binaries on kernel.org 
+- Added mirrors for kernel sources and uninative binaries on kernel.org
 - glibc and binutils recipes now use shallow mirror tarballs for faster fetching
 - When patching fails, show more information on the fatal error
 
@@ -234,7 +234,7 @@ New Features / Enhancements in 4.0
    - Detect more known licenses in Python code
    - Move license md5sums data into CSV files
    - npm: Use README as license fallback
-   
+
 - SDK-related enhancements:
 
    - Extended recipes to :ref:`ref-classes-nativesdk`: ``cargo``,
@@ -244,7 +244,7 @@ New Features / Enhancements in 4.0
    - Support creating per-toolchain cmake file in SDK
 
 - Rust enhancements:
-   
+
    - New python_setuptools3_rust class to enable building python extensions in Rust
    - classes/meson: Add optional rust definitions
 
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index 653602f152..30049b89f6 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -35,7 +35,7 @@ New Features / Enhancements in 4.2
 
    -  BitBake's UI will now ping the server regularly to ensure
       it is still alive.
- 
+
 -  New variables:
 
    -  :term:`VOLATILE_TMP_DIR` allows to specify
@@ -288,7 +288,7 @@ New Features / Enhancements in 4.2
       BitBake manual. All variables should be easy to access through the Yocto
       Manual variable index.
    -  Expanded the description of the :term:`BB_NUMBER_THREADS` variable.
-      
+
 -  Miscellaneous changes:
 
    -  Supporting 64 bit dates on 32 bit platforms: several packages have been
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
index ab71cbe40c..8612128f7b 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -665,7 +665,7 @@ The padding size can be modified by setting :term:`DT_PADDING_SIZE`
 to the desired size, in bytes.
 
 See :oe_git:`devicetree.bbclass sources
-</openembedded-core/tree/meta/classes-recipe/devicetree.bbclass>` 
+</openembedded-core/tree/meta/classes-recipe/devicetree.bbclass>`
 for further variables controlling this class.
 
 Here is an excerpt of an example ``recipes-kernel/linux/devicetree-acme.bb``
@@ -3270,7 +3270,7 @@ The variables used by this class are:
 -  :term:`UBOOT_FIT_KEY_REQ_ARGS`: ``openssl req`` arguments.
 -  :term:`UBOOT_FIT_SIGN_ALG`: signature algorithm for the FIT image.
 -  :term:`UBOOT_FIT_SIGN_NUMBITS`: size of the private key for FIT image
-   signing.                                                  
+   signing.
 -  :term:`UBOOT_FIT_KEY_SIGN_PKCS`: algorithm for the public key certificate
    for FIT image signing.
 -  :term:`UBOOT_FITIMAGE_ENABLE`: enable the generation of a U-Boot FIT image.
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index c28cd7a94a..2e4b23408d 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -358,7 +358,7 @@ information.
 ``do_populate_sdk_ext``
 -----------------------
 
-Creates the file and directory structure for an installable extensible 
+Creates the file and directory structure for an installable extensible
 SDK (eSDK). See the ":ref:`overview-manual/concepts:sdk generation`"
 section in the Yocto Project Overview and Concepts Manual for more
 information.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 435481c9aa..52062b63fa 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2983,18 +2983,18 @@ system and gives an overview of their function and contents.
 
    :term:`FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
-      description of the FIT image.  
+      description of the FIT image.
 
       The default value is set to "1" by the :ref:`ref-classes-kernel-fitimage`
-      class, which corresponds to 32 bit addresses. 
+      class, which corresponds to 32 bit addresses.
 
       For platforms that need to set 64 bit addresses, for example in
       :term:`UBOOT_LOADADDRESS` and :term:`UBOOT_ENTRYPOINT`, you need to
-      set this value to "2", as two 32 bit values (cells) will be needed 
+      set this value to "2", as two 32 bit values (cells) will be needed
       to represent such addresses.
 
       Here is an example setting "0x400000000" as a load address::
-    
+
          FIT_ADDRESS_CELLS = "2"
          UBOOT_LOADADDRESS= "0x04 0x00000000"
 
@@ -3971,15 +3971,15 @@ system and gives an overview of their function and contents.
       Specifies a space-separated list of license names (as they would
       appear in :term:`LICENSE`) that should be excluded
       from the build (if set globally), or from an image (if set locally
-      in an image recipe). 
+      in an image recipe).
 
       When the variable is set globally, recipes that provide no alternatives to listed
       incompatible licenses are not built. Packages that are individually
-      licensed with the specified incompatible licenses will be deleted. 
+      licensed with the specified incompatible licenses will be deleted.
       Most of the time this does not allow a feasible build (because it becomes impossible
       to satisfy build time dependencies), so the recommended way to
       implement license restrictions is to set the variable in specific
-      image recipes where the restrictions must apply. That way there 
+      image recipes where the restrictions must apply. That way there
       are no build time restrictions, but the license check is still
       performed when the image's filesystem is assembled from packages.
 
@@ -4495,12 +4495,12 @@ system and gives an overview of their function and contents.
       When kernel configuration fragments are missing for some
       :term:`KERNEL_FEATURES` specified by layers or BSPs,
       building and configuring the kernel stops with an error.
-    
+
       You can turn these errors into warnings by setting the
       following in ``conf/local.conf``::
 
          KERNEL_DANGLING_FEATURES_WARN_ONLY = "1"
-    
+
       You will still be warned that runtime issues may occur,
       but at least the kernel configuration and build process will
       be allowed to continue.
@@ -7868,7 +7868,7 @@ system and gives an overview of their function and contents.
       This option allows to associate `SPDX annotations
       <https://spdx.github.io/spdx-spec/v2.3/annotations/>`__ to a recipe,
       using the values of variables in the recipe::
-        
+
          ANNOTATION1 = "First annotation for recipe"
          ANNOTATION2 = "Second annotation for recipe"
          SPDX_CUSTOM_ANNOTATION_VARS = "ANNOTATION1 ANNOTATION2"
@@ -7991,7 +7991,7 @@ system and gives an overview of their function and contents.
       The name of keys used by the :ref:`ref-classes-kernel-fitimage` class
       for signing U-Boot FIT image stored in the :term:`SPL_SIGN_KEYDIR`
       directory. If we have for example a ``dev.key`` key and a ``dev.crt``
-      certificate stored in the :term:`SPL_SIGN_KEYDIR` directory, you will 
+      certificate stored in the :term:`SPL_SIGN_KEYDIR` directory, you will
       have to set :term:`SPL_SIGN_KEYNAME` to ``dev``.
 
    :term:`SPLASH`
@@ -8028,7 +8028,7 @@ system and gives an overview of their function and contents.
 
           EXTRA_OECONF += "--disable-startup-msg --enable-img-fullscreen"
 
-      For information on append files, see the                                                                            
+      For information on append files, see the
       ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
       section.
 
@@ -9442,10 +9442,10 @@ system and gives an overview of their function and contents.
 
    :term:`UBOOT_FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
-      description of the U-Boot FIT image.  
+      description of the U-Boot FIT image.
 
       The default value is set to "1" by the :ref:`ref-classes-uboot-sign`
-      class, which corresponds to 32 bit addresses. 
+      class, which corresponds to 32 bit addresses.
 
       For platforms that need to set 64 bit addresses in
       :term:`UBOOT_LOADADDRESS` and :term:`UBOOT_ENTRYPOINT`, you need to
@@ -9453,7 +9453,7 @@ system and gives an overview of their function and contents.
       to represent such addresses.
 
       Here is an example setting "0x400000000" as a load address::
-    
+
          UBOOT_FIT_ADDRESS_CELLS = "2"
          UBOOT_LOADADDRESS= "0x04 0x00000000"
 
@@ -9516,7 +9516,7 @@ system and gives an overview of their function and contents.
          UBOOT_FITIMAGE_ENABLE = "1"
 
       See the :ref:`ref-classes-uboot-sign` class for details.
-      
+
    :term:`UBOOT_LOADADDRESS`
       Specifies the load address for the U-Boot image. During U-Boot image
       creation, the :term:`UBOOT_LOADADDRESS` variable is passed as a
-- 
2.34.1


