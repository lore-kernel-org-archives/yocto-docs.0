Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAD4C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 13:30:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.20455.1682602221303230531
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 06:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PkqNBbkz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8AEBF1BF20F;
	Thu, 27 Apr 2023 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682602218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vq9L5WTUGaXZ3XOLfyAkMOK7P+heKFERKc6OjkG7Sx4=;
	b=PkqNBbkz0bBie/QLLs20uJk3Id8235vreL6oVy0LlEfxtiMX9wU6jcdhnM6EMdjystux9b
	fQrBFkRSCPy5XyDLypmQv8M/VnrccBiHbxC96+6sjKgEli7ecZN3ZvLHqgEmavxo0BM1TL
	P5w6vpCJEa4lQKvBOAB5AzDykxQHHHOPRsaw8AnvT8VvpgJ4kN+kC3fP3cSTA0KbFnwlBq
	VLV7IGedcPcbtvX+6BuLlLRA6c77p+2usuFV863IrRbWz0I3xqj6SnF3WZEQ5CpjumYkOu
	PfIIBF0uDL2MPZuvgLVdcTzkKVa6MJw86GZtyb1+CGJWHIcCAlibkxDbL+POkQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: fixes and improvements to 4.2 release notes
Date: Thu, 27 Apr 2023 15:30:14 +0200
Message-Id: <20230427133014.40920-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Apr 2023 13:30:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3874

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Remove empty subsections (detailed elsewhere)
- Fix bullet list syntax (missing leading empty line)
- Fix a few CVE URLs
- Add some references
- Minor font and case fixes

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/release-notes-4.2.rst    | 158 ++++++++----------
 1 file changed, 72 insertions(+), 86 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index 6f7ff03e1b..30a4afeebb 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -39,12 +39,6 @@ New Features / Enhancements in 4.2
       :wikipedia:`LoongArch <Loongson#LoongArch>`
       (``loongarch64``) architecture, though there is no testing for it yet.
 
--  Kernel-related enhancements:
-
--  QEMU/runqemu enhancements:
-
--  Image-related enhancements:
-
 -  New variables:
 
    -  :term:`VOLATILE_TMP_DIR` allows to specify
@@ -68,13 +62,13 @@ New Features / Enhancements in 4.2
    -  Enabled building Rust for baremetal targets
 
    -  You can now also easily select to build beta or nightly
-      versions of rust with a new :term:`RUST_CHANNEL` variable
+      versions of Rust with a new :term:`RUST_CHANNEL` variable
       (use at own risk)
 
-   -  Support for local github repos in :term:`SRC_URI` as
-      replacements for cargo dependencies
+   -  Support for local GitHub repos in :term:`SRC_URI` as
+      replacements for Cargo dependencies
 
-   -  Use built-in rust targets for -native builds to save several
+   -  Use built-in Rust targets for ``-native`` builds to save several
       minutes building the Rust toolchain
 
 -  Python 3.8+ and GCC 8.0+ are now the minimum required versions on the build host
@@ -108,7 +102,7 @@ New Features / Enhancements in 4.2
 
    -  go: add support to build on ppc64le
    -  rust: rustfmt now working and installed for riscv32
-   -  libpng: enable NEON for aarch64 to enensure consistency with arm32.
+   -  libpng: enable NEON for aarch64 to ensure consistency with arm32.
    -  baremetal-helloworld: Enable x86 and x86-64 ports
 
 -  Kernel-related enhancements:
@@ -138,11 +132,11 @@ New Features / Enhancements in 4.2
 
    -  Set ``QB_SMP`` with ?= to make it easier to modify
    -  Set ``QB_CPU`` with ?= to make it easier to modify (x86 configuration only)
