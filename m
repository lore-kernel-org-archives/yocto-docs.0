Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BA2C63705
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 20:39:43 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.28062.1670445574424533170
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 12:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YexntTy2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 429E01C0002;
	Wed,  7 Dec 2022 20:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670445572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=af2SQBPIiQeuWGOipyBoUh+ANiuWbKPIfrMV2W9gIcU=;
	b=YexntTy2GgJDvcCexvCl0neovL4eOjpO+keoe/q7YkYo42FDpRknQCXVR6CYWURX+G/8BR
	1lP4y6fChUBS4D4p0glOwB6Bkd0aYHnb+AvLwvdhID8X6V756dAfi1IHsy7FuPXnCro9V/
	QtIZyx18R/JTvE4rtabHH3F5RNlGLtQkDwG7pX8OHiOGD+98iwWOTaJUfehsGhv99q6Wxu
	hh7QmcViRfYQ+Sqjw3qJhSWxviEGAr3VVVo7iSR7RksLVxMj8hbFWsQ56kHAGaBU5MgyRC
	f38UOWuuvNz8xW4PFXJe/CkbbcFgprlyy1RhmnCvNdCiOMON/vmENVwhL4mo3A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: add missing references to variables
Date: Wed,  7 Dec 2022 21:39:28 +0100
Message-Id: <20221207203928.511207-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Dec 2022 20:39:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3521

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

Missing references detected by:
- Listing all variables in the YP manual:
  grep "^   :term:" documentation/ref-manual/variables.rst | sed -n -e 's/^\(.*\)\(:term:`\)\(.*\)\(`\)/\3/p' > /tmp/yocto-vars.txt
- Then grepping each variable in the manuals, either in the middle of a line, or at the
  beginning or at the end:
  cat /tmp/yocto-vars.txt | while read var; do echo $var; git grep " $var " *.rst | grep -v " = ";  done > /tmp/unreferrenced-vars1.txt
  cat /tmp/yocto-vars.txt | while read var; do echo $var; git grep " $var$" *.rst | grep -v " = ";  done > /tmp/unreferrenced-vars2.txt
  cat /tmp/yocto-vars.txt | while read var; do echo $var; git grep "^$var " *.rst | grep -v " = ";  done > /tmp/unreferrenced-vars3.txt
Then inspecting the 3 results files and fixing the true positives manually.
There were many false positives too, but this reduced the number of lines to inspect.
---
 documentation/dev-manual/building.rst         |  6 +-
 documentation/dev-manual/packages.rst         |  2 +-
 .../migration-guides/migration-3.0.rst        |  2 +-
 .../migration-guides/migration-4.1.rst        |  2 +-
 .../migration-guides/release-notes-3.4.1.rst  | 22 +++---
 .../migration-guides/release-notes-3.4.2.rst  | 10 +--
 .../migration-guides/release-notes-3.4.3.rst  |  6 +-
 .../migration-guides/release-notes-3.4.4.rst  | 10 +--
 .../migration-guides/release-notes-3.4.rst    | 72 +++++++++----------
 .../migration-guides/release-notes-4.0.1.rst  | 20 +++---
 .../migration-guides/release-notes-4.0.2.rst  | 14 ++--
 .../migration-guides/release-notes-4.0.3.rst  | 34 ++++-----
 .../migration-guides/release-notes-4.0.4.rst  | 22 +++---
 .../migration-guides/release-notes-4.0.5.rst  | 12 ++--
 .../migration-guides/release-notes-4.0.rst    | 28 ++++----
 .../migration-guides/release-notes-4.1.1.rst  | 46 ++++++------
 .../migration-guides/release-notes-4.1.rst    |  8 +--
 documentation/overview-manual/concepts.rst    |  6 +-
 documentation/profile-manual/intro.rst        |  4 +-
 documentation/profile-manual/usage.rst        |  2 +-
 documentation/ref-manual/classes.rst          | 18 ++---
 documentation/ref-manual/images.rst           |  2 +-
 documentation/ref-manual/qa-checks.rst        |  2 +-
 documentation/ref-manual/variables.rst        | 14 ++--
 .../sdk-manual/appendix-customizing.rst       |  3 +-
 documentation/test-manual/intro.rst           |  8 +--
 .../test-manual/reproducible-builds.rst       |  2 +-
 .../test-manual/understand-autobuilder.rst    |  2 +-
 28 files changed, 188 insertions(+), 191 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index c2cf3a35f3..2798dd3e98 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -138,7 +138,7 @@ Follow these steps to set up and execute multiple configuration builds:
    temporary directory (:term:`TMPDIR`) can be shared will depend on what is
    similar and what is different between the configurations. Multiple MACHINE
    targets can share the same (:term:`TMPDIR`) as long as the rest of the
-   configuration is the same, multiple DISTRO settings would need separate
+   configuration is the same, multiple :term:`DISTRO` settings would need separate
    (:term:`TMPDIR`) directories.
 
    For example, consider a scenario with two different multiconfigs for the same
@@ -273,12 +273,12 @@ loading modules needed to locate and mount the final root filesystem.
 
 Follow these steps to create an :term:`Initramfs` image:
 
-1. *Create the Initramfs Image Recipe:* You can reference the
+1. *Create the :term:`Initramfs` Image Recipe:* You can reference the
    ``core-image-minimal-initramfs.bb`` recipe found in the
    ``meta/recipes-core`` directory of the :term:`Source Directory`
    as an example from which to work.
 
-2. *Decide if You Need to Bundle the Initramfs Image Into the Kernel
+2. *Decide if You Need to Bundle the :term:`Initramfs` Image Into the Kernel
    Image:* If you want the :term:`Initramfs` image that is built to be bundled
    in with the kernel image, set the :term:`INITRAMFS_IMAGE_BUNDLE`
    variable to ``"1"`` in your ``local.conf`` configuration file and set the
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 5f7bd68b9a..afd8bfc945 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -220,7 +220,7 @@ The alternative to setting up a PR Service is to manually "bump" the
 :term:`PR` variable.
 
 If a committed change results in changing the package output, then the
-value of the PR variable needs to be increased (or "bumped") as part of
+value of the :term:`PR` variable needs to be increased (or "bumped") as part of
 that commit. For new recipes you should add the :term:`PR` variable and set
 its initial value equal to "r0", which is the default. Even though the
 default value is "r0", the practice of adding it to a new recipe makes
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 107d2b8797..967c7e0de8 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -222,7 +222,7 @@ The following sanity check changes occurred.
 
    -  Github archive tarballs --- these are not guaranteed to be stable.
       Consequently, it is likely that the tarballs will be refreshed and
-      thus the SRC_URI checksums will fail to apply. It is recommended
+      thus the :term:`SRC_URI` checksums will fail to apply. It is recommended
       that you fetch either an official release tarball or a specific
       revision from the actual Git repository instead.
 
diff --git a/documentation/migration-guides/migration-4.1.rst b/documentation/migration-guides/migration-4.1.rst
index bb8c6dd697..d56fceba0b 100644
--- a/documentation/migration-guides/migration-4.1.rst
+++ b/documentation/migration-guides/migration-4.1.rst
@@ -182,7 +182,7 @@ Miscellaneous changes
 - The Python ``zoneinfo`` module is now split out to its own ``python3-zoneinfo``
   package.
 - The :term:`PACKAGECONFIG` option to enable wpa_supplicant in the ``connman``
-  recipe has been renamed to "wpa-supplicant". If you have set PACKAGECONFIG for
+  recipe has been renamed to "wpa-supplicant". If you have set :term:`PACKAGECONFIG` for
   the ``connman`` recipe to include this option you will need to update
   your configuration. Related to this, the :term:`WIRELESS_DAEMON` variable
   now expects the new ``wpa-supplicant`` naming and affects ``packagegroup-base``
diff --git a/documentation/migration-guides/release-notes-3.4.1.rst b/documentation/migration-guides/release-notes-3.4.1.rst
index d15a8a8fbd..914cbf74ed 100644
--- a/documentation/migration-guides/release-notes-3.4.1.rst
+++ b/documentation/migration-guides/release-notes-3.4.1.rst
@@ -53,9 +53,9 @@ Fixes in 3.4.1
 -  ca-certificates: update 20210119 -> 20211016
 -  classes/populate_sdk_base: Add setscene tasks
 -  conf: update for release 3.4
--  convert-srcuri.py: use regex to check space in SRC_URI
+-  convert-srcuri.py: use regex to check space in :term:`SRC_URI`
 -  create-spdx: Fix key errors in do_create_runtime_spdx
--  create-spdx: Protect against None from LICENSE_PATH
+-  create-spdx: Protect against None from :term:`LICENSE_PATH`
 -  create-spdx: Set the Organization field via a variable
 -  create-spdx: add create_annotation function
 -  create-spdx: cross recipes are native also
@@ -82,18 +82,18 @@ Fixes in 3.4.1
 -  insane.bbclass: Add a check for directories that are expected to be empty
 -  kernel-devsrc: Add vdso.lds and other build files for riscv64 as well
 -  libnewt: Use python3targetconfig to fix reproducibility issue
--  libpcre/libpcre2: correct SRC_URI
--  libx11-compose-data: Update LICENSE to better reflect reality
--  libx11: Update LICENSE to better reflect reality
+-  libpcre/libpcre2: correct :term:`SRC_URI`
+-  libx11-compose-data: Update :term:`LICENSE` to better reflect reality
+-  libx11: Update :term:`LICENSE` to better reflect reality
 -  libxml2: Use python3targetconfig to fix reproducibility issue
 -  linunistring: Add missing gperf-native dependency
 -  linux-firmware: upgrade to 20211027
