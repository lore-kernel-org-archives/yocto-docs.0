Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F10CEDDA9
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19644.1728487495464875446
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C+1tf4/A;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE3A2240005;
	Wed,  9 Oct 2024 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ebKcYHPl/gy4qY8JZIzNfpRJwAKgC6+thq9MVbV6xEk=;
	b=C+1tf4/AfeSKBj0c8iokYOCF0pSvbEtfjhiAjoHbpw81yEsn42AibSZSLkbqCHBC0ylTWk
	Xr96UOk/bQldaYZRg3bHjZw3z+0rzA0NkI+mkLppmAFxO+qg2+GbNyVzXNAF+zmGCdMdbD
	+EQq7uSkOK2hM20PjAjsfnFQ0arV9418gG2a0yyoSxhy3EPGPwKPYskmNObv28WWlwzmtT
	mPbhDaO5bmZN+OrwnZs8Fywt9vwwPrAbHlb0cle6aQ9qQ+Nvnm6KAr96nuLzsxfL0Ob1js
	3v3Qxac+PcHtiCpov1SaAHSZ6Dkb5C05tLK/4dDDbifJ3Rj/YGf+kULJvmCJ4w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 00/16] Updates for styhead
Date: Wed, 09 Oct 2024 17:24:08 +0200
Message-Id: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABigBmcC/1XMQQqDMBBA0avIrDsSQ0y0q96jdJGaUQOaKZNQC
 uLdG7rr8i3+PyCTRMpwbQ4QesccOVXoSwPT6tNCGEM1aKVNp9SIQhv5TJi4EPbYoe2tm43T/RR
 GqNlLaI6f3/L+qJ6FdyyrkP8bKWc6rdrBWjfYuvGpcIqpXTh4Cbcnc9kqJ97hPL+00NInpwAAA
 A==
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Lee Chee Yang <chee.yang.lee@intel.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=14651;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+WFdn/Gtu7vrLKIFC4FS7/0VawZn3qoh6bI5YvwIF5U=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBDAN6mu6dY3YcPrSStE+iCXr4xW7xUAsNh/
 GPRH+srbdCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagQwAKCRDRgEFAKaOo
 Nt1OD/0ZitTQOYLtNVt10aN6n0HZam5YT/47JIP0kqM7/xaFbI8nmsqSaGUrSxM75WF+J1g/ggF
 0ZRSGvyL8SdDuBDyEMj1nxTJ5hNgvRfDX3KbBMieTNNO9E4hKwe5y8yAufzjDf1LuQmoyHHTPci
 3awCC1PeKcAjE9sdSWThvjZTWG32pK4VsMIeAPeTascHLH+12B7LHYxt1cxkYXO0Apn9armLwkK
 N5ob4WL14LiZiYKNh6OUm1Q5896Ny2vtV7+dNbcpcSdsLorpTMpic0YtHJKhmgXf7AKOQhKXCNR
 PBRMOpctS+EQv0CfNaE7oDNaVOeh6sViAYQo2KDBrPxn6GgR3zjsxbLGSRvrP+xIAEZvy2WuWRk
 Epd42XPFz/LG717BPCrhUqKyb1vNVzN0n0Jk/5sEkrPx+4ESGI71zNd9Dqa4FX2l6Ec4038pLiG
 JmNUcZJ4OIrfvsBOrQSBt+sYQchhFPgytg30Zipr2hzna2SOCW4xKylObmtFTJnpaOw1s7UjBa2
 cfrsfpBhUBsau5/nXf4Fh7p1MKEjBe0EdgG9ovxYjmxwx2A1/4OtCW4o94EHjqZEQuiCT+aPgfR
 Em27GI0n7Dx3LLbmymvT7lgaUCmnItwM5yGsnNlgRFGA4lPGwAd16C+fVqZvcODpfuXmzAoWcGU
 49e/klGyhpFSEFQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5429

Changes in v2:
- Remove "Known Issues" section, it only contained rust being
  non-reproducible, which is actually not true anymore.
- Rename variable PRSERVER_UPSTREAM -> PRSERV_UPSTREAM.