-   -  New ``QB_NFSROOTFS_EXTRA_OPT`` to allow extra options to be appended to the nfs rootfs options in kernel boot args, e.g. ``"wsize=4096,rsize=4096"``
+   -  New ``QB_NFSROOTFS_EXTRA_OPT`` to allow extra options to be appended to the NFS rootfs options in kernel boot args, e.g. ``"wsize=4096,rsize=4096"``
    -  New ``QB_SETUP_CMD`` and ``QB_CLEANUP_CMD`` to enable running custom shell setup and cleanup commands before and after QEMU.
    -  ``QB_DEFAULT_KERNEL`` now defaults to pick the bundled initramfs kernel image if the Linux kernel image is generated with :term:`INITRAMFS_IMAGE_BUNDLE` set to "1"
    -  Split out the QEMU guest agent to its own ``qemu-guest-agent`` package
-   -  runqemu: new "guestagent" option to enable communication with the guest agent
+   -  runqemu: new ``guestagent`` option to enable communication with the guest agent
    -  runqemu: respect :term:`IMAGE_LINK_NAME` when searching for image
 
 -  Image-related enhancements:
@@ -152,10 +146,10 @@ New Features / Enhancements in 4.2
 
 -  wic Image Creator enhancements:
 
-   -  bootimg-efi: add support for directly loading Linux kernel UEFI stub
-   -  bootimg-efi: implement --include-path
-   -  Allow usage of fstype=none to specify an unformatted partition
-   -  Implement repeatable disk identifiers based on SOURCE_DATE_EPOCH
+   -  ``bootimg-efi.py``: add support for directly loading Linux kernel UEFI stub
+   -  ``bootimg-efi.py``: implement ``--include-path``
+   -  Allow usage of ``fstype=none`` to specify an unformatted partition
+   -  Implement repeatable disk identifiers based on :term:`SOURCE_DATE_EPOCH`
 
 -  FIT image related improvements:
 
@@ -179,7 +173,7 @@ New Features / Enhancements in 4.2
       - ``unifdef``
 
    -  New :term:`SDK_ZIP_OPTIONS` variable to enable passing additional options to the zip command when preparing the SDK zip archive
-   -  New Rust SDK target packagegroup (packagegroup-rust-sdk-target)
+   -  New Rust SDK target packagegroup (``packagegroup-rust-sdk-target``)
 
 -  Testing:
 
@@ -220,13 +214,12 @@ New Features / Enhancements in 4.2
    -  ptest support added to ``bc``, ``cpio`` and ``gnutls``, and fixes made to
       ptests in numerous other recipes.
 
-   -  ``ptest-runner`` now adds a non-root "ptest" user for tests to run as
+   -  ``ptest-runner`` now adds a non-root "ptest" user to run tests.
 
-   -  resulttool: add a --list-ptest option to the log subcommand to list ptest names
+   -  ``resulttool``: add a ``--list-ptest`` option to the log subcommand to list ptest names
       in a results file
 
-   -  resulttool: regression: add metadata filtering for oeselftest
-
+   -  ``resulttool``: regression: add metadata filtering for oeselftest
 
 -  New :term:`PACKAGECONFIG` options in the following recipes:
 
@@ -263,30 +256,30 @@ New Features / Enhancements in 4.2
 
 -  Utility script changes:
 
-   -  devtool: ignore patch-fuzz errors when extracting source in order to enable fixing fuzz issues
-   -  oe-setup-layers: Make efficiently idempotent
-   -  oe-setup-layers: print a note about submodules if present
-   -  New buildstats-summary script to show a summary of the buildstats data
-   -  report-error: catch Nothing PROVIDES error
-   -  combo-layer: add sync-revs command
-   -  scripts: convert-overrides: Allow command-line customizations
+   -  ``devtool``: ignore patch-fuzz errors when extracting source in order to enable fixing fuzz issues
+   -  ``oe-setup-layers``: make efficiently idempotent
+   -  ``oe-setup-layers``: print a note about submodules if present
+   -  New ``buildstats-summary`` script to show a summary of the buildstats data
+   -  :ref:`ref-classes-report-error` class: catch ``Nothing PROVIDES`` error
+   -  ``combo-layer``: add ``sync-revs`` command
+   -  ``convert-overrides``: allow command-line customizations
 
 -  bitbake-layers improvements:
 
