Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F5FE77188
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.77669.1734427637952485982
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SC5JoBJM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BAC31C0010;
	Tue, 17 Dec 2024 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTYQ4N0AwGeeX7rkAh1t5OuDvDokL/8hTfdfOM89g48=;
	b=SC5JoBJMfZ+/JtFOnPvoZ7VDbT23q11xfV1jYRyEWOeb9LzOrMH89c4iBit9ce7A2OIP8J
	6nwKxEbF18Pi0wnyMM0KG/4xXrcdb/53gbuMfqBeyl6lXq5DYsLRaNnKIXT5YOa6K6Kbzy
	ysYjHsSMvZaztc0hMZ6ohClhK8yZ/r4/0cidcpe5DOhJDqWNkpQVAG+rh6bWemzpFlqpGk
	LNZUeEBsYgX4Cj2TTBvHwzwlmYiBgs2YL/2NoDyh5ftmEFU/Idvn65UuMx0ec8CU9bEhyS
	s9bB0k7I4snWH67F5IwhTiFZ2Ytbju4cDbTC+Xt62cvCX22/Y1TttCV9WBz4fA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:13 +0100
Subject: [yocto-docs PATCH 14/14] migration-guides: update the release
 notes for 5.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-14-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=18997;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=bkDWJAmvB3vUKJ60QSI+qzcRLDOyK+TuZV9OlsMsnEk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPxV9q/ux7yNIm5qGNBe2jqkP9mz0IVzUJLv
 1ywqcUWILaJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD8QAKCRDRgEFAKaOo
 NtUlEACVPACeTZ3mlWDk02fph7uaFSIfLCClUcTwJHh8r+LjmyfPiicSCJLjq8vHEUx0x6Va5Uh
 7MPDQ3GcqtbvAjZYZGuXBtJWPyw7+2KSo+7yIDuJvmpn/JMwjQRiXQHemYcUXQ1FndUn88c+XvQ
 CAnQHngb7Mbj5onnPMMWjr+cFrh4MSCR0dWkn7c3cWiy+5ktx7e7ZpQKPF9yvjxmQ0ASYKmGxQA
 +zUxjJ8nOGGBpn5ajr4u0bcCE6xde6G8ksQFSu7XCXLxiCrPNjXPAYwf8BdB9M2qt2QD4lGXpz6
 CbOtXR0nJr+eND7+o/AVefBo8cZ1UQQhi+9SIOD1v9qmnPaMCb6oay8g6lWeIorFG3guUmlQMcg
 6wKimhvMJIryJUz1KsueVRWwOehAzhVsEKu4gXRzBKPQ83ojsDzg7AnxLxFQOpa6wW0+m+LI/gG
 WDEpDzLRhlnTGDUzdT4Zvb4TYugxvQRcNl78ZWSQu0JZ2vmydW/Cix8DALWZ9D0gUN3YII4uJRe
 WbLYMJdiUaPZebwravsm6O9+tXk6ewhT8dTyTtIYEYAQ5PFu7bAQ+mLOxktrch9TmuzyinmpAG9
 deuDd0NMuSW8EOlKrb6+3jBDXlMyBpYwGuELnca11JsxrCCBLMqn3RQVP33kod0uTag04yuqJnw
 jgczc//UBz1NH0w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5947

Update the release note and migration guide for the 5.2 release. This
release is not due until April 2025, but this catches up what has
already been applied since 5.1.

Precisely, this tracks the important changes between commits
8149e74258 and 87d7341465 in poky.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst   |  50 +++
 .../migration-guides/release-notes-5.2.rst         | 345 ++++++++++++++++++++-
 2 files changed, 393 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 7b35e7721fa74f51617fb5530987f62e9c74fed9..532f3942e4ac678c8afc2887b83f9296d1d26438 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -14,6 +14,28 @@ Migration notes for |yocto-ver| (|yocto-codename|)
 This section provides migration information for moving to the Yocto
 Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
 
