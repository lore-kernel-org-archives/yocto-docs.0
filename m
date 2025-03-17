Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D50C35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.47832.1742202395287591252
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iddF91BL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8EDA43277;
	Mon, 17 Mar 2025 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4JaQSHBGi+IxRwZcMIIgPLdck3ubM55BeoublgXFhko=;
	b=iddF91BLFugvlUV+JF+ReR24qL/HN6+N7FeRY2iSvtD8ONXfuDJqv8dAiwohwFVPvN0nAh
	MOtxr2bOCDndW0oxByB69TAq6faRKuFJnrlZugtBdE6tpncdQQ7NBzyoVZHndfhjA2DZDb
	LHcQFNgkyuP+VOM+o0roTJHYY3UlCDxVVZkwBa+HlH7L3fQewZfaDNBZUlYbmeRcGc8vNq
	qsd/T5msHSf9g4FZxPuMTGqrFt7GQfwRV3eHDxKse+MAOLUB0R4qrjt0ZS+bY9gPgfUnHg
	MXQ0oY4WW06wY2RbM9NvZ+/Q9Sv8UlwjUDi/UXMcHw0f/RHFLa5dN6D0fX23sg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:06:17 +0100
Subject: [PATCH 11/11] migration-guides/release-notes-5.2: update for
 upcoming 5.2 release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-release-note-5-2-updates-v1-11-82b0a4182aff@bootlin.com>
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=21722;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6vnv614R4hggmH7hX4lIJLhES9RjJUpY43YqxSTXrO8=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+YW1Qqo/ZqJJJ+RHjvS4H2jSkwpUOXZ+xkLs
 7tLG7Tr67eJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fmFgAKCRDRgEFAKaOo
 NkdKEAC6y4kYU81FuTb9ZmX1r1KweM4oowatu4FGPuHKqXZLINZY//yOu46lGFRxK36vHkrWI2i
 AMVrhk2YPsTOeSJkuFNLs6RFb5O2+QHOcI4zMHW6GoQW/wIKh7JAZJlMtgpgB11gCfMOZQR2kl9
 GV4x2NZ3f4hyezkHgdaRembqcVyk9d88WQm2Yw4+ECXjCYMI1UFUb7U6hZQFNRNxFe3EXGfU2lh
 NLnkkAPl4dTrCHgNpeEhF5vwzeVobF5HkYdNdFZe/VKSXXSv2i2nWLWHClicpoQNLLG4EoJ+62v
 O6+l9sy4Zr51gVXQh0ucPheebqjhfoutLd2E8U/rcDkBMhXOFurv8yMPiCIAtVh3Y0jSf3zaFmi
 RrVCVSXGYqwstRUXeE16LqU9lXHvN2hWeMtZntkRX0MG6RFdQ8Zz5JvlMarJNE2sRtWGTl6+ovp
 95rYthnVH5gn2j3RgkouPGPTaIYrJr4rzDOm6enPePsQBYViDtY9qhPGOk1XB0AOoIvCNgtMAP3
 Q6rZyoZQbIuTzSFijBXwq0ujm4cwEwNyaS9P1Izhkn/QaUpVD1b8id9QwwBqIm9cdqUbM+F7d37
 FChgPtOxcwBWqouigJ4EAhsZua5DDSOoP96pXVAjMTK1fpGbtIkhNaB49VRAhLRJ1V6+CtS2SDu
 o6gFgtyMMRl9rlw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeludduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedujeduffeltdejgfdtuefhjeetvdelkeejffekveetfefhtdehtdeivefgudeludenucffohhmrghinhepsggrrhgvsghogidrohhrghdpghhithhhuhgsrdgtohhmpdhphihtvghsthdrohhrghdpkhgvrhhnvghlrdhorhhgpdguvggsihgrnhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtr
 dhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 09:06:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6572