--  linux-yocto-dev: Ensure DEPENDS matches recent 5.14 kernel changes
+-  linux-yocto-dev: Ensure :term:`DEPENDS` matches recent 5.14 kernel changes
 -  linux-yocto-rt/5.10: update to -rt54
 -  linux-yocto/5.10: update to v5.10.78
 -  linux-yocto/5.14: common-pc: enable CONFIG_ATA_PIIX as built-in
 -  linux-yocto/5.14: update to v5.14.17
--  linux-yocto: add libmpc-native to DEPENDS
+-  linux-yocto: add libmpc-native to :term:`DEPENDS`
 -  lttng-tools: replace ad hoc ptest fixup with upstream fixes
 -  manuals: releases.rst: move gatesgarth to outdated releases section
 -  mesa: Enable svga for x86 only
@@ -126,13 +126,13 @@ Fixes in 3.4.1
 -  qemu.inc: Remove empty egg-info directories before running meson
 -  recipes: Update github.com urls to use https
 -  ref-manual: Update how to set a useradd password
--  ref-manual: document "reproducible_build" class and SOURCE_DATE_EPOCH
+-  ref-manual: document "reproducible_build" class and :term:`SOURCE_DATE_EPOCH`
 -  ref-manual: document BUILD_REPRODUCIBLE_BINARIES
--  ref-manual: document TOOLCHAIN_HOST_TASK_ESDK
+-  ref-manual: document :term:`TOOLCHAIN_HOST_TASK_ESDK`
 -  ref-manual: remove meta class
 -  ref-manual: update system requirements
 -  releases.rst: fix release number for 3.3.3
--  scripts/convert-srcuri: Update SRC_URI conversion script to handle github url changes
+-  scripts/convert-srcuri: Update :term:`SRC_URI` conversion script to handle github url changes
 -  scripts/lib/wic/help.py: Update Fedora Kickstart URLs
 -  scripts/oe-package-browser: Fix after overrides change
 -  scripts/oe-package-browser: Handle no packages being built
@@ -153,7 +153,7 @@ Fixes in 3.4.1
 -  waffle: convert to git, website is down
 -  wayland: Fix wayland-tools packaging
 -  wireless-regdb: upgrade 2021.07.14 -> 2021.08.28
--  wpa-supplicant: Match package override to PACKAGES for pkg_postinst
+-  wpa-supplicant: Match package override to :term:`PACKAGES` for pkg_postinst
 
 Contributors to 3.4.1
 ~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-3.4.2.rst b/documentation/migration-guides/release-notes-3.4.2.rst
index ddf25ef1bd..2940d457e8 100644
--- a/documentation/migration-guides/release-notes-3.4.2.rst
+++ b/documentation/migration-guides/release-notes-3.4.2.rst
@@ -15,7 +15,7 @@ Security Fixes in 3.4.2
 -  libsndfile1: fix :cve:`2021-4156`
 -  xserver-xorg: whitelist two CVEs
 -  grub2: fix :cve:`2021-3981`
--  xserver-xorg: update CVE_PRODUCT
+-  xserver-xorg: update :term:`CVE_PRODUCT`
 -  binutils: :cve:`2021-42574`
 -  gcc: Fix :cve:`2021-42574`
 -  gcc: Fix :cve:`2021-35465`
@@ -38,7 +38,7 @@ Fixes in 3.4.2
 -  vim: upgrade to patch 4269
 -  vim: update to include latest CVE fixes
 -  expat: upgrade to 2.4.4
--  libusb1: correct SRC_URI
+-  libusb1: correct :term:`SRC_URI`
 -  yocto-check-layer: add debug output for the layers that were found
 -  linux-firmware: Add CLM blob to linux-firmware-bcm4373 package
 -  linux-yocto/5.10: update to v5.10.93
@@ -49,7 +49,7 @@ Fixes in 3.4.2
 -  kernel: introduce python3-dtschema-wrapper
 -  vim: upgrade to 8.2 patch 3752
 -  bootchart2: Add missing python3-math dependency
--  socat: update SRC_URI
+-  socat: update :term:`SRC_URI`
 -  pigz: fix one failure of command "unpigz -l"
 -  linux-yocto/5.14: update genericx86* machines to v5.14.21
 -  linux-yocto/5.10: update genericx86* machines to v5.10.87
@@ -69,7 +69,7 @@ Fixes in 3.4.2
 -  rpm: remove tmp folder created during install
 -  package_manager: ipk: Fix host manifest generation
 -  bitbake: utils: Update to use exec_module() instead of load_module()
--  linux-yocto: add libmpc-native to DEPENDS
+-  linux-yocto: add libmpc-native to :term:`DEPENDS`
 -  ref-manual: fix patch documentation
 -  bitbake: tests/fetch: Drop gnu urls from wget connectivity test
 -  bitbake: fetch: npm: Use temporary file for empty user config
@@ -112,7 +112,7 @@ Fixes in 3.4.2
 -  classes/crate-fetch: Ensure crate fetcher is available
 -  rootfs-postcommands: update systemd_create_users
 -  classes/meson: Add optional rust definitions
--  rust-cross: Replace TARGET_ARCH with TUNE_PKGARCH
+-  rust-cross: Replace :term:`TARGET_ARCH` with :term:`TUNE_PKGARCH`
 -  maintainers.inc: fix up rust-cross entry
 -  rust-cross: Fix directory not deleted for race glibc vs. musl
 -  wic: use shutil.which
diff --git a/documentation/migration-guides/release-notes-3.4.3.rst b/documentation/migration-guides/release-notes-3.4.3.rst
index 9db53d71df..5e9a1b3958 100644
--- a/documentation/migration-guides/release-notes-3.4.3.rst
+++ b/documentation/migration-guides/release-notes-3.4.3.rst
@@ -28,7 +28,7 @@ Fixes in 3.4.3
 -  build-appliance-image: Update to honister head revision
 -  coreutils: remove obsolete ignored CVE list
 -  crate-fetch: fix setscene failures
--  cups: Add --with-dbusdir to EXTRA_OECONF for deterministic build
+-  cups: Add --with-dbusdir to :term:`EXTRA_OECONF` for deterministic build
 -  cve-check: create directory of CVE_CHECK_MANIFEST before copy
 -  cve-check: get_cve_info should open the database read-only
 -  default-distrovars.inc: Switch connectivity check to a yoctoproject.org page
@@ -59,7 +59,7 @@ Fixes in 3.4.3
 -  kernel-devsrc: do not copy Module.symvers file during install
 -  libarchive : update to 3.5.3
 -  libpcap: Disable DPDK explicitly
--  libxml-parser-perl: Add missing RDEPENDS
+-  libxml-parser-perl: Add missing :term:`RDEPENDS`
 -  linux-firmware: upgrade 20211216 -> 20220209
 -  linux-yocto/5.10: Fix ramoops/ftrace
 -  linux-yocto/5.10: features/zram: remove CONFIG_ZRAM_DEF_COMP
@@ -74,7 +74,7 @@ Fixes in 3.4.3
 -  poky.conf: bump version for 3.4.3 honister release
 -  qemuboot: Fix build error if UNINATIVE_LOADER is unset
 -  quilt: Disable external sendmail for deterministic build
--  recipetool: Fix circular reference in SRC_URI
+-  recipetool: Fix circular reference in :term:`SRC_URI`
 -  releases: update to include 3.3.5
 -  releases: update to include 3.4.2
 -  rootfs-postcommands: amend systemd_create_users add user to group check
diff --git a/documentation/migration-guides/release-notes-3.4.4.rst b/documentation/migration-guides/release-notes-3.4.4.rst
index 55a4583b29..01d6ccc01a 100644
--- a/documentation/migration-guides/release-notes-3.4.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.4.rst
@@ -19,20 +19,20 @@ Fixes in 3.4.4
 -  bitbake: knotty: reduce keep-alive timeout from 5000s (83 minutes) to 10 minutes
 -  bitbake: server/process: Disable gc around critical section
 -  bitbake: server/xmlrpcserver: Add missing xmlrpcclient import
--  bitbake: toaster: Fix IMAGE_INSTALL issues with _append vs :append
+-  bitbake: toaster: Fix :term:`IMAGE_INSTALL` issues with _append vs :append
 -  bitbake: toaster: fixtures replace gatesgarth
 -  build-appliance-image: Update to honister head revision
 -  conf.py/poky.yaml: Move version information to poky.yaml and read in conf.py
 -  conf/machine: fix QEMU x86 sound options
--  devupstream: fix handling of SRC_URI
+-  devupstream: fix handling of :term:`SRC_URI`
 -  documentation: update for 3.4.4 release
 -  externalsrc/devtool: Fix to work with fixed export funcition flags handling
 -  gmp: add missing COPYINGv3
--  gnu-config: update SRC_URI
+-  gnu-config: update :term:`SRC_URI`
 -  libxml2: fix CVE-2022-23308 regression
 -  libxml2: move to gitlab.gnome.org
 -  libxml2: update to 2.9.13
--  libxshmfence: Correct LICENSE to HPND
+-  libxshmfence: Correct :term:`LICENSE` to HPND
 -  license_image.bbclass: close package.manifest file
 -  linux-firmware: correct license for ar3k firmware
 -  linux-firmware: upgrade 20220310 -> 20220411
@@ -54,7 +54,7 @@ Fixes in 3.4.4
 -  u-boot: Inherit pkgconfig
 -  uninative: Upgrade to 3.6 with gcc 12 support
 -  vim: Upgrade 8.2.4524 -> 8.2.4681
--  virglrenderer: update SRC_URI
+-  virglrenderer: update :term:`SRC_URI`
 -  webkitgtk: update to 2.32.4
 -  wireless-regdb: upgrade 2022.02.18 -> 2022.04.08
 
