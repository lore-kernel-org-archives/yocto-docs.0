Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AB1CED63B
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10724.1728459697453287966
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MYoffGe8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5F951BF20E;
	Wed,  9 Oct 2024 07:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7SOMFDEoIWe1MtIT7jxs99dyDaoeAkKx4Ycpn/27nM=;
	b=MYoffGe8i7//MHPi+X1VVHE9OsjY6FahkpcPgbcNuWRBJ7VLzB7PNZrQkzq2yT2gl6Px1i
	aBmhWHpyy2W950dI8TZU06XC8RRivWRp3yQJYjzJMtuHWZsdOTDJBEbFIABFe2ZEIrgXDx
	FiTpOOE7qzDykvEMcd151wlPa7zRHpDqYmHf4sMV7Wd6vS+4ai4UGbxG1ccoliViYE4Lex
	y/ZDShbl5qpYr72dvW61besE1Lq+SdlK4oV597hutEJFh3pb76axp9hW/7/brdwv4Kh1Ql
	/MwKWlp/5L3FzmvyYoE1SU5T4uwPq4EYcRRm7meMsF+6rURhNWSKd/1WmMRdKg==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 16/16] release-notes-5.1: update release note for styhead
Date: Wed,  9 Oct 2024 09:41:14 +0200
Message-ID: <20241009074120.866786-17-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009074120.866786-1-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5423

From: Antonin Godard <antonin.godard@bootlin.com>

Finalize the release note for the 5.1 release (styhead).

Add enhancements, changes, removals, license changes, and migration
notes for this release by going over the git commit log of
openembedded-core, bitbake and meta-yocto.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/migration-5.1.rst        |  63 +-
 .../migration-guides/release-notes-5.1.rst    | 829 ++++++++++++++++--
 2 files changed, 794 insertions(+), 98 deletions(-)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index 298ff3e25..8a6e04e22 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -86,8 +86,15 @@ Supported distributions
 Compared to the previous releases, running BitBake is supported on new
 GNU/Linux distributions:

+-  Ubuntu 24.10
+-  Fedora 40
+-  OpenSUSE Leap 15.5
+-  OpenSUSE Leap 15.6
+
 On the other hand, some earlier distributions are no longer supported:

+-  Ubuntu 23.04
+
 See :ref:`all supported distributions <system-requirements-supported-distros>`.

 .. _migration-5.1-go-changes:
@@ -95,20 +102,35 @@ See :ref:`all supported distributions <system-requirements-supported-distros>`.
 Go language changes
 ~~~~~~~~~~~~~~~~~~~

+-  After dropping the custom :ref:`ref-tasks-unpack` from the
+   :ref:`ref-classes-go` class, go recipes should now add
+   ``destsuffix=${GO_SRCURI_DESTSUFFIX}`` to their :term:`SRC_URI` to extract
+   them in the appropriate path. An example would be::
+
+      SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
+
+-  Go modules are no longer compiled with ``--linkmode=external``.
+
 .. _migration-5.1-systemd-changes:

 systemd changes
 ~~~~~~~~~~~~~~~

+-  New :term:`PACKAGECONFIG` value ``bpf-framework`` used to pre-compile eBPFs
+   that are required for the systemd.resource-control features
+   ``RestrictFileSystems`` and ``RestrictNetworkInterfaces``.
+
 .. _migration-5.1-recipe-changes:

 Recipe changes
 ~~~~~~~~~~~~~~

-.. _migration-5.1-deprecated-variables:
+-  ``gobject-introspection``: the ``giscanner`` utility is now shipped as a
+   separate package in ``gobject-introspection-tools``.
+
+-  ``perf`` no longer uses ``libnewt`` for compiling its TUI.

-Deprecated variables
-~~~~~~~~~~~~~~~~~~~~
+-  ``openssl``: do not build the test suite unless ptests are enabled.

 .. _migration-5.1-removed-variables:

@@ -117,6 +139,9 @@ Removed variables

 The following variables have been removed:

+-  ``TCLIBCAPPEND`` is now removed as sharing :term:`TMPDIR` for multiple libc
+   providers has been supported for years.
+
 .. _migration-5.1-removed-recipes:

 Removed recipes
@@ -124,19 +149,35 @@ Removed recipes

 The following recipes have been removed in this release:

+-  ``liba52``: superseded by ``ffmpeg``
+-  ``libomxil``: recipe removed as its only consumer, the gstreamer omx plugin,
+    was removed and has not been developed for several years
+-  ``libnewt``: moved to meta-oe
+-  ``mpeg2dec``: inactive for 10 years and superseded by ``ffmpeg``
+-  ``pytest-runner``: moved to meta-python
+-  ``python3-importlib-metadata``: moved to meta-python
+-  ``python3-pathlib2``: moved to meta-python
+-  ``python3-py``: moved to meta-python
+-  ``python3-rfc3986-validator``: moved to meta-python
+-  ``python3-toml``: moved to meta-python
+-  ``python3-tomli``: moved to meta-python
+-  ``usbinit``: recipe was poorly named as it is a gadget ethernet driver.
+   Gadget ethernet is of questionable use now and usbinit isn't referenced/used
+   anywhere within OE-Core.
+
+
 .. _migration-5.1-removed-classes:

 Removed classes
 ~~~~~~~~~~~~~~~

-No classes have been removed in this release.
+The following classes have been removed in this release:

-.. _migration-5.1-qemu-changes:
+-  ``siteconfig``:  removed as it was only used by ``ncurses`` and ``zlib`` and
+   adding minimal added-value for a considerable amount of added runtime.

-QEMU changes
-~~~~~~~~~~~~

-.. _migration-5.1-misc-changes:
+.. _migration-5.1-qemu-changes:

 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
@@ -155,3 +196,9 @@ Miscellaneous changes
    Environment variables containing relative paths from tested build directory
    to outside of the original build directory may need to be updated as they
    won't be changed by `oe-selftest`.
+
+-  Several sanity checks from the :ref:`ref-classes-insane` class, such as
+   ``buildpaths``, have been promoted to errors instead of warnings.
+
+-  The ``license-incompatible`` :term:`ERROR_QA` sanity check was renamed to
+   ``license-exception``.
diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 211f92553..62aa88f2e 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -6,109 +6,270 @@ Release notes for 5.1 (styhead)
 New Features / Enhancements in 5.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--  Linux kernel 6.X, gcc 14.X, glibc 2.X, LLVM 18.X, and over XXX other recipe upgrades
+-  Linux kernel 6.10, gcc 14.2, glibc 2.40, LLVM 18.1.18, and over 300 other
+   recipe upgrades.

 -  New variables:

-   - :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`: suffix for the CVE JSON manifest file.
+   -  :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`: suffix for the CVE JSON manifest file.

-   - :term:`PRSERVER_UPSTREAM`: Upstream PR service (host:port).
+   -  :term:`PRSERVER_UPSTREAM`: Upstream PR service (``host:port``) for the
+      local PR server to connect to.

-   - :term:`RECIPE_UPGRADE_EXTRA_TASKS`: space-delimited list of tasks to run after the new
-     sources have been unpacked in scripts/lib/devtool/upgrade.py ugrade() method.
+   -  :term:`RECIPE_UPGRADE_EXTRA_TASKS`: space-delimited list of tasks to run
+      after the new sources have been unpacked in
+      ``scripts/lib/devtool/upgrade.py`` upgrade() method.

