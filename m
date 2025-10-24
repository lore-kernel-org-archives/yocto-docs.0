Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20633CCF9EC
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.5043.1761294042890094323
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wlDDBh+l;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F2324E412CC
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 669AC60703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA177102F2487;
	Fri, 24 Oct 2025 10:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294041; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Wm8VVQqXeIi/u4OVlVpUQm4QLIDEcQnt/f5tOCuspp4=;
	b=wlDDBh+lxcWBWHFcXkFpHfILL4ZGV567vnq3ouQ1F0HWUAO61qz3q5vuFVZ1qvZSRNxTLm
	oYY00mc9UduZzC7SZPgMp/SfpjN9Bo1Y7jhO8UFyTvmgeV5omF3w9B8aDy34V2Hbn30z93
	EmsSn6yKd2E4sAhEYBfge6lPwAg3vmQ5e2KZpQSzAIWJrfksReQiAVwqjQvScDuoPU113A
	oLKMAxXItsWcn8i9S0935swOWGtpdhh6GDMlCK/2RT/FqnRxeuhLlULAZC0w8frA3LqNEv
	DhRBMS1iEwDcy4sHT5Gqp8jbmkrYk+5vk/oLeAsMlkLmDrcEdkpEynyE/riJpQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:20:05 +0200
Subject: [PATCH v2 16/16] migration-guides/release-notes-5.3: updates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-16-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=29173;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=W/oL5+lg57d05ELedwqNfCfjmQ7Ct4HzO16syRE82Cg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbKDi3qfaAwcX96JN8vnvaT7HuoahE/rR5xf
 L1ogW8VGWOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2ygAKCRDRgEFAKaOo
 Nl3qD/99RTUiZ6jfR02CHGIyY6tq+nPLP8azDLRja3W5aNCHwo0Mqx5d6x3T5KVXiQfXjJ0JXzt
 31LUKJsutok3elujPC28nKR4g2UbopEUUC4R/YfJawH+c5j9xvHR60oYlEP0xSVTWceo/Qoifio
 VxYgnNSlbfAWVpKfdKXOM16IASZS9orR6cTnCjFieo66mAvDURTD9Md0kHWmbh7JddMUX3H5+XH
 bKvKvj7c3m7SJ4TWEZBG4BqLNt98MbM/C5qI8m5Lh/zf3YdnYRA9Asds3P1UMJq7ZWoYyWJGpnN
 u2PmzyauJw49NaD6qJbtOy72wquHIY15/iRizciN5qMRd9ZsNUc2EXsXsqv5nGEYfveymwpPATV
 wJG6Zm8Ij+VMKSRXiOwH0W8zBAAyI70R38/JIuOyW9mk0Msf4Zm6Jk4zzWebDAaEW8JAvGjlnZ0
 6zXNPg5+k0arOhdRARAWf8wbSXa/VeG7I+4TdfcY19yoPkHQdPMDS8SSlh/9FY6dlCBRLjrDzZ9
 qRv7gUnasjTQ16vXIDTYZ8xpcVpOa8NDm3zWAq75a7B3ICEbhD6A83Ewpi97Jj5ZSft8KV4hgxC
 h4JbLOjrngftvAKkEudQCWi5rnbWrMshcbfKkO6ElvY8MjlUqpQ99Eqli+gg2Xs+HCXs2w/LVwZ
 yzC6disTIA5LjXA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7805

Update the release notes and migration manual for 5.3.