diff --git a/documentation/migration-guides/release-notes-3.4.rst b/documentation/migration-guides/release-notes-3.4.rst
index 83ca901016..43638fd60a 100644
--- a/documentation/migration-guides/release-notes-3.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.rst
@@ -38,7 +38,7 @@ New Features / Enhancements in 3.4
 
    -  Support zstd-compressed modules and :term:`Initramfs` images
    -  Allow opt-out of split kernel modules
-   -  linux-yocto-dev: base AUTOREV on specified version
+   -  linux-yocto-dev: base :term:`AUTOREV` on specified version
    -  kernel-yocto: provide debug / summary information for metadata
    -  kernel-uboot: Handle gzip and lzo compression options
    -  linux-yocto/5.14: added devupstream support
@@ -172,47 +172,47 @@ Known Issues in 3.4
 Recipe Licenses changes in 3.4
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The following corrections have been made to the LICENSE values set by recipes:
-
--  acpica: correct LICENSE to "Intel | BSD-3-Clause | GPLv2"
--  dtc: correct LICENSE to "GPLv2 | BSD-2-Clause"
--  e2fsprogs: correct LICENSE to "GPLv2 & LGPLv2 & BSD-3-Clause & MIT"
--  ffmpeg: correct LICENSE to "GPLv2+ & LGPLv2.1+ & ISC & MIT & BSD-2-Clause & BSD-3-Clause & IJG"
--  flac: correct LICENSE to "GFDL-1.2 & GPLv2+ & LGPLv2.1+ & BSD-3-Clause"
--  flex: correct LICENSE to "BSD-3-Clause & LGPL-2.0+"
--  font-util: correct LICENSE to "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
--  glib-2.0: correct LICENSE to "LGPLv2.1+ & BSD-3-Clause & PD"
--  gobject-introspection: correct LICENSE to "LGPLv2+ & GPLv2+ & MIT" (add MIT license)
--  hdparm: correct LICENSE to "BSD-2-Clause & GPLv2 & hdparm"
--  iputils: correct LICENSE to "BSD-3-Clause & GPLv2+"
--  libcap: correct LICENSE to "BSD-3-Clause | GPLv2"
--  libevent: correct LICENSE to "BSD-3-Clause & MIT"
--  libjitterentropy: correct LICENSE to "GPLv2+ | BSD-3-Clause"
--  libpam: correct LICENSE to "GPLv2+ | BSD-3-Clause"
--  libwpe: correct LICENSE to "BSD-2-Clause"
--  libx11-compose-data: correct LICENSE to "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
--  libx11: correct LICENSE to "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
--  libxfont2: correct LICENSE to "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
--  libxfont: correct LICENSE to "MIT & MIT-style & BSD-3-Clause"
--  lsof: correct LICENSE to reflect that it uses a BSD-like (but not exactly BSD) license ("Spencer-94")
--  nfs-utils: correct LICENSE to "MIT & GPLv2+ & BSD-3-Clause"
+The following corrections have been made to the :term:`LICENSE` values set by recipes:
+
+-  acpica: correct :term:`LICENSE` to "Intel | BSD-3-Clause | GPLv2"
+-  dtc: correct :term:`LICENSE` to "GPLv2 | BSD-2-Clause"
+-  e2fsprogs: correct :term:`LICENSE` to "GPLv2 & LGPLv2 & BSD-3-Clause & MIT"
+-  ffmpeg: correct :term:`LICENSE` to "GPLv2+ & LGPLv2.1+ & ISC & MIT & BSD-2-Clause & BSD-3-Clause & IJG"
+-  flac: correct :term:`LICENSE` to "GFDL-1.2 & GPLv2+ & LGPLv2.1+ & BSD-3-Clause"
+-  flex: correct :term:`LICENSE` to "BSD-3-Clause & LGPL-2.0+"
+-  font-util: correct :term:`LICENSE` to "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
+-  glib-2.0: correct :term:`LICENSE` to "LGPLv2.1+ & BSD-3-Clause & PD"
+-  gobject-introspection: correct :term:`LICENSE` to "LGPLv2+ & GPLv2+ & MIT" (add MIT license)
+-  hdparm: correct :term:`LICENSE` to "BSD-2-Clause & GPLv2 & hdparm"
+-  iputils: correct :term:`LICENSE` to "BSD-3-Clause & GPLv2+"
+-  libcap: correct :term:`LICENSE` to "BSD-3-Clause | GPLv2"
+-  libevent: correct :term:`LICENSE` to "BSD-3-Clause & MIT"
+-  libjitterentropy: correct :term:`LICENSE` to "GPLv2+ | BSD-3-Clause"
+-  libpam: correct :term:`LICENSE` to "GPLv2+ | BSD-3-Clause"
+-  libwpe: correct :term:`LICENSE` to "BSD-2-Clause"
+-  libx11-compose-data: correct :term:`LICENSE` to "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
+-  libx11: correct :term:`LICENSE` to "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
+-  libxfont2: correct :term:`LICENSE` to "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
+-  libxfont: correct :term:`LICENSE` to "MIT & MIT-style & BSD-3-Clause"
+-  lsof: correct :term:`LICENSE` to reflect that it uses a BSD-like (but not exactly BSD) license ("Spencer-94")
+-  nfs-utils: correct :term:`LICENSE` to "MIT & GPLv2+ & BSD-3-Clause"
 -  ovmf: correct license to "BSD-2-Clause-Patent"
--  ppp: correct LICENSE to "BSD-3-Clause & BSD-3-Clause-Attribution & GPLv2+ & LGPLv2+ & PD"
--  python3-packaging: correct LICENSE to "Apache-2.0 | BSD-2-Clause"
--  python-async-test: correct LICENSE to "BSD-3-Clause"
+-  ppp: correct :term:`LICENSE` to "BSD-3-Clause & BSD-3-Clause-Attribution & GPLv2+ & LGPLv2+ & PD"
+-  python3-packaging: correct :term:`LICENSE` to "Apache-2.0 | BSD-2-Clause"
+-  python-async-test: correct :term:`LICENSE` to "BSD-3-Clause"
 -  quota: remove BSD license (only BSD licensed part of the code was removed in 4.05)
--  shadow: correct LICENSE to "BSD-3-Clause | Artistic-1.0"
--  shadow-sysroot: set LICENSE the same as shadow
--  sudo: correct LICENSE to "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
--  swig: correct LICENSE to "BSD-3-Clause & GPLv3"
+-  shadow: correct :term:`LICENSE` to "BSD-3-Clause | Artistic-1.0"
+-  shadow-sysroot: set :term:`LICENSE` the same as shadow
+-  sudo: correct :term:`LICENSE` to "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
+-  swig: correct :term:`LICENSE` to "BSD-3-Clause & GPLv3"
 -  valgrind: correct license to "GPLv2 & GPLv2+ & BSD-3-Clause"
--  webkitgtk: correct LICENSE to "BSD-2-Clause & LGPLv2+"
--  wpebackend-fdo: correct LICENSE to "BSD-2-Clause"
--  xinetd: correct LICENSE to reflect that it uses a unique BSD-like (but not exactly BSD) license
+-  webkitgtk: correct :term:`LICENSE` to "BSD-2-Clause & LGPLv2+"
+-  wpebackend-fdo: correct :term:`LICENSE` to "BSD-2-Clause"
+-  xinetd: correct :term:`LICENSE` to reflect that it uses a unique BSD-like (but not exactly BSD) license
 
 Other license-related notes:
 
--  When creating recipes for Python software, recipetool will now treat "BSD" as "BSD-3-Clause" for the purposes of setting LICENSE, as that is the most common understanding.
+-  When creating recipes for Python software, recipetool will now treat "BSD" as "BSD-3-Clause" for the purposes of setting :term:`LICENSE`, as that is the most common understanding.
 -  Please be aware that an :term:`Initramfs` bundled with the kernel using :term:`INITRAMFS_IMAGE_BUNDLE` should only contain GPLv2-compatible software; this is now mentioned in the documentation.
 
 Security Fixes in 3.4
diff --git a/documentation/migration-guides/release-notes-4.0.1.rst b/documentation/migration-guides/release-notes-4.0.1.rst
index 28d1d71dcf..65cbdf7347 100644
--- a/documentation/migration-guides/release-notes-4.0.1.rst
+++ b/documentation/migration-guides/release-notes-4.0.1.rst
@@ -39,7 +39,7 @@ Fixes in 4.0.1
 -  docs: migration-guides: migration-3.4: mention that hardcoded password are supported if hashed
 -  docs: migration-guides: release-notes-4.0: fix risc-v typo
 -  docs: migration-guides: release-notes-4.0: replace kernel placeholder with correct recipe name
--  docs: ref-manual: variables: add hashed password example in EXTRA_USERS_PARAMS
+-  docs: ref-manual: variables: add hashed password example in :term:`EXTRA_USERS_PARAMS`
 -  docs: set_versions.py: add information about obsolescence of a release
 -  docs: set_versions.py: fix latest release of a branch being shown twice in switchers.js
 -  docs: set_versions.py: fix latest version of an active release shown as obsolete
@@ -81,7 +81,7 @@ Fixes in 4.0.1
 -  linux-yocto/5.15: update to v5.15.36
 -  linux-yocto: enable powerpc-debug fragment
 -  mdadm: Drop clang specific cflags
--  migration-3.4: add missing entry on EXTRA_USERS_PARAMS
+-  migration-3.4: add missing entry on :term:`EXTRA_USERS_PARAMS`
 -  migration-guides: add release notes for 4.0
 -  migration-guides: complete migration guide for 4.0
 -  migration-guides: release-notes-4.0: mention LTS release
@@ -89,7 +89,7 @@ Fixes in 4.0.1
 -  migration-guides: stop including documents with ".. include"
 -  musl: Fix build when usrmerge distro feature is enabled
 -  ncurses: use COPYING file