Changes since 87d7341465f8 ("python3-iniparse: remove recipe") up to
6610cad12a06 ("bitbake: data_smart: Ensure module dependency changes
invalidate the base config cache") in Poky.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.2.rst    | 310 ++++++++++++++++--
 1 file changed, 283 insertions(+), 27 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 417b202cd..80a9a3605 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -9,7 +9,7 @@ Release notes for |yocto-ver| (|yocto-codename|)
 New Features / Enhancements in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  Linux kernel 6.XXX, gcc 14.XXX, glibc 2.XXX, LLVM 18.1.XXX, and over XXX other
+-  Linux kernel 6.12, gcc 14.2, glibc 2.41, LLVM 19.1.7, and over 300 other
    recipe upgrades.
 
 -  New variables:
@@ -17,11 +17,30 @@ New Features / Enhancements in |yocto-ver|
    -  ``linux-firmware``: Add the :term:`FIRMWARE_COMPRESSION` variable which
       allows compression the firmwares provided by the ``linux-firmware`` recipe.
       Possible values are ``xz`` and ``zst``.
-   -  reproducibility: Add the :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
+
+   -  Reproducibility: Add the :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
       variable which enables a reproducibility test on recipes using
       :ref:`Shared State <overview-manual/concepts:Shared State>` for the
       dependencies. See :doc:`/test-manual/reproducible-builds`.
 
+   -  ``systemd``: Add term:`WATCHDOG_RUNTIME_SEC`: for controlling the
+      ``RuntimeWatchdogSec`` option in ``/etc/systemd/system.conf``.
+
+   -  :term:`FIT_UBOOT_ENV` to allow including a u-boot script as a text in a
+      fit image. See the :ref:`ref-classes-kernel-fitimage` for more information.
+
+   -  :ref:`ref-classes-meson`: :term:`MESON_INSTALL_TAGS` to allow passing
+      install tags (``--tags``) to the ``meson install`` command during the
+      :ref:`ref-tasks-install` task.
+
+   -  :ref:`ref-classes-cve-check`: :term:`NVD_DB_VERSION` to allow choosing the
+      CVE feed when using the :ref:`ref-classes-cve-check` class.
+
+   -  The :term:`BB_USE_HOME_NPMRC` controls whether or not BitBake uses the
+      user's ``.npmrc`` file within their home directory within the npm fetcher.
+      This can be used for authentication of private NPM registries, among other
+      uses.
+
 -  Kernel-related changes:
 
    -  :ref:`ref-classes-cml1`: in :ref:`ref-tasks-diffconfig`, do not override
@@ -38,11 +57,39 @@ New Features / Enhancements in |yocto-ver|
        -  ``qcom-qcm6490-ipa``
        -  ``qcom-x1e80100-audio``
        -  ``qcom-qcs615-adreno``
+       -  ``qcom-aic100``
+       -  ``qcom-qdu100``
+       -  ``qca-qca2066``
+       -  ``qca-qca61x4-serial``
+       -  ``qca-qca61x4-usb``
+       -  ``qca-qca6390``
+       -  ``qca-qca6698``
+       -  ``qca-wcn3950``
+       -  ``qca-wcn3988``
+       -  ``qca-wcn399x``
+       -  ``qca-wcn6750``
+       -  ``qca-wcn7850``
+       -  ``qcom-2-license``
+       -  ``qcom-aic100``
+       -  ``qcom-qcm6490-wifi``
+       -  ``qcom-qdu100``
+       -  ``qcom-sa8775p-audio``
+       -  ``qcom-sa8775p-compute``
+       -  ``qcom-sa8775p-generalpurpose``
+       -  ``qcom-x1e80100-lenovo-t14s-g6-adreno``
+       -  ``qcom-x1e80100-lenovo-t14s-g6-audio``
+       -  ``qcom-x1e80100-lenovo-t14s-g6-compute``
+
+   -  ``linux-firmware``: split ``amgpu``, ``ath10k``, ``ath11k`` and ``ath12k``
+      in separate packages.
 
    -  The :ref:`ref-classes-kernel-yocto` classes now supports in-tree
       configuration fragments. These can be added with the
       :term:`KERNEL_FEATURES` variable.
 
+   -  Kernel configuration audit can now be disabled by setting
+      :term:`KMETA_AUDIT` to 1.
+
    -  The ``kern-tools`` recipe is now able to recognize files ending with
       ``.config`` for :ref:`ref-classes-kernel-yocto`-based Kernel recipes.
 
@@ -50,12 +97,19 @@ New Features / Enhancements in |yocto-ver|
       :ref:`ref-classes-kernel-uboot` class. This can be done by setting the
       variable :term:`FIT_KERNEL_COMP_ALG` to ``lzma``.
 
+   -  :ref:`ref-classes-kernel-yocto`: Reproducibility for commits created by
+      the :ref:`ref-classes-kernel-yocto` class was improved.
+
+   -  ``kernel-arch``: add ``-fmacro-prefix-map`` in ``KERNEL_CC`` to fix a
+      reproducibility issue.
+
 -  New core recipes:
 
    -  ``python3-pefile``: required for the :ref:`ref-classes-uki` class.
 
    -  Add initial support for the `Barebox <https://www.barebox.org>`__
-      bootloader, along with associated OEQA test cases.
+      bootloader, along with associated OEQA test cases. This adds the
+      ``barebox`` and the ``barebox-tools`` recipes.
 
    -  Import ``makedumpfile`` from meta-openembedded, as the ``kexec-tools``
       recipe :term:`RDEPENDS` on it.
@@ -69,6 +123,30 @@ New Features / Enhancements in |yocto-ver|
       </meta-openembedded>`, a recipe for hardware identification and
       configuration data, needed by ``libdisplay-info``.
 
+   -  The ``cve-update-db-native`` was restored from kirkstone and can be used
+      to update the CVE National Vulnerability Database (NVD). Add support for
+      the FKIE-CAD (https://github.com/fkie-cad/nvd-json-data-feeds) CVE source
+      for it.
+
+   -  The ``rpm-sequoia-crypto-policy`` to ship a crypto policy file for the
+      ``rpm-sequoia`` recipe.
+
+  -  The ``libsass`` and ``sassc`` for the C/C++ port of the Sass CSS
+     pre-compiler, required by the ``libadwaita`` recipe.
+
+  -  ``python3-roman-numerals-py``: module providing utilities for working with
+     well-formed Roman numerals. ``python3-sphinx`` relies on this recipe.
+
+  -  The ``fastfloat`` recipe, a header-only library for fast number parsing.
+     This will be a dependency for the ``vte`` recipe in later versions.
+
+  -  The ``avahi-libnss-mdns`` was renamed from ``libnss-mdns``.
+
+  -  The ``cargo-c`` was renamed from ``cargo-c-native``.
+
+  -  The ``tcl8`` recipe was added to support the failing build of ``expect``.
+     The ``tcl`` recipe (version 9) remains the main recipe for this component.
+
 -  New core classes:
 
    -  New :ref:`ref-classes-uki` class for building Unified Kernel Images (UKI).
@@ -79,12 +157,23 @@ New Features / Enhancements in |yocto-ver|
       this class. This class also strips potential build paths in the compilation
       output for reproducibility.
 
+   -  New :ref:`ref-classes-ptest-python-pytest` class to automatically
+      configure :ref:`ref-classes-ptest` for Python packages using the `pytest
+      <https://docs.pytest.org>`__ unit test framework.
+
 -  Architecture-specific changes:
 
    -  ``tune-cortexa32``: set tune feature to ``armv8a``.
 
+   -  Add the ``loongarch64`` architecture for the ``grub2`` and ``llvm``
+      recipes. It was also added to build with ``musl`` as the toolchain.
+
 -  QEMU / ``runqemu`` changes:
 
+   -  ``qemu/machine``: change the  ``QEMU_EXTRAOPTIONS_${TUNE_PKGARCH}`` syntax
+      in QEMU machine definitions to ``QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}``
+      to follow the same patterns as other QEMU-related variables.
+
 -  Documentation changes:
 
    -  Use ``rsvg`` as a replacement of ``inkscape`` to convert svg files in the