This series of patch attempts to catch up and update the documentation for the
following repositories:

* openembedded-core since b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277
* bitbake since c86466d51e8ff14e57a734c1eec5bb651fdc73ef
* meta-yocto since 8f12ba9f7006d54e6f5259eb1c734e6116a2580b

Add the missing variables, classes, etc. to the reference manual.
Remove dropped classes and variables.

Document it all in release-notes-5.1.rst and migration-5.1.rst.

Note: Chee Yang, I have amended your commit to fix some typos, and included it
in this series.

The following list of commits (thanks Ross for creating it!) are included in the
release note / migration guide (shas from poky):

- edba6889: cve-check: Introduce CVE_CHECK_MANIFEST_JSON_SUFFIX
- 00439863: cargo_common.bbclass: Support git repos with submodules
- 02420523: initramfs-framework: support force reboot if fatal error occurs
- 062c289e: install-buildtools: fix "test installation" step
- 0655e196: populate_sdk_base: Ensure nativesdk targets have do_package_qa run
- 0670ea7b: insane: add patch-status to default ERROR_QA
- 0731d490: cve_check: Use a local copy of the database during builds
- 07eb1bea: package.py: Add Requires.private field in process_pkgconfig
- 09b49a35: tclibc-picolibc: Adds a new TCLIBC variant to build with picolibc as C library
- 0a494c82: busybox: reconfigure wget https support by default for security
- 0c03d6ae: openssh: systemd notification was implemented upstream
- 0cc22f1c: linux-yocto: introduce 6.10 reference kernel
- 0d499317: bitbake: codeparser/data: Ensure module function contents changing is accounted for
- 0f8d29b6: bitbake.conf: Add truncate to HOSTTOOLS
- 148e0c87: liba52: remove the recipe
- 17038110: cmake.bbclass: Add ${COREBASE}/scripts to CMAKE_FIND_ROOT_PATH
- 182e599d: systemd: add PACKAGECONFIG for bpf-framework
- 18e41945: devtool/upgrade: rename RECIPE_UPDATE_EXTRA_TASKS -> RECIPE_UPGRADE_EXTRA_TASKS
- 1c3439f8: python3-tomli: remove recipe (moved to meta-python)
- 1cf0974a: bitbake.conf: Further cleanup compiler optimization flags
- 1e613275: yocto-uninative: Update to 4.6 for glibc 2.40
- 26038959: classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
- 2700bde9: python3-pathlib2: remove recipe (moved to meta-python)
- 28516320: devtool: standard: update-recipe/finish: fix update localfile in another layer
- 292e1731: oeqa/postactions: do not uncompress retrieved archive on host
- 29c2cd4d: bitbake: hashserv: client: Add batch stream API
- 29debb80: ssh-pregen-hostkeys: Limit to qemu machines by default
- 2bf34e28: llvm: Enable libllvm for native build
- 2dded995: classes: add new retain class for retaining build results
- 2e9e8f6f: qemuboot: Trigger write_qemuboot_conf task on changes of kernel image realpath
- 306337e0: oeqa/manual: remove obsolete CROPS and Eclipse manually testing scripts
- 313afc99: meta-ide-support: Mark recipe as MACHINE-specific
- 314a2202: oe-build-perf-report: Improve report styling and add descriptions
- 3220a20b: sstate: Drop intercept functions support
- 37de7a14: pytest-runner: remove recipe (moved to meta-python)
- 3859ff59: vex.bbclass: add a new class
- 3891414b: bitbake.conf: Drop obsolete debug compiler options
- 38cfb652: cve-json-to-text: add script
- 397870f8: llvm: Switch to using release tarballs
- 3d98aafc: recipeutils/get_recipe_upgrade_status: group recipes when they need to be upgraded together
- 3f69d525: rust: build the default set of tools
- 3f76c3d2: Switch default spdx version to 3.0
- 413f327b: testexport: support for executing tests over serial
- 41e59c53: selftest/classes: add localpkgfeed class
- 4574919d: scripts/makefile-getvar: add script to get values from Makefiles
- 45c7150b: openssl: strip the test suite
- 469c371e: u-boot.inc: Refactor do_* steps into functions that can be overridden
- 478f4465: bblayers/machines: add bitbake-layers command to list machines
- 498ebc9b: sstate: Drop SSTATEPOSTINSTFUNC support
- 4ca98d99: musl: Show error when used with multilibs
- 4cbce9cd: bitbake: prserv: add "upstream" server support
- 4e96673a: glibc: add task to list exported symbols
- 519eec77: linux-libc-headers: update to v6.10
- 5aeabd32: resulttool: Add support to create test report in JUnit XML format
- 5d535e9e: git: set --with-gitconfig=/etc/gitconfig for -native builds
- 5ef61d10: insane: Add error for B = WORKDIR
- 5f6fe371: apt-native: don't let dpkg overwrite files by default
- 64eb8c9c: cml1: add do_savedefconfig
- 64f5e2c8: python3-toml: remove recipe (moved to meta-python)
- 65757c9e: bitbake: prserv: enable database sharing
- 665fdc4e: testimage/postactions: Allow artifact collection to be skipped
- 686e477d: python3-py: remove recipe (moved to meta-python)
- 6b9eb4e9: siteconfig: Drop siteconfig class/code/support
- 6be592d2: bitbake: codeparser: Skip non-local functions for module dependencies
- 6d77296d: devtool: Drop oe-local-files and simplify
- 6dc57c91: libnewt: move to meta-oe
- 6e409b5d: setuptools3: check for a PEP517 build system selection
- 6e80b2ab: oeqa/utils/postactions: transfer whole archive over ssh instead of doing individual copies
- 6f19b541: gobject-introspection: split tools and giscanner into a separate package
- 7004840f: sanity: check for working user namespaces
- 7033add1: usbinit: Drop recipe
- 71c6db8e: recipes: Start WORKDIR -> UNPACKDIR transition
- 72dd8c0d: cve-check-map: add new statuses
- 763c6dab: pulseaudio: Add PACKAGECONFIG for optional OSS support
- 76a63bd0: bitbake: siggen: Enable batching of unihash queries
- 7ec8dcfc: layer.conf: Add os-release to SIGGEN_EXCLUDERECIPES_ABISAFE
- 812dafbe: base/bitbake.conf: Introduce UNPACKDIR
- 82d07928: devtool upgrade: enable RECIPE_UPDATE_EXTRA_TASKS
- 836b4b57: oe-build-perf-report: Add apache echarts to make report interactive
- 8426e027: classes/create-spdx-3.0: Add classes
- 87c29b5a: bitbake: fetch2: Add gomodgit fetcher
- 8e071ad4: go: Drop fork of unpack code, mandate GO_SRCURI_DESTSUFFIX
- 8ec959bb: classes-recipe/image: Add image file manifest
- 92d8c7c5: bitbake: parse: Improve/fix cache invalidation via mtime
- 9837ba61: kernel-fitimage: fix external dtb check
- 997b11a5: bitbake: build: Ensure addtask before/after tasknames have prefix applied
- 999bd954: go: Drop the linkmode completely
- 9a0329ec: python3-importlib-metadata: remove recipe (moved to meta-python)
- a1840d09: python3: Drop generating a static libpython
- a22bdf72: rootfs: Ensure run-postinsts is not uninstalled for read-only-rootfs-delayed-postinsts
- a46e374d: oe-debuginfod: add option for data storage
- a88251b3: buildtools-tarball: Add python3-pip
- aca14abc: populate_sdk_base: add 7zip archive type for SDK
- b29ae5eb: libomxil: remove the recipe
- b35f2209: binutils: Upgrade to 2.43 release
- b5526e68: go: drop the old 1.4 bootstrap C version
- b67fced0: gcc: Allow using libc++
- b6983712: bitbake: fetch2/git: Enforce default remote name to "origin"
- baebb347: linux-yocto-dev: bump to v6.11
- bd102d12: conf/defaultsetup.conf: Drop TCLIBCAPPEND
- bf511fc2: xcb-util-errors: add recipe
- c174208d: insane: Error for S == WORKDIR
- c5b985c9: selftests: add test_minidebuginfo_qemu
- cc191968: scripts/pull-spdx-licenses.py: Add script
- cd000e08: licenses: Update to SPDX license version 3.24.0
- d045fed3: bootimg-partition: break out code to a common library.
- d1430438: perf: drop newt from tui build requirements
- d237e9af: openssl: disable tests unless ptest is enabled
- d24a7d0f: base: Switch UNPACKDIR to a subdir of WORKDIR
- d4b5a24c: gstreamer1.0-plugins-bad: add PACKAGECONFIG for gtk3
- d4f05aaf: python3-jsonschema: rename nongpl PACKAGECONFIG
- d6a4522e: openssh: allow configuration of hostkey type
- d9066258: distro/include: Add yocto-space-optimize, disabling debugging for large components
- dd763142: bitbake: fetch2: Add gomod fetcher
- e1555ba6: license_image.bbclass: Rename license-incompatible to license-exception
- e16d690e: bitbake: hashserv: server: Add support for SO_REUSEPORT
- e1fa3247: toolchain-scripts: export the target endianism and word size
- e2527cf5: bitbake: fetch2/git: Use git shallow fetch to implement clone_shallow_local()
- e4921286: mpeg2dec: remove the recipe
- e64be51e: oeqa/sdk: add out-of-tree kernel module building test
- e665be2a: insane: Promote long standing warnings to errors
- e9939fe2: oeqa: selftest: context: run tests serially if testtools/subunit modules are not found
- ece2f576: glibc: Upgrade to 2.40
- edc44fcf: create-spdx-*: Support multilibs via SPDX_MULTILIB_SSTATE_ARCHS
- f06fbe9b: cve-check: remove the TEXT format support
- f0b560e0: lib/package_manager/ipk: Do not hardcode payload compression algorithm
- f5bea876: python3-rfc3986-validator: remove recipe (moved to meta-python)
- f72d2642: classes-recipe: nospdx: Add class
- f7f4d9d5: package_rpm: remove support for DIRFILES
- fdcaf1cc: oeqa/postactions: Separate artefact collection from test result collection
- 93e3ae70: kernel.bbclass: remove unused CMDLINE_CONSOLE
- 6f0a78e0: bitbake.conf: Include cve-check-map earlier, before distro
- 0979646a: abi_version/package: Bump hashequiv version and package class version
- 14e487aa: python3: add dependency on -compression to -core
- 393ff343: glib/gobject-introspection: update 2.78.4 -> 2.80.0, 1.78.1 -> 1.80.0
- 3c1c56ec: native/nativesdk: Stop overriding unprefixed *FLAGS variables
- 431767f0: classes-recipe/multilib_script: Expand before splitting
- 0f2f18c7: python3-idna: enable ptest
- 35cb7bc6: runqemu: add sd card device
- 551fdabc: bitbake: fetch2/crate: add upstream latest version check function
- bd21b9e8: python3-cffi: enable ptest
- d4c0282f: python3-packaging: enable ptest

