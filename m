Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E42CD1297
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 09:48:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.161743.1712742489480033435
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 02:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L/WgrwPN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECC241BF204;
	Wed, 10 Apr 2024 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712742488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ECSjpDr5Dsd2y/rc8ipf28qCZuckktppctlrFY6Pf8=;
	b=L/WgrwPNEWL/3NsoRk6eYL0pmZZVwf7fek8XNo8fue9mguAV42qBPTS8m9Z8bWtIPcNZE4
	9pLHfAFrQ/Ykiop4PoYxlCN68zwsveVXG7GbZSFcDNXust7AgEt8jFriLCvlyMxGDtC4uv
	6rxhLxmvdNLr4Rwz7igjXj//apv6RwF2pbhs41QgJnY5r4C6GqGv8gT91n9lUM6Q0XfNf2
	CiKhmgeK9Gsn4D9+3zI4SiPCUgDIsi/z/YLLmea5MXdPcEOJx3KG+ZAPRTAZcUwia6TNO7
	RYp+EwcTjPZ+j2PD3B3Bjt024QkVtQGuFZnAFxXaI67m7J+bbq92wcyvRnvPMQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 1/2] release-notes: add updates for 5.0
Date: Wed, 10 Apr 2024 11:47:45 +0200
Message-ID: <20240410094746.2978238-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410094746.2978238-1-joaomarcos.costa@bootlin.com>
References: <20240410094746.2978238-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 09:48:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5104

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

- add new core recipes section
- add new variables
- add arch-specific enhancements
- add kernel-related enhancements
- add qemu enhancements
- add rust enhancements
- add wic enhancements
- add sdk-related improvements
- add testing enhancements
- add utility script changes
- add packaging changes
- add bitbake improvements
- add miscellaneous changes
---
 .../migration-guides/release-notes-5.0.rst    | 123 +++++++++++++++++-
 1 file changed, 122 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 0a740688f..1c4b300be 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -6,7 +6,7 @@ Release notes for 5.0 (scarthgap)
 New Features / Enhancements in 5.0
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  Linux kernel 6.6, gcc 13.2, glibc 2.39, LLVM 18.1, and over XXX other recipe upgrades
+-  Linux kernel 6.6, gcc 13.2, glibc 2.39, LLVM 18.1, and over 300 other recipe upgrades
 
 -  New variables:
 
@@ -14,20 +14,108 @@ New Features / Enhancements in 5.0
       internal CVE database for incremental update (instead of a full
       redownload).
 
+   -  :term:`RPMBUILD_EXTRA_PARAMS`: support extra user-defined fields without
+      crashing the RPM package creation.
+
+   -  :term:`OPKG_MAKE_INDEX_EXTRA_PARAMS`: support extra parameters for
+      ``opkg-make-index``.
+
+   -  :term:`EFI_UKI_PATH`, :term:`EFI_UKI_DIR`: define the location of UKI
+      image in the EFI System partition.
+
 -  Architecture-specific enhancements:
 
+   -  ``genericarm64``: a new ``MACHINE`` to represent a 64-bit General Arm
+      SystemReady platform.
+
+   -  Add Power8 tune to PowerPC architecture.
+
+   -  ``arch-armv9``: remove CRC and SVE tunes, since FEAT_CRC32 is now mandatory
+      and SVE/SVE2 are enabled by default in GCC's ``-march=armv9-a``.
+
 -  Kernel-related enhancements:
 
+   - The default kernel is the current LTS (6.6).
+
+   - Added suport for ``genericarm64``.
+
 -  New core recipes:
 