-   - :term:`UNPACKDIR`: allow change of do_unpack directory.
+   -  :term:`UNPACKDIR`: allow change of the :ref:`ref-tasks-unpack` task
+      directory.

--  Architecture-specific enhancements:
+-  Kernel-related changes:

--  Kernel-related enhancements:
-
-  - The default kernel is the current stable (6.10), and there is also support
-    for the latest long-term release (6.6).
+  -  The default kernel is the current stable (6.10), and there is also support
+     for the latest long-term release (6.6).

 -  New core recipes:

-   -  `fmt <https://fmt.dev>`__: an open-source formatting library for C++. (from meta-oe)
+   -  `fmt <https://fmt.dev>`__: an open-source formatting library for C++
+      (imported from meta-oe).
+
+   -  `xcb-util-errors <http://xcb.freedesktop.org/XcbUtil/>`__: gives human
+      readable names to error codes and event codes
+
+-  QEMU / ``runqemu`` changes:
+
+   -  runqemu: ``QB_DRIVE_TYPE`` now support for sd card (``/dev/mmcblk``)
+
+   -  Trigger ``write_qemuboot_conf`` task on changes of kernel image realpath
+      (:term:`KERNEL_IMAGE_NAME`).
+
+-  Go changes:
+
+   -  New go module fetcher (``gomod://``) for downloading module dependencies
+      to the module cache from a module proxy.
+
+   -  New go module fetcher (``gomodgit://``) for downloading module
+      dependencies to the module cache directly from a git repository.
+
+   -  The old 1.4 Go bootstrap written in C has been dropped. The default
+      Go bootstrap provider is now ``go-binary-native`` only.
+
+-  Rust changes:
+
+   -  Cargo dependencies specified as git repositories now also have their git
+      submodules checked out.
+
+   -  Rust is now built with its default set of tools instead of just
+      ``rust-demangler``.
+
+-  wic Image Creator changes:
+
+   -  Add the ``truncate`` utility in :term:`HOSTTOOLS`, needed by some wic
+      commands.
+
+   -  The ``get_boot_files`` function is no longer part of the
+      ``bootimg-partition`` plugin and is part of the common ``bootfiles.py``
+      library.
+
+-  SDK-related changes:
+
+   -  Included ``nativesdk-python3-pip`` in :term:`buildtools` by default.
+
+   -  :ref:`ref-classes-nativesdk` now have :ref:`ref-tasks-package_qa` run when
+      calling :ref:`ref-tasks-populate_sdk`.
+
+   -  A new 7zip archive type can be used to create the SDK by setting
+      :term:`SDK_ARCHIVE_TYPE` to ``7zip``.
+
+   -  The :ref:`ref-classes-toolchain-scripts` class now exports the target
+      endianness and wordsize in environment variables ``OECORE_TARGET_BITS``
+      and ``OECORE_TARGET_ENDIAN``.
+
+-  Testing-related changes:
+
+   -  oeqa/selftest: Only rewrite envvars paths that absolutely point to
+      :term:`BUILDDIR`.

-   -  `xcb-util-errors <http://xcb.freedesktop.org/XcbUtil/>`__: gives human readable
-      names to error codes and event codes
+   -  oeqa/manual: remove obsolete CROPS and Eclipse manually testing scripts

--  QEMU / ``runqemu`` enhancements:
+   -  Enable ptests for ``python3-cffi``, ``python3-idna``,
+      ``python3-libarchive-c``, ``python3-mako``, ``python3-packaging``,
+      ``python3-uritools`` and ``python3-rpds-py``.

-   - runqemu: :term:`QB_DRIVE_TYPE` now support for sd card (/dev/mmcblk)
+   -  Running tests on target with :ref:`ref-classes-testimage` can now be done
+      over a serial connection.

--  Rust improvements:
+   -  Artifact collection when using the :ref:`ref-classes-testimage` class is
+      now optional and allowed by making :term:`TESTIMAGE_FAILED_QA_ARTIFACTS`
+      empty.

--  SDK-related improvements:
+   -  Artifacts from ``oeqa`` post-actions are now retrieved as whole archives
+      instead of individual copies. The archive is left uncompressed on the
+      host.

-   -  included ``nativesdk-python3-pip`` in buildtools.
+   -  A test for the ``minidebuginfo`` feature of :term:`DISTRO_FEATURES` is now
+      part of the test suite.

--  Testing:
+   -  A test for building a kernel module was added to the SDK test suite.

-   -  oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir
+   -  oeqa/selftest: run test serially if neither the ``testtools`` or
+      ``subunit`` python modules have been found.

-   -  Enable ptests for ``python3-cffi``, ``python3-idna``, ``python3-libarchive-c``,
-      ``python3-mako``, ``python3-packaging``, ``python3-uritools`` and ``python3-rpds-py``.
+   -  Artifact collection and test result collection are now separated and
+      artifact collection can be controlled with the ``OEQA_ARTEFACT_DIR``
+      variable.

 -  Utility script changes:

-   -  New ``cve-json-to-text`` script that converts the cve-check result from the JSON format
-      to the TEXT format as cve-check removed text format.
+   -  New ``cve-json-to-text`` script that converts the cve-check result from
+      the JSON format to the TEXT format as cve-check removed text format.

    -  New ``makefile-getvar`` script to extract value from a Makefile.

-   -  New ``pull-spdx-licenses`` script to pull SPDX license data, update license list JSON
-      data and update license directory.
+   -  New ``pull-spdx-licenses`` script to pull SPDX license data, update
+      license list JSON data and update license directory.

    -  Several improvements in ``oe-build-perf-report`` report.

-   -  ``oe-debuginfod`` add parameter "-d" to store debuginfod files in project sub-directory.
+   -  ``oe-debuginfod`` add parameter "-d" to store debuginfod files in project
+      sub-directory.

    -  ``resulttool`` support test report generation in JUnit XML format.

+   -  Remove ``install-buildtools`` "test installation" step harmless error
+      messages.

--  BitBake improvements:
+   -  ``bitbake-layers``: add a new subcommand ``show-machines`` to list the
+      machines available in the currently configured layers.

-   -  New go module fetcher (``gomod://``) for downloading module dependencies to the
-      module cache from a module proxy.
+-  BitBake changes:

-   -  New go module fetcher (``gomodgit://``) for downloading module dependencies to the
-      module cache directly from a git repository.
+   -  Fetcher for rust crates: added a check for latest upstream version.

-   -  Fetcher for rust crate: added check for latest upstream version.
+   -  ``syncrpc`` now requires a minimum version of the websockets module depend
+      on python version.

-   -  Syncrpc now requires a minimum version of the websockets module depend on python version.
+   -  Improve ``bitbake-hashclient`` stress statistics reporting.

-   -  Improved bitbake-hashclient stress statistics reporting.
+   -  ``bitbake-hashserv`` added ``reuseport`` parameter to enable SO_REUSEPORT,
+      allowing multiple servers to bind to the same port for load balancing

-   -  bitbake-hashserv added ``reuseport`` parameter to enable SO_REUSEPORT, allowing
-      multiple servers to bind to the same port for load balancing
+   -  Improve cloning speed with :term:`BB_GIT_SHALLOW` and
+      :term:`BB_GENERATE_MIRROR_TARBALLS`.

-   -  improved cloning speed with :term:`BB_GIT_SHALLOW` and :term:`BB_GENERATE_MIRROR_TARBALLS`.
+   -  `BitBake` UI now includes log paths for failed task.

-   -  bitbake UI now include log paths for failed task.
+   -  ``fetcher2``: support for wget and wget2.

-   -  fetcher2 support for wget and wget2.
+   -  ``fetcher2``: support npm package name with '@' character.

-   -  fetcher2 support npm package name with '@' character.
+   -  ``fetcher2``: remote name for ``git://`` is now ``origin`` by default.

    -  Codeparser now support shell substitution in quotes, for example::

          var1="$(cmd1 ...)"

--  devtool improvements:
+   -  Function code of pylib functions are now taken into account when computing
+      taskhashes.

-   - Fix ``_test_devtool_add_git_url`` test
+   -  Fix ``_test_devtool_add_git_url`` test

--  recipetool improvements:
+   -  Hashserv: add a batch stream API that reduces the round trip latency on the
+      server.
+
+   -  The :ref:`ref-classes-prserv` class now uses a shared sqlite3 database to
+      allow multiple processes to access the database.
+
+   -  The python codeparser now skips the checksumming of external python
+      modules imported with ``from module import something``.
+
+   -  Enable batching of ``unihash`` queries to reduce the effect of latency
+      when making multiple queries to the server.
+
+   -  Parser: improve cache invalidation reliability by using the mtime's
+      nanoseconds, inode number and size of files.
+
+   -  When using the syntax ``addtask do_XXX before YYY after ZZZ``, bitbake now
+      ensures that ``YYY`` and ``ZZZ`` are prefixed with ``do_``, to avoid
+      unexpected failures.
+
+-  ``devtool`` changes:
+
+   -  Fix ``_test_devtool_add_git_url`` test
+
+   -  ``update-recipe``, ``finish``: fix error when calling on another layer and
+      having a localfile.
+
+   -  ``devtool check-upgrade-status`` now groups recipes when they need to be
+      upgraded together.

 -  Packaging changes:

--  Security improvements:
+   -  When processing ``pkgconfig``'s ``pc`` files, also process
+      "Requires.private" in addition to "Requires". This fixes a broken
+      dependency list for IPKs and avoids installing unecessary recommended
+      additional packages (and save disk usage).
+
+   -  Package management: make the extraction of IPK packages not depend on
+      ``zst`` compression, as it can be changed with :term:`OPKGBUILDCMD`.
+
+   -  Remove support for ``DIRFILES`` of :ref:`ref-classes-package_rpm` as it is
+      rpm-specific and untested.
+
+   -  Bump ``abi_version`` and ``package`` versions after recent ``pkgconfig``
+      changes.
+
+-  Security changes:
+
+   -  The ``busybox`` default configuration now disables internal TLS code to
+      use the ``openssl`` backend instead, for a more secure initial set of
+      settings.
+
+   -  Limit ssh host keys pre-generation to qemu machines by default, for
+      security purposes.
+
+-  LLVM related changes:
+
+   -  Enable ``libllvm`` in :term:`PACKAGECONFIG` for native builds.
+
+   -  Fetch release tarballs instead of git checkouts to reduce disk usage.
+
+-  :ref:`ref-classes-cve-check` changes:
+
+   -  The class :ref:`ref-classes-cve-check` now uses a local copy of the NVD
+      database during builds.
+
+   -  New statuses can be reported by :ref:`ref-classes-cve-check`:
+
+      -  ``fix-file-included``: when a fix file has been included (set automatically)
+      -  ``version-not-in-range``: version number NOT in the vulnerable range (set automatically)
+      -  ``version-in-range``: version number IS in the vulnerable range (set automatically)
+      -  ``unknown``: impossible to conclude if the vulnerability is present or not

--  Toaster Web UI improvements:
+   -  The TEXT output format was removed to favor the JSON format which offers
+      more features.

--  Prominent documentation updates:
+   -  Allow overriding the default "policies" from
+      ``meta/conf/cve-check-map.conf`` by including it before distro include
+      files in ``meta/conf/bitbake.conf``.
+
+SPDX-related changes:
+
+   -  Update the SPDX license set too version 3.24.0, and produce SPDX output in
+      version 3.0 by default, instead of 2.2.
+
+   -  New ``create-spdx-3.0`` class to generate SPDX 3.0 output (used by generic
+      class :ref:`ref-classes-create-spdx`). New ``create-spdx-image-3.0``
+      class that is used when generating images and ``create-spdx-sdk-3.0`` for sdk
+      based recipes.
+
+   -  New :ref:`ref-classes-nospdx` class that allows recipes to opt out of
+      generating SPDX.
+
+   -  Specify the SPDX image purposes for ``tar``, ``cpio`` and ``wic`` images.
+
+   -  The :ref:`ref-classes-create-spdx` class now reports for
+      :ref:`ref-classes-multilib*` classes.

 -  Miscellaneous changes:

@@ -116,80 +277,568 @@ New Features / Enhancements in 5.1

    -  Allow selection of host key types used by openssh.

-   -  New glibc task do_symlist to list exported symbols.
+   -  New glibc task ``do_symlist`` to list exported symbols.

-   -  initramfs-framework support for force reboot in the case of fatal error.
+   -  ``initramfs-framework`` support for force reboot in the case of fatal error.

-   -  insane class now check for patch-status and pep517-backend by default.
+   -  The :ref:`ref-classes-insane` class now checks for ``patch-status`` and
+      ``pep517-backend`` by default.

    -  New ``yocto-space-optimize`` include file to allow turning off debug compiler options
       for a small set of recipes to reduce build on disk footprint and package/sstate sizes.

-   -  Update to SPDX license version 3.24.0
-
-   -  New :ref:`create-spdx-3.0` class to generate SPDX 3.0 output, :ref:`create-spdx-image-3.0`
-      class that is used when generating images and :ref:`create-spdx-sdk-3.0` for sdk
-      based recipes.
+   -  Image creation tasks inheriting from the :ref:`ref-classes-image` class
+      now produce a ``manifest.json`` file listing the images created. The
+      output manifest path is defined by the :term:`IMAGE_OUTPUT_MANIFEST`
+      variable.

-   -  New :ref:`nospdx` class that allows recipes to opt out of generating SPDX.
-
-   -  New :ref:`Vex` class generates the minimum information that is necessary
+   -  New :ref:`ref-classes-vex` class generates the minimum information that is necessary
       for VEX generation by an external CVE checking tool.

-   -  New :ref:`retain` class creates a tarball of the work directory for a recipe
+   -  New :ref:`ref-classes-retain` class creates a tarball of the work directory for a recipe
       when one of its tasks fails, or any other nominated directories.

-   -  New :ref:`localpkgfeed` class in meta-selftest to create a subset of the
+   -  New ``localpkgfeed`` class in meta-selftest to create a subset of the
       package feed that just contain the packages depended on by this recipe.

    -  New :term:`PACKAGECONFIG` options for individual recipes:

-      - appstream: qt6
-      - cronie: inotify
-      - gstreamer1.0-plugins-bad: gtk3
-      - libsdl2: libsamplerate
-      - mesa: tegra
-      - openssh: hostkey-rsa hostkey-ecdsa hostkey-ed25519
-      - pciutils: kmod zlib
-      - piglit: wayland
-      - pulseaudio: oss-output
-      - python3: staticlibpython
-      - python3-jsonschema: format-nongpl (previously "nongpl")
-      - systemd: bpf-framework
-      - util-linux: libmount-mountfd-support
-
-   -  Stop referring :term:`WORKDIR` for :term:`S` and :term:`B`: trigger
-     :ref:`ref-classes-insane` errors when :term:`S` or :term:`B` are equal to
-     :term:`WORKDIR`.
+      -  ``appstream``: qt6
+      -  ``cronie``: inotify
+      -  ``gstreamer1``.0-plugins-bad: gtk3
+      -  ``libsdl2``: libsamplerate
+      -  ``mesa``: tegra
+      -  ``openssh``: hostkey-rsa hostkey-ecdsa hostkey-ed25519
+      -  ``pciutils``: kmod zlib
+      -  ``piglit``: wayland
+      -  ``pulseaudio``: oss-output
+      -  ``python3``: staticlibpython
+      -  ``python3-jsonschema``: format-nongpl (previously "nongpl")
+      -  ``systemd``: bpf-framework
+      -  ``util-linux``: libmount-mountfd-support
+
+   -  Stop referring :term:`WORKDIR` for :term:`S` and :term:`B` and trigger
+      :ref:`ref-classes-insane` errors when :term:`S` or :term:`B` are equal to
+      :term:`WORKDIR`.
+
+   -  ``picolibc`` can now be used with :term:`TCLIBC` to build with
+      ``picolibc`` as the C library.
+
+   -  ``openssh`` now uses ``sd_notify`` patch from upstream instead of custom
+      one, which does not depend on libsystemd and is standalone.
+
+   -  ``cmake`` now uses the ``${COREBASE}/scripts/git`` wrapper instead of the
+      host's, which is required during :ref:`ref-tasks-install` to call git
+      while disabling fakeroot, and avoid "dubious ownership" git errors.
+
+   -  Default compiler option changes:
+
+      -  :term:`BUILD_CFLAGS` now includes the `-pipe` option by default.
+
+      -  Remove the ``eliminate-unused-debug-types`` option from
+         the default compiler options since it is now included by default.
+
+   -  ``uninative`` updated to 4.6 for glibc 2.40
+
+   -  Mark recipe ``meta-ide-support`` as machine specific with
+      :term:`PACKAGE_ARCH`.
+
+   -  sstate: Drop intercept functions support which was only used by now
+      removed ``siteconfig`` class.
+
+   -  sstate: Drop support for ``SSTATEPOSTINSTFUNC`` variable now that
+      ``postfunc`` is available.
+
+   -  openssl: strip the test suite after building, reducing the build tree of
+      50% after installation.
+
+   -  u-boot: Refactor some of the :ref:`ref-tasks-configure` tasks into new
+      functions, making it easier to modify using a bbappend.
+
+   -  The ``musl`` recipe now shows an error if used with
+      :ref:`ref-classes-multilib*` enabled (``musl`` does not support multilib).
+
+   -  The ``git`` recipe is now configured with default configuration pointing to
+      ``/etc/gitconfig`` for :ref:`ref-classes-native` recipes.
+
+   -  The ``apt-native`` recipe, used to compile ``dpkg`` and handle ``deb``
+      packages, was modified to avoid files being overriden by other packages when
+      they share common files. Instead, prompt an error.
+
+   -  The :ref:`ref-tasks-savedefconfig` was moved from the u-boot and kernel
+      recipes to the :ref:`ref-classes-cml1` class, so that more kbuild-based
+      recipes can use it.
+
+   -  The :ref:`ref-classes-sanity` class now checks if user namespaces are
+      enabled on the host as they are required for network isolation.
+
+   -  The recipe ``os-release`` is now part of
+      :term:`SIGGEN_EXCLUDERECIPES_ABISAFE` and does not trigger a rebuild on a
+      change for dependent tasks.
+
+   -  In :ref:`ref-classes-kernel-fitimage`, the existence of
+      :term:`EXTERNAL_KERNEL_DEVICETREE` is checked more thoroughly to avoid
+      false positives.
+
+   -  rootfs: ensure ``run-postinsts`` is not uninstalled when the
+      *read-only-rootfs-delayed-postinsts* and *read-only-rootfs*
+      :term:`IMAGE_FEATURES` are enabled.
+
+   -  Gcc can now use ``libc++`` as its runtime.
+
+   -  The variable ``CMDLINE_CONSOLE`` was removed from the
+      :ref:`ref-classes-kernel` class, as it wasn't used anywhere.
+
+   -  ``python3``: make ``-core`` depend on ``-compression`` as it needs to
+      import the ``zipfile`` module.
+
+   -  The classes :ref:`ref-classes-native` and :ref:`ref-classes-nativesdk` do
+      not override the ``*FLAGS`` variables anymore, allowing users to use the
+      ``+=`` syntax in recipes.
+
+   -  The ``multilib_script`` class (part of :ref:`ref-classes-multilib*`)
+      now expands the ``MULTILIB_SCRIPTS`` variable before splitting the
+      scripts, fixing some issues seen when :term:`PACKAGECONFIG` would
+      conditionally modify it.

 Known Issues in 5.1
 ~~~~~~~~~~~~~~~~~~~

+-  Rust related issues:
+
+   -  Rust builds are not fully reproducible (only ``rust-dbg`` and
+      ``rust-rustdoc`` are not).
+
+   -  There are some remaining rust selftest failures that need to be fixed, due
+      to the way it is being built.
+
+
 Recipe License changes in 5.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 The following corrections have been made to the :term:`LICENSE` values set by recipes:

--  ``dejagnu``: update :term:`LICENSE` to ``GPL-3.0-only``.
--  ``gcr``: update :term:`LICENSE` to ``LGPL-2.0-only``.
--  ``glibc``: update :term:`LICENSE` to ``GPL-2.0-only & LGPL-2.1-or-later``.
--  ``gpgme``: update :term:`LICENSE` for different packages.
--  ``libgcrypt``: add license ``BSD-3-Clause``.
--  ``linux-firmware``: separate license ``Firmware-linaro`` for linaro-license package.
--  ``iw``: update :term:`LICENSE` to ``ISC``.
+-  ``ccache``: ``GPL-3.0-or-later`` to ``GPL-3.0-or-later & MIT & BSL-1.0 & ISC`` after adding third-party licenses.
+-  ``dejagnu``: update to ``GPL-3.0-only``.
+-  ``gcr``: update to ``LGPL-2.0-only``.
+-  ``glibc``: update to ``GPL-2.0-only & LGPL-2.1-or-later``.
+-  ``gpgme``: update for different packages.
+-  ``iw``: update to ``ISC``.
+-  ``json-glib``: ``LGPL-2.1-only`` to ``LGPL-2.1-or-later`` after update to 1.10.0.
+-  ``libgcrypt``: ``GPL-2.0-or-later & LGPL-2.1-or-later`` to ``GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause``. Add BSD-3-Clause for poly1305-amd64-avx512.S.
+-  ``linux-firmware``: set package :term:`LICENSE` for following firmware packages:
+   -  ``cc33xx``
+   -  ``ath10k-wcn3990``
+   -  ``qcom-adreno-g750``
+   -  ``qcom-x1e80100-adreno``
+   -  ``wfx``
+   -  ``qcom-vpu``
+   -  ``qcom-sm8550-audio-tplg``
+   -  ``qcom-sm8650-audio-tplg``
+   -  ``linaro-license``
+   -  ``mali-csffw-arch108``
+-  ``lz4``: ``BSD-2-Clause | GPL-2.0-only`` to ``BSD-2-Clause | GPL-2.0-or-later`` after update to 1.10.0.
 -  ``ppp``: add license ``RSA-MD`` .
--  ``tiff``: update :term:`LICENSE` to ``libtiff``.
--  ``unzip``: update :term:`LICENSE` to ``Info-ZIP``.
--  ``xz``: add :term:`LICENSE` ``PD`` for xz, xz-dev and xz-doc package.
--  ``zip``: update :term:`LICENSE` to ``Info-ZIP``.
-
+-  ``python3-docutils``: ``PSF-2.0 & BSD-2-Clause & GPL-3.0-only`` to ``CC0-1.0 & ZPL-2.1 & BSD-2-Clause & GPL-3.0-only``. Add CC0 after update to 0.21.2.
+-  ``tiff``: update to ``libtiff``.
+-  ``unzip``: update to ``Info-ZIP``.
+-  ``util-linux``: Add ``GPL-2.0-only``  after update to 2.40.1 (``GPL-2.0`` changed to ``GPL-2.0-only`` in README.licensing).
+-  ``xz``: ``PD`` removed and ``0BSD`` added after update to 5.6.2.
+-  ``xz``: add ``PD`` for xz, xz-dev and xz-doc package.
+-  ``zip``: update to ``Info-ZIP``.

 Security Fixes in 5.1
 ~~~~~~~~~~~~~~~~~~~~~

+-  ``apr``: :cve:`2023-49582`
+-  ``busybox``: :cve:`2021-42380`, :cve:`2023-42363`, :cve:`2023-42364`, :cve:`2023-42365`, :cve:`2023-42366`
+-  ``cups``: :cve:`2024-35235`
+-  ``curl``: :cve:`2024-6197`, :cve:`2024-6874`, :cve:`2024-7264`
+-  ``expat``: :cve:`2024-45490`, :cve:`2024-45491`, :cve:`2024-45492`.
+-  ``gcc``: :cve:`2023-4039`
+-  ``gdk-pixbuf``: :cve:`2022-48622`
+-  ``ghostscript``: :cve:`2024-33869`, :cve:`2023-52722`, :cve:`2024-33870`, :cve:`2024-33871`, :cve:`2024-29510`
+-  ``git``: :cve:`2024-32002`, :cve:`2024-32004`, :cve:`2024-32020`, :cve:`2024-32021`, :cve:`2024-32465`
+-  ``glibc``: :cve:`2024-2961`, :cve:`2024-33599`, :cve:`2024-33600`, :cve:`2024-33601`, :cve:`2024-33602`
+-  ``go``: :cve:`2024-24790`
+-  ``gtk+3``: :cve:`2024-6655`
+-  ``linux-yocto/6.10``: :cve:`2020-16119`
+-  ``linux-yocto/6.6``: :cve:`2020-16119`
+-  ``llvm``: :cve:`2024-0151`
+-  ``ncurses``: :cve:`2023-50495`, :cve:`2023-45918`
+-  ``openssh``: :cve:`2024-6387`
+-  ``openssl``: :cve:`2024-4603`, :cve:`2024-4741`
+-  ``ovmf``: :cve:`2023-45236`, :cve:`2023-45237`, :cve:`2024-25742`
+-  ``python3``: :cve:`2024-7592`, :cve:`2024-8088`, :cve:`2024-6232`
+-  ``ruby``: :cve:`2024-27282`, :cve:`2024-27281`, :cve:`2024-27280`
+-  ``tiff``: :cve:`2024-7006`
+-  ``vim``: :cve:`2024-41957`, :cve:`2024-41965`, :cve:`2024-43374`, :cve:`2024-43790`, :cve:`2024-43802`
+-  ``wget``: :cve:`2024-38428`
+-  ``wpa-supplicant``: :cve:`2024-5290`, :cve:`2023-52160`
+-  ``xserver-xorg``: :cve:`2024-31080`, :cve:`2024-31081`, :cve:`2024-31082`, :cve:`2024-31083`
+
 Recipe Upgrades in 5.1
 ~~~~~~~~~~~~~~~~~~~~~~

+-  ``acpica`` 20240322 -> 20240827
+-  ``adwaita-icon-theme`` 45.0 -> 46.2
+-  ``alsa-lib`` 1.2.11 -> 1.2.12
+-  ``alsa-plugins`` 1.2.7.1 -> 1.2.12
+-  ``alsa-ucm-conf`` 1.2.11 -> 1.2.12
+-  ``alsa-utils`` 1.2.11 -> 1.2.12
+-  ``asciidoc`` 10.2.0 -> 10.2.1
+-  ``at-spi2-core`` 2.50.1 -> 2.52.0
+-  ``attr`` 2.5.1 -> 2.5.2
+-  ``automake`` 1.16.5 -> 1.17
+-  ``base-passwd`` 3.6.3 -> 3.6.4
+-  ``bash`` 5.2.21 -> 5.2.32
+-  ``bash-completion`` 2.12.0 -> 2.14.0
+-  ``bind`` 9.18.28 -> 9.20.1
+-  ``binutils`` 2.42 -> 2.43.1
+-  ``binutils-cross`` 2.42 -> 2.43.1
+-  ``binutils-cross-canadian`` 2.42 -> 2.43.1
+-  ``binutils-crosssdk`` 2.42 -> 2.43.1
+-  ``bluez5`` 5.72 -> 5.78
+-  ``boost`` 1.84.0 -> 1.86.0
+-  ``boost-build-native`` 1.84.0 -> 1.86.0
+-  ``btrfs-tools`` 6.7.1 -> 6.10.1
+-  ``build-appliance-image`` 15.0.0 (bf88a67b4523…) -> 15.0.0 (7cc8bf7af794…)
+-  ``ca-certificates`` 20211016 -> 20240203
+-  ``cairo`` 1.18.0 -> 1.18.2
+-  ``cargo`` 1.75.0 -> 1.79.0
+-  ``cargo-c-native`` 0.9.30+cargo-0.77.0 -> 0.10.3+cargo-0.81.0
+-  ``ccache`` 4.9.1 -> 4.10.2
+-  ``cmake`` 3.28.3 -> 3.30.2
+-  ``cmake-native`` 3.28.3 -> 3.30.2
+-  ``connman`` 1.42 -> 1.43
+-  ``coreutils`` 9.4 -> 9.5
+-  ``cracklib`` 2.9.11 -> 2.10.2
+-  ``createrepo-c`` 1.0.4 -> 1.1.4
+-  ``cross-localedef-native`` 2.39+git -> 2.40+git
+-  ``cryptodev-linux`` 1.13+gitX -> 1.14
+-  ``cryptodev-module`` 1.13+gitX -> 1.14
+-  ``cryptodev-tests`` 1.13+gitX -> 1.14
+-  ``curl`` 8.7.1 -> 8.9.1
+-  ``debianutils`` 5.16 -> 5.20
+-  ``dhcpcd`` 10.0.6 -> 10.0.10
+-  ``diffoscope`` 259 -> 277
+-  ``dmidecode`` 3.5 -> 3.6
+-  ``dnf`` 4.19.0 -> 4.21.1
+-  ``dpkg`` 1.22.0 -> 1.22.11
+-  ``dropbear`` 2022.83 -> 2024.85
+-  ``e2fsprogs`` 1.47.0 -> 1.47.1
+-  ``ell`` 0.64 -> 0.68
+-  ``enchant2`` 2.6.7 -> 2.8.2
+-  ``encodings`` 1.0.7 -> 1.1.0
+-  ``epiphany`` 46.0 -> 46.3
+-  ``erofs-utils`` 1.7.1 -> 1.8.1
+-  ``ethtool`` 6.7 -> 6.10
+-  ``ffmpeg`` 6.1.1 -> 7.0.2
+-  ``findutils`` 4.9.0 -> 4.10.0
+-  ``freetype`` 2.13.2 -> 2.13.3
+-  ``fribidi`` 1.0.14 -> 1.0.15
+-  ``gcc`` 13.3.0 -> 14.2.0
+-  ``gcc-cross`` 13.3.0 -> 14.2.0
+-  ``gcc-cross-canadian`` 13.3.0 -> 14.2.0
+-  ``gcc-crosssdk`` 13.3.0 -> 14.2.0
+-  ``gcc-runtime`` 13.3.0 -> 14.2.0
+-  ``gcc-sanitizers`` 13.3.0 -> 14.2.0
+-  ``gcc-source`` 13.3.0 -> 14.2.0
+-  ``gcr`` 4.2.1 -> 4.3.0
+-  ``gdb`` 14.2 -> 15.1
+-  ``gdb-cross`` 14.2 -> 15.1
+-  ``gdb-cross-canadian`` 14.2 -> 15.1
+-  ``gdbm`` 1.23 -> 1.24
+-  ``gi-docgen`` 2023.3 -> 2024.1
+-  ``git`` 2.44.1 -> 2.46.0
+-  ``glib-2.0`` 2.78.6 -> 2.82.1
+-  ``glib-networking`` 2.78.1 -> 2.80.0
+-  ``glibc`` 2.39+git -> 2.40+git
+-  ``glibc-locale`` 2.39+git -> 2.40+git
+-  ``glibc-mtrace`` 2.39+git -> 2.40+git
+-  ``glibc-scripts`` 2.39+git -> 2.40+git
+-  ``glibc-testsuite`` 2.39+git -> 2.40+git
+-  ``glibc-y2038-tests`` 2.39+git -> 2.40+git
+-  ``glslang`` 1.3.275.0 -> 1.3.290.0
+-  ``gnu-config`` 20240101+git -> 20240823+git
+-  ``gnu-efi`` 3.0.17 -> 3.0.18
+-  ``gnupg`` 2.4.4 -> 2.5.0
+-  ``gnutls`` 3.8.4 -> 3.8.6
+-  ``go-helloworld`` 0.1 (d9923f6970e9…) -> 0.1 (39e772fc2670…)
+-  ``gobject-introspection`` 1.78.1 -> 1.80.1
+-  ``gptfdisk`` 1.0.9 -> 1.0.10
+-  ``gsettings-desktop-schemas`` 46.0 -> 47.1
+-  ``gst-devtools`` 1.22.12 -> 1.24.6
+-  ``gstreamer1.0`` 1.22.12 -> 1.24.6
+-  ``gstreamer1.0-libav`` 1.22.12 -> 1.24.6
+-  ``gstreamer1.0-plugins-bad`` 1.22.12 -> 1.24.6
+-  ``gstreamer1.0-plugins-base`` 1.22.12 -> 1.24.6
+-  ``gstreamer1.0-plugins-good`` 1.22.12 -> 1.24.6
+-  ``gstreamer1.0-plugins-ugly`` 1.22.12 -> 1.24.6
+-  ``gstreamer1.0-python`` 1.22.12 -> 1.24.6
+-  ``gstreamer1.0-rtsp-server`` 1.22.12 -> 1.24.6
+-  ``gstreamer1.0-vaapi`` 1.22.12 -> 1.24.6
+-  ``gtk+3`` 3.24.41 -> 3.24.43
+-  ``gtk-doc`` 1.33.2 -> 1.34.0
+-  ``gtk4`` 4.14.1 -> 4.16.0
+-  ``harfbuzz`` 8.3.0 -> 9.0.0
+-  ``hicolor-icon-theme`` 0.17 -> 0.18
+-  ``hwlatdetect`` 2.6 -> 2.7
+-  ``icu`` 74-2 -> 75-1
+-  ``ifupdown`` 0.8.41 -> 0.8.43
+-  ``iproute2`` 6.7.0 -> 6.10.0
+-  ``iputils`` 20240117 -> 20240905
+-  ``iw`` 6.7 -> 6.9
+-  ``json-glib`` 1.8.0 -> 1.10.0
+-  ``kea`` 2.4.1 -> 2.6.1
+-  ``kexec-tools`` 2.0.28 -> 2.0.29
+-  ``kmod`` 31 -> 33
+-  ``kmscube`` 0.0.1+git (6ab022fdfcfe…) -> 0.0.1+git (467e86c5cbeb…)
+-  ``less`` 643 -> 661
+-  ``libadwaita`` 1.5.2 -> 1.6.0
+-  ``libassuan`` 2.5.6 -> 3.0.1
+-  ``libbsd`` 0.12.1 -> 0.12.2
+-  ``libcap`` 2.69 -> 2.70
+-  ``libcomps`` 0.1.20 -> 0.1.21
+-  ``libdnf`` 0.73.2 -> 0.73.3
+-  ``libdrm`` 2.4.120 -> 2.4.123
+-  ``libedit`` 20230828-3.1 -> 20240808-3.1
+-  ``libevdev`` 1.13.1 -> 1.13.2
+-  ``libfontenc`` 1.1.7 -> 1.1.8
+-  ``libgcc`` 13.3.0 -> 14.2.0
+-  ``libgcc-initial`` 13.3.0 -> 14.2.0
+-  ``libgcrypt`` 1.10.3 -> 1.11.0
+-  ``libgfortran`` 13.3.0 -> 14.2.0
+-  ``libgit2`` 1.7.2 -> 1.8.1
+-  ``libgpg-error`` 1.48 -> 1.50
+-  ``libical`` 3.0.17 -> 3.0.18
+-  ``libinput`` 1.25.0 -> 1.26.1
+-  ``libjitterentropy`` 3.4.1 -> 3.5.0
+-  ``libksba`` 1.6.6 -> 1.6.7
+-  ``libnl`` 3.9.0 -> 3.10.0
+-  ``libpam`` 1.5.3 -> 1.6.1
+-  ``libpcap`` 1.10.4 -> 1.10.5
+-  ``libpciaccess`` 0.18 -> 0.18.1
+-  ``libpcre2`` 10.43 -> 10.44
+-  ``libpng`` 1.6.42 -> 1.6.43
+-  ``libportal`` 0.7.1 -> 0.8.1
+-  ``libproxy`` 0.5.4 -> 0.5.8
+-  ``librepo`` 1.17.0 -> 1.18.1
+-  ``librsvg`` 2.57.1 -> 2.58.2
+-  ``libsdl2`` 2.30.1 -> 2.30.7
+-  ``libslirp`` 4.7.0 -> 4.8.0
+-  ``libsolv`` 0.7.28 -> 0.7.30
+-  ``libsoup`` 3.4.4 -> 3.6.0
+-  ``libstd-rs`` 1.75.0 -> 1.79.0
+-  ``libtirpc`` 1.3.4 -> 1.3.5
+-  ``libtool`` 2.4.7 -> 2.5.2
+-  ``libtool-cross`` 2.4.7 -> 2.5.2
+-  ``libtool-native`` 2.4.7 -> 2.5.2
+-  ``libtraceevent`` 1.7.3 -> 1.8.3
+-  ``liburcu`` 0.14.0 -> 0.14.1
+-  ``liburi-perl`` 5.27 -> 5.28
+-  ``libva`` 2.20.0 -> 2.22.0
+-  ``libva-initial`` 2.20.0 -> 2.22.0
+-  ``libva-utils`` 2.20.1 -> 2.22.0
+-  ``libwebp`` 1.3.2 -> 1.4.0
+-  ``libwpe`` 1.14.2 -> 1.16.0
+-  ``libx11`` 1.8.9 -> 1.8.10
+-  ``libxcb`` 1.16 -> 1.17.0
+-  ``libxdmcp`` 1.1.4 -> 1.1.5
+-  ``libxfont2`` 2.0.6 -> 2.0.7
+-  ``libxkbcommon`` 1.6.0 -> 1.7.0
+-  ``libxml2`` 2.12.8 -> 2.13.3
+-  ``libxmlb`` 0.3.15 -> 0.3.19
+-  ``libxmu`` 1.1.4 -> 1.2.1
+-  ``libxslt`` 1.1.39 -> 1.1.42
+-  ``libxtst`` 1.2.4 -> 1.2.5
+-  ``lighttpd`` 1.4.74 -> 1.4.76
+-  ``linux-firmware`` 20240312 -> 20240909
+-  ``linux-libc-headers`` 6.6 -> 6.10
+-  ``linux-yocto`` 6.6.35+git -> 6.6.50+git, 6.10.8+git
+-  ``linux-yocto-dev`` 6.9+git -> 6.11+git
+-  ``linux-yocto-rt`` 6.6.35+git -> 6.6.50+git, 6.10.8+git
+-  ``linux-yocto-tiny`` 6.6.35+git -> 6.6.50+git, 6.10.8+git
+-  ``llvm`` 18.1.6 -> 18.1.8
+-  ``logrotate`` 3.21.0 -> 3.22.0
+-  ``ltp`` 20240129 -> 20240524
+-  ``lttng-modules`` 2.13.12 -> 2.13.14
+-  ``lttng-tools`` 2.13.13 -> 2.13.14
+-  ``lua`` 5.4.6 -> 5.4.7
+-  ``lz4`` 1.9.4 -> 1.10.0
+-  ``lzip`` 1.24 -> 1.24.1
+-  ``man-db`` 2.12.0 -> 2.12.1
+-  ``man-pages`` 6.06 -> 6.9.1
+-  ``mc`` 4.8.31 -> 4.8.32
+-  ``mdadm`` 4.2 -> 4.3
+-  ``meson`` 1.3.1 -> 1.5.1
+-  ``mkfontscale`` 1.2.2 -> 1.2.3
+-  ``mmc-utils`` 0.1+git (b5ca140312d2…) -> 0.1+git (123fd8b2ac39…)
+-  ``mpg123`` 1.32.6 -> 1.32.7
+-  ``msmtp`` 1.8.25 -> 1.8.26
+-  ``mtd-utils`` 2.1.6 -> 2.2.0
+-  ``mtdev`` 1.1.6 -> 1.1.7
+-  ``mtools`` 4.0.43 -> 4.0.44
+-  ``musl`` 1.2.4+git -> 1.2.5+git
+-  ``nativesdk-libtool`` 2.4.7 -> 2.5.2
+-  ``ncurses`` 6.4 -> 6.5
+-  ``nettle`` 3.9.1 -> 3.10
+-  ``nfs-utils`` 2.6.4 -> 2.7.1
+-  ``nghttp2`` 1.61.0 -> 1.63.0
+-  ``ninja`` 1.11.1 -> 1.12.1
+-  ``npth`` 1.6 -> 1.7
+-  ``ofono`` 2.4 -> 2.10
+-  ``opensbi`` 1.4 -> 1.5.1
+-  ``openssh`` 9.6p1 -> 9.8p1
+-  ``openssl`` 3.2.3 -> 3.3.1
+-  ``opkg`` 0.6.3 -> 0.7.0
+-  ``opkg-utils`` 0.6.3 -> 0.7.0
+-  ``ovmf`` edk2-stable202402 -> edk2-stable202408
+-  ``p11-kit`` 0.25.3 -> 0.25.5
+-  ``pango`` 1.52.1 -> 1.54.0
+-  ``pciutils`` 3.11.1 -> 3.13.0
+-  ``perl`` 5.38.2 -> 5.40.0
+-  ``perlcross`` 1.5.2 -> 1.6
+-  ``piglit`` 1.0+gitr (22eaf6a91cfd…) -> 1.0+gitr (c11c9374c144…)
+-  ``pinentry`` 1.2.1 -> 1.3.1
+-  ``pkgconf`` 2.1.1 -> 2.3.0
+-  ``psmisc`` 23.6 -> 23.7
+-  ``ptest-runner`` 2.4.4+git -> 2.4.5+git
+-  ``puzzles`` 0.0+git (80aac3104096…) -> 0.0+git (1c1899ee1c4e…)
+-  ``python3-alabaster`` 0.7.16 -> 1.0.0
+-  ``python3-attrs`` 23.2.0 -> 24.2.0
+-  ``python3-babel`` 2.14.0 -> 2.16.0
+-  ``python3-bcrypt`` 4.1.2 -> 4.2.0
+-  ``python3-beartype`` 0.17.2 -> 0.18.5
+-  ``python3-build`` 1.1.1 -> 1.2.1
+-  ``python3-certifi`` 2024.2.2 -> 2024.8.30
+-  ``python3-cffi`` 1.16.0 -> 1.17.0
+-  ``python3-cryptography`` 42.0.5 -> 42.0.8
+-  ``python3-cryptography-vectors`` 42.0.5 -> 42.0.8
+-  ``python3-cython`` 3.0.8 -> 3.0.11
+-  ``python3-dbusmock`` 0.31.1 -> 0.32.1
+-  ``python3-docutils`` 0.20.1 -> 0.21.2
+-  ``python3-dtschema`` 2024.2 -> 2024.5
+-  ``python3-git`` 3.1.42 -> 3.1.43
+-  ``python3-hatchling`` 1.21.1 -> 1.25.0
+-  ``python3-hypothesis`` 6.98.15 -> 6.111.2
+-  ``python3-idna`` 3.7 -> 3.8
+-  ``python3-jsonpointer`` 2.4 -> 3.0.0
+-  ``python3-jsonschema`` 4.21.1 -> 4.23.0
+-  ``python3-libarchive-c`` 5.0 -> 5.1
+-  ``python3-license-expression`` 30.2.0 -> 30.3.1
+-  ``python3-lxml`` 5.0.0 -> 5.3.0
+-  ``python3-mako`` 1.3.2 -> 1.3.5
+-  ``python3-markdown`` 3.5.2 -> 3.6
+-  ``python3-maturin`` 1.4.0 -> 1.7.1
+-  ``python3-meson-python`` 0.15.0 -> 0.16.0
+-  ``python3-more-itertools`` 10.2.0 -> 10.4.0
+-  ``python3-packaging`` 23.2 -> 24.1
+-  ``python3-pbr`` 6.0.0 -> 6.1.0
+-  ``python3-pip`` 24.0 -> 24.2
+-  ``python3-pluggy`` 1.4.0 -> 1.5.0
+-  ``python3-psutil`` 5.9.8 -> 6.0.0
+-  ``python3-pyasn1`` 0.5.1 -> 0.6.0
+-  ``python3-pycairo`` 1.26.0 -> 1.26.1
+-  ``python3-pycparser`` 2.21 -> 2.22
+-  ``python3-pyelftools`` 0.30 -> 0.31
+-  ``python3-pygments`` 2.17.2 -> 2.18.0
+-  ``python3-pygobject`` 3.46.0 -> 3.48.2
+-  ``python3-pyopenssl`` 24.0.0 -> 24.2.1
+-  ``python3-pyparsing`` 3.1.1 -> 3.1.4
+-  ``python3-pyproject-metadata`` 0.7.1 -> 0.8.0
+-  ``python3-pytest`` 8.0.2 -> 8.3.2
+-  ``python3-pytest-subtests`` 0.11.0 -> 0.13.1
+-  ``python3-pyyaml`` 6.0.1 -> 6.0.2
+-  ``python3-referencing`` 0.33.0 -> 0.35.1
+-  ``python3-requests`` 2.31.0 -> 2.32.3
+-  ``python3-rpds-py`` 0.18.0 -> 0.20.0
+-  ``python3-scons`` 4.6.0 -> 4.8.0
+-  ``python3-setuptools`` 69.1.1 -> 72.1.0
+-  ``python3-setuptools-rust`` 1.9.0 -> 1.10.1
+-  ``python3-setuptools-scm`` 8.0.4 -> 8.1.0
+-  ``python3-sphinx`` 7.2.6 -> 8.0.2
+-  ``python3-sphinxcontrib-applehelp`` 1.0.8 -> 2.0.0
+-  ``python3-sphinxcontrib-devhelp`` 1.0.6 -> 2.0.0
+-  ``python3-sphinxcontrib-htmlhelp`` 2.0.5 -> 2.1.0
+-  ``python3-sphinxcontrib-qthelp`` 1.0.7 -> 2.0.0
+-  ``python3-sphinxcontrib-serializinghtml`` 1.1.10 -> 2.0.0
+-  ``python3-testtools`` 2.7.1 -> 2.7.2
+-  ``python3-trove-classifiers`` 2024.2.23 -> 2024.7.2
+-  ``python3-typing-extensions`` 4.10.0 -> 4.12.2
+-  ``python3-uritools`` 4.0.2 -> 4.0.3
+-  ``python3-urllib3`` 2.2.1 -> 2.2.2
+-  ``python3-webcolors`` 1.13 -> 24.8.0
+-  ``python3-websockets`` 12.0 -> 13.0.1
+-  ``python3-wheel`` 0.42.0 -> 0.44.0
+-  ``python3-zipp`` 3.17.0 -> 3.20.1
+-  ``qemu`` 8.2.3 -> 9.0.2
+-  ``qemu-native`` 8.2.3 -> 9.0.2
+-  ``qemu-system-native`` 8.2.3 -> 9.0.2
+-  ``quilt`` 0.67 -> 0.68
+-  ``quilt-native`` 0.67 -> 0.68
+-  ``readline`` 8.2 -> 8.2.13
+-  ``repo`` 2.42 -> 2.46
+-  ``rng-tools`` 6.16 -> 6.17
+-  ``rpcbind`` 1.2.6 -> 1.2.7
+-  ``rsync`` 3.2.7 -> 3.3.0
+-  ``rt-tests`` 2.6 -> 2.7
+-  ``ruby`` 3.2.2 -> 3.3.4
+-  ``rust`` 1.75.0 -> 1.79.0
+-  ``rust-cross-canadian`` 1.75.0 -> 1.79.0
+-  ``rust-llvm`` 1.75.0 -> 1.79.0
+-  ``shaderc`` 2023.8 -> 2024.1
+-  ``shadow`` 4.14.2 -> 4.16.0
+-  ``spirv-headers`` 1.3.275.0 -> 1.3.290.0
+-  ``spirv-tools`` 1.3.275.0 -> 1.3.290.0
+-  ``sqlite3`` 3.45.1 -> 3.46.1
+-  ``strace`` 6.7 -> 6.10
+-  ``stress-ng`` 0.17.05 -> 0.18.02
+-  ``sysklogd`` 2.5.2 -> 2.6.1
+-  ``sysstat`` 12.7.5 -> 12.7.6
+-  ``systemd`` 255.4 -> 256.5
+-  ``systemd-boot`` 255.4 -> 256.5
+-  ``systemd-boot-native`` 255.4 -> 256.5
+-  ``systemtap`` 5.0 -> 5.1
+-  ``systemtap-native`` 5.0 -> 5.1
+-  ``taglib`` 2.0.1 -> 2.0.2
+-  ``tcl`` 8.6.13 -> 8.6.14
+-  ``texinfo`` 7.0.3 -> 7.1
+-  ``ttyrun`` 2.31.0 -> 2.34.0
+-  ``u-boot`` 2024.01 -> 2024.07
+-  ``u-boot-tools`` 2024.01 -> 2024.07
+-  ``util-linux`` 2.39.3 -> 2.40.2
+-  ``util-linux-libuuid`` 2.39.3 -> 2.40.2
+-  ``util-macros`` 1.20.0 -> 1.20.1
+-  ``vala`` 0.56.15 -> 0.56.17
+-  ``valgrind`` 3.22.0 -> 3.23.0
+-  ``vte`` 0.74.2 -> 0.76.3
+-  ``vulkan-headers`` 1.3.275.0 -> 1.3.290.0
+-  ``vulkan-loader`` 1.3.275.0 -> 1.3.290.0
+-  ``vulkan-samples`` git (2307c3eb5608…) -> git (fdce530c0295…)
+-  ``vulkan-tools`` 1.3.275.0 -> 1.3.290.0
+-  ``vulkan-utility-libraries`` 1.3.275.0 -> 1.3.290.0
+-  ``vulkan-validation-layers`` 1.3.275.0 -> 1.3.290.0
+-  ``vulkan-volk`` 1.3.275.0 -> 1.3.290.0
+-  ``waffle`` 1.7.2 -> 1.8.1
+-  ``wayland`` 1.22.0 -> 1.23.1
+-  ``wayland-protocols`` 1.33 -> 1.37
+-  ``webkitgtk`` 2.44.1 -> 2.44.3
+-  ``weston`` 13.0.1 -> 13.0.3
+-  ``wget`` 1.21.4 -> 1.24.5
+-  ``wpa-supplicant`` 2.10 -> 2.11
+-  ``x264`` r3039+git (baee400fa9ce…) -> r3039+git (31e19f92f00c…)
+-  ``xauth`` 1.1.2 -> 1.1.3
+-  ``xcb-proto`` 1.16.0 -> 1.17.0
+-  ``xev`` 1.2.5 -> 1.2.6
+-  ``xkeyboard-config`` 2.41 -> 2.42
+-  ``xmlto`` 0.0.28+0.0.29+git -> 0.0.29
+-  ``xorgproto`` 2023.2 -> 2024.1
+-  ``xwayland`` 23.2.5 -> 24.1.2
+-  ``xz`` 5.4.6 -> 5.6.2
+-  ``zstd`` 1.5.5 -> 1.5.6
+
+
 Contributors to 5.1
 ~~~~~~~~~~~~~~~~~~~

--
2.46.0