Here are the commits that did _NOT_ make it into the release note yet (not as
important, again thanks Ross for making the list):

- 005c9350: weston-init: fix weston not starting when xwayland is enabled
- 01d17cd5: recipetool: create_npm: resolve licenses defined in package.json
- 1053035c: npm: accept unspecified versions in package.json
- 18b37cc5: bitbake: ui/knotty: respect NO_COLOR &amp; check for tty; rename print_hyperlink =&gt; format_hyperlink
- 4485677c: gcc-runtime: enabling "network" task specific flag
- 4b160cb6: utils.bbclass: Use objdump instead of readelf to compute SONAME
- 51192a79: gcc: Upgrade to GCC 14.2
- 524e6b65: bitbake: fetch2/npmsw: fix fetching git revisions not on master
- 58414305: bitbake: gcp.py: remove slow calls to gsutil stat
- 5a308474: bitbake: siggen: Batch unihash_exists checks
- 5aa7391d: gcc: remove g77/f77
- 632e3170: local.conf.sample: Fix hashequivalence server address
- 66158e79: gdb: Upgrade to 15.1 release
- 662cda7e: populate_sdk_ext.bclass: make sure OECORE_NATIVE_SYSROOT is exported.
- 6a0a2c46: bitbake: runqueue: Process unihashes in parallel at init
- 70a857b8: classes: image_types: apply EXTRA_IMAGECMD:squashfs* in oe_mksquashfs()
- 76421d57: bitbake: bitbake-hashclient: Add ping command
- 7a1e8c44: classes/pypi: don't expose PYPI_ARCHIVE_NAME
- 7c5d68f2: scripts/install-buildtools: Update to 5.0.3
- 8876fe95: llvm: Upgrade to 18.1.5
- ad2365a3: bitbake: ui/knotty: print log paths for failed tasks in summary
- ad6470a4: scripts/oe-setup-build: write a build environment initialization one-liner into the build directory
- c32490b1: volatile-binds: Do not create workdir if OverlayFS is disabled
- e5176979: linux-yocto/6.10: cfg: disable nfsd legacy client tracking
- ec86853a: bitbake: fetch2/npmsw: allow packages not declaring a registry version
- ef938f1b: gstreamer1.0-plugins-bad: rename onevpl-intel-gpu -> vpl-gpu-rt
- f6de2b03: bitbake: bitbake-layers: adapt force option to not use tinfoil
- fa894486: package.py: Fix static library processing