+``debug-tweaks`` removed from :term:`IMAGE_FEATURES`
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The ``debug-tweaks`` image feature is now removed because it was too vague about
+what it achieved: an image on which the ``root`` user can login without a
+password.
+
+To achieve the same result, the features previously added by ``debug-tweaks``
+should be manually added to the :term:`IMAGE_FEATURES` variable. These are:
+
+-  ``allow-empty-password``
+-  ``allow-root-login``
+-  ``empty-root-password``
+-  ``post-install-logging``
+
+Such a statement would be::
+
+   IMAGE_FEATURES += "allow-empty-password allow-root-login empty-root-password post-install-logging"
+
+See the list of available image features in the :ref:`ref-features-image`
+section of the Yocto Project Reference Manual.
+
 Supported kernel versions
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -34,9 +56,24 @@ See :ref:`all supported distributions <system-requirements-supported-distros>`.
 Go language changes
 ~~~~~~~~~~~~~~~~~~~
 
+Rust language changes
+~~~~~~~~~~~~~~~~~~~~~
+
+-  Recipes inheriting the :ref:`ref-classes-cargo` do not install libraries by
+   default anymore. This behavior can be controlled by the
+   :term:`CARGO_INSTALL_LIBRARIES` variable.
+
 systemd changes
 ~~~~~~~~~~~~~~~
 
+-  Support for ``split-usr`` and ``unmerged-usr`` are now removed after Systemd
+   was updated to version 255. This option allowed installing Systemd in a
+   system where directories such as ``/lib``, ``/sbin`` or ``/bin`` are *not*
+   merged into ``/usr``.
+
+   As a consequence, the ``systemd`` recipe no longer contains the ``usrmerge``
+   :term:`PACKAGECONFIG` option as it is now implied by default.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 
@@ -45,16 +82,29 @@ Removed variables
 
 The following variables have been removed:
 
+-  ``PACKAGE_SNAP_LIB_SYMLINKS``: related to an unmaintained and obsolete
+   "micro" :term:`distro <DISTRO>`.
+
+-  ``SETUPTOOLS_INSTALL_ARGS``: obsolete and unused variable.
+
 Removed recipes
 ~~~~~~~~~~~~~~~
 
 The following recipes have been removed in this release:
 
+-  ``liburi-perl``: moved to :oe_git:`meta-perl </meta-openembedded/tree/meta-perl>`.
+-  ``python3-isodate``: moved to :oe_git:`meta-python </meta-openembedded/tree/meta-python>`.
+-  ``python3-iniparse``: removed as there are no consumers of this recipe in
+   :oe_git:`openembedded-core </openembedded-core>` or :oe_git:`meta-openembedded </meta-openembedded>`.
+
 Removed classes
 ~~~~~~~~~~~~~~~
 
 The following classes have been removed in this release:
 
+-  ``migrate_localcount.bbclass``: obsolete class for which code was already
+   removed in 2012.
+
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index d03ed7a3b07936fc3c2d15177f350b5507ecb5d4..0eef448330df0b3b3ec8a2c77cdb042a36e240c1 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -14,36 +14,377 @@ New Features / Enhancements in |yocto-ver|
 
 -  New variables:
 
+   -  ``linux-firmware``: Add the :term:`FIRMWARE_COMPRESSION` variable which
+      allows compression the firmwares provided by the ``linux-firmware`` recipe.
+      Possible values are ``xz`` and ``zst``.
+
 -  Kernel-related changes:
 