--  neard: Switch SRC_URI to git repo
+-  neard: Switch :term:`SRC_URI` to git repo
 -  oeqa/selftest: add test for git working correctly inside pseudo
 -  openssl: minor security upgrade 3.0.2 -> 3.0.3
 -  package.bbclass: Prevent perform_packagecopy from removing /sysroot-only
@@ -99,14 +99,14 @@ Fixes in 4.0.1
 -  poky.conf: bump version for 4.0.1 release
 -  qemu.bbclass: Extend ppc/ppc64 extra options
 -  qemuarm64: use virtio pci interfaces
--  qemuarmv5: use arm-versatile-926ejs KMACHINE
--  ref-manual: Add XZ_THREADS and XZ_MEMLIMIT
--  ref-manual: add KERNEL_DEBUG_TIMESTAMPS
--  ref-manual: add ZSTD_THREADS
+-  qemuarmv5: use arm-versatile-926ejs :term:`KMACHINE`
+-  ref-manual: Add :term:`XZ_THREADS` and :term:`XZ_MEMLIMIT`
+-  ref-manual: add :term:`KERNEL_DEBUG_TIMESTAMPS`
+-  ref-manual: add :term:`ZSTD_THREADS`
 -  ref-manual: add a note about hard-coded passwords
 -  ref-manual: add empty-dirs QA check and QA_EMPTY_DIRS*
--  ref-manual: add mention of vendor filtering to CVE_PRODUCT
--  ref-manual: mention wildcarding support in INCOMPATIBLE_LICENSE
+-  ref-manual: add mention of vendor filtering to :term:`CVE_PRODUCT`
+-  ref-manual: mention wildcarding support in :term:`INCOMPATIBLE_LICENSE`
 -  releases: update for yocto 4.0
 -  rootfs-postcommands: fix symlinks where link and output path are equal
 -  ruby: upgrade 3.1.1 -> 3.1.2
@@ -122,7 +122,7 @@ Fixes in 4.0.1
 -  systemd-boot: remove outdated EFI_LD comment
 -  systemtap: Fix build with gcc-12
 -  terminal.py: Restore error output from Terminal
--  u-boot: Correct the SRC_URI
+-  u-boot: Correct the :term:`SRC_URI`
 -  u-boot: Inherit pkgconfig
 -  update_udev_hwdb: fix multilib issue with systemd
 -  util-linux: Create u-a symlink for findfs utility
diff --git a/documentation/migration-guides/release-notes-4.0.2.rst b/documentation/migration-guides/release-notes-4.0.2.rst
index 2c79969f4d..3490e1f52f 100644
--- a/documentation/migration-guides/release-notes-4.0.2.rst
+++ b/documentation/migration-guides/release-notes-4.0.2.rst
@@ -5,7 +5,7 @@ Security Fixes in Yocto-4.0.2
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 -  libxslt: Mark :cve:`2022-29824` as not applying
--  tiff: Add jbig PACKAGECONFIG and clarify IGNORE :cve:`2022-1210`
+-  tiff: Add jbig :term:`PACKAGECONFIG` and clarify IGNORE :cve:`2022-1210`
 -  tiff: mark :cve:`2022-1622` and :cve:`2022-1623` as invalid
 -  pcre2:fix :cve:`2022-1586` Out-of-bounds read
 -  curl: fix :cve:`2022-22576`, :cve:`2022-27775`, :cve:`2022-27776`, :cve:`2022-27774`, :cve:`2022-30115`, :cve:`2022-27780`, :cve:`2022-27781`, :cve:`2022-27779` and :cve:`2022-27782`
@@ -23,7 +23,7 @@ Fixes in Yocto-4.0.2
 -  bash: submit patch upstream
 -  bind: upgrade 9.18.1 -> 9.18.2
 -  binutils: Bump to latest 2.38 release branch
--  bitbake.conf: Make TCLIBC and TCMODE lazy assigned
+-  bitbake.conf: Make :term:`TCLIBC` and :term:`TCMODE` lazy assigned
 -  bitbake: build: Add clean_stamp API function to allow removal of task stamps
 -  bitbake: data: Do not depend on vardepvalueexclude flag
 -  bitbake: fetch2/osc: Small fixes for osc fetcher
@@ -56,7 +56,7 @@ Fixes in Yocto-4.0.2
 -  gcc-source: Fix incorrect task dependencies from ${B}
 -  gcc: Upgrade to 11.3 release
 -  gcc: depend on zstd-native
--  git: fix override syntax in RDEPENDS
+-  git: fix override syntax in :term:`RDEPENDS`
 -  glib-2.0: upgrade 2.72.1 -> 2.72.2
 -  glibc: Drop make-native dependency
 -  go: upgrade 1.17.8 -> 1.17.10
@@ -83,7 +83,7 @@ Fixes in Yocto-4.0.2
 -  libpcre2: upgrade 10.39 -> 10.40
 -  librepo: upgrade 1.14.2 -> 1.14.3
 -  libseccomp: Add missing files for ptests
--  libseccomp: Correct LIC_FILES_CHKSUM
+-  libseccomp: Correct :term:`LIC_FILES_CHKSUM`
 -  libxkbcommon: upgrade 1.4.0 -> 1.4.1
 -  libxml2: Upgrade 2.9.13 -> 2.9.14
 -  license.bbclass: Bound beginline and endline in copy_license_files()
@@ -125,8 +125,8 @@ Fixes in Yocto-4.0.2
 -  perl: Add dependency on make-native to avoid race issues
 -  perl: Fix build with gcc-12
 -  poky.conf: bump version for 4.0.2
--  popt: fix override syntax in RDEPENDS
--  pypi.bbclass: Set CVE_PRODUCT to PYPI_PACKAGE
+-  popt: fix override syntax in :term:`RDEPENDS`
+-  pypi.bbclass: Set :term:`CVE_PRODUCT` to :term:`PYPI_PACKAGE`
 -  python3: Ensure stale empty python module directories don't break the build
 -  python3: Remove problematic paths from sysroot files
 -  python3: fix reproducibility issue with python3-core
@@ -143,7 +143,7 @@ Fixes in Yocto-4.0.2
 -  sanity: Don't warn about make 4.2.1 for mint
 -  sanity: Switch to make 4.0 as a minimum version
 -  sed: Specify shell for "nobody" user in run-ptest
--  selftest/imagefeatures/overlayfs: Always append to DISTRO_FEATURES
+-  selftest/imagefeatures/overlayfs: Always append to :term:`DISTRO_FEATURES`
 -  selftest/multiconfig: Test that multiconfigs in separate layers works
 -  sqlite3: upgrade to 3.38.5
 -  staging.bbclass: process direct dependencies in deterministic order
diff --git a/documentation/migration-guides/release-notes-4.0.3.rst b/documentation/migration-guides/release-notes-4.0.3.rst
index 9f51ff9b3e..d71733aff2 100644
--- a/documentation/migration-guides/release-notes-4.0.3.rst
+++ b/documentation/migration-guides/release-notes-4.0.3.rst
@@ -29,7 +29,7 @@ Fixes in Yocto-4.0.3
 -  base.bbclass: Correct the test for obsolete license exceptions
 -  base/reproducible: Change Source Date Epoch generation methods
 -  bin_package: install into base_prefix
--  bind: Remove legacy python3 PACKAGECONFIG code
+-  bind: Remove legacy python3 :term:`PACKAGECONFIG` code
 -  bind: upgrade to 9.18.4
 -  binutils: stable 2.38 branch updates
 -  build-appliance-image: Update to kirkstone head revision
@@ -38,8 +38,8 @@ Fixes in Yocto-4.0.3
 -  curl: backport openssl fix CN check error code
 -  cve-check: hook cleanup to the BuildCompleted event, not CookerExit
 -  cve-extra-exclusions: Clean up and ignore three CVEs (2xqemu and nasm)
--  devtool: finish: handle patching when S points to subdir of a git repo
--  devtool: ignore pn- overrides when determining SRC_URI overrides
+-  devtool: finish: handle patching when :term:`S` points to subdir of a git repo
+-  devtool: ignore pn- overrides when determining :term:`SRC_URI` overrides
 -  docs: BB_HASHSERVE_UPSTREAM: update to new host
 -  dropbear: break dependency on base package for -dev package
 -  efivar: fix import functionality
@@ -48,7 +48,7 @@ Fixes in Yocto-4.0.3
 -  externalsrc.bbclass: support crate fetcher on externalsrc
 -  font-util: update 1.3.2 -> 1.3.3
 -  gcc-runtime: Fix build when using gold
--  gcc-runtime: Fix missing MLPREFIX in debug mappings
+-  gcc-runtime: Fix missing :term:`MLPREFIX` in debug mappings
 -  gcc-runtime: Pass -nostartfiles when building dummy libstdc++.so
 -  gcc: Backport a fix for gcc bug 105039
 -  git: upgrade to v2.35.4
@@ -56,8 +56,8 @@ Fixes in Yocto-4.0.3
 -  glib-networking: upgrade to 2.72.1
 -  glibc : stable 2.35 branch updates
 -  glibc-tests: Avoid reproducibility issues
--  glibc-tests: not clear BBCLASSEXTEND
--  glibc: revert one upstream change to work around broken DEBUG_BUILD build
+-  glibc-tests: not clear :term:`BBCLASSEXTEND`
+-  glibc: revert one upstream change to work around broken :term:`DEBUG_BUILD` build
 -  glibc: stable 2.35 branch updates
 -  gnupg: upgrade to 2.3.7
 -  go: upgrade to v1.17.12
@@ -84,8 +84,8 @@ Fixes in Yocto-4.0.3
 -  kernel-arch: Fix buildpaths leaking into external module compiles
 -  kernel-devsrc: fix reproducibility and buildpaths QA warning
 -  kernel-devsrc: ppc32: fix reproducibility
