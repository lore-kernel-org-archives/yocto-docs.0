Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FEBC48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:14:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.web10.6256.1708402449265506429
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Feb 2024 20:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lHQUj7ZI;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708402449; x=1739938449;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1737znIIvIeuotyv+Jh/JoIcXKneL9b/ZVBtYBd/q2M=;
  b=lHQUj7ZIXCS2moWgwJCZKdkwBh11pdCSwnCpape/0yGtiQaEkBeFowji
   iBqMYoQSIlFlnwxotmDEAmPurGcTFJX8F3gQLtzKAkf1+RKQ963DmPBsF
   wNjucs3HW+MdQX9m6+b5ymxfQepKJKHkOBVapldsiULXSLpOqm8ZpjPKC
   diQXHMtsDQz++SKRdw7lsTX4nm5/qdBMeJKaI5oEcXDBFeYwf29AeF8ho
   xLOd828uUR9iKRRDqdGvcwRANgrb/hwGMgoSNO2fKzteJ4HyJcbchHuYr
   tnq+7ICRbs9eT0ij+1SeLEFInX8alAoYapW3w7tcJH8zlS3UzS4vwAvXg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2632941"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2632941"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 20:14:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="9322713"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by orviesa004.jf.intel.com with ESMTP; 19 Feb 2024 20:14:07 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] migration-guide: add release notes for 4.3.3
Date: Tue, 20 Feb 2024 12:12:33 +0800
Message-Id: <20240220041233.3730675-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Feb 2024 04:14:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4847

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
v2: move some linux-yocto/6.1 cve to "fix". These were fixed in version
 upgrade but marked Ignore in exclusion as fixed dot version not updated
 in NVD database.

 .../migration-guides/release-4.3.rst          |   1 +
 .../migration-guides/release-notes-4.3.3.rst  | 200 ++++++++++++++++++
 2 files changed, 201 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.3.3.rst

diff --git a/documentation/migration-guides/release-4.3.rst b/documentation/migration-guides/release-4.3.rst
index 3adb5b620..fa5653c46 100644
--- a/documentation/migration-guides/release-4.3.rst
+++ b/documentation/migration-guides/release-4.3.rst
@@ -9,3 +9,4 @@ Release 4.3 (nanbield)
    release-notes-4.3
    release-notes-4.3.1
    release-notes-4.3.2