-   -  layerindex-fetch: checkout layer(s) branch when clone exists
-   -  create: add -a/--add-layer option to add layer to bblayers.conf after creating layer
-   -  show-layers: improve output layout
+   -  ``layerindex-fetch``: checkout layer(s) branch when clone exists
+   -  ``create``: add ``-a``/``--add-layer option`` to add layer to ``bblayers.conf`` after creating layer
+   -  ``show-layers``: improve output layout
 
 -  Other BitBake improvements:
 
-   -  Inline python snippets can now include dictionary expressions
+   -  Inline Python snippets can now include dictionary expressions
    -  Evaluate the value of export/unexport/network flags so that they can be reset to "0"
    -  Make :term:`EXCLUDE_FROM_WORLD` boolean so that it can be reset to "0"
-   -  Support int values in bb.utils.to_boolean() in addition to strings
-   -  bitbake-getvar: Add a quiet command line argument
-   -  Allow the '@' character in variable flag names
+   -  Support int values in ``bb.utils.to_boolean()`` in addition to strings
+   -  ``bitbake-getvar``: Add a ``quiet`` command line argument
+   -  Allow the ``@`` character in variable flag names
    -  Python library code will now be included when calculating task hashes
-   -  fetch2/npmsw: add more short forms for git operations
+   -  ``fetch2/npmsw``: add more short forms for git operations
    -  Display a warning when ``SRCREV = "${AUTOREV}"`` is set too late to be effective
    -  Display all missing :term:`SRC_URI` checksums at once
    -  Improve error message for a missing multiconfig
@@ -295,20 +288,22 @@ New Features / Enhancements in 4.2
 
 -  Packaging changes:
 
-   -  rng-tools is no longer recommended by openssh, and the rng-tools service files have been split out to their own package
-   -  linux-firmware: split rtl8761 and amdgpu firmware
-   -  linux-firmware: add new fw file to ${PN}-qcom-adreno-a530
-   -  iproute2: separate routel and add python dependency
-   -  xinetd: move xconv.pl script to separate package
-   -  perf: Enable debug/source packaging
+   -  ``rng-tools`` is no longer recommended by ``openssh``, and the ``rng-tools``
+      service files have been split out to their own package
+   -  ``linux-firmware``: split ``rtl8761`` and ``amdgpu`` firmware
+   -  ``linux-firmware``: add new firmware file to ``${PN}-qcom-adreno-a530``
+   -  ``iproute2``: separate ``routel`` and add Python dependency
+   -  ``xinetd``: move ``xconv.pl`` script to separate package
+   -  ``perf``: enable debug/source packaging
 
 -  Miscellaneous changes:
 
    -  Supporting 64 bit dates on 32 bit platforms: several packages have been
-      updated to pass Y2038 tests, and a QA check for 32 bit time and file
+      updated to pass year 2038 tests, and a QA check for 32 bit time and file
       offset functions has been added (default off)
 
    -  Patch fuzz/Upstream-Status checking has been reworked:
+
       -  Upstream-Status checking is now configurable from :term:`WARN_QA`/:term:`ERROR_QA` (``patch-status-core``)
       -  Can now be enabled for non-core layers (``patch-status-noncore``)
       -  ``patch-fuzz`` is now in :term:`ERROR_QA` by default, and actually stops the build
@@ -318,54 +313,50 @@ New Features / Enhancements in 4.2
    -  New :term:`VOLATILE_TMP_DIR` variable allows to specify whether ``/tmp``
       should be on persistent storage or in RAM.
 