--  kernel-uboot.bbclass: Use vmlinux.initramfs when INITRAMFS_IMAGE_BUNDLE set
--  kernel.bbclass: pass LD also in savedefconfig
+-  kernel-uboot.bbclass: Use vmlinux.initramfs when :term:`INITRAMFS_IMAGE_BUNDLE` set
+-  kernel.bbclass: pass :term:`LD` also in savedefconfig
 -  libffi: fix native build being not portable
 -  libgcc: Fix standalone target builds with usrmerge distro feature
 -  libmodule-build-perl: Use env utility to find perl interpreter
@@ -115,7 +115,7 @@ Fixes in Yocto-4.0.3
 -  oeqa/runtime/scp: Disable scp test for dropbear
 -  oeqa/runtime: add test that the kernel has CONFIG_PREEMPT_RT enabled
 -  oeqa/sdk: drop the nativesdk-python 2.x test
--  openssh: Add openssh-sftp-server to openssh RDEPENDS
+-  openssh: Add openssh-sftp-server to openssh :term:`RDEPENDS`
 -  openssh: break dependency on base package for -dev package
 -  openssl: update to 3.0.5
 -  package.bbclass: Avoid stripping signed kernel modules in splitdebuginfo
@@ -123,28 +123,28 @@ Fixes in Yocto-4.0.3
 -  package.bbclass: Fix kernel source handling when not using externalsrc
 -  package_manager/ipk: do not pipe stderr to stdout
 -  packagegroup-core-ssh-dropbear: Add openssh-sftp-server recommendation
--  patch: handle if S points to a subdirectory of a git repo
+-  patch: handle if :term:`S` points to a subdirectory of a git repo
 -  perf: fix reproducibility in 5.19+
 -  perf: fix reproduciblity in older releases of Linux
 -  perf: sort-pmuevents: really keep array terminators
 -  perl: don't install Makefile.old into perl-ptest
 -  poky.conf: bump version for 4.0.3
--  pulseaudio: add m4-native to DEPENDS
+-  pulseaudio: add m4-native to :term:`DEPENDS`
 -  python3: Backport patch to fix an issue in subinterpreters
--  qemu: Add PACKAGECONFIG for brlapi
+-  qemu: Add :term:`PACKAGECONFIG` for brlapi
 -  qemu: Avoid accidental librdmacm linkage
 -  qemu: Avoid accidental libvdeplug linkage
 -  qemu: Fix slirp determinism issue
--  qemu: add PACKAGECONFIG for capstone
--  recipetool/devtool: Fix python egg whitespace issues in PACKAGECONFIG
+-  qemu: add :term:`PACKAGECONFIG` for capstone
+-  recipetool/devtool: Fix python egg whitespace issues in :term:`PACKAGECONFIG`
 -  ref-manual: variables: remove sphinx directive from literal block
 -  rootfs-postcommands.bbclass: move host-user-contaminated.txt to ${S}
--  ruby: add PACKAGECONFIG for capstone
+-  ruby: add :term:`PACKAGECONFIG` for capstone
 -  rust: fix issue building cross-canadian tools for aarch64 on x86_64
 -  sanity.bbclass: Add ftps to accepted URI protocols for mirrors sanity
 -  selftest/runtime_test/virgl: Disable for all almalinux
 -  sstatesig: Include all dependencies in SPDX task signatures
--  strace: set COMPATIBLE_HOST for riscv32
+-  strace: set :term:`COMPATIBLE_HOST` for riscv32
 -  systemd: Added base_bindir into pkg_postinst:udev-hwdb.
 -  udev-extraconf/initrdscripts/parted: Rename mount.blacklist -> mount.ignorelist
 -  udev-extraconf/mount.sh: add LABELs to mountpoints
@@ -169,7 +169,7 @@ Fixes in Yocto-4.0.3
 -  xev: upgrade to 1.2.5
 -  xf86-input-synaptics: upgrade to 1.9.2
 -  xmodmap: upgrade to 1.0.11
--  xorg-app: Tweak handling of compression changes in SRC_URI
+-  xorg-app: Tweak handling of compression changes in :term:`SRC_URI`
 -  xserver-xorg: upgrade to 21.1.4
 -  xwayland: upgrade to 22.1.3
 -  yocto-bsps/5.10: fix buildpaths issue with gen-mach-types
diff --git a/documentation/migration-guides/release-notes-4.0.4.rst b/documentation/migration-guides/release-notes-4.0.4.rst
index 9068841783..05e3e71785 100644
--- a/documentation/migration-guides/release-notes-4.0.4.rst
+++ b/documentation/migration-guides/release-notes-4.0.4.rst
@@ -1,4 +1,4 @@
-Release notes for Yocto-4.0.4 (Kirkstone)
+Releae notes for Yocto-4.0.4 (Kirkstone)
 -----------------------------------------
 
 Security Fixes in Yocto-4.0.4
@@ -28,13 +28,13 @@ Fixes in Yocto-4.0.4
 -  autoconf: Fix strict prototype errors in generated tests
 -  autoconf: Update K & R stype functions
 -  bind: upgrade to 9.18.5
--  bitbake.conf: set BB_DEFAULT_UMASK using ??=
+-  bitbake.conf: set :term:`BB_DEFAULT_UMASK` using ??=
 -  bitbake: ConfHandler/BBHandler: Improve comment error messages and add tests
 -  bitbake: ConfHandler: Remove lingering close
 -  bitbake: bb/utils: movefile: use the logger for printing
 -  bitbake: bb/utils: remove: check the path again the expand python glob
 -  bitbake: bitbake-user-manual: Correct description of the ??= operator
--  bitbake: bitbake-user-manual: npm fetcher: improve description of SRC_URI format
+-  bitbake: bitbake-user-manual: npm fetcher: improve description of :term:`SRC_URI` format
 -  bitbake: bitbake: bitbake-user-manual: hashserv can be accessed on a dedicated domain
 -  bitbake: bitbake: runqueue: add cpu/io pressure regulation
 -  bitbake: bitbake: runqueue: add memory pressure regulation
@@ -77,7 +77,7 @@ Fixes in Yocto-4.0.4
 -  iso-codes: upgrade to 4.11.0
 -  kernel-fitimage.bbclass: add padding algorithm property in config nodes
 -  kernel-fitimage.bbclass: only package unique DTBs
--  kernel: Always set CC and LD for the kernel build
+-  kernel: Always set :term:`CC` and :term:`LD` for the kernel build
 -  kernel: Use consistent make flags for menuconfig
 -  lib:npm_registry: initial checkin
 -  libatomic-ops: upgrade to 7.6.14
@@ -94,18 +94,18 @@ Fixes in Yocto-4.0.4
 -  linux-yocto/5.10: update to v5.10.137
 -  linux-yocto/5.15: update genericx86* machines to v5.15.59
 -  linux-yocto/5.15: update to v5.15.62
--  linux-yocto: Fix COMPATIBLE_MACHINE regex match
--  linux-yocto: prepend the value with a space when append to KERNEL_EXTRA_ARGS
+-  linux-yocto: Fix :term:`COMPATIBLE_MACHINE` regex match
+-  linux-yocto: prepend the value with a space when append to :term:`KERNEL_EXTRA_ARGS`
 -  lttng-modules: fix 5.19+ build
 -  lttng-modules: fix build against mips and v5.19 kernel
 -  lttng-modules: fix build for kernel 5.10.137
 -  lttng-modules: replace mips compaction fix with upstream change
 -  lz4: upgrade to 1.9.4
 -  maintainers: update opkg maintainer
--  meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE
+-  meta: introduce :term:`UBOOT_MKIMAGE_KERNEL_TYPE`
 -  migration guides: add missing release notes
 -  mobile-broadband-provider-info: upgrade to 20220725
--  nativesdk: Clear TUNE_FEATURES
+-  nativesdk: Clear :term:`TUNE_FEATURES`
 -  npm: replace 'npm pack' call by 'tar czf'
 -  npm: return content of 'package.json' in 'npm_pack'
 -  npm: take 'version' directly from 'package.json'
@@ -124,7 +124,7 @@ Fixes in Yocto-4.0.4
 -  poky.conf: add ubuntu-22.04 to tested distros
 -  poky.conf: bump version for 4.0.4
 -  pseudo: Update to include recent upstream minor fixes
--  python3-pip: Fix RDEPENDS after the update
+-  python3-pip: Fix :term:`RDEPENDS` after the update
 -  ref-manual: add numa to machine features
 -  relocate_sdk.py: ensure interpreter size error causes relocation to fail
 -  rootfs-postcommands.bbclass: avoid moving ssh host keys if etc is writable
@@ -140,12 +140,12 @@ Fixes in Yocto-4.0.4
 -  shadow: Avoid nss warning/error with musl
 -  shadow: Enable subid support
 -  system-requirements.rst: Add Ubuntu 22.04 to list of supported distros
--  systemd: Add 'no-dns-fallback' PACKAGECONFIG option
+-  systemd: Add 'no-dns-fallback' :term:`PACKAGECONFIG` option
 -  systemd: Fix unwritable /var/lock when no sysvinit handling
 -  sysvinit-inittab/start_getty: Fix respawn too fast
 -  tcp-wrappers: Fix implicit-function-declaration warnings
 -  tzdata: upgrade to 2022b
--  util-linux: Remove --enable-raw from EXTRA_OECONF
+-  util-linux: Remove --enable-raw from :term:`EXTRA_OECONF`
 -  vala: upgrade to 0.56.3
 -  vim: Upgrade to 9.0.0453
 -  watchdog: Include needed system header for function decls