This covers commits from bd4625cd4db0 ("build-appliance-image: Update to
master head revision") to 4a1f38dd8db1 ("bitbake: knotty, uihelper:
Remove running_pids and lastpids") in Poky.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.3.rst   |  47 ++-
 .../migration-guides/release-notes-5.3.rst         | 331 +++++++++++++++++++--
 2 files changed, 355 insertions(+), 23 deletions(-)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 985712cb2..fc543c175 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -134,10 +134,20 @@ To set back the "mac" policy in systemd (version 257.8 at the time of writing
 this note), you should set the ``NamePolicy`` and ``AlternativeNamesPolicy`` as
 detailed in :manpage:`systemd.link(5)`.
 
+Removal of unlicensed Linux kernel firmwares
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+By default, the ``linux-firmware`` recipe now excludes firmwares that do not
+provide any license information. The recipe holds an internal list of firmwares
+to exclude via a variable named ``REMOVE_UNLICENSED``, this variable may be
+overridden if unlicensed firmware is needed. See :oe_git:`the recipe
+</openembedded-core/tree/meta/recipes-kernel/linux-firmware>` for a complete
+overview of the removed firmwares.
+
 Supported kernel versions
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
+The :term:`OLDEST_KERNEL` setting is 5.15 in this release, meaning that
 out the box, older kernels are not supported. See :ref:`4.3 migration notes
 <migration-4.3-supported-kernel-versions>` for details.
 
@@ -147,7 +157,9 @@ Supported distributions
 Compared to the previous releases, running BitBake is supported on new
 GNU/Linux distributions:
 
--  XXX
+-  Debian 13 (Trixie)
+-  Fedora 42
+-  Ubuntu 25.04
 
 On the other hand, some earlier distributions are no longer supported:
 
@@ -174,6 +186,10 @@ The following variables have been removed:
    :term:`BitBake` invocation and replace it with information about what was
    built during the build. This was partly broken and hard to maintain.
 
+-  ``GPE_MIRROR``: this variable used to contain the
+   "http://gpe.linuxtogo.org/download/source" URL, but was not used by any
+   recipe in OE-Core.
+
 Removed recipes
 ~~~~~~~~~~~~~~~
 
@@ -195,6 +211,11 @@ The following recipes have been removed in this release:
 -  ``xf86-input-vmmouse``: It has a runtime dependency on ``xf86-input-mouse``,
    which stopped supporting Linux.
 
+-  ``babeltrace``: Removed in favour of ``babeltrace2``.
+
+-  ``cwautomacros``: A long-obsolete set of custom :ref:`ref-classes-autotools`
+   macros, not used by any other recipe.
+
 Removed :term:`PACKAGECONFIG` entries
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -206,6 +227,8 @@ Removed :term:`PACKAGECONFIG` entries
 
 -  ``mesa``: ``kmsro``, ``osmesa``, ``xa``
 
+-  ``systemd``: ``dbus``
+
 Removed classes
 ~~~~~~~~~~~~~~~
 
@@ -269,4 +292,22 @@ Miscellaneous changes
 -  ``xserver-xorg``: remove sub-package ``${PN}-xwayland``, as ``xwayland`` is
    now its own recipe.
 
--  The Wic-specific option ``--extra-space`` has been renamed to ``--extra-filesystem-space``.
\ No newline at end of file
+-  ``gdk-pixbuf``: drop the ``GDK_PIXBUF_LOADERS`` variable, which was part of
+   the recipe's :term:`PACKAGECONFIG`. Instead the :term:`PACKAGECONFIG` can be
+   modified directly to achieve the same result.
+
+-  Remove the ``meta/conf/distro/include/distro_alias.inc`` include file,
+   which associated a recipe name to one or more Distribution package name.
+   This file is not used and maintained anymore.
+
+-  Remove the ``nghttp2-proxy`` package from the ``nghttp2`` recipe as the
+   ``nghttp2-proxy`` package became empty after an upgrade that makes it a
+   library recipe only (due to
+   :term:`EXTRA_OEMAKE` containing ``-DENABLE_APP=OFF`` by default in the
+   recipe).
+
+-  Remove the ``util-linux-fcntl-lock`` package (in the ``util-linux`` recipe) as
+   util-linux now supports the ``--fcntl`` flag for the ``flock`` command.
+
+   Recipes currently using the ``fcntl-lock`` command should replace these by
+   ``flock --fcntl``.
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index 417087e35..231fa6ba7 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -11,10 +11,21 @@ Release notes for |yocto-ver| (|yocto-codename|)
 New Features / Enhancements in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  Linux kernel XXX, gcc 15, glibc XXX, LLVM XXX, and over XXX other
+-  Linux kernel 6.16, gcc 15, glibc 2.42, LLVM 21.1.1, and over 300 other
    recipe upgrades.
 
--  Minimum Python version required on the host: XXX.
+-  Minimum Python version required on the host: 3.9.
+
+-  Host requirements changes:
+
+   -  The minimum disk space requirement is now 140Gbytes (previously 90Gbytes).
+
+   -  The minimum RAM requirement is now 32Gbytes (previously 8Gbytes).
+
+   -  These changes are mainly due to recent additions of the LLVM and other
+      such resource heavy recipes. For guidance on how to limit the resources
+      used by the :term:`OpenEmbedded Build System`, see the
+      :doc:`/dev-manual/limiting-resources` guide.
 
 -  BitBake changes:
 
@@ -36,10 +47,18 @@ New Features / Enhancements in |yocto-ver|
       -  ``az``: Add sanity check to check that :term:`AZ_SAS` starts with ``?``
          to mark the start of the query parameters.
 
-      -  ``git``: Add the tag to shallow clone tarball name.
+      -  ``git``:
+
+         -  Add the tag to shallow clone tarball name.
+         -  Verify if local clones contains a tag, when the ``tag=`` parameter
+            is used in :term:`SRC_URI`.
+
+   -  ``knotty``:
+
+      -  Pass failed task logs through the log infrastructure (use
+         ``bb.plain()`` instead of ``print()``).
 
-   -  ``knotty``: pass failed task logs through the log infrastructure (use
-      ``bb.plain()`` instead of ``print()``)
+      -  Improve refresh rate of the footer progress bar.
 
    -  Add support for automatically promoting class inherits to deferred
       inherits by listing them in the :term:`BB_DEFER_BBCLASSES` variable.
@@ -92,6 +111,17 @@ New Features / Enhancements in |yocto-ver|
       :term:`BitBake` to specify what to profile. Can be "main", "idle" or
       "parsing". Split the reports in separate files.
 
+   -  A "filtering" functionality was added and allows modifying the value of a
+      variable before its value is returned by :term:`BitBake`. The
+      ``setVarFilter`` API can be used for applying the filters, but it is
+      **not** recommended for general use. It was added for internal use in
+      the :term:`OpenEmbedded Build System` in the :ref:`ref-classes-native`
+      class. The list of filters that are allows are derived from a select
+      list of functions that must be added using a ``filter_proc`` decorator.
+
+   -  ``tests/parse``: Add tests for ``include``, ``require`` and
+      ``include_all``.
+
 -  Toolchain changes:
 
    -  The Clang/LLVM toolchain can now be used as part of the build.
@@ -106,6 +136,12 @@ New Features / Enhancements in |yocto-ver|
       The toolchain is also customizable on a per-recipe basis, using the
       :term:`TOOLCHAIN` and :term:`TOOLCHAIN_NATIVE` variables.
 
+      .. warning::
+
+         The :term:`TOOLCHAIN` should **not** be set globally. For overridding
+         the toolchain globally, use :term:`PREFERRED_TOOLCHAIN_TARGET`,
+         :term:`PREFERRED_TOOLCHAIN_NATIVE` and :term:`PREFERRED_TOOLCHAIN_SDK`.
+
    -  Multiple recipes were pinned to use the GCC/Binutils toolchain as they do
       not support being built with Clang/LLVM yet. In these recipes the
       :term:`TOOLCHAIN` variable is set to "gcc".
@@ -119,14 +155,42 @@ New Features / Enhancements in |yocto-ver|
    -  ``bitbake.conf``: Drop ``lz4`` from :term:`HOSTTOOLS`, as it is not
       required anymore, and the ``lz4-native`` package is used instead.
 
-   -  ``conf/fragments``: add a fragment for the CDN :ref:`sstate-cache
-      <overview-manual/concepts:shared state cache>` mirror.
+   -  :term:`Configuration Fragments <Configuration Fragment>`:
+
+      -  Add a fragment for the CDN :ref:`sstate-cache
+         <overview-manual/concepts:shared state cache>` mirror.
+
+      -  Add a ``show-fragments`` sub-command to the
+         :oe_git:`bitbake-config-build </bitbake/tree/bin/bitbake-config-build>`
+         utility, to show the content of fragments from command-line.
 
    -  ``default-distrovars``: set an empty default for :term:`LICENSE_PATH`.
 
    -  The default definition of :term:`UNPACKDIR` is no longer
       ``sources-unpack`` but ``sources``.
 
+   -  The default value for :term:`IMAGE_FSTYPES` (defined in
+      :oe_git:`bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`)
+      is now ``tar.zst`` (previously ``tar.gz``).
+
+   -  Remove the ``meta/conf/distro/include/distro_alias.inc`` include file,
+      which associated a recipe name to one or more Distribution package name.
+      This file is not used and maintained anymore.
+
+   -  A new configuration file :ref:`structure-build-conf-toolcfg.conf` is now
+      used by :oe_git:`bitbake-config-build </bitbake/tree/bin/bitbake-config-build>`
+      to manage :term:`Configuration Fragments <Configuration Fragment>`.
+
+   -  ``bitbake.conf``: add :term:`TMPDIR` to the ``GIT_CEILING_DIRECTORIES``
+      Git variable. This avoids Git trying to find a repository higher than
+      :term:`TMPDIR` in recipes that use the :ref:`structure-build-work-shared`
+      directory for storing their sources. This fixes reproducibility issues.
+
+   -  Changes to the ``genericarm64`` machine configuration:
+
+      -  Increase the :term:`Initramfs` maximum size.
+      -  Install extra Linux firmware packages to fix Linux kernel warnings.
+
 -  New variables:
 
    -  The ``VIRTUAL-RUNTIME_dbus`` variable, to allow changing the runtime
@@ -159,6 +223,11 @@ New Features / Enhancements in |yocto-ver|
       deployed filenames. Users can now override :term:`UBOOT_VERSION` to
       changes the output filenames.
 
+   -  The :term:`UBOOT_MAKE_OPTS` variable specifies extra options passed to
+      ``make`` when building U-boot. Extra options can also be passed as the
+      fourth argument of the :term:`UBOOT_CONFIG` variable. See the
+      documentation of :ref:`ref-classes-uboot-config` for more details.
+
 -  Kernel-related changes:
 
    -  ``linux/generate-cve-exclusions``: use data from CVEProject instead of
@@ -186,6 +255,8 @@ New Features / Enhancements in |yocto-ver|
    -  ``linux-yocto``: when built for RISC-V, enable features in
       :term:`KERNEL_FEATURES` based on features listed in :term:`TUNE_FEATURES`.
 
+   -  ``perf``: Enable ``coresight`` if enabled in :term:`MACHINE_FEATURES`.
+
 -  New core recipes:
 
    -  ``python3-pdm``, ``python3-pdm-backend`` and ``python3-pdm-build-locked``,
@@ -210,6 +281,13 @@ New Features / Enhancements in |yocto-ver|
       to code blocks in Sphinx. It is part of ``buildtools-docs-tarball`` for later
       use in the Yocto Project documentation.
 
+   -  ``python3-coherent-licensed``: License management tooling for Coherent
+      System and skeleton projects. It became a new dependency of
+      ``python3-zipp``.
+
+   -  ``gn``: a commonly used build tool to generate `ninja
+      <https://ninja-build.org/>`__ files.
+
    -  LLVM/Clang related recipes:
 
       -  ``clang``: LLVM based C/C++ compiler.
@@ -225,11 +303,15 @@ New Features / Enhancements in |yocto-ver|
       -  ``llvm-tblgen-native``: LLVM TableGen binaries for the build host,
          often used to build LLVM projects.
 
+      -  ``lld``: the LLVM Linker.
+
       -  ``lldb``: LLDB debugger for LLVM projects.
 
       -  ``llvm-project-source``: canonical git mirror of the LLVM subversion
          repository.
 
+      -  ``llvm``: The LLVM Compiler Infrastructure.
+
       -  ``openmp``: LLVM OpenMP compiler Runtime.
 
   -  ``kernel-signing-keys-native``: this recipe is used in the
@@ -242,6 +324,9 @@ New Features / Enhancements in |yocto-ver|
    -  ``glvnd``, which enables OpenGL Vendor Neutral Dispatch Library
       support when using recipes such as ``mesa``.
 
+   -  ``opencl``: support for the :wikipedia:`Open Machine Language (OpenCL)
+      <OpenCL>` framework.
+
 -  New core classes:
 
    -  The new :ref:`ref-classes-kernel-fit-image` class replaces the previous
@@ -255,6 +340,10 @@ New Features / Enhancements in |yocto-ver|
       maintain Go recipes that use a ``BPN-go-mods.inc`` and
       ``BPN-licenses.inc`` and update these files automatically.
 
+   -  The new :ref:`ref-classes-python_pdm` class supports building Python
+      recipes with the `PDM <https://pdm-project.org/>`__ package and dependency
+      manager.
+
 -  Architecture-specific changes:
 
    -  Rework the RISC-V :term:`TUNE_FEATURES` to make them based of the RISC-V
@@ -299,6 +388,16 @@ New Features / Enhancements in |yocto-ver|
       </openembedded-core/tree/meta/conf/machine/include/riscv/README>` for more
       information.
 
+   -  Add support for new Arm64 cores, which are represented as files to be
+      included in :term:`MACHINE` configuration in :term:`OpenEmbedded-Core
+      (OE-Core)`. The new configuration files are:
+
+      -  :oe_git:`conf/machine/include/arm/arch-armv8-7a.inc </openembedded-core/tree/meta/conf/machine/include/arm/arch-armv8-7a.inc>`
+      -  :oe_git:`conf/machine/include/arm/arch-armv8-8a.inc </openembedded-core/tree/meta/conf/machine/include/arm/arch-armv8-8a.inc>`
+      -  :oe_git:`conf/machine/include/arm/arch-armv9-1a.inc </openembedded-core/tree/meta/conf/machine/include/arm/arch-armv9-1a.inc>`
+      -  :oe_git:`conf/machine/include/arm/arch-armv9-2a.inc </openembedded-core/tree/meta/conf/machine/include/arm/arch-armv9-2a.inc>`
+      -  :oe_git:`conf/machine/include/arm/arch-armv9-3a.inc </openembedded-core/tree/meta/conf/machine/include/arm/arch-armv9-3a.inc>`
+
    -  ``arch-mips.inc``: Use ``-EB``/``-EL`` for denoting Endianness.
 
    -  Enable ``riscv32`` as supported arch for ``musl`` systems.
@@ -306,6 +405,15 @@ New Features / Enhancements in |yocto-ver|
    -  Powerpc: Use ``-maltivec`` in compiler flags if ``altivec`` is in
       :term:`TUNE_FEATURES`.
 
+   -  ``arm``: add a ``nocrypto`` feature to :term:`TUNE_FEATURES` to complement
+      the ``crypto`` feature to explicitly disable cryptographic extensions via
+      Gcc flags.
+
+      This lead to the creation of two new tunes:
+
+      -  ``tune-cortexa72-nocrypto``
+      -  ``tune-cortexa53-nocrypto``
+
 -  QEMU / ``runqemu`` changes:
 
    -  Refactor :ref:`ref-classes-qemu` functions into library functions (in
@@ -330,19 +438,40 @@ New Features / Enhancements in |yocto-ver|
       machine's CPU must also be recent enough to support these instructions
       natively.
 
-   -  ``runqemu`` can now run compressed images with snapshot mode. For example,
-      with ``IMAGE_FSTYPES = "... ext4.zst ..."``, you can run::
+   -  ``runqemu``:
+
+      -  The script can now run compressed images with snapshot mode. For
+         example, with ``IMAGE_FSTYPES = "... ext4.zst ..."``, you can run::
+
+            runqemu snapshot ext4.zst <image-recipe>
 
-         runqemu snapshot ext4.zst <image-recipe>
+      -  Add support for the ``erofs`` filesystem types.
+
+      -  The :term:`BitBake` environment is now a requirement, and the script
+         cannot run without a successful call to ``bitbake -e``.
+
+         The script will also raise an error with the ``bitbake`` command is not
+         found.
 
 -  Documentation changes:
 
+   -  Add documentation on :term:`Configuration Fragments <Configuration
+      Fragment>`:
+
+      -  :doc:`/ref-manual/fragments`
+      -  :doc:`/dev-manual/creating-fragments`
+
    -  Part of :term:`BitBake` internals are now documented at
       :yocto_docs:`/bitbake/bitbake-user-manual/bitbake-user-manual-library-functions.html`.
 
    -  A new :doc:`/dev-manual/limiting-resources` guide was created to help
-      users limit the host resources used by the :term:`OpenEmbedded Build
-      System`.
+      users limit the resources used by the :term:`OpenEmbedded Build System`.
+
+   -  A new :doc:`/dev-manual/hashequivserver` guide was created to help users
+      setting up a :ref:`overview-manual/concepts:Hash Equivalence` server.
+
+   -  The QA checks defined in the :term:`OpenEmbedded Build System` were
+      gathered in :doc:`/ref-manual/qa-checks`.
 
 -  Core library changes:
 
@@ -352,6 +481,9 @@ New Features / Enhancements in |yocto-ver|
 
 -  Go changes:
 
+   -  :ref:`ref-classes-go-mod-update-modules`: Update license finding to use
+      the new ``find_licenses_up`` library function.
+
 -  Rust changes:
 
    -  ``rust-llvm``:
@@ -362,6 +494,9 @@ New Features / Enhancements in |yocto-ver|
       -  Disable the following feature through configuration
          (:ref:`ref-tasks-configure`): libedit, benchmarks.
 
+   -  Add the ``has-thread-local`` option to the
+      :ref:`ref-classes-rust-target-config` class.
+
 -  Wic Image Creator changes:
 
    -  After a Python upgrade, WIC plugins containing dashes (``-``) for their
@@ -387,14 +522,32 @@ New Features / Enhancements in |yocto-ver|
          :term:`BitBake` variables. This directory is usually found in
          :term:`STAGING_DIR`.
 
-   - Add the Wic-specific option ``--extra-partiton-space`` to add extra empty
-     space after the space filled by the filesystem in the partition.
+   -  The Wic-specific option ``--extra-space`` is now also named
+      ``--extra-filesystem-space``.
+
+   -  Add the Wic-specific option ``--extra-partiton-space`` to add extra empty
+      space after the space filled by the filesystem in the partition.
+
+   -  ``bootimg_pcbios``: move Syslinux install into separate functions, to make
+      it easier to add new bootloaders.
+
+      The Grub bootloader is now possible to install with this Wic plugin.
 
 -  SDK-related changes:
 
    -  Include additional information about Meson setting in the SDK environment
       setup script (host system, CPU family, etc.).
 
+   -  Add Go to :term:`SDK_TOOLCHAIN_LANGS`, except for the following
+      architecture on which this is not supported:
+
+      -  RISC-V 32 bits (``rv32``)
+      -  PowerPC
+
+   -  Image-based SDKs can now include Zsh completions by adding the
+      ``zsh-completion-pkgs`` feature to the :term:`IMAGE_FEATURES` variable in
+      the image recipe.
+
 -  Testing-related changes:
 
    -  ``bitbake/tests/fetch``: Add tests for ``gitsm`` with git-lfs.
@@ -402,6 +555,9 @@ New Features / Enhancements in |yocto-ver|
    -  ``bitbake/lib/bb/tests/fetch``: add a test case to ensure Git shallow
       fetch works for tag containing slashes.
 
+   -  :ref:`ref-classes-testexport`: capture all tests and data from all layers
+      (instead of the :term:`OpenEmbedded-Core (OE-Core)` layer only).
+
    -  OEQA:
 
       -  SDK:
@@ -452,8 +608,16 @@ New Features / Enhancements in |yocto-ver|
 
       - ``runqemu``: add new test for booting compressed images.
 
-   -  :ref:`ref-classes-testexport`: capture all tests and data from all layers
-      (instead of the :term:`OpenEmbedded-Core (OE-Core)` layer only).
+      -  General improvements of the parallelization of tests, namely fixing
+         some tests that could spawn an unlimited number of threads leading to
+         OOM kills.
+
+      -  A new SDK test is now running for Go after ``go`` was added to
+         :term:`SDK_TOOLCHAIN_LANGS`.
+
+      -  Commands sent over SSH (using the ``OESSHTarget`` class) will now error
+         when an SSH failure occurs. It is possible to ignore these errors by
+         passing ``ignore_ssh_fails`` when executing a command.
 
 -  Utility script changes:
 
@@ -465,6 +629,8 @@ New Features / Enhancements in |yocto-ver|
          patch files *must* include an ``Upstream-Status`` to pass with this
          script.
 
+      -  Show the :term:`DISTRO` used when running the script.
+
       -  :ref:`ref-classes-yocto-check-layer` class:
 
          -  Refactor to be extended easily.
@@ -487,7 +653,11 @@ New Features / Enhancements in |yocto-ver|
 
    -  ``buildstats-diff``: find last two Buildstats files if none are specified.
 
-   -  ``pybootchartgui``: visualize ``/proc/net/dev`` network stats in graphs.
+   -  ``pybootchartgui``:
+
+      -  visualize ``/proc/net/dev`` network stats in graphs.
+
+      -  account for network statistics when calculating extents.
 
 -  Packaging changes:
 
@@ -496,6 +666,19 @@ New Features / Enhancements in |yocto-ver|
       detailed information on the files used during the compilation and improve
       SPDX accuracy.
 
+   -  When using the ``ipk`` and ``rpm`` package managers, give out more possible
+      reasons about unmatched packages.
+
+      For example::
+
+         E: Package 'catch2' has no installation candidate
+         catch2 is a recipe. Its generated packages are: ['catch2-src', 'catch2-dbg', 'catch2-staticdev', 'catch2-dev', 'catch2-doc']
+         Either specify a generated package or set ALLOW_EMPTY:${PN} = "1" in catch2 recipe
+
+   -  ``package.py``: replace all files unconditionally when copying debug
+      sources (passing ``-u`` to the ``cpio`` command in
+      ``copydebugsources()``). This improves reproducibility.
+
 -  LLVM related changes:
 
    -  Like ``gcc-source``, the LLVM project sources are part of ``work-shared``
@@ -532,8 +715,16 @@ New Features / Enhancements in |yocto-ver|
 
    -  Handle workspaces for multiconfig.
 
+   -  Fix upgrade for recipes with Git submodules.
+
 -  Patchtest-related changes:
 
+   -  Multiple improvements to the tool's :oe_git:`README
+      </openembedded-core/tree/scripts/patchtest.README>`.
+
+   -  Don't match :term:`BitBake` Python expansions as GitHub usernames
+      (``${@...}`` syntax).
+
 -  Security changes:
 
    -  ``openssl``: add FIPS support. This can be enabled through the ``fips``
@@ -541,6 +732,10 @@ New Features / Enhancements in |yocto-ver|
 
 -  :ref:`ref-classes-cve-check` changes:
 
+
+   -  ``cve-update-db-native``: FKIE: use Secondary metric if there is no
+      Primary metric.
+
 -  New :term:`PACKAGECONFIG` options for individual recipes:
 
    -  ``ppp``: ``l2tp``, ``pptp``
@@ -551,13 +746,34 @@ New Features / Enhancements in |yocto-ver|
    -  ``openssl``: ``fips``
    -  ``qemu``: ``sdl-image``, ``pixman``
    -  ``wget``: ``pcre2``
-   -  ``mesa``: ``asahi``, ``amd``, ``svga``, ``teflon``, ``nouveau``
+   -  ``mesa``: ``asahi``, ``amd``, ``svga``, ``teflon``, ``nouveau``,
+      ``xmlconfig``
+   -  ``dbus``: ``traditional-activation``, ``message-bus``
+   -  ``cmake``: ``debugger``
+   -  ``libcxx``: ``unwind-cross``
+   -  ``tiff``: ``lerc``
+   -  ``freetype``: ``brotli``
+   -  ``gawk``: ``pma-if-64bit``
+   -  ``x264``: ``ffmpeg``, ``opencl``
 
 -  Systemd related changes:
 
    -  Enable getty generator by default by adding ``serial-getty-generator`` to
       :term:`PACKAGECONFIG`.
 
+   -  Now uses the :term:`USE_NLS` variable to enable or disable building
+      translations.
+
+   -  Fix deduplicated templates and instance lines in preset files when listing
+      both template and instances in :term:`SYSTEMD_SERVICE`.
+
+   -  Stop enabling non-standard MAC policy when using the 'pni-names' feature
+      (part of :term:`DISTRO_FEATURES`). Instead, follow what is provided by
+      upstream systemd.
+
+   -  Install ``systemd-sysv-install`` when using the
+      ``systemd-systemctl-native`` recipe.
+
 -  :ref:`ref-classes-sanity` class changes:
 
    -  :ref:`ref-classes-insane`: Move test for invalid :term:`PACKAGECONFIG` to
@@ -573,6 +789,9 @@ New Features / Enhancements in |yocto-ver|
       install ``libstdc++-14-dev`` instead of ``libgcc-14-dev`` to avoid build
       issues when building :ref:`ref-classes-native` with Clang.
 
+   -  Drop the ``var-undefined`` QA check as it was not relevant for the
+      variables it was checking for, as those are mandatory by default.
+
 -  U-boot related changes:
 
    -  :ref:`ref-classes-uboot-sign`: Add support for setting firmware property
@@ -586,6 +805,11 @@ New Features / Enhancements in |yocto-ver|
       variable to automatically set U-boot configuration options (for example
       ``CONFIG_RISCV_ISA_F``).
 
+   -  Improve the way build directories are split when having multiple
+      configurations listed in :term:`UBOOT_CONFIG`. This fixes an issue where
+      two or more of these configurations were using the same directory for
+      building (because these were using the same defconfig file).
+
 -  Miscellaneous changes:
 
    -  ``dropbear``: The ``dropbearkey.service`` can now take extra arguments for
@@ -645,12 +869,79 @@ New Features / Enhancements in |yocto-ver|
    -  :ref:`ref-classes-externalsrc`: Always ask Git for location of ``.git``
       directory (may be different from the default ``${S}/.git``).
 
-   -  :ref:`ref-classes-features_check`: Add support for required
-      :term:`TUNE_FEATURES`.
+   -  :ref:`ref-classes-features_check`: Add support for :term:`REQUIRED_TUNE_FEATURES`.
 
    -  ``openssh``: limit read access to ``sshd_config`` file (set its filemode
       to ``0600``).
 
+   -  ``barebox-tools`` now installs the ``rk-usb-loader`` utility.
+
+   -  The :ref:`ref-classes-setuptools3_legacy` class now supports the
+      :ref:`qa-check-pep517-backend` QA check.
+
+   -  The :ref:`ref-classes-ccache` class now supports using Ccache for native
+      recipes when the local build configuration contains::
+
+         ASSUME_PROVIDED += "ccache-native"
+         HOSTTOOLS += "ccache"
+
+   -  :ref:`ref-classes-python_pep517`: use ``pyproject-build`` instead of
+      calling the module with ``nativepython3``.
+
+   -  ``dbus-glib``: include the binding tools separately into the
+      ``${PN}-tools`` package.
+
+   -  ``dbus``: use the :ref:`ref-classes-systemd` class to handle the unit
+      files of D-Bus.
+
+   -  ``dpkg``: add :ref:`ptest <test-manual/ptest:testing packages with ptest>`
+      support.
+
+   -  ``shared-mime-info``: Now uses the :term:`USE_NLS` variable to enable or
+      disable building translations.
+
+   -  ``p11-kit``: Now uses the :term:`USE_NLS` variable to enable or
+      disable building translations.
+
+   -  ``babeltrace2``: Enable Python plugins
+
+   -  ``initramfs-framework``: mount a temporary filesystem on ``/run`` and move
+      it to the root filesystem directory before calling ``switch_root``.
+
+   -  ``python3``: Pass ``PLATFORM_TRIPLET`` explicitly when cross compiling to
+      make it deterministic instead of letting Python detect the platform
+      triplet (``${HOST_ARCH}-${HOST_OS}``).
+
+   -  ``pulseaudio``: Add the ``audio`` group explicitly if
+      ``pulseaudio-server`` is used.
+
+   -  ``oe/license_finder``: Add ``find_licenses_up`` function to find licenses
+      upwards until reaching a predefined top directory (as an argument).
+
+   -  ``mesa``:
+
+      -  Build Mesa's Asahi tools when ``asahi`` is part of the recipe's
+         :term:`PACKAGECONFIG` variable.
+
+      -  The ``mesa`` recipe now declares two new :term:`PROVIDES` for Vulkan
+         and OpenCL ICD. These virtual provider are respectively named
+         ``virtual-opencl-icd`` and ``virtual-vulkan-icd``.
+
+      -  ``mesa-demos``: split info tools to a separate package
+         ``mesa-demos-info``.
+
+   -  ``vte``: skip :ref:`ref-classes-gobject-introspection` with Clang on Arm,
+      as it caused build failures.
+
+   -  ``shadow``: Increase the maximum group name length from 24 to 32 (default
+      value provided by upstream recipe, was previously hardcoded to 24).
+
+   -  ``udev-extraconf``: Speed up the ``mount.sh`` script by passing the block
+      device of interest to ``blkid`` when getting partition label names.
+
+   -  ``piglit``: enable OpenCL support if ``opencl`` is part of the
+      :term:`DISTRO` features.
+
 Known Issues in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

-- 
2.51.0