+   -  :ref:`ref-classes-cml1`: in :ref:`ref-tasks-diffconfig`, do not override
+      ``.config`` with ``.config.orig``. This applies to other recipes using the
+      class :ref:`ref-classes-cml1`.
+
+   -  ``linux-firmware``: add following new firmware packages:
+
+       -  ``qcom-qcm6490-audio``
+       -  ``qcom-qcm6490-compute``
+       -  ``qcom-adreno-a663``
+       -  ``qcom-qcm6490-adreno``
+       -  ``qcom-sa8775p-adreno``
+       -  ``qcom-qcm6490-ipa``
+       -  ``qcom-x1e80100-audio``
+       -  ``qcom-qcs615-adreno``
+
+   -  The :ref:`ref-classes-kernel-yocto` classes now supports in-tree
+      configuration fragments. These can be added with the
+      :term:`KERNEL_FEATURES` variable.
+
+   -  The ``kern-tools`` recipe is now able to recognize files ending with
+      ``.config`` for :ref:`ref-classes-kernel-yocto`-based Kernel recipes.
+
+   -  Support the LZMA compression algorithm in the
+      :ref:`ref-classes-kernel-uboot` class. This can be done by setting the
+      variable :term:`FIT_KERNEL_COMP_ALG` to ``lzma``.
+
 -  New core recipes:
 
+   -  ``python3-pefile``: required for the :ref:`ref-classes-uki` class.
+
+   -  Add initial support for the `Barebox <https://www.barebox.org>`__
+      bootloader, along with associated OEQA test cases.
+
+   -  Import ``makedumpfile`` from meta-openembedded, as the ``kexec-tools``
+      recipe :term:`RDEPENDS` on it.
+
+   -  The ``tcl-8`` recipe was added back to support the build of ``expect``.
+
+   -  Add the ``libdisplay-info`` recipe, an EDID and DisplayID library,
+      required for Weston 14.0.1 and newer.
+
+   -  The ``hwdata`` recipe was imported from :oe_git:`meta-openembedded
+      </meta-openembedded>`, a recipe for hardware identification and
+      configuration data, needed by ``libdisplay-info``.
+
+-  New core classes:
+
+   -  New :ref:`ref-classes-uki` class for building Unified Kernel Images (UKI).
+      Associated OEQA tests were also added for this class.
+
+   -  New :ref:`ref-classes-cython` class for python recipes that require Cython
+      for their compilation. Existing recipes depending on Cython now inherit
+      this class. This class also strips potential build paths in the compilation
+      output for reproducibility.
+
+-  Architecture-specific changes:
+
+   -  ``tune-cortexa32``: set tune feature to ``armv8a``.
+
 -  QEMU / ``runqemu`` changes:
 
+-  Documentation changes:
+
+   -  Use ``rsvg`` as a replacement of ``inkscape`` to convert svg files in the
+      documentation.
+
+   -  The ``cve`` role was replaced by ``cve_nist`` to avoid a conflict with
+      more recent version of Sphinx.
+
 -  Go changes:
 
+   -  The :ref:`ref-classes-go-mod` class now sets an internal variable
+      ``GO_MOD_CACHE_DIR`` to enable the use of the Go module fetchers for
+      downloading and unpacking module dependencies to the module cache.
+
+   -  Make the :ref:`ref-tasks-compile` task run before
+      :ref:`ref-tasks-populate_lic` in the :ref:`ref-classes-go-mod` class so
+      license files are found by :ref:`ref-tasks-populate_lic` after the ``go
+      install`` command is run in :ref:`ref-tasks-compile`.
+
 -  Rust changes:
 
--  wic Image Creator changes:
+   -  ``rust-target-config``: Update the data layout for the *x86-64* target, as
+      it was different in Rust from LLVM, which produced a data layout error.
+
+-  Wic Image Creator changes:
+
+   -  Allow the ``--exclude-path`` option to exclude symlinks.
+
+   -  Add the variable :term:`WIC_SECTOR_SIZE` to control the sector size of Wic
+      images.
 
 -  SDK-related changes:
 