+   release-notes-4.3.3
diff --git a/documentation/migration-guides/release-notes-4.3.3.rst b/documentation/migration-guides/release-notes-4.3.3.rst
new file mode 100644
index 000000000..2a0658a9c
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.3.3.rst
@@ -0,0 +1,200 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.3.3 (Nanbield)
+----------------------------------------
+
+Security Fixes in Yocto-4.3.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  curl: Fix :cve:`2023-46219`
+-  glibc: Ignore fixed :cve:`2023-0687` and :cve:`2023-5156`
+-  linux-yocto/6.1: Ignore :cve:`2022-48619`, :cve:`2023-4610`, :cve:`2023-5178`, :cve:`2023-5972`, :cve:`2023-6040`, :cve:`2023-6531`, :cve:`2023-6546`, :cve:`2023-6622`, :cve:`2023-6679`, :cve:`2023-6817`, :cve:`2023-6931`, :cve:`2023-6932`, :cve:`2023-7192`, :cve:`2024-0193` and :cve:`2024-0443`
+-  linux-yocto/6.1: Fix :cve:`2023-1193`, :cve_mitre:`2023-51779`, :cve:`2023-51780`, :cve:`2023-51781`, :cve:`2023-51782` and :cve:`2023-6606`
+-  qemu: Fix :cve:`2023-3019`
+-  shadow: Fix :cve:`2023-4641`
+-  sqlite3: Fix :cve:`2024-0232`
+-  sqlite3: drop obsolete CVE ignore :cve:`2023-36191`
+-  sudo: Fix :cve:`2023-42456` and :cve:`2023-42465`
+-  tiff: Fix :cve:`2023-6277`
+-  xwayland: Fix :cve:`2023-6377` and :cve:`2023-6478`
+
+
+Fixes in Yocto-4.3.3
+~~~~~~~~~~~~~~~~~~~~
+
+-  aspell: upgrade to 0.60.8.1
+-  avahi: update URL for new project location
+-  base-passwd: upgrade to 3.6.3
+-  bitbake: asyncrpc: Add context manager API
+-  bitbake: toaster/toastergui: Bug-fix verify given layer path only if import/add local layer
+-  build-appliance-image: Update to nanbield head revision
+-  classes-global/sstate: Fix variable typo
+-  cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES
+-  contributor-guide: fix lore URL
+-  contributor-guide: use "apt" instead of "aptitude"
+-  create-spdx-2.2: combine spdx can try to write before dir creation
+-  curl: Disable test 1091 due to intermittent failures
+-  curl: Disable two intermittently failing tests
+-  dev-manual: gen-tapdevs need iptables installed
+-  dev-manual: start.rst: Update use of Download page
+-  dev-manual: update license manifest path
+-  devtool: deploy: provide max_process to strip_execs
+-  devtool: modify: Handle recipes with a menuconfig task correctly
+-  docs: document VSCode extension
+-  dtc: preserve version also from shallow git clones
+-  elfutils: Update license information
+-  glib-2.0: upgrade to 2.78.3
+-  glibc-y2038-tests: do not run tests using 32 bit time APIs
+-  go: upgrade to 1.20.12
+-  grub: fs/fat: Don't error when mtime is 0
+-  gstreamer1.0: upgrade to 1.22.8
+-  icon-naming-utils: take tarball from debian
+-  kea: upgrade to 2.4.1
+-  lib/prservice: Improve lock handling robustness
+-  libadwaita: upgrade to 1.4.2
+-  libatomic-ops: upgrade to 7.8.2
+-  libva-utils: upgrade to 2.20.1
+-  linux-firmware: Change bnx2 packaging
+-  linux-firmware: Create bnx2x subpackage
+-  linux-firmware: Fix the linux-firmware-bcm4373 :term:`FILES` variable
+-  linux-firmware: Package iwlwifi .pnvm files
+-  linux-yocto/6.1: security/cfg: add configs to harden protection
+-  linux-yocto/6.1: update to v6.1.73
+-  meta/documentation.conf: fix do_menuconfig description
+-  migration-guide: add release notes for 4.0.16
+-  migration-guide: add release notes for 4.3.2
+-  ncurses: Fix - tty is hung after reset
+-  nfs-utils: Update Upstream-Status
+-  nfs-utils: upgrade to 2.6.4
+-  oeqa/selftest/prservice: Improve test robustness
+-  package.py: OEHasPackage: Add :term:`MLPREFIX` to packagename
+-  poky.conf: bump version for 4.3.3 release
+-  pseudo: Update to pull in syncfs probe fix
+-  python3-license-expression: Fix the ptest failure
+-  qemu.bbclass: fix a python TypeError
+-  qemu: upgrade to 8.1.4
+-  ref-manual: Add UBOOT_BINARY, extend :term:`UBOOT_CONFIG`
+-  ref-manual: classes: remove insserv bbclass
+-  ref-manual: update tested and supported distros
+-  release-notes-4.3: fix spacing
+-  rootfs.py: check depmodwrapper execution result
+-  rpcbind: Specify state directory under /run
+-  scripts/runqemu: fix regex escape sequences
+-  sqlite3: upgrade to 3.43.2
+-  sstate: Fix dir ownership issues in :term:`SSTATE_DIR`
+-  sudo: upgrade to 1.9.15p5
+-  tcl: Fix prepending to run-ptest script
+-  uninative-tarball.xz - reproducibility fix
+-  xwayland: upgrade to 23.2.3
+-  zstd: fix :term:`LICENSE` statement
+
+
+Known Issues in Yocto-4.3.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.3.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Alassane Yattara
+-  Alexander Kanavin
+-  Anuj Mittal
+-  Baruch Siach
+-  Bruce Ashfield
+-  Chen Qi
+-  Clay Chang
+-  Enguerrand de Ribaucourt
+-  Ilya A. Kriveshko
+-  Jason Andryuk
+-  Jeremy A. Puhlman
+-  Joao Marcos Costa
+-  Jose Quaresma
+-  Joshua Watt
+-  Jörg Sommer
+-  Khem Raj
+-  Lee Chee Yang
+-  Markus Volk
+-  Massimiliano Minella
+-  Maxin B. John
+-  Michael Opdenacker
+-  Ming Liu
+-  Mingli Yu
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Richard Purdie
+-  Robert Berger
+-  Robert Yang
+-  Rodrigo M. Duarte
+-  Ross Burton
+-  Saul Wold
+-  Simone Weiß
+-  Soumya Sambu
+-  Steve Sakoman
+-  Trevor Gamblin
+-  Wang Mingyu
+-  William Lyu
+-  Xiangyu Chen
+-  Yang Xu
+-  Zahir Hussain
+
+
+Repositories / Downloads for Yocto-4.3.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`nanbield </poky/log/?h=nanbield>`
+-  Tag:  :yocto_git:`yocto-4.3.3 </poky/log/?h=yocto-4.3.3>`
+-  Git Revision: :yocto_git:`d3b27346c3a4a7ef7ec517e9d339d22bda74349d </poky/commit/?id=d3b27346c3a4a7ef7ec517e9d339d22bda74349d>`
+-  Release Artefact: poky-d3b27346c3a4a7ef7ec517e9d339d22bda74349d
+-  sha: 2db39f1bf7bbcee039e9970eed1f6f9233bcc95d675159647c9a2a334fc81eb0
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.3/poky-d3b27346c3a4a7ef7ec517e9d339d22bda74349d.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.3/poky-d3b27346c3a4a7ef7ec517e9d339d22bda74349d.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`nanbield </openembedded-core/log/?h=nanbield>`
+-  Tag:  :oe_git:`yocto-4.3.3 </openembedded-core/log/?h=yocto-4.3.3>`
+-  Git Revision: :oe_git:`0584d01f623e1f9b0fef4dfa95dd66de6cbfb7b3 </openembedded-core/commit/?id=0584d01f623e1f9b0fef4dfa95dd66de6cbfb7b3>`
+-  Release Artefact: oecore-0584d01f623e1f9b0fef4dfa95dd66de6cbfb7b3
+-  sha: 730de0d5744f139322402ff9a6b2483c6ab929f704cec06258ae51de1daebe3d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.3/oecore-0584d01f623e1f9b0fef4dfa95dd66de6cbfb7b3.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.3/oecore-0584d01f623e1f9b0fef4dfa95dd66de6cbfb7b3.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`nanbield </meta-mingw/log/?h=nanbield>`
+-  Tag:  :yocto_git:`yocto-4.3.3 </meta-mingw/log/?h=yocto-4.3.3>`
+-  Git Revision: :yocto_git:`49617a253e09baabbf0355bc736122e9549c8ab2 </meta-mingw/commit/?id=49617a253e09baabbf0355bc736122e9549c8ab2>`
+-  Release Artefact: meta-mingw-49617a253e09baabbf0355bc736122e9549c8ab2
+-  sha: 2225115b73589cdbf1e491115221035c6a61679a92a93b2a3cf761ff87bf4ecc
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.3/meta-mingw-49617a253e09baabbf0355bc736122e9549c8ab2.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.3/meta-mingw-49617a253e09baabbf0355bc736122e9549c8ab2.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.6 </bitbake/log/?h=2.6>`
+-  Tag:  :oe_git:`yocto-4.3.3 </bitbake/log/?h=yocto-4.3.3>`
+-  Git Revision: :oe_git:`380a9ac97de5774378ded5e37d40b79b96761a0c </bitbake/commit/?id=380a9ac97de5774378ded5e37d40b79b96761a0c>`
+-  Release Artefact: bitbake-380a9ac97de5774378ded5e37d40b79b96761a0c
+-  sha: 78f579b9d29e72d09b6fb10ac62aa925104335e92d2afb3155bc9ab1994e36c1
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.3/bitbake-380a9ac97de5774378ded5e37d40b79b96761a0c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.3/bitbake-380a9ac97de5774378ded5e37d40b79b96761a0c.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`nanbield </yocto-docs/log/?h=nanbield>`
+-  Tag: :yocto_git:`yocto-4.3.3 </yocto-docs/log/?h=yocto-4.3.3>`
+-  Git Revision: :yocto_git:`dde4b815db82196af086847f68ee27d7902b4ffa </yocto-docs/commit/?id=dde4b815db82196af086847f68ee27d7902b4ffa>`
+
-- 
2.34.1