@@ -93,6 +182,10 @@ New Features / Enhancements in |yocto-ver|
    -  The ``cve`` role was replaced by ``cve_nist`` to avoid a conflict with
       more recent version of Sphinx.
 
+   -  New documentation on the multiconfig feature: :doc:`/dev-manual/multiconfig`.
+
+   -  New documentation on ``bblock``: :doc:`/dev-manual/bblock`.
+
 -  Go changes:
 
    -  The :ref:`ref-classes-go-mod` class now sets an internal variable
@@ -116,6 +209,9 @@ New Features / Enhancements in |yocto-ver|
    -  Add the variable :term:`WIC_SECTOR_SIZE` to control the sector size of Wic
       images.
 
+   -  ``bootimg-efi``: Support "+" symbol in filenames passed in
+      :term:`IMAGE_EFI_BOOT_FILES`.
+
 -  SDK-related changes:
 
    -  Add support for ZST-compression through :term:`SDK_ARCHIVE_TYPE`, by
@@ -126,6 +222,11 @@ New Features / Enhancements in |yocto-ver|
 
    -  Enable ``ipv6``, ``acl``, and ``xattr`` in :term:`DISTRO_FEATURES_NATIVESDK`.
 
+   -  Toolchain SDKs (``meta-toolchain``) now properly supports the ``usrmerge``
+      feature (part of :term:`DISTRO_FEATURES`).
+
+   -  The ``pipefail`` shell option is now added to the SDK installer script.
+
 -  Testing-related changes:
 
    -  ``oeqa/postactions``: Fix archive retrieval from target.