diff --git a/documentation/migration-guides/release-notes-4.0.5.rst b/documentation/migration-guides/release-notes-4.0.5.rst
index ea0280b03c..f888f788c5 100644
--- a/documentation/migration-guides/release-notes-4.0.5.rst
+++ b/documentation/migration-guides/release-notes-4.0.5.rst
@@ -28,7 +28,7 @@ Fixes in Yocto-4.0.5
 -  build-appliance-image: Update to kirkstone head revision (4a88ada)
 -  busybox: add devmem 128-bit support
 -  classes: files: Extend overlayfs-etc class
--  coreutils: add openssl PACKAGECONFIG
+-  coreutils: add openssl :term:`PACKAGECONFIG`
 -  create-pull-request: don't switch the git remote protocol to git://
 -  dev-manual: fix reference to BitBake user manual
 -  expat: upgrade 2.4.8 -> 2.4.9
@@ -39,15 +39,15 @@ Fixes in Yocto-4.0.5
 -  glibc-locale: explicitly remove empty dirs in ${libdir}
 -  glibc-tests: use += instead of :append
 -  glibc: stable 2.35 branch updates.(8d125a1f)
--  go-native: switch from SRC_URI:append to SRC_URI +=
+-  go-native: switch from :term:`SRC_URI`:append to SRC_URI +=
 -  image_types_wic.bbclass: fix cross binutils dependency
 -  kern-tools: allow 'y' or 'm' to avoid config audit warnings
--  kern-tools: fix queue processing in relative TOPDIR configurations
+-  kern-tools: fix queue processing in relative :term:`TOPDIR` configurations
 -  kernel-yocto: allow patch author date to be commit date
 -  libpng: upgrade to 1.6.38
 -  linux-firmware: package new Qualcomm firmware
 -  linux-firmware: upgrade 20220708 -> 20220913
--  linux-libc-headers: switch from SRC_URI:append to SRC_URI +=
+-  linux-libc-headers: switch from :term:`SRC_URI`:append to :term:`SRC_URI` +=
 -  linux-yocto-dev: add qemuarm64
 -  linux-yocto/5.10: update to v5.10.149
 -  linux-yocto/5.15: cfg: fix ACPI warnings for -tiny
@@ -63,7 +63,7 @@ Fixes in Yocto-4.0.5
 -  perf: Fix for recent kernel upgrades
 -  poky.conf: bump version for 4.0.5
 -  poky.yaml.in: update version requirements
--  python3-rfc3986-validator: switch from SRC_URI:append to SRC_URI +=
+-  python3-rfc3986-validator: switch from SRC_URI:append to :term:`SRC_URI` +=
 -  python3: upgrade 3.10.4 -> 3.10.7
 -  qemu: Backport patches from upstream to support float128 on qemu-ppc64
 -  rpm: Remove -Wimplicit-function-declaration warnings
@@ -72,7 +72,7 @@ Fixes in Yocto-4.0.5
 -  stress-cpu: disable float128 math on powerpc64 to avoid SIGILL
 -  tune-neoversen2: support tune-neoversen2 base on armv9a
 -  tzdata: update to 2022d
--  u-boot: switch from append to += in SRC_URI
+-  u-boot: switch from append to += in :term:`SRC_URI`
 -  uninative: Upgrade to 3.7 to work with glibc 2.36
 -  vim: Upgrade to 9.0.0598
 -  webkitgtk: Update to 2.36.7
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 3be7342a9c..8f14f8dcdc 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -144,7 +144,7 @@ New Features / Enhancements in 4.0
       - qemuarm64: Add tiny ktype to qemuarm64 bsp
       - armv9a/tune: Add the support for the Neoverse N2 core
       - arch-armv8-5a.inc: Add tune include for armv8.5a
-      - grub-efi: Add xen_boot support when 'xen' is in DISTRO_FEATURES for aarch64
+      - grub-efi: Add xen_boot support when 'xen' is in :term:`DISTRO_FEATURES` for aarch64
       - tune-cortexa73: Introduce cortexa73-crypto tune
       - libacpi: Build libacpi also for 'aarch64' machines
       - core-image-tiny-initramfs: Mark recipe as 32 bit ARM compatible
@@ -176,7 +176,7 @@ New Features / Enhancements in 4.0
    - linux-yocto: cfg: add kcov feature fragment
    - linux-yocto: export pkgconfig variables to devshell
    - linux-yocto-dev: use versioned branch as default
-   - New ``KERNEL_DEBUG_TIMESTAMPS`` variable (to replace removed ``BUILD_REPRODUCIBLE_BINARIES`` for the kernel)
+   - New :term:`KERNEL_DEBUG_TIMESTAMPS` variable (to replace removed ``BUILD_REPRODUCIBLE_BINARIES`` for the kernel)
    - Introduce python3-dtschema-wrapper in preparation for mandatory schema checking on dtb files in 5.16
    - Allow disabling kernel artifact symlink creation
    - Allow changing default .bin kernel artifact extension
@@ -292,7 +292,7 @@ New Features / Enhancements in 4.0
 - libxkbcommon: allow building of API documentation
 - libxkbcommon: split libraries and xkbcli into separate packages
 - systemd: move systemd shared library into its own package
-- systemd: Minimize udev package size if DISTRO_FEATURES doen't contain sysvinit
+- systemd: Minimize udev package size if :term:`DISTRO_FEATURES` doen't contain sysvinit
 
 Known Issues in 4.0
 ~~~~~~~~~~~~~~~~~~~
@@ -304,22 +304,22 @@ Known Issues in 4.0
 Recipe License changes in 4.0
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The following corrections have been made to the LICENSE values set by recipes:
+The following corrections have been made to the :term:`LICENSE` values set by recipes:
 
-* cmake: add BSD-1-Clause & MIT & BSD-2-Clause to LICENSE due to additional vendored libraries in native/target context
-* gettext: extend LICENSE conditional upon PACKAGECONFIG (due to vendored libraries)
+* cmake: add BSD-1-Clause & MIT & BSD-2-Clause to :term:`LICENSE` due to additional vendored libraries in native/target context
+* gettext: extend :term:`LICENSE` conditional upon :term:`PACKAGECONFIG` (due to vendored libraries)
 * gstreamer1.0: update licenses of all modules to LGPL-2.1-or-later (with some exceptions that are GPL-2.0-or-later)
 * gstreamer1.0-plugins-bad/ugly: use the GPL-2.0-or-later only when it is in use
 * kern-tools-native: add missing MIT license due to Kconfiglib
-* libcap: add pam_cap license to LIC_FILES_CHKSUM if pam is enabled
+* libcap: add pam_cap license to :term:`LIC_FILES_CHKSUM` if pam is enabled
 * libidn2: add Unicode-DFS-2016 license
-* libsdl2: add BSD-2-Clause to LICENSE due to default yuv2rgb and hidapi inclusion
-* libx11-compose-data: update LICENSE to "MIT & MIT-style & BSD-1-Clause & HPND & HPND-sell-variant" to better reflect reality
-* libx11: update LICENSE to "MIT & MIT-style & BSD-1-Clause & HPND & HPND-sell-variant" to better reflect reality
-* libxshmfence: correct LICENSE - MIT -> HPND
-* newlib: add BSD-3-Clause to LICENSE
-* python3-idna: correct LICENSE - Unicode -> Unicode-TOU
-* python3-pip: add "Apache-2.0 & MPL-2.0 & LGPL-2.1-only & BSD-3-Clause & PSF-2.0 & BSD-2-Clause" to LICENSE due to vendored libraries
+* libsdl2: add BSD-2-Clause to :term:`LICENSE` due to default yuv2rgb and hidapi inclusion
+* libx11-compose-data: update :term:`LICENSE` to "MIT & MIT-style & BSD-1-Clause & HPND & HPND-sell-variant" to better reflect reality
+* libx11: update :term:`LICENSE` to "MIT & MIT-style & BSD-1-Clause & HPND & HPND-sell-variant" to better reflect reality
+* libxshmfence: correct :term:`LICENSE` - MIT -> HPND
+* newlib: add BSD-3-Clause to :term:`LICENSE`
+* python3-idna: correct :term:`LICENSE` - Unicode -> Unicode-TOU
+* python3-pip: add "Apache-2.0 & MPL-2.0 & LGPL-2.1-only & BSD-3-Clause & PSF-2.0 & BSD-2-Clause" to :term:`LICENSE` due to vendored libraries
 
 Other license-related notes:
 
diff --git a/documentation/migration-guides/release-notes-4.1.1.rst b/documentation/migration-guides/release-notes-4.1.1.rst
index cd52ab3b33..c5cc7d6792 100644
--- a/documentation/migration-guides/release-notes-4.1.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.1.rst
@@ -29,7 +29,7 @@ Fixes in Yocto-4.1.1
 -  bitbake: tests/fetch: Allow handling of a file:// url within a submodule
 -  bitbake: tests: bb.tests.fetch.URLHandle: add 2 new tests
 -  bitbake: utils/ply: Update md5 to better report errors with hashlib
--  bluez5: add dbus to RDEPENDS
+-  bluez5: add dbus to :term:`RDEPENDS`
 -  build-appliance-image: Update to langdale head revision
 -  buildconf: compare abspath
 -  buildtools-tarball: export certificates to python and curl
@@ -40,7 +40,7 @@ Fixes in Yocto-4.1.1
 -  dev-manual: common-tasks.rst: add reference to "do_clean" task
 -  dev-manual: common-tasks.rst: add reference to "do_listtasks" task
 -  docs: add support for langdale (4.1) release
--  dropbear: add pam to PACKAGECONFIG
+-  dropbear: add pam to :term:`PACKAGECONFIG`
 -  externalsrc.bbclass: fix git repo detection
 -  externalsrc.bbclass: Remove a trailing slash from ${B}
 -  externalsrc: move back to classes