Antonin Godard (15):
  ref-manual: add missing CVE_CHECK manifest variables
  ref-manual: add new vex class
  ref-manual: add new retain class and variables
  ref-manual: add missing nospdx class
  ref-manual: add new RECIPE_UPGRADE_EXTRA_TASKS variable
  ref-manual: drop siteconfig class
  ref-manual: add missing TESTIMAGE_FAILED_QA_ARTIFACTS
  ref-manual: add missing image manifest variables
  ref-manual: add missing EXTERNAL_KERNEL_DEVICETREE variable
  ref-manual: drop TCLIBCAPPEND variable
  ref-manual: add missing OPKGBUILDCMD variable
  ref-manual: add missing variable PRSERV_UPSTREAM
  ref-manual: merge patch-status-* to patch-status
  ref-manual: add mission pep517-backend sanity check
  release-notes-5.1: update release note for styhead

Lee Chee Yang (1):
  release-notes-5.1: update for several section

 .../migration-guides/migration-5.1.rst        |  63 +-
 .../migration-guides/release-notes-5.1.rst    | 983 +++++++++++++++++-
 documentation/ref-manual/classes.rst          |  70 +-
 documentation/ref-manual/variables.rst        | 118 ++-
 4 files changed, 1181 insertions(+), 53 deletions(-)