+   -  Add support for ZST-compression through :term:`SDK_ARCHIVE_TYPE`, by
+      setting its value to ``tar.zst``.
+
+   -  The ``debug-tweaks`` features were removed from ``-sdk`` images
+      (``core-image-*-sdk.bb``).
+
+   -  Enable ``ipv6``, ``acl``, and ``xattr`` in :term:`DISTRO_FEATURES_NATIVESDK`.
+
 -  Testing-related changes:
 
+   -  ``oeqa/postactions``: Fix archive retrieval from target.
+
+   -  ``oeqa/selftest/gcc``: Fix kex exchange identification error.
+
+   -  ``oeqa/utils/qemurunner``: support ignoring vt100 escape sequences.
+
+   -  ``oeqa``: support passing custom boot patterns to runqemu.
+
+   -  ``oeqa/selftest/cases``: add basic U-boot and Barebox tests.
+
+   -  ``oeqa/selftest/rust``: skip on all MIPS platforms.
+
+   -  Lots of changes and improvements to the :term:`Toaster` OEQA tests.
+
+   -  ``oeqa/selftest``: add a test for bitbake "-e" and "-getvar" difference.
+
+   -  ``oeqa/ssh``: improve performance and log sizes when handling large files.
+
 -  Utility script changes:
 
+   -  The ``patchreview.py`` script now uses the ``check_upstream_status`` from
+      ``oe.qa`` to get patch statuses.
+
+   -  ``resulttool``:
+
+      -  Allow store to filter to specific revisions (``--revision`` flag).
+
+      -  Use single space indentation in JSON output, to save disk
+         space.
+
+      -  Add ``--logfile-archive`` option to store and archive log files
+         separately.
+
+      -  Handle LTP raw logs as well as Ptest.
+
+   -  ``scripts/yocto-check-layer``:
+
+      -  Check for the presence of a ``SECURITY.md`` file in layers and make it
+         mandatory.
+
+      -  The :ref:`ref-classes-yocto-check-layer` class now uses
+         :term:`CHECKLAYER_REQUIRED_TESTS` to get the list of QA checks to verify
+         when running the ``yocto-check-layer`` script.
+
 -  BitBake changes:
 
+   -  ``fetch2``: do not preserve ownership when unpacking.
+
+   -  ``fetch2``: switch from Sqlite ``persist_data`` to a standard cache file
+      for checksums, and drop ``persist_data``.
+
+   -  ``fetch2``: add support for GitHub codespaces by adding the
+      ``GITHUB_TOKEN`` to the list of variables exported during ``git``
+      invocations.
+
+   -  ``fetch2``: set User-Agent to 'bitbake/version' instead of a "fake
+      mozilla" user agent.
+
+   -  ``compress``: use ``lz4`` instead of ``lz4c``, as ``lz4c`` as been
+      considered deprecrated since 2018.
+
+   -  ``server/process``: decrease idle/main loop frequency, as it is idle and
+      main loops have socket select calls to know when to execute.
+
+   -  ``bitbake-worker``: improve bytearray truncation performance when large
+       amounts of data are being transferred from the cooker to the worker.
+
+   -  ``bitbake-worker/cooker``: increase the default pipe size from 64KB to
+      512KB for better efficiency when transferring large amounts of data.
+
+   -  ``fetch/wget``: increase timeout to 100s from 30s to match CDN worst
+      response time.
+
+   -  ``bitbake-getvar``: catch ``NoProvider`` exception to improve error
+      readability when a recipe is not found with ``--recipe``.
+
+   -  ``bb/build``: add a function ``bb.build.listtasks()`` to list the tasks in
+      a datastore.
+
+   -  Remove custom exception backtrace formatting, and replace occurences of
+      ``bb.exception.format_exception()`` by ``traceback.format_exception()``.
+
+   -  ``runqueue``: various performance optimizations including:
+
+      -  Fix performance of multiconfigs with large overlap.
+      -  Optimise ``setscene`` loop processing by starting where it
+         was left off in the previous execution.
+
+   -  ``knotty`` now hints the user if :term:`MACHINE` was not set in
+      the ``local.conf`` file.
+
 -  Packaging changes:
 