@@ -56,7 +56,7 @@ Fixes in Yocto-4.1.1
 -  kern-tools: fix relative path processing
 -  kernel-fitimage: Use KERNEL_OUTPUT_DIR where appropriate
 -  kernel-yocto: improve fatal error messages of symbol_why.py
--  kernel: Clear SYSROOT_DIRS instead of replacing sysroot_stage_all
+-  kernel: Clear :term:`SYSROOT_DIRS` instead of replacing sysroot_stage_all
 -  libcap: upgrade 2.65 -> 2.66
 -  libical: upgrade 3.0.14 -> 3.0.15
 -  libksba: upgrade 1.6.0 -> 1.6.2
@@ -124,37 +124,37 @@ Fixes in Yocto-4.1.1
 -  poky.conf: remove Ubuntu 21.10
 -  populate_sdk_base: ensure ptest-pkgs pulls in ptest-runner
 -  psplash: add psplash-default in rdepends
--  qemu-native: Add PACKAGECONFIG option for jack
+-  qemu-native: Add :term:`PACKAGECONFIG` option for jack
 -  quilt: backport a patch to address grep 3.8 failures
 -  ref-manual/faq.rst: update references to products built with OE / Yocto Project
 -  ref-manual/variables.rst: clarify sentence
 -  ref-manual: add a note to ssh-server-dropbear feature
--  ref-manual: add CVE_CHECK_SHOW_WARNINGS
--  ref-manual: add CVE_DB_UPDATE_INTERVAL
--  ref-manual: add DEV_PKG_DEPENDENCY
--  ref-manual: add DISABLE_STATIC
--  ref-manual: add FIT_PAD_ALG
--  ref-manual: add KERNEL_DEPLOY_DEPEND
+-  ref-manual: add :term:`CVE_CHECK_SHOW_WARNINGS`
+-  ref-manual: add :term:`CVE_DB_UPDATE_INTERVAL`
+-  ref-manual: add :term:`DEV_PKG_DEPENDENCY`
+-  ref-manual: add :term:`DISABLE_STATIC`
+-  ref-manual: add :term:`FIT_PAD_ALG`
+-  ref-manual: add :term:`KERNEL_DEPLOY_DEPEND`
 -  ref-manual: add missing features
--  ref-manual: add MOUNT_BASE variable
+-  ref-manual: add :term:`MOUNT_BASE` variable
 -  ref-manual: add overlayfs class variables
--  ref-manual: add OVERLAYFS_ETC_EXPOSE_LOWER
--  ref-manual: add OVERLAYFS_QA_SKIP
+-  ref-manual: add :term:`OVERLAYFS_ETC_EXPOSE_LOWER`
+-  ref-manual: add :term:`OVERLAYFS_QA_SKIP`
 -  ref-manual: add previous overlayfs-etc variables
 -  ref-manual: add pypi class
--  ref-manual: add SDK_TOOLCHAIN_LANGS
+-  ref-manual: add :term:`SDK_TOOLCHAIN_LANGS`
 -  ref-manual: add section for create-spdx class
--  ref-manual: add serial-autologin-root to IMAGE_FEATURES documentation
--  ref-manual: add UBOOT_MKIMAGE_KERNEL_TYPE
--  ref-manual: add WATCHDOG_TIMEOUT to variable glossary
--  ref-manual: add WIRELESS_DAEMON
+-  ref-manual: add serial-autologin-root to :term:`IMAGE_FEATURES` documentation
+-  ref-manual: add :term:`UBOOT_MKIMAGE_KERNEL_TYPE`
+-  ref-manual: add :term:`WATCHDOG_TIMEOUT` to variable glossary
+-  ref-manual: add :term:`WIRELESS_DAEMON`
 -  ref-manual: classes.rst: add links to all references to a class
 -  ref-manual: complementary package installation recommends
--  ref-manual: correct default for BUILDHISTORY_COMMIT
+-  ref-manual: correct default for :term:`BUILDHISTORY_COMMIT`
 -  ref-manual: document new github-releases class
 -  ref-manual: expand documentation on image-buildinfo class
 -  ref-manual: faq.rst: reorganize into subsections, contents at top
--  ref-manual: remove reference to largefile in DISTRO_FEATURES
+-  ref-manual: remove reference to largefile in :term:`DISTRO_FEATURES`
 -  ref-manual: remove reference to testimage-auto class
 -  ref-manual: system-requirements: Ubuntu 22.04 now supported
 -  ref-manual: tasks.rst: add reference to the "do_image_complete" task
@@ -163,7 +163,7 @@ Fixes in Yocto-4.1.1
 -  ref-manual: tasks.rst: add reference to the "do_validate_branches" task
 -  ref-manual: tasks.rst: add references to the "do_cleansstate" task
 -  ref-manual: update buildpaths QA check documentation
--  ref-manual: update pypi documentation for CVE_PRODUCT default in 4.1
+-  ref-manual: update pypi documentation for :term:`CVE_PRODUCT` default in 4.1
 -  ref-manual: variables.rst: add reference to "do_populate_lic" task
 -  release-notes-4.1.rst remove bitbake-layers subcommand argument
 -  runqemu: Do not perturb script environment
@@ -183,8 +183,8 @@ Fixes in Yocto-4.1.1
 -  uboot-sign: Fix using wrong KEY_REQ_ARGS
 -  Update documentation for classes split
 -  vim: upgrade to 9.0.0820
--  vulkan-samples: add lfs=0 to SRC_URI to avoid git smudge errors in do_unpack
--  wic: honor the SOURCE_DATE_EPOCH in case of updated fstab
+-  vulkan-samples: add lfs=0 to :term:`SRC_URI` to avoid git smudge errors in do_unpack
+-  wic: honor the :term:`SOURCE_DATE_EPOCH` in case of updated fstab
 -  wic: swap partitions are not added to fstab
 -  wpebackend-fdo: upgrade 1.12.1 -> 1.14.0
 -  xserver-xorg: move some recommended dependencies in required
diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index 60402b6588..4ffcb7d6f0 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -81,7 +81,7 @@ New Features / Enhancements in 4.1
    - linux-yocto: Enable mdio for qemu
    - linux-yocto/5.15: base: enable kernel crypto userspace API
    - kern-tools: allow 'y' or 'm' to avoid config audit warnings
-   - kernel-yocto.bbclass: say what SRC_URI entry is being dropped
+   - kernel-yocto.bbclass: say what :term:`SRC_URI` entry is being dropped
    - kernel.bbclass: Do not overwrite recipe's custom postinst
    - kmod: Enable xz support by default
    - Run depmod(wrapper) against each compiled kernel when multiple kernels are enabled
@@ -117,7 +117,7 @@ New Features / Enhancements in 4.1
      configuration to a ``write_ubi_config`` function that can be easily overridden
 
 - openssh: add support for config snippet includes to ssh and sshd
-- :ref:`create-spdx <ref-classes-create-spdx>`: Add ``SPDX_PRETTY`` option
+- :ref:`create-spdx <ref-classes-create-spdx>`: Add :term:`SPDX_PRETTY` option
 - wpa-supplicant: build static library if not disabled via :term:`DISABLE_STATIC`
 - wpa-supplicant: package dynamic modules
 - openssl: extract legacy provider module to a separate package
@@ -170,7 +170,7 @@ New Features / Enhancements in 4.1
 - meson: provide relocation script and native/cross wrappers also for meson-native
 - meson.bbclass: add cython binary to cross/native toolchain config
 - New ``musl-locales`` recipe to provide a limited set of locale data for musl based systems
-- gobject-introspection: use ``OBJDUMP`` environment variable so that objdump tool can be picked up from the environment
+- gobject-introspection: use :term:`OBJDUMP` environment variable so that objdump tool can be picked up from the environment
 - The Python ``zoneinfo`` module is now split out to its own ``python3-zoneinfo`` package.
 - busybox: added devmem 128-bit support
 - vim: split xxd out into its own package
@@ -211,7 +211,7 @@ Known Issues in 4.1
 Recipe License changes in 4.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The following corrections have been made to the LICENSE values set by recipes:
+The following corrections have been made to the :term:`LICENSE` values set by recipes:
 
 - alsa-state: add GPL-2.0-or-later because of alsa-state-init file
 - git: add GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.0 & LGPL-2.1-or-later due to embedded code
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 562f460c33..d2edfc3427 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -582,8 +582,7 @@ module.
 .. note::
 
    For information on how to have the OpenEmbedded build system generate
-   tarballs for Git repositories and place them in the
-   DL_DIR
+   tarballs for Git repositories and place them in the :term:`DL_DIR`
    directory, see the :term:`BB_GENERATE_MIRROR_TARBALLS`
    variable in the Yocto Project Reference Manual.
 