@@ -144,8 +245,12 @@ New Features / Enhancements in |yocto-ver|
 
    -  ``oeqa/selftest``: add a test for bitbake "-e" and "-getvar" difference.
 
+   -  ``oeqa/selftest``: Fix failure when configuration contains ``BBLAYERS:append``
+
    -  ``oeqa/ssh``: improve performance and log sizes when handling large files.
 
+   -  ``oeqa/poisoning``: fix and improve gcc include poisoning tests.
+
 -  Utility script changes:
 
    -  The ``patchreview.py`` script now uses the ``check_upstream_status`` from
@@ -172,19 +277,42 @@ New Features / Enhancements in |yocto-ver|
          :term:`CHECKLAYER_REQUIRED_TESTS` to get the list of QA checks to verify
          when running the ``yocto-check-layer`` script.
 
+   -  New ``oe-image-files-spdx`` script utility directory under
+      ``scripts/contrib`` to that processes the SPDX 3.0.1 output from a build
+      and lists all the files on the root file system with their checksums.
+
 -  BitBake changes:
 
-   -  ``fetch2``: do not preserve ownership when unpacking.
+   -  Add a new ``include_all`` directive, which can be used to include multiple
+      files present in the same location in different layers.
+
+   -  Fetcher related changes (``fetch2``):
+
+      -  Do not preserve ownership when unpacking.
+
+      -  switch from Sqlite ``persist_data`` to a standard cache file
+         for checksums, and drop ``persist_data``.
+
+      -  add support for GitHub codespaces by adding the
+         ``GITHUB_TOKEN`` to the list of variables exported during ``git``
+         invocations.
 
-   -  ``fetch2``: switch from Sqlite ``persist_data`` to a standard cache file
-      for checksums, and drop ``persist_data``.
+      -  set User-Agent to 'bitbake/version' instead of a "fake
+         mozilla" user agent.
 