+   -  `bmaptool <https://github.com/yoctoproject/bmaptool>`__: a tool for
+      creating block maps for files and flashing images, being now under Yocto
+      Project umbrella.
+
+   -  ``core-image-initramfs-boot``: a minimal initramfs image, containing just
+      udev and init, designed to find the main root filesystem and pivot to it.
+
+   -  `lzlib <https://www.nongnu.org/lzip/lzlib.html>`__: a data compression
+      library that provides LZMA compression and decompression functions.
+
+   -  `lzop <https://www.lzop.org/>`__: a compression utility based on LZO
+      library, that was brought back after a (now reverted) removal.
+
+   -  `python3-jsonschema-specifications <https://pypi.org/project/jsonschema-specifications/>`__:
+      the support files for JSON Schema Specifications (meta-schemas and
+      vocabularies), added as a new dependency of ``python3-jsonschema``.
+
+   -  `python3-maturin <https://github.com/pyo3/maturin>`__: a project that
+      allows building and publishing Rust crates as Python packages.
+
+   -  `python3-meson-python <https://github.com/mesonbuild/meson-python>`__: a
+      Python build backend that enables Meson build-system for Python packages.
+
+   -  `python3-pyproject-metadata <https://pypi.org/project/pyproject-metadata/>`__:
+      a class to handle PEP 621 metadata, and a dependency for
+      ``python3-meson-python``.
+
+   -  `python3-referencing <https://github.com/python-jsonschema/referencing>`__:
+      another dependency of ``python3-jsonschema``, it provides an
+      implementation of JSON reference resolution.
+
+   -  `python3-rpds-py <https://pypi.org/project/rpds-py/>`__: Python bindings
+      to the Rust rpds crate, and a runtime dependency for ``python3-referencing``.
+
+   -  `python3-sphinxcontrib-jquery <https://pypi.org/project/sphinxcontrib-jquery/>`__:
+      a Sphinx extension to include jQuery on newer Sphinx releases. Recent
+      versions of ``python3-sphinx-rtd-theme`` hardly depend on it.
+
+   -  `python3-yamllint <https://github.com/adrienverge/yamllint>`__: a linter
+      for YAML files. In U-Boot, the binman tool uses this linter to verify the
+      configs during compile time.
+
+   -  ``systemd-boot-native``: a UEFI boot manager, this time built as native to
+      provide ``ukify`` tool.
+
+   -  `utfcpp <https://github.com/nemtrif/utfcpp>`__: a C++ library to handle
+      UTF-8 encoded strings. It was added as a dependency for ``taglib`` after
+      its upgrade to v2.0.
+
+   -  `vulkan-utility-libraries <https://github.com/KhronosGroup/Vulkan-Utility-Libraries>`__:
+      a set of libraries to share code across various Vulkan repositories.
+
+   -  `vulkan-volk <https://github.com/zeux/volk>`__: a meta-loader for Vulkan,
+      needed to support building latest ``vulkan-tools``.
+
 -  QEMU / ``runqemu`` enhancements:
 
    -  QEMU has been upgraded to version 8.2.1
 
+   -  ``qemuboot``: support predictable network interface names.
+
+   -  ``runqemu``: match ".rootfs." in addition to "-image-" for the rootfs.
+
 -  Rust improvements:
 
    -  Rust has been upgraded to version 1.75
 
+   -  The Rust profiler (i.e., PGO - Profile-guided Optimization) options were
+      enabled back.
+
+   -  The Rust's ``oe-selftest`` were enabled, except for ``mips32`` whose tests
+      are skipped.
+
+   -  ``rust-cross-canadian``: added ``riscv64`` to cross-canadian hosts.
+
 -  wic Image Creator enhancements:
 
    -  Allow the imager's output file extension to match the imager's name,
@@ -46,19 +134,50 @@ New Features / Enhancements in 5.0
 
 -  SDK-related improvements:
 
+   -  ``nativesdk``: let :term:`MACHINE_FEATURES` be set by ``machine-sdk`` conf
+      files.
+
+   -  ``nativesdk``: prevent :term:`MACHINE_FEATURES` and :term:`DISTRO_FEATURES`
+      from being backfilled.
+
 -  Testing:
 
    -  Add an optional ``unimplemented-ptest`` QA warning to detect upstream
       packages with tests, that do not use ptest.
 
+   -  ``testimage``: retrieve the ptests directory, especially for the logs,
+      upon ptest failure.
+
+   -  ``oeqa``, ``oe-selftest``: add test cases for Maturin (SDK and runtime).
+
 -  Utility script changes:
 
    -  New ``recipetool/create_go.py`` script added to support Go recipe creation
 
+   -  ``oe-init-build-env`` can generate a initial configuration (.vscode) for
+      VSCode and yocto.bitbake extension.
+
 -  BitBake improvements:
 
+   -  Add support for :term:`BB_LOADFACTOR_MAX`, so Bitbake can stop running
+      extra tasks if the system load is too high, especially in distros where
+      ``/proc/pressure`` is disabled.
+
+   -  Add garbage collection to remove unused unihashes from the database.
+
+   -  ``taskexp_ncurses``: add ncurses version of ``taskexp``, the dependency
+      explorer originally implemented with GTK.
+
+   -  Improve ``runqueue`` performance by adding a cache mechanism in
+      ``build_taskdepdata``.
+
+   -  ``bitbake.conf``: add ``runtimedir`` to represent the path to the runtime
+      state directory (i.e., /run).
+
 -  Packaging changes:
 
+   -  ``package_rpm``: the RPM package compressor's mode can now be overriden.
+
 -  Security improvements:
 
    -  Improve incremental CVE database download from NVD. Rejected CVEs are
@@ -85,6 +204,8 @@ New Features / Enhancements in 5.0
 
    -  Disable strace support of bluetooth by default.
 
+   -  ``openssh`` now has a Systemd service: ``sshd.service``.
+
 Known Issues in 5.0
 ~~~~~~~~~~~~~~~~~~~
 
-- 
2.43.0