--
2.46.0

---
Antonin Godard (15):
      ref-manual: add missing CVE_CHECK manifest variables
      ref-manual: add new vex class
      ref-manual: add new retain class and variables
      ref-manual: add missing nospdx class
      ref-manual: add new RECIPE_UPGRADE_EXTRA_TASKS variable
      ref-manual: drop siteconfig class
      ref-manual: add missing TESTIMAGE_FAILED_QA_ARTIFACTS
      ref-manual: add missing image manifest variables
      ref-manual: add missing EXTERNAL_KERNEL_DEVICETREE variable
      ref-manual: drop TCLIBCAPPEND variable
      ref-manual: add missing OPKGBUILDCMD variable
      ref-manual: add missing variable PRSERV_UPSTREAM
      ref-manual: merge patch-status-* to patch-status
      ref-manual: add mission pep517-backend sanity check
      release-notes-5.1: update release note for styhead

Lee Chee Yang (1):
      release-notes-5.1: update for several section

 documentation/migration-guides/migration-5.1.rst   |  63 +-
 .../migration-guides/release-notes-5.1.rst         | 975 ++++++++++++++++++++-
 documentation/ref-manual/classes.rst               |  70 +-
 documentation/ref-manual/variables.rst             | 118 ++-
 4 files changed, 1171 insertions(+), 55 deletions(-)
---
base-commit: 98e7f378bc5670d23a6c2bdfcd3b7af965f7c450
change-id: 20241009-release-note-5-1-6567f4725cd9

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