-   -  ``fetch2``: add support for GitHub codespaces by adding the
-      ``GITHUB_TOKEN`` to the list of variables exported during ``git``
-      invocations.
+      -  ``wget``: handle HTTP 308 Permanent Redirect.
 
-   -  ``fetch2``: set User-Agent to 'bitbake/version' instead of a "fake
-      mozilla" user agent.
+      -  ``wget``: increase timeout to 100s from 30s to match CDN worst
+         response time.
+
+      -  Add support for fast initial shallow fetch. The fetcher will prefer an
+         initial shallow clone, but will re-utilize an existing bare clone if
+         there is one. If the remote server does not allow shallow fetches, the
+         fetcher falls back to a bare clone. This improves the data transfer
+         size on the initial fetch of a repository, eliminates the need to use
+         an HTTPS tarball :term:`SRC_URI` to reduce data transfer, and allows
+         SSH-based authentication when using non-public repos, so additional
+         HTTPS tokens may not be required.
 
    -  ``compress``: use ``lz4`` instead of ``lz4c``, as ``lz4c`` as been
       considered deprecrated since 2018.
@@ -192,14 +320,13 @@ New Features / Enhancements in |yocto-ver|
    -  ``server/process``: decrease idle/main loop frequency, as it is idle and
       main loops have socket select calls to know when to execute.
 
-   -  ``bitbake-worker``: improve bytearray truncation performance when large
-       amounts of data are being transferred from the cooker to the worker.
+   -  ``bitbake-worker``:
 
-   -  ``bitbake-worker/cooker``: increase the default pipe size from 64KB to
-      512KB for better efficiency when transferring large amounts of data.
+      -  improve bytearray truncation performance when large
+         amounts of data are being transferred from the cooker to the worker.
 
-   -  ``fetch/wget``: increase timeout to 100s from 30s to match CDN worst
-      response time.
+      -  ``cooker``: increase the default pipe size from 64KB to
+         512KB for better efficiency when transferring large amounts of data.
 
    -  ``bitbake-getvar``: catch ``NoProvider`` exception to improve error
       readability when a recipe is not found with ``--recipe``.
@@ -219,6 +346,18 @@ New Features / Enhancements in |yocto-ver|
    -  ``knotty`` now hints the user if :term:`MACHINE` was not set in
       the ``local.conf`` file.
 
+   -  ``utils``: add Go mod h1 checksum support, specific to Go modules. Use
+      with ``goh1``.
+
+   -  The parser now catches empty variable name assignments such as::
+
+         += "value"
+
+      The previous code would have assigned ``value`` to the variable named ``+``.
+
+   -  ``hashserv``: Add the ``gc-mark-stream`` command for batch hash marking.
+
+
 -  Packaging changes:
 
    -  ``systemd``: extract dependencies from ``.note.dlopen`` ELF segments, to
@@ -235,13 +374,18 @@ New Features / Enhancements in |yocto-ver|
 
 -  LLVM related changes:
 
+   -  Set ``LLVM_HOST_TRIPLE`` for cross-compilation, which is recommended when
+      cross-compiling Llvm.
+
 -  SPDX-related changes:
 
-   -  SPDX 3.0: Find local sources when searching for debug sources.
+   -  SPDX 3.0:
 
-   -  SPDX 3.0: Map ``gitsm`` URIs to ``git``.
+      -  Find local sources when searching for debug sources.
 
-   -  SPDX 3.0: Link license and build by alias instead of SPDX ID.
+      -  Map ``gitsm`` URIs to ``git``.
+
+      -  Link license and build by alias instead of SPDX ID.
 
    -  Fix SPDX tasks not running when code changes (use of ``file-checksums``).
 
@@ -256,6 +400,14 @@ New Features / Enhancements in |yocto-ver|
       ``devtool modify my-recipe --debug-build`` followed by
       ``devtool ide-sdk my-recipe my-image``.
 
