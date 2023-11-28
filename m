Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F676C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 06:54:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.27292.1701154437254756424
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 22:53:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QzFj4Fli;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701154437; x=1732690437;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HDNW3VqaM7nsT8jgg4Dxgkzpy7l0Ok1/yYC3bz2X6H8=;
  b=QzFj4FliIv7LTKII8eLcjQ9KHqRzOACRS0rDpkx2+/tete04TJ7tpGOO
   zt3QK2GymlOGEnnMtO7Vyvs1kZ/FN0JClh3tWJYPLgO9siVmpYCRBzS4d
   5wxlKAE39EX3tC9IDhZuzvaFAQYsrY3vvGo4Igthg5YvWILdFR1smflAr
   Z+XgA6klD3FDgcJSEt7VPftrb24M8CDFzwrspRHeebWh+9qZ1cFP3o/Yd
   QWyahyosN5iMJQethI+v6ZMYuhW8kDcSY7TyemE16pM1VXiZsuZoWG+Ov
   gEd7VDFVcYTIW/1Jg6Ylold9ZP6Ysx14JFveeANOODgPioNeN7rcBlyPd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="459365818"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="459365818"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 22:53:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="891984978"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="891984978"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by orsmga004.jf.intel.com with ESMTP; 27 Nov 2023 22:53:54 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: add release notes for 4.3.1
Date: Tue, 28 Nov 2023 14:50:58 +0800
Message-Id: <20231128065058.1858790-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Nov 2023 06:54:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4647

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.3.rst          |   1 +
 .../migration-guides/release-notes-4.3.1.rst  | 236 ++++++++++++++++++
 2 files changed, 237 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.3.1.rst

diff --git a/documentation/migration-guides/release-4.3.rst b/documentation/migration-guides/release-4.3.rst
index 92516ae8f..5b651a2ef 100644
--- a/documentation/migration-guides/release-4.3.rst
+++ b/documentation/migration-guides/release-4.3.rst
@@ -7,3 +7,4 @@ Release 4.3 (nanbield)
 
    migration-4.3
    release-notes-4.3