@@ -1122,8 +1121,7 @@ checksum <overview-manual/concepts:checksums (signatures)>`.
 
 .. note::
 
-   This naming scheme assumes that
-   BB_SIGNATURE_HANDLER
+   This naming scheme assumes that :term:`BB_SIGNATURE_HANDLER`
    is "OEBasicHash", which is almost always the case in current
    OpenEmbedded.
 
diff --git a/documentation/profile-manual/intro.rst b/documentation/profile-manual/intro.rst
index e9208dfde8..93f8429ee3 100644
--- a/documentation/profile-manual/intro.rst
+++ b/documentation/profile-manual/intro.rst
@@ -38,7 +38,7 @@ an 'sdk' image e.g. ::
 
    $ bitbake core-image-sato-sdk
 
-or alternatively by adding 'tools-profile' to the EXTRA_IMAGE_FEATURES line in
+or alternatively by adding 'tools-profile' to the :term:`EXTRA_IMAGE_FEATURES` line in
 your local.conf::
 
    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile"
@@ -65,7 +65,7 @@ If you've already built a stripped image, you can generate debug
 packages (xxx-dbg) which you can manually install as needed.
 
 To generate debug info for packages, you can add dbg-pkgs to
-EXTRA_IMAGE_FEATURES in local.conf. For example::
+:term:`EXTRA_IMAGE_FEATURES` in local.conf. For example::
 
    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile dbg-pkgs"
 
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 01fbde1411..1e31019897 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1896,7 +1896,7 @@ manual, and boot the resulting target image.
 .. note::
 
    If you have a :term:`Build Directory` containing multiple machines, you need
-   to have the MACHINE you're connecting to selected in local.conf, and
+   to have the :term:`MACHINE` you're connecting to selected in local.conf, and
    the kernel in that machine's :term:`Build Directory` must match the kernel on
    the booted system exactly, or you'll get the above 'crosstap' message
    when you try to invoke a script.
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9f8593831f..de5f108fb1 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1395,12 +1395,12 @@ generation.
 ===========================
 
 The :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class provides support to pack a kernel image,
-device trees, a U-boot script, a Initramfs bundle and a RAM disk
+device trees, a U-boot script, a :term:`Initramfs` bundle and a RAM disk
 into a single FIT image. In theory, a FIT image can support any number
-of kernels, U-boot scripts, Initramfs bundles, RAM disks and device-trees.
+of kernels, U-boot scripts, :term:`Initramfs` bundles, RAM disks and device-trees.
 However, :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` currently only supports
 limited usecases: just one kernel image, an optional U-boot script,
-an optional Initramfs bundle, an optional RAM disk, and any number of
+an optional :term:`Initramfs` bundle, an optional RAM disk, and any number of
 device tree.
 
 To create a FIT image, it is required that :term:`KERNEL_CLASSES`
@@ -1431,14 +1431,14 @@ is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
 :term:`INITRAMFS_IMAGE` is specified and that :term:`INITRAMFS_IMAGE_BUNDLE`
 is set to 0.
 
-Only a single Initramfs bundle can be added to the FIT image created by
-:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the Initramfs bundle in FIT is optional.
-In case of Initramfs, the kernel is configured to be bundled with the root filesystem
+Only a single :term:`Initramfs` bundle can be added to the FIT image created by
+:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the :term:`Initramfs` bundle in FIT is optional.
+In case of :term:`Initramfs`, the kernel is configured to be bundled with the root filesystem
 in the same binary (example: zImage-initramfs-:term:`MACHINE`.bin).
-When the kernel is copied to RAM and executed, it unpacks the Initramfs root filesystem.
-The Initramfs bundle can be enabled when :term:`INITRAMFS_IMAGE`
+When the kernel is copied to RAM and executed, it unpacks the :term:`Initramfs` root filesystem.
+The :term:`Initramfs` bundle can be enabled when :term:`INITRAMFS_IMAGE`
 is specified and that :term:`INITRAMFS_IMAGE_BUNDLE` is set to 1.
-The address where the Initramfs bundle is to be loaded by U-boot is specified
+The address where the :term:`Initramfs` bundle is to be loaded by U-boot is specified
 by :term:`UBOOT_LOADADDRESS` and the entrypoint by :term:`UBOOT_ENTRYPOINT`.
 
 Only a single U-boot boot script can be added to the FIT image created by
diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index d52b39f3cf..9358acc953 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -20,7 +20,7 @@ image you want.
    file before using the BitBake command to build the minimal or base
    image::
 
-           1. Comment out the EXTRA_IMAGE_FEATURES line
+           1. Comment out the :term:`EXTRA_IMAGE_FEATURES` line
            2. Set INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0* AGPL-3.0*"
 
 
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 1a768aac93..798d4be4cf 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -602,7 +602,7 @@ Errors and Warnings
 
     GitHub provides "archive" tarballs, however these can be re-generated
     on the fly and thus the file's signature will not necessarily match that
-    in the SRC_URI checksums in future leading to build failures. It is
+    in the :term:`SRC_URI` checksums in future leading to build failures. It is
     recommended that you use an official release tarball or switch to
     pulling the corresponding revision in the actual git repository instead.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0435f88347..99100498b7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3922,7 +3922,7 @@ system and gives an overview of their function and contents.
       This kind of mechanism is typically used for two reasons:
 
       -  For booting the same kernel binary on multiple systems requiring
-         different device drivers. The Initramfs image is then customized
+         different device drivers. The :term:`Initramfs` image is then customized
 	 for each type of system, to include the specific  kernel modules
          necessary to access the final root filesystem. This technique
 	 is used on all GNU / Linux distributions for desktops and servers.
@@ -6456,7 +6456,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          A recipe's own recipe name (:term:`PN`) is always implicitly prepended
-         to `PROVIDES`, so while using "+=" in the above example may not be
+         to :term:`PROVIDES`, so while using "+=" in the above example may not be
          strictly necessary it is recommended to avoid confusion.
 
       In addition to providing recipes under alternate names, the
@@ -7772,7 +7772,7 @@ system and gives an overview of their function and contents.
       prevented the reuse of prebuilt artifacts stored in the Shared
       State Cache.
 
-      ``SSTATE_EXCLUDEDEPS_SYSROOT`` is evaluated as two regular
+      :term:`SSTATE_EXCLUDEDEPS_SYSROOT` is evaluated as two regular
       expressions of recipe and dependency to ignore. An example
       is the rule in :oe_git:`meta/conf/layer.conf </meta/conf/layer.conf>`::
 
@@ -8254,7 +8254,7 @@ system and gives an overview of their function and contents.
          SYSTEMD_SERVICE:${PN} = "connman.service"
 
       The package overrides that can be specified are directly related to the value of
-      term:`SYSTEMD_PACKAGES`. Overrides not included in term:`SYSTEMD_PACKAGES`
+      :term:`SYSTEMD_PACKAGES`. Overrides not included in :term:`SYSTEMD_PACKAGES`
       will be silently ignored.
 
    :term:`SYSVINIT_ENABLED_GETTYS`
@@ -8765,7 +8765,7 @@ system and gives an overview of their function and contents.
       :doc:`/sdk-manual/index` manual.
 
       Note that this variable applies to building an SDK, not an eSDK,
-      in which case the term:`TOOLCHAIN_HOST_TASK_ESDK` setting should be
+      in which case the :term:`TOOLCHAIN_HOST_TASK_ESDK` setting should be
       used instead.
 
    :term:`TOOLCHAIN_HOST_TASK_ESDK`
@@ -9417,7 +9417,7 @@ system and gives an overview of their function and contents.
       -  :term:`MULTIMACH_TARGET_SYS`: The target system identifier
       -  :term:`PN`: The recipe name
       -  :term:`EXTENDPE`: The epoch --- if :term:`PE` is not specified, which
-         is usually the case for most recipes, then `EXTENDPE` is blank.
+         is usually the case for most recipes, then :term:`EXTENDPE` is blank.
       -  :term:`PV`: The recipe version
       -  :term:`PR`: The recipe revision
 
@@ -9453,7 +9453,7 @@ system and gives an overview of their function and contents.
       On systems where many tasks run in parallel, setting a limit to this
       can be helpful in controlling system resource usage.
 
-    :term:`XZ_MEMLIMIT`
+   :term:`XZ_MEMLIMIT`
       Specifies the maximum memory the xz compression should use as a percentage
       of system memory. If unconstrained the xz compressor can use large amounts of
       memory and become problematic with parallelism elsewhere in the build.
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index dfd51bda1c..45ad54fd76 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -73,8 +73,7 @@ adjustments:
 
    .. note::
 
-      The default value of
-      ESDK_CLASS_INHERIT_DISABLE
+      The default value of :term:`ESDK_CLASS_INHERIT_DISABLE`
       is set using the "?=" operator. Consequently, you will need to
       either define the entire list by using the "=" operator, or you
       will need to append a value using either ":append" or the "+="
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 9afe108396..2d75e141f1 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -512,14 +512,14 @@ workers, consider the following:
 
 **Running "cleanall" is not permitted.**
 
-This can delete files from DL_DIR which would potentially break other
-builds running in parallel. If this is required, DL_DIR must be set to
+This can delete files from :term:`DL_DIR` which would potentially break other
+builds running in parallel. If this is required, :term:`DL_DIR` must be set to
 an isolated directory.
 
 **Running "cleansstate" is not permitted.**
 
-This can delete files from SSTATE_DIR which would potentially break
-other builds running in parallel. If this is required, SSTATE_DIR must
+This can delete files from :term:`SSTATE_DIR` which would potentially break
+other builds running in parallel. If this is required, :term:`SSTATE_DIR` must
 be set to an isolated directory. Alternatively, you can use the "-f"
 option with the ``bitbake`` command to "taint" tasks by changing the
 sstate checksums to ensure sstate cache items will not be reused.
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 61127de23c..2a2f7790d2 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -71,7 +71,7 @@ things we do within the build system to ensure reproducibility include:
 .. note::
 
    Because of an open bug in GCC, using ``DISTRO_FEATURES:append = " lto"`` or
-   adding ``-flto`` (Link Time Optimization) to ``CFLAGS`` makes the resulting
+   adding ``-flto`` (Link Time Optimization) to :term:`CFLAGS` makes the resulting
    binary non-reproducible, in that it depends on the full absolute build path
    to ``recipe-sysroot-native``, so installing the Yocto Project in a different
    directory results in a different binary.
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index 70ec4535f5..bfdc678164 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -170,7 +170,7 @@ the system can checkout repositories.
 Shared DL_DIR
 -------------
 
-The Workers are all connected over NFS which allows DL_DIR to be shared
+The Workers are all connected over NFS which allows :term:`DL_DIR` to be shared
 between them. This reduces network accesses from the system and allows
 the build to be sped up. Usage of the directory within the build system
 is designed to be able to be shared over NFS.
-- 
2.37.2