+   -  ``create-spdx``: support line numbers for :term:`NO_GENERIC_LICENSE`
+      license types.
+
+   -  ``spdx30``: Adds a "contains" relationship that relates the root file
+      system package to the files contained in it. If a package provides a file
+      with a matching hash and path, it will be linked, otherwise a new File
+      element will be created.
+
 -  Patchtest-related changes:
 
    -  Refactor pattern definitions in a ``patterns`` module.
@@ -299,6 +451,8 @@ New Features / Enhancements in |yocto-ver|
       currently prints warning message for every unpatched CVE the
       :ref:`ref-classes-cve-check` class finds.
 
+   -  Allow choosing the CVE feed with :term:`NVD_DB_VERSION`.
+
 -  New :term:`PACKAGECONFIG` options for individual recipes:
 
       -  ``perf``: ``zstd``
@@ -308,15 +462,61 @@ New Features / Enhancements in |yocto-ver|
       -  ``libpam``: ``selinux``
       -  ``libsecret``: ``pam``
       -  ``rpm``: ``sequoia``
+      -  ``systemd``: ``apparmor``, ``fido``, ``mountfsd``, ``nsresourced``
+      -  ``ovmf``: ``debug``
 
--  Miscellaneous changes:
+-  Systemd related changes:
 
-   -  ``bluez``: fix mesh build when building with musl.
+   -  ``systemd``:
+
+      -  set better sane time at startup by creating the ``clock-epoch`` file in
+         ``${libdir}`` if the ``set-time-epoch`` :term:`PACKAGECONFIG` config is
+         set.
+
+      -  really disable Predictable Network Interface names if the ``pni-names``
+         feature is not part of :term:`DISTRO_FEATURES`. Previously it was only
+         really disable for QEMU machines.
+
+      -  split ``networkd`` into its own package named ``systemd-networkd``.
 
    -  ``systemd-bootchart``: now supports the 32-bit *riscv* architecture.
 
    -  ``systemd-boot``: now supports the *riscv* architecture.
 
+   -  ``systemd-serialgetty``:
+
+      -  the recipe no longer sets a default value for
+         :term:`SERIAL_CONSOLES`, and uses the one set in ``bitbake.conf``.
+
+      -  the recipe no longer ships a copy of the ``serial-getty@.service`` as
+         it is provided by systemd directly.
+
+      -  Don't set a default :term:`SERIAL_CONSOLES` value in the
+         ``systemd-serialgetty`` recipe and take the global value that should
+         already be set.
+
+      -  Replace custom unit files by existing unit files provided in the
+         systemd source code.
+
+   -  User unit supports was improved. All the user units are now enabled by
+      default.
+
+   -  The custom implementation of ``systemctl`` in :term:`OpenEmbedded-Core
+      (OE-Core)` was removed to use the upstream one. This ``systemctl`` binary
+      is now compiled and used for systemd-related operations.
+
+-  :ref:`ref-classes-sanity` class changes:
+
+   -  Add a sanity check to validate that the C++ toolchain is functional on the
+      host.
+
+   -  Add a sanity check to verify that :term:`TOPDIR` does not contain
+      non-ASCII characters, as it may lead to unexpected build errors.
+
+-  Miscellaneous changes:
+
+   -  ``bluez``: fix mesh build when building with musl.
+
    -  ``python3-pip``: the ``pip`` executable is now left and not deleted, and
       can be used instead of ``pip3`` and ``pip2``.
 
@@ -326,7 +526,8 @@ New Features / Enhancements in |yocto-ver|
    -  :term:`SOLIBSDEV` and :term:`SOLIBS` are now defined for the *mingw32*
       architecture (``.dll``).
 
-   -  :ref:`rootfs-postcommands <ref-classes-rootfs*>`: make opkg status reproducible.
+   -  :ref:`rootfs-postcommands <ref-classes-rootfs*>`: make ``opkg`` status
+      reproducible.
 
    -  The default :term:`KERNEL_CONSOLE` value is no longer ``ttyS0`` but the
       first entry from the :term:`SERIAL_CONSOLES` variable.