-   -  vulkan-loader: Allow headless targets to build the loader
-   -  dhcpcd: fix to work with systemd
-   -  u-boot: Add /boot to :term:`SYSROOT_DIRS` to allow boot files to be used by other recipes
-   -  linux-firmware: don't put the firmware into the sysroot
-   -  cups: add :term:`PACKAGECONFIG` to control web interface and default to off
-   -  buildtools-tarball: export certificates to python and curl
-   -  yocto-check-layer: Allow OE-Core to be tested
-   -  yocto-check-layer: check for patch file upstream status
-   -  boost: enable building Boost.URL library
-   -  native: Drop special variable handling
-   -  poky: make it easier to set :term:`INIT_MANAGER` from local.conf
-   -  create-spdx: Add support for custom Annotations
-   -  create-spdx: Report downloads as separate packages
-   -  create-spdx: Removed the top-level image SPDX file and the JSON index file from :term:`DEPLOYDIR` to avoid confusion
-   -  os-release: replace ``DISTRO_CODENAME`` with ``VERSION_CODENAME`` (still set from :term:`DISTRO_CODENAME`)
-   -  weston: Add kiosk shell
-   -  overlayfs: Allow unused mount points
-   -  sstatesig: emit more helpful error message when not finding sstate manifest
-   -  pypi.bbclass: Set :term:`SRC_URI` downloadfilename with an optional prefix
-   -  poky-bleeding: Update and rework
-   -  package.bbclass: check if package names conflict via PKG:${PN} override in do_package
-   -  cve-update-nvd2-native: new NVD CVE database fetcher using the 2.0 API
-   -  mirrors.bbclass: use shallow tarball for binutils-native/nativesdk-binutils
-   -  meta/conf: move default configuration templates into meta/conf/templates/default
-   -  binutils: Enable --enable-new-dtags as per many Linux distributions
-   -  base-files: Drop localhost.localdomain from hosts file as per many Linux distributions
-   -  packagegroup-core-boot: make init-ifupdown package a recommendation
-
+   -  ``vulkan-loader``: allow headless targets to build the loader
+   -  ``dhcpcd``: fix to work with systemd
+   -  ``u-boot``: add /boot to :term:`SYSROOT_DIRS` to allow boot files to be used by other recipes
+   -  ``linux-firmware``: don't put the firmware into the sysroot
+   -  ``cups``: add :term:`PACKAGECONFIG` to control web interface and default to off
+   -  ``buildtools-tarball``: export certificates to python and curl
+   -  ``yocto-check-layer``: allow OE-Core to be tested
+   -  ``yocto-check-layer``: check for patch file upstream status
+   -  ``boost``: enable building ``Boost.URL`` library
+   -  ``native``: drop special variable handling
+   -  Poky: make it easier to set :term:`INIT_MANAGER` from local.conf
+   -  :ref:`ref-classes-create-spdx`: add support for custom annotations (:term:`SPDX_CUSTOM_ANNOTATION_VARS`)
+   -  :ref:`ref-classes-create-spdx`: report downloads as separate packages
+   -  :ref:`ref-classes-create-spdx`: remove the top-level image SPDX file and the JSON index file from :term:`DEPLOYDIR` to avoid confusion
+   -  ``os-release``: replace ``DISTRO_CODENAME`` with ``VERSION_CODENAME`` (still set from :term:`DISTRO_CODENAME`)
+   -  ``weston``: add kiosk shell
+   -  :ref:`ref-classes-overlayfs`: Allow unused mount points
+   -  ``sstatesig``: emit more helpful error message when not finding sstate manifest
+   -  :ref:`ref-classes-pypi`.bbclass: Set :term:`SRC_URI` downloadfilename with an optional prefix
+   -  ``poky-bleeding`` distro: update and rework
+   -  :ref:`package.bbclass <ref-classes-package>`: check if package names conflict via ``PKG:${PN}`` override in :ref:`do_package <ref-tasks-package>`
+   -  ``cve-update-nvd2-native``: new NVD CVE database fetcher using the 2.0 API
+   -  :ref:`ref-classes-mirrors` class: use shallow tarball for ``binutils-native``/``nativesdk-binutils``
+   -  ``meta/conf``: move default configuration templates into ``meta/conf/templates/default``
+   -  ``binutils``: enable ``--enable-new-dtags`` as per many Linux distributions
+   -  ``base-files``: drop ``localhost.localdomain`` from hosts file as per many Linux distributions
+   -  ``packagegroup-core-boot``: make ``init-ifupdown`` package a recommendation
 
 Known Issues in 4.2
 ~~~~~~~~~~~~~~~~~~~
 
