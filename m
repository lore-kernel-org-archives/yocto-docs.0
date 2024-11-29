Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABC3D70E04
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 02:15:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.web10.107695.1732846525815342203
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Nov 2024 18:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=d9WtdMfm;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732846526; x=1764382526;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9gZCQtJC66/cbIjcMPGfGUb5xXjPgE+8wB4M6jH+Bz8=;
  b=d9WtdMfmhjdI3Wge+pgka2isEiJVPQZALqiqcgohYqsD4ESWlnQmwRBJ
   kbvxX8sTQYqQSQh88S5zC+N72M6JY5mtkMedeKUWuVeUdotx9zVuzYBd9
   L+JoT+76ryFDZVCplfeeOT9KK1ZlSC4RdnvRVJg5yhzYiw8VZBd0WpKLR
   HxrfWmNAVK59Li/qEk0TCBlpp/mSsZlNNDVaKgz0j0iH8XWe5TaTBZ0Jg
   m2G6grH9SO7kLl9/31uwBFRT1UN1zZSy9+bBEddLXFrrufH8RCCwhDQoi
   0VoZ4YvdroBBZMb9sUozICyvyCod23q165CHOSY4OPO8LCreoApdD5DT3
   Q==;
X-CSE-ConnectionGUID: nWYkUr/OSz6vh6D/aJrTsQ==
X-CSE-MsgGUID: jPHlGi0sRLW+TEo0GXlq/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43746636"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="43746636"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 18:15:25 -0800
X-CSE-ConnectionGUID: 5webnrP1Svi9twWxdeE3aw==
X-CSE-MsgGUID: d+EDBKAGTiOvXNLhny2L4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92543230"
Received: from cheeyang-desk1.png.intel.com ([10.107.249.127])
  by fmviesa008.fm.intel.com with ESMTP; 28 Nov 2024 18:15:24 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: add release notes for 4.0.23
Date: Fri, 29 Nov 2024 10:13:13 +0800
Message-Id: <20241129021313.2300280-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 02:15:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5843

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.23.rst | 209 ++++++++++++++++++
 2 files changed, 210 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.23.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index 88ccbec9a..ac21e01c8 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -29,4 +29,5 @@ Release 4.0 (kirkstone)
    release-notes-4.0.20
    release-notes-4.0.21
    release-notes-4.0.22
+   release-notes-4.0.23
 