@@ -364,10 +565,6 @@ New Features / Enhancements in |yocto-ver|
       ``virtual-x-terminal-emulator`` runtime provider with
       :term:`PREFERRED_RPROVIDER`.
 
-   -  ``systemd``: set better sane time at startup by creating the
-      ``clock-epoch`` file in ``${libdir}`` if the ``set-time-epoch``
-      :term:`PACKAGECONFIG` config is set.
-
    -  ``cve-update-nvd2-native``: updating the database will now result in an
       error if :term:`BB_NO_NETWORK` is enabled and
       :term:`CVE_DB_UPDATE_INTERVAL` is not set to ``-1``.
@@ -398,6 +595,65 @@ New Features / Enhancements in |yocto-ver|
       ``seat`` group to be able to properly establish connection between the
       Weston and the ``seatd`` socket.
 
+   -  ``webkitgtk``:
+
+      -  Fix build on 32bit arches with 64bit ``time_t`` only.
+
+      -  Disable JIT on RISCV64.
+
+   -  :ref:`ref-classes-report-error`: Add :term:`PN` to error report files.
+
+   -  ``initrdscripts``: add UBI support for mounting a live ``ubifs`` rootfs.
+
+   -  ``uboot-extlinux-config.bbclass``: add support for device tree overlays.
+
+   -  ``glibc``: add ``ld.so.conf`` to :term:`CONFFILES`.
+
+   -  ``udev-extraconf``: Allow FAT mount group to be specified with
+      :term:`MOUNT_GROUP`.
+
+   -  New ``bbverbnote`` log utility which can be used to print on the console
+      (equivalent to the ``bb.verbnote`` Python implementation).
+
+   -  :ref:``ref-classes-grub-efi``: Add :term:`GRUB_TITLE` variable to set
+      custom GRUB titles.
+
+   -  ``gawk``: Enable high precision arithmetic support by default (``mpfr``
+      enabled by default in :term:`PACKAGECONFIG`).
+
+   -  ``licenses``: Map the license ``SGIv1`` to ``SGI-OpenGL``, as ``SGIv1`` is
+      not an SPDX license identifier.
+
+   -  Configuration files for the `b4 <https://b4.docs.kernel.org>`__
+      command-line tool was added to the different Yocto Project and OpenEmbedded
+      repositories.
+
+   -  :ref:`ref-classes-kernel-fitimage`: handle :doc:`multiconfig
+      </dev-manual/multiconfig>` dependency when
+      :term:`INITRAMFS_MULTICONFIG` is set.
+
+   -  ``psplash``: when using the ``systemd`` feature from
+      :term:`DISTRO_FEATURES`, start the ``psplash`` service when the
+      ``/dev/fb0`` framebuffer is detected with Udev.
+
+   -  ``gdb``: is now compiled with xz support by default (``--with-lzma``).
+
+   -  ``busybox``: drop net-tools from the default ``defconfig``, since these tools
+      (``ifconfig``, etc.) have been deprecated since `2009
+      <https://lists.debian.org/debian-devel/2009/03/msg00780.html>`__.
+
+   -  ``perf`` is built with ``zstd`` in :term:`PACKAGECONFIG` by default.
+
+   -  ``boost``: add ``charconv`` to built libraries by default.
+
+   -  ``mirrors``: rationalise Debian mirrors to point at the canonical server
+      (deb.debian.org) instead of country specific ones. This server is backed
+      by a :wikipedia:`CDN <Content_delivery_network>` to properly balance the
+      server load.
+
+   -  ``lib: sbom30``: Add action statement for affected VEX statements with
+      "Mitigation action unknown", as these are not tracked by the existing
+      code.
 
 Known Issues in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
2.47.0