-
 Recipe License changes in 4.2
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The following corrections have been made to the :term:`LICENSE` values set by recipes:
 
-- curl: set :term:`LICENSE` appropriately to "curl" as it is a special derivative of the MIT/X license, not exactly that license.
-- libgit2: added Zlib, ISC, LGPL-2.1-or-later and CC0-1.0 to :term:`LICENSE` covering portions of the included code.
-- linux-firmware: set package :term:`LICENSE` appropriately for all qcom packages
-
-
+- ``curl``: set :term:`LICENSE` appropriately to ``curl`` as it is a special derivative of the MIT/X license, not exactly that license.
+- ``libgit2``: added ``Zlib``, ``ISC``, ``LGPL-2.1-or-later`` and ``CC0-1.0`` to :term:`LICENSE` covering portions of the included code.
+- ``linux-firmware``: set package :term:`LICENSE` appropriately for all qcom packages
 
 Security Fixes in 4.2
 ~~~~~~~~~~~~~~~~~~~~~
 
-- binutils: :cve:`2022-4285`, :cve:`2023-25586`
+- binutils: :cve:`2022-4285`, `CVE-2023-25586 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-25586>`__
 - curl: :cve:`2022-32221`, :cve:`2022-35260`, :cve:`2022-42915`, :cve:`2022-42916`
 - epiphany: :cve:`2023-26081`
 - expat: :cve:`2022-43680`
@@ -373,7 +364,7 @@ Security Fixes in 4.2
 - git: :cve:`2022-39260`, :cve:`2022-41903`, :cve:`2022-23521`, :cve:`2022-41953` (ignored)
 - glibc: :cve:`2023-25139` (ignored)
 - go: :cve:`2023-24532`, :cve:`2023-24537`
-- grub2: :cve:`2022-2601`, :cve:`2022-3775`, :cve:`2022-28736`
+- grub2: :cve:`2022-2601`, :cve:`2022-3775`, `CVE-2022-28736 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-28736>`__
 - inetutils: :cve:`2019-0053`
 - less: :cve:`2022-46663`
 - libarchive: :cve:`2022-36227`
@@ -385,7 +376,7 @@ Security Fixes in 4.2
 - openssl: :cve:`2022-3358`, :cve:`2022-3786`, :cve:`2022-3602`, :cve:`2022-3996`, :cve:`2023-0286`, :cve:`2022-4304`, :cve:`2022-4203`, :cve:`2023-0215`, :cve:`2022-4450`, :cve:`2023-0216`, :cve:`2023-0217`, :cve:`2023-0401`, :cve:`2023-0464`
 - ppp: :cve:`2022-4603`
 - python3-cryptography{-vectors}: :cve:`2022-3602`, :cve:`2022-3786`, :cve:`2023-23931`
-- python3: :cve:`2022-37460`
+- python3: `CVE-2022-37460 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-37460>`__
 - qemu: :cve:`2022-3165`
 - rust: :cve:`2022-46176`
 - rxvt-unicode: :cve:`2022-4170`
@@ -399,7 +390,6 @@ Security Fixes in 4.2
 - xdg-utils: :cve:`2022-4055`
 - xserver-xorg: :cve:`2022-3550`, :cve:`2022-3551`, :cve:`2023-1393`, :cve:`2023-0494`, :cve:`2022-3553` (ignored)
 
-
 Recipe Upgrades in 4.2
 ~~~~~~~~~~~~~~~~~~~~~~
 
@@ -758,9 +748,6 @@ Recipe Upgrades in 4.2
 - zlib: upgrade 1.2.12 -> 1.2.13
 - zstd: upgrade 1.5.2 -> 1.5.4
 
-
-
-
 Contributors to 4.2
 ~~~~~~~~~~~~~~~~~~~
 
@@ -944,4 +931,3 @@ Thanks to the following people who contributed to this release:
 - Zoltan Boszormenyi
 - 张忠山
 
-
-- 
2.34.1