--  Security changes:
+   -  ``systemd``: extract dependencies from ``.note.dlopen`` ELF segments, to
+      better detect dynamically linked libraries at runtime.
+
+   -  ``package_rpm``: use ZSTD's default compression level from the variable
+      :term:`ZSTD_COMPRESSION_LEVEL`.
+
+   -  ``package_rpm``: restrict RPM packaging to 4 threads to improve
+      the compression speed.
 
 -  LLVM related changes:
 
 -  SPDX-related changes:
 
+   -  SPDX 3.0: Find local sources when searching for debug sources.
+
+   -  SPDX 3.0: Map ``gitsm`` URIs to ``git``.
+
+   -  SPDX 3.0: Link license and build by alias instead of SPDX ID.
+
+   -  Fix SPDX tasks not running when code changes (use of ``file-checksums``).
+
+-  ``devtool`` changes:
+
+   -  Remove the "S = WORKDIR" workaround as now :term:`S` cannot be equal to
+      :term:`WORKDIR`.
+
+-  Patchtest-related changes:
+
+   -  Refactor pattern definitions in a ``patterns`` module.
+
+   -  Refactor and improve the ``mbox`` module.
+
+   -  Split out result messages.
+
+   -  Add a check for user name tags in patches (for example "fix added by
+      @username").
+
+-  :ref:`ref-classes-insane` class related changes:
+
+   -  Only parse ELF if they are files and not symlinks.
+
+   -  Check for ``RUNPATH`` in addition to ``RPATH`` in binaries.
+
+   -  Ensure :ref:`ref-classes-insane` tasks of dependencies run in builds when
+      expected.
+
+-  Security changes:
+
+   -  The ``PIE`` gcc flag is now passed for the *powerpc* architecture after a
+      bugfix in gcc (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81170).
+
+   -  ``openssh``: be more restrictive on private key file permissions by
+      setting them from the :ref:`ref-tasks-install` task.
+
+-  :ref:`ref-classes-cve-check` changes:
+
+   -  Update the :term:`DL_DIR` database location name
+      (``${DL_DIR}/CVE_CHECK2``).
+
+   -  Add the field "modified" to the JSON report (from "NVD-modified").
+
+   -  Add support for CVSS v4.0.
+
+   -  Fix malformed cve status description with ``:`` characters.
+
+   -  Restore the :term:`CVE_CHECK_SHOW_WARNINGS` variable and functionality. It
+      currently prints warning message for every unpatched CVE the
+      :ref:`ref-classes-cve-check` class finds.
+
+-  New :term:`PACKAGECONFIG` options for individual recipes:
+
+      -  ``perf``: ``zstd``
+      -  ``ppp``: ``pam``, ``openssl``
+      -  ``libpciaccess``: ``zlib``
+      -  ``gdk-pixbuf``: ``gif``, ``others``
+      -  ``libpam``: ``selinux``
+      -  ``libsecret``: ``pam``
+
 -  Miscellaneous changes:
 
+   -  ``bluez``: fix mesh build when building with musl.
+
+   -  ``systemd-bootchart``: now supports the 32-bit *riscv* architecture.
+
+   -  ``systemd-boot``: now supports the *riscv* architecture.
+
+   -  ``python3-pip``: the ``pip`` executable is now left and not deleted, and
+      can be used instead of ``pip3`` and ``pip2``.
+
+   -  ``tar`` image types are now more reproducible as the :term:`IMAGE_CMD` for
+      ``tar`` now strips ``atime`` and ``ctime`` from the archive content.
+
+   -  :term:`SOLIBSDEV` and :term:`SOLIBS` are now defined for the *mingw32*
+      architecture (``.dll``).
+
+   -  :ref:`rootfs-postcommands <ref-classes-rootfs*>`: make opkg status reproducible.
+
+   -  The default :term:`KERNEL_CONSOLE` value is no longer ``ttyS0`` but the
+      first entry from the :term:`SERIAL_CONSOLES` variable.
+
+   -  ``virglrenderer``: add a patch to fix ``-int-conversion`` build issue.
+
+   -  ``ffmpeg``: disable asm optimizations for the *x86* architecture as PIC is
+      required and *x86* ASM code is not PIC.
+
+   -  ``udev-extraconf``: fix the ``network.sh`` script that did not configure
+      hotplugged interfaces.
+
+   -  ``classes-global/license``: move several functions and logic to library
+      code in :oe_git:`meta/lib/oe/license.py </openembedded-core/tree/meta/lib/oe/license.py>`.
+
+   -  The recipe ``cairo`` now disables the features ``symbol-lookup``,
+      ``spectre`, and ``tests`` by default.
+
+   -  The recipe ``glib-2.0`` now disables the feature ``sysprof`` by default.
+
+   -  The recipe ``gstreamer1.0-libav`` now disables the feature ``doc`` by default.
+
+   -  ``rxvt-unicode``: change ``virtual/x-terminal-emulator`` from
+      :term:`PROVIDES` to :term:`RPROVIDES` as ``virtual-x-terminal-emulator``.
+      Also make this recipe depend on the ``x11`` distro features with
+      :term:`REQUIRED_DISTRO_FEATURES`.
+
+   -  ``rxvt-unicode.inc``: disable the ``terminfo`` installation by setting
+      ``TIC`` to ``:`` in :term:`EXTRA_OECONF`, to avoid host contamination.
+
+   -  ``matchbox-terminal``: add ``x-terminal-emulator`` as :term:`RPROVIDES`
+      and set :term:`ALTERNATIVE` for the recipe.
+
+   -  ``default-providers.conf``: set ``rxvt-unicode`` as the default
+      ``virtual-x-terminal-emulator`` runtime provider with
+      :term:`PREFERRED_RPROVIDER`.
+
+   -  ``systemd``: set better sane time at startup by creating the
+      ``clock-epoch`` file in ``${libdir}`` if the ``set-time-epoch``
+      :term:`PACKAGECONFIG` config is set.
+
+   -  ``cve-update-nvd2-native``: updating the database will now result in an
+      error if :term:`BB_NO_NETWORK` is enabled and
+      :term:`CVE_DB_UPDATE_INTERVAL` is not set to ``-1``.
+
+   -  ``systemtap``: add ``--with-extra-version="oe"`` configure option to
+      improve the reproducibility of the recipe.
+
+   -  ``python3``: package ``tkinter``'s shared objects separately in the
+      ``python3-tkinter`` package.
+
+   -  ``init-manager``: set the variable ``VIRTUAL-RUNTIME_dev_manager`` to
+      ``udev`` by default in
+      :oe_git:`meta/conf/distro/include/init-manager-none.inc
+      </openembedded-core/tree/meta/conf/distro/include/init-manager-none.inc>`
+      and :oe_git:`meta/conf/distro/include/init-manager-sysvinit.inc
+      </openembedded-core/tree/meta/conf/distro/include/init-manager-sysvinit.inc>`,
+      instead of :oe_git:`meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+      </openembedded-core/tree/meta/recipes-core/packagegroups/packagegroup-core-boot.bb>`
+      only.
+
+      Likewise, the same is done for ``VIRTUAL-RUNTIME_keymaps`` with
+      ``keymaps`` as its default value.
+
+   -  ``seatd``: Create a ``seat`` group and package the systemd service
+      ``seatd.service`` with correct permissions.
+
+      That way, the ``weston`` user in ``weston-init.bb`` was added to the
+      ``seat`` group to be able to properly establish connection between the
+      Weston and the ``seatd`` socket.
+
+
 Known Issues in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

-- 
2.47.1