+   release-notes-4.3.1
diff --git a/documentation/migration-guides/release-notes-4.3.1.rst b/documentation/migration-guides/release-notes-4.3.1.rst
new file mode 100644
index 000000000..a9ebcee9d
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.3.1.rst
@@ -0,0 +1,236 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.3.1 (Nanbield)
+----------------------------------------
+
+Security Fixes in Yocto-4.3.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  libsndfile1: Fix :cve:`2022-33065`
+-  libxml2: Ignore :cve:`2023-45322`
+-  linux-yocto: Ignore :cve:`2020-27418`, :cve:`2020-27418`, :cve:`2023-1193`, :cve:`2023-31085`, :cve_mitre:`2023-34324`, :cve:`2023-39189`, :cve:`2023-39191`, :cve:`2023-39192`, :cve:`2023-39193`, :cve:`2023-39194`, :cve:`2023-39194`, :cve:`2023-40791`, :cve:`2023-4244`, :cve:`2023-42754`, :cve:`2023-42756`, :cve:`2023-44466`, :cve:`2023-44466`, :cve:`2023-4563`, :cve:`2023-45862`, :cve:`2023-45862`, :cve:`2023-45863`, :cve:`2023-45863`, :cve:`2023-45871`, :cve:`2023-45898`, :cve:`2023-4610`, :cve:`2023-4732`, :cve:`2023-4732`, :cve:`2023-5158`, :cve:`2023-5197` and :cve:`2023-5345`
+-  openssl: Fix :cve:`2023-5363`
+-  pixman: Ignore :cve:`2023-37769`
+-  vim: Fix :cve:`2023-46246`
+-  zlib: Ignore :cve:`2023-45853`
+
+
+Fixes in Yocto-4.3.1
+~~~~~~~~~~~~~~~~~~~~
+
+-  Remove references to apm in :term:`MACHINE_FEATURES`
+-  baremetal-helloworld: Pull in fix for race condition on x86-64
+-  base: Ensure recipes using mercurial-native have certificates
+-  bb-matrix-plot.sh: Show underscores correctly in labels
+-  bin_package.bbclass: revert "Inhibit the default dependencies"
+-  bitbake: SECURITY.md: add file
+-  brief-yoctoprojectqs: use new CDN mirror for sstate
+-  bsp-guide: bsp.rst: update beaglebone example
+-  bsp-guide: bsp: skip Intel machines no longer supported in Poky
+-  build-appliance-image: Update to nanbield head revision
+-  contributor-guide: add patchtest section
+-  contributor-guide: clarify patchtest usage
+-  cve-check: don't warn if a patch is remote
+-  cve-check: slightly more verbose warning when adding the same package twice
+-  cve-check: sort the package list in the JSON report
+-  dev-manual: add security team processes
+-  dev-manual: extend the description of CVE patch preparation
+-  dev-manual: layers: Add notes about layer.conf
+-  dev-manual: new-recipe.rst: add missing parenthesis to "Patching Code" section
+-  dev-manual: start.rst: remove obsolete reference
+-  dev-manual: wic: update "wic list images" output
+-  docs: add support for nanbield (4.3) release
+-  documentation.conf: drop SERIAL_CONSOLES_CHECK
+-  ell: Upgrade to 0.59
+-  glib-2.0: Remove unnecessary assignement
+-  goarch: Move Go architecture mapping to a library
+-  kernel-arch: drop CCACHE from :term:`KERNEL_STRIP` definition
+-  kernel.bbclass: Use strip utility used for kernel build in do_package
+-  layer.conf: Switch layer to nanbield series only
+-  libsdl2: upgrade to 2.28.4
+-  linux-yocto: make sure the pahole-native available before do_kernel_configme
+-  llvm: Upgrade to 17.0.3
+-  machine: drop obsolete SERIAL_CONSOLES_CHECK
+-  manuals: correct "yocto-linux" by "linux-yocto"
+-  manuals: improve description of :term:`CVE_STATUS` and :term:`CVE_STATUS_GROUPS`
+-  manuals: update linux-yocto append examples
+-  manuals: update list of supported machines
+-  migration-4.3: additional migration items
+-  migration-4.3: adjustments to existing text
+-  migration-4.3: remove some unnecessary items
+-  migration-guides: QEMU_USE_SLIRP variable removed
+-  migration-guides: add BitBake changes
+-  migration-guides: add debian 12 to newly supported distros
+-  migration-guides: add kernel notes
+-  migration-guides: add testing notes
+-  migration-guides: add utility notes
+-  migration-guides: edgerouter machine removed
+-  migration-guides: enabling :term:`SPDX` only for Poky, not a global default
+-  migration-guides: fix empty sections
+-  migration-guides: further updates for 4.3
+-  migration-guides: further updates for release 4.3
+-  migration-guides: git recipes reword
+-  migration-guides: mention CDN
+-  migration-guides: mention LLVM 17
+-  migration-guides: mention runqemu change in serial port management
+-  migration-guides: packaging changes
+-  migration-guides: remove SERIAL_CONSOLES_CHECK
+-  migration-guides: remove non-notable change
+-  migration-guides: updates for 4.3
+-  oeqa/selftest/debuginfod: improve selftest
+-  oeqa/selftest/devtool: abort if a local workspace already exist
+-  oeqa/ssh: Handle SSHCall timeout error code
+-  openssl: Upgrade to 3.1.4
+-  overview-manual: concepts: Add Bitbake Tasks Map
+-  patchtest-send-results: add In-Reply-To
+-  patchtest-send-results: check max line length, simplify responses
+-  patchtest-send-results: fix sender parsing
+-  patchtest-send-results: improve subject line
+-  patchtest-send-results: send results to submitter
+-  patchtest/selftest: add XSKIP, update test files
+-  patchtest: disable merge test
+-  patchtest: fix lic_files_chksum test regex
+-  patchtest: make pylint tests compatible with 3.x
+-  patchtest: reduce checksum test output length
+-  patchtest: remove test for CVE tag in mbox
+-  patchtest: remove unused imports
+-  patchtest: rework license checksum tests
+-  patchtest: shorten test result outputs
+-  patchtest: simplify test directory structure
+-  patchtest: skip merge test if not targeting master
+-  patchtest: test regardless of mergeability
+-  perl: fix intermittent test failure
+-  poky.conf: bump version for 4.3.1 release
+-  profile-manual: aesthetic cleanups
+-  ref-manual: Add documentation for the unimplemented-ptest QA warning
+-  ref-manual: Fix :term:`PACKAGECONFIG` term and add an example
+-  ref-manual: Warn about :term:`COMPATIBLE_MACHINE` skipping native recipes
+-  ref-manual: add systemd-resolved to distro features
+-  ref-manual: classes: explain cml1 class name
+-  ref-manual: document :term:`KERNEL_LOCALVERSION`
+-  ref-manual: document :term:`KERNEL_STRIP`
+-  ref-manual: document :term:`MESON_TARGET`
+-  ref-manual: document cargo_c class
+-  ref-manual: remove semicolons from ``*PROCESS_COMMAND`` variables
+-  ref-manual: update :term:`SDK_NAME` variable documentation
+-  ref-manual: variables: add :term:`RECIPE_MAINTAINER`
+-  ref-manual: variables: add :term:`RECIPE_SYSROOT` and :term:`RECIPE_SYSROOT_NATIVE`
+-  ref-manual: variables: add :term:`TOOLCHAIN_OPTIONS` variable
+-  ref-manual: variables: add example for :term:`SYSROOT_DIRS` variable
+-  ref-manual: variables: document :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
+-  ref-manual: variables: mention new CDN for :term:`SSTATE_MIRRORS`
+-  ref-manual: variables: provide no-match example for :term:`COMPATIBLE_MACHINE`
+-  ref-manual: variables: remove SERIAL_CONSOLES_CHECK
+-  release-notes-4.3: add CVEs, recipe upgrades, license changes, contributors
+-  release-notes-4.3: add Repositories / Downloads section
+-  release-notes-4.3: feature additions
+-  release-notes-4.3: fix some typos
+-  release-notes-4.3: move new classes to Rust section
+-  release-notes-4.3: remove the Distribution section
+-  release-notes-4.3: tweaks to existing text
+-  sdk-manual: appendix-obtain: improve and update descriptions
+-  test-manual: reproducible-builds: stop mentioning LTO bug
+-  vim: Improve locale handling
+-  vim: Upgrade to 9.0.2068
+-  vim: use upstream generated .po files
+
+
+Known Issues in Yocto-4.3.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.3.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Alejandro Hernandez Samaniego
+-  Alex Stewart
+-  Archana Polampalli
+-  Arne Schwerdt
+-  BELHADJ SALEM Talel
+-  Dmitry Baryshkov
+-  Eero Aaltonen
+-  Joshua Watt
+-  Julien Stephan
+-  Jérémy Rosen
+-  Khem Raj
+-  Lee Chee Yang
+-  Marta Rybczynska
+-  Max Krummenacher
+-  Michael Halstead
+-  Michael Opdenacker
+-  Paul Eggleton
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Quentin Schulz
+-  Richard Purdie
+-  Robert P. J. Day
+-  Ross Burton
+-  Rouven Czerwinski
+-  Steve Sakoman
+-  Trevor Gamblin
+-  Wang Mingyu
+-  William Lyu
+-  Xiangyu Chen
+-  luca fancellu
+
+
+Repositories / Downloads for Yocto-4.3.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`nanbield </poky/log/?h=nanbield>`
+-  Tag:  :yocto_git:`yocto-4.3.1 </poky/log/?h=yocto-4.3.1>`
+-  Git Revision: :yocto_git:`bf9f2f6f60387b3a7cd570919cef6c4570edcb82 </poky/commit/?id=bf9f2f6f60387b3a7cd570919cef6c4570edcb82>`
+-  Release Artefact: poky-bf9f2f6f60387b3a7cd570919cef6c4570edcb82
+-  sha: 9b4351159d728fec2b63a50f1ac15edc412e2d726e9180a40afc06051fadb922
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.1/poky-bf9f2f6f60387b3a7cd570919cef6c4570edcb82.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.1/poky-bf9f2f6f60387b3a7cd570919cef6c4570edcb82.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`nanbield </openembedded-core/log/?h=nanbield>`
+-  Tag:  :oe_git:`yocto-4.3.1 </openembedded-core/log/?h=yocto-4.3.1>`
+-  Git Revision: :oe_git:`cce77e8e79c860f4ef0ac4a86b9375bf87507360 </openembedded-core/commit/?id=cce77e8e79c860f4ef0ac4a86b9375bf87507360>`
+-  Release Artefact: oecore-cce77e8e79c860f4ef0ac4a86b9375bf87507360
+-  sha: e6cde08e7c549f57a67d833a36cdb942648fba81558dc8b0e65332d2a2c023cc
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.1/oecore-cce77e8e79c860f4ef0ac4a86b9375bf87507360.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.1/oecore-cce77e8e79c860f4ef0ac4a86b9375bf87507360.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`nanbield </meta-mingw/log/?h=nanbield>`
+-  Tag:  :yocto_git:`yocto-4.3.1 </meta-mingw/log/?h=yocto-4.3.1>`
+-  Git Revision: :yocto_git:`49617a253e09baabbf0355bc736122e9549c8ab2 </meta-mingw/commit/?id=49617a253e09baabbf0355bc736122e9549c8ab2>`
+-  Release Artefact: meta-mingw-49617a253e09baabbf0355bc736122e9549c8ab2
+-  sha: 2225115b73589cdbf1e491115221035c6a61679a92a93b2a3cf761ff87bf4ecc
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.1/meta-mingw-49617a253e09baabbf0355bc736122e9549c8ab2.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.1/meta-mingw-49617a253e09baabbf0355bc736122e9549c8ab2.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.6 </bitbake/log/?h=2.6>`
+-  Tag:  :oe_git:`yocto-4.3.1 </bitbake/log/?h=yocto-4.3.1>`
+-  Git Revision: :oe_git:`936fcec41efacc4ce988c81882a9ae6403702bea </bitbake/commit/?id=936fcec41efacc4ce988c81882a9ae6403702bea>`
+-  Release Artefact: bitbake-936fcec41efacc4ce988c81882a9ae6403702bea
+-  sha: efbdd5fe7f29227a3fd26d6a08a368bf8215083a588b4d23f3adf35044897520
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.1/bitbake-936fcec41efacc4ce988c81882a9ae6403702bea.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.1/bitbake-936fcec41efacc4ce988c81882a9ae6403702bea.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`nanbield </yocto-docs/log/?h=nanbield>`
+-  Tag: :yocto_git:`yocto-4.3.1 </yocto-docs/log/?h=yocto-4.3.1>`
+-  Git Revision: :yocto_git:`6b98a6164263298648e89b5a5ae1260a58f1bb35 </yocto-docs/commit/?id=6b98a6164263298648e89b5a5ae1260a58f1bb35>`
+
-- 
2.34.1