diff --git a/documentation/migration-guides/release-notes-4.0.23.rst b/documentation/migration-guides/release-notes-4.0.23.rst
new file mode 100644
index 000000000..abf7c6975
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.23.rst
@@ -0,0 +1,209 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.0.23 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.23
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  ``curl``: Fix :cve_nist:`2024-9681`
+-  ``expat``: Fix :cve_nist:`2024-50602`
+-  ``gcc``: Ignore :cve_nist:`2023-4039`
+-  ``ghostscript``: Fix :cve_nist:`2023-46361` and :cve_nist:`2024-29508`
+-  ``gstreamer1.0``: Ignore :cve_nist:`2024-0444`
+-  ``libarchive``: Fix :cve_nist:`2024-48957` and :cve_nist:`2024-48958`
+-  ``openssl``: Fix :cve_nist:`2024-9143`
+-  ``orc``: Fix :cve_nist:`2024-40897`
+-  ``python3``: Ignore :cve_nist:`2023-27043`, :cve_nist:`2024-6232` and :cve_nist:`2024-7592`
+-  ``qemu``: Fix :cve_nist:`2023-3019`
+-  ``vim``: Fix :cve_nist:`2024-43790`, :cve_nist:`2024-43802`, :cve_nist:`2024-45306` and :cve_nist:`2024-47814`
+-  ``zstd``: Fix :cve_nist:`2022-4899`
+
+
+Fixes in Yocto-4.0.23
+~~~~~~~~~~~~~~~~~~~~~
+
+-  at-spi2-core: backport a patch to fix build with gcc-14 on host
+-  bitbake: bitbake: doc/user-manual: Update the BB_HASHSERVE_UPSTREAM
+-  bitbake: codeparser: Fix handling of string AST nodes with older Python versions
+-  bitbake: fetch2/git: Use quote from shlex, not pipes
+-  bitbake: gitsm: Add call_process_submodules() to remove duplicated code
+-  bitbake: gitsm: Remove downloads/tmpdir when failed
+-  bitbake: tests/fetch: Use our own mirror of mobile-broadband-provider to decouple from gnome gitlab
+-  bitbake: tests/fetch: Use our own mirror of sysprof to decouple from gnome gitlab
+-  bmap-tools: update :term:`HOMEPAGE` and :term:`SRC_URI`
+-  build-appliance-image: Update to kirkstone head revision
+-  cmake: Fix sporadic issues when determining compiler internals
+-  cracklib: Modify patch to compile with GCC 14
+-  cve-check: add CVSS vector string to CVE database and reports
+-  cve-check: add support for cvss v4.0
+-  cve_check: Use a local copy of the database during builds
+-  dev-manual: document how to provide confs from layer.conf
+-  documentation: Makefile: add SPHINXLINTDOCS to specify subset to sphinx-lint
+-  documentation: Makefile: fix epub and latexpdf targets
+-  documentation: README: add instruction to run Vale on a subset
+-  documentation: brief-yoctoprojectqs: update BB_HASHSERVE_UPSTREAM for new infrastructure
+-  documentation: conf.py: add a bitbake_git extlink
+-  documentation: rename :cve: role to :cve_nist:
+-  documentation: styles: vocabularies: Yocto: add sstate
+-  documnetation: contributor-guide: Remove duplicated words
+-  gcc: restore a patch for Neoverse N2 core
+-  glib-2.0: patch regression of :cve_nist:`2023-32665`
+-  kmscube: create_framebuffer: backport modifier fix
+-  libffi: backport a fix to build libffi-native with gcc-14
+-  linux-firmware: Upgrade to 20240909
+-  local.conf.sample: update BB_HASHSERVE_UPSTREAM for new infrastructure
+-  migration-guide: add release notes for 4.0.22
+-  migration-guide: release-notes-4.0: update BB_HASHSERVE_UPSTREAM for new infrastructure
+-  nativesdk-intercept: Fix bad intercept chgrp/chown logic
+-  orc: Upgrade to  0.4.40
+-  overlayfs-etc: add option to skip creation of mount dirs
+-  overview-manual: concepts: add details on package splitting
+-  package: Switch debug source handling to use prefix map
+-  patch.py: Use shlex instead of deprecated pipe
+-  poky.conf: bump version for 4.0.23
+-  pseudo: Disable LFS on 32bit arches
+-  pseudo: Fix envp bug and add posix_spawn wrapper
+-  pseudo: Fix to work with glibc 2.40
+-  pseudo: Switch back to the master branch
+-  pseudo: Update to include logic fix
+-  pseudo: Update to include open symlink handling bugfix
+-  pseudo: Update to pull in fchmodat fix
+-  pseudo: Update to pull in fd leak fix
+-  pseudo: Update to pull in gcc14 fix and missing statvfs64 intercept
+-  pseudo: Update to pull in linux-libc-headers race fix
+-  pseudo: Update to pull in python 3.12+ fix
+-  pseudo: Update to pull in syncfs probe fix
+-  ref-manual: add description for the "sysroot" term
+-  ref-manual: add missing CVE_CHECK manifest variables
+-  ref-manual: add missing :term:`EXTERNAL_KERNEL_DEVICETREE` variable
+-  ref-manual: add missing :term:`OPKGBUILDCMD` variable
+-  ref-manual: devtool-reference: document missing commands
+-  ref-manual: devtool-reference: refresh example outputs
+-  ref-manual: introduce :term:`CVE_CHECK_REPORT_PATCHED` variable
+-  ref-manual: release-process: add a reference to the doc's release
+-  ref-manual: release-process: refresh the current LTS releases
+-  ref-manual: release-process: update releases.svg
+-  ref-manual: release-process: update releases.svg with month after "Current"
+-  ref-manual: structure.rst: document missing tmp/ dirs
+-  ref-manual: variables: add SIGGEN_LOCKEDSIGS* variables
+-  syslinux: Disable error on implicit-function-declaration
+-  util-linux: Define pidfd_* function signatures
+-  vala: add -Wno-error=incompatible-pointer-types work around
+-  vim: Upgrade to 9.1.0764
+-  xmlto: backport a patch to fix build with gcc-14 on host
+-  zip: Fix build with gcc-14
+-  zip: Make configure checks to be more robust
+
+
+Known Issues in Yocto-4.0.23
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-N/A
+
+
+Contributors to Yocto-4.0.23
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Aleksandar Nikolic
+-  Alexandre Belloni
+-  Antoine Lubineau
+-  Antonin Godard
+-  Archana Polampalli
+-  Ashish Sharma
+-  Baruch Siach
+-  Eilís 'pidge' Ní Fhlannagáin
+-  Jose Quaresma
+-  Julien Stephan
+-  Khem Raj
+-  Lee Chee Yang
+-  Macpaul Lin
+-  Martin Jansa
+-  Michael Opdenacker
+-  Ola x Nilsson
+-  Peter Marko
+-  Philip Lorenz
+-  Randolph Sapp
+-  Richard Purdie
+-  Robert Yang
+-  Rohini Sangam
+-  Ruiqiang Hao
+-  Siddharth Doshi
+-  Steve Sakoman
+-  Talel BELHAJSALEM
+-  Wang Mingyu
+-  Yogita Urade
+-  Zoltan Boszormenyi
+
+
+Repositories / Downloads for Yocto-4.0.23
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.23 </poky/log/?h=yocto-4.0.23>`
+-  Git Revision: :yocto_git:`8e092852b63e998d990b8f8e1aa91297dec4430f </poky/commit/?id=8e092852b63e998d990b8f8e1aa91297dec4430f>`
+-  Release Artefact: poky-8e092852b63e998d990b8f8e1aa91297dec4430f
+-  sha: 339d34d8432070dac948449e732ebf06a888eeb27ff548958b2395c9446b029d
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.23/poky-8e092852b63e998d990b8f8e1aa91297dec4430f.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.23/poky-8e092852b63e998d990b8f8e1aa91297dec4430f.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.23 </openembedded-core/log/?h=yocto-4.0.23>`
+-  Git Revision: :oe_git:`fb45c5cf8c2b663af293acb069d446610f77ff1a </openembedded-core/commit/?id=fb45c5cf8c2b663af293acb069d446610f77ff1a>`
+-  Release Artefact: oecore-fb45c5cf8c2b663af293acb069d446610f77ff1a
+-  sha: 1d394370ea7d43fb885ab8a952d6d1e43f1a850745a5152d5ead5565a283a0f5
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.23/oecore-fb45c5cf8c2b663af293acb069d446610f77ff1a.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.23/oecore-fb45c5cf8c2b663af293acb069d446610f77ff1a.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.23 </meta-mingw/log/?h=yocto-4.0.23>`
+-  Git Revision: :yocto_git:`87c22abb1f11be430caf4372e6b833dc7d77564e </meta-mingw/commit/?id=87c22abb1f11be430caf4372e6b833dc7d77564e>`
+-  Release Artefact: meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e
+-  sha: f0bc4873e2e0319fb9d6d6ab9b98eb3f89664d4339a167d2db6a787dd12bc1a8
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.23/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.23/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.23 </meta-gplv2/log/?h=yocto-4.0.23>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.23/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.23/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.23 </bitbake/log/?h=yocto-4.0.23>`
+-  Git Revision: :oe_git:`fb73c495c45d1d4107cfd60b67a5b4f11a99647b </bitbake/commit/?id=fb73c495c45d1d4107cfd60b67a5b4f11a99647b>`
+-  Release Artefact: bitbake-fb73c495c45d1d4107cfd60b67a5b4f11a99647b
+-  sha: 5cd271299951f25912a2e8d4de6d8769a4c0bb3bbcfc90815be41f23fd299a0b
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.23/bitbake-fb73c495c45d1d4107cfd60b67a5b4f11a99647b.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.23/bitbake-fb73c495c45d1d4107cfd60b67a5b4f11a99647b.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.23 </yocto-docs/log/?h=yocto-4.0.23>`
+-  Git Revision: :yocto_git:`TBD </yocto-docs/commit/?id=TBD>`
+
+
-- 
2.34.1


