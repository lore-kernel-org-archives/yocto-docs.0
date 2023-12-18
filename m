Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809B9C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 07:20:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.39509.1702884051206739127
 for <docs@lists.yoctoproject.org>;
 Sun, 17 Dec 2023 23:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=DMMNq0Ig;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702884051; x=1734420051;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2vCyZ/MwmcgvXcU2wMzY39eOX7wCYpDUCM7Hx7yZ5xc=;
  b=DMMNq0IgQIsEQMvwXyKW9REpjamKC5yqPDESsoCBc7ejRuRTPezidS9k
   0cidqEgCLfsfMZf95aIICQ1HwgFgslHzRSNwMqavOAJEBYbGuKIvkf8Z1
   HW5MqFyPa7BJu/Td/iaJppfqlVGB7IsDjZRTC13qm/sxrLz9vchn5xPyS
   1GTYYQlLeoXj0c3eVpPN5yJJ8y3+RnNUIOVRC3joZU9ESDAvAN4cQicNQ
   eBrCqVKKPbr3kWEEGxt86/3v3ZpivjOLeSlG3tAfbn7LgvhZC5hiQwsxt
   l6yNkPSjhSXt1rUAgcpQDXi37unFWZyinhH368eVelOlHTnGCP6jyal+C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="394341543"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="394341543"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 23:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="919165286"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="919165286"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2023 23:20:43 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Cc: ypa.takayasu.ito@gmail.com
Subject: [PATCH] migration-guides: add release notes for 4.0.15
Date: Mon, 18 Dec 2023 15:17:24 +0800
Message-Id: <20231218071724.2934824-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 07:20:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4681

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.15.rst | 189 ++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.15.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index 748eab3bd..09fb8ca04 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -21,3 +21,4 @@ Release 4.0 (kirkstone)
    release-notes-4.0.12
    release-notes-4.0.13
    release-notes-4.0.14
+   release-notes-4.0.15
diff --git a/documentation/migration-guides/release-notes-4.0.15.rst b/documentation/migration-guides/release-notes-4.0.15.rst
new file mode 100644
index 000000000..301cc3f45
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.15.rst
@@ -0,0 +1,189 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.0.15 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.15
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  avahi: Fix :cve:`2023-1981`, :cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471`, :cve:`2023-38472` and :cve:`2023-38473`
+-  binutils: Fix :cve:`2022-47007`, :cve:`2022-47010` and :cve:`2022-48064`
+-  bluez5: Fix :cve:`2023-45866`
+-  ghostscript: Ignore GhostPCL :cve:`2023-38560`
+-  gnutls: Fix :cve:`2023-5981`
+-  go: Ignore :cve:`2023-45283` and :cve:`2023-45284`
+-  grub: Fix :cve:`2023-4692` and :cve:`2023-4693`
+-  gstreamer1.0-plugins-bad: Fix :cve_mitre:`2023-44429`
+-  libsndfile: Fix :cve:`2022-33065`
+-  libwebp: Fix :cve:`2023-4863`
+-  openssl: Fix :cve:`2023-5678`
+-  python3-cryptography: Fix :cve:`2023-49083`
+-  qemu: Fix :cve:`2023-1544`
+-  sudo: CVE-2023-42456 :cve_mitre:`2023-42465`
+-  tiff: Fix :cve:`2023-41175`
+-  vim: Fix :cve:`2023-46246`, :cve:`2023-48231`, :cve:`2023-48232`, :cve:`2023-48233`, :cve:`2023-48234`, :cve:`2023-48235`, :cve:`2023-48236`, :cve:`2023-48237` and :cve:`2023-48706`
+-  xserver-xorg: Fix :cve:`2023-5367` and :cve:`2023-5380`
+-  xwayland: Fix :cve:`2023-5367`
+
+
+Fixes in Yocto-4.0.15
+~~~~~~~~~~~~~~~~~~~~~
+
+-  bash: changes to SIGINT handler while waiting for a child
+-  bitbake: Fix disk space monitoring on cephfs
+-  bitbake: bitbake-getvar: Make --quiet work with --recipe
+-  bitbake: runqueue.py: fix PSI check logic
+-  bitbake: runqueue: Add pressure change logging
+-  bitbake: runqueue: convert deferral messages from bb.note to bb.debug
+-  bitbake: runqueue: fix PSI check calculation
+-  bitbake: runqueue: show more pressure data
+-  bitbake: runqueue: show number of currently running bitbake threads when pressure changes
+-  bitbake: tinfoil: Do not fail when logging is disabled and full config is used
+-  build-appliance-image: Update to kirkstone head revision
+-  cve-check: don't warn if a patch is remote
+-  cve-check: slightly more verbose warning when adding the same package twice
+-  cve-check: sort the package list in the JSON report
+-  cve-exclusion_5.10.inc: update for 5.10.202
+-  go: Fix issue in DNS resolver
+-  goarch: Move Go architecture mapping to a library
+-  gstreamer1.0-plugins-base: enable glx/opengl support
+-  linux-yocto/5.10: update to v5.10.202
+-  manuals: update class references
+-  migration-guide: add release notes for 4.0.14
+-  native: Clear TUNE_FEATURES/ABIEXTENSION
+-  openssh: drop sudo from ptest dependencies
+-  overview-manual: concepts: Add Bitbake Tasks Map
+-  poky.conf: bump version for 4.0.15
+-  python3-jinja2: Fixed ptest result output as per the standard
+-  ref-manual: classes: explain cml1 class name
+-  ref-manual: update :term:`SDK_NAME` variable documentation
+-  ref-manual: variables: add :term:`RECIPE_MAINTAINER`
+-  ref-manual: variables: document OEQA_REPRODUCIBLE_* variables
+-  ref-manual: variables: mention new CDN for :term:`SSTATE_MIRRORS`
+-  rust-common: Set llvm-target correctly for cross SDK targets
+-  rust-cross-canadian: Fix ordering of target json config generation
+-  rust-cross/rust-common: Merge arm target handling code to fix cross-canadian
+-  rust-cross: Simplfy the rust_gen_target calls
+-  rust-llvm: Allow overriding LLVM target archs
+-  sdk-manual: extensible.rst: remove instructions for using SDK functionality directly in a yocto build
+-  sudo: upgrade to 1.9.15p2
+-  systemtap_git: fix used uninitialized error
+-  vim: Improve locale handling
+-  vim: Upgrade to 9.0.2130
+-  vim: use upstream generated .po files
+
+
+Known Issues in Yocto-4.0.15
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.15
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Alexander Kanavin
+-  Archana Polampalli
+-  BELHADJ SALEM Talel
+-  Bruce Ashfield
+-  Chaitanya Vadrevu
+-  Chen Qi
+-  Deepthi Hemraj
+-  Denys Dmytriyenko
+-  Hitendra Prajapati
+-  Lee Chee Yang
+-  Li Wang
+-  Martin Jansa
+-  Meenali Gupta
+-  Michael Opdenacker
+-  Mikko Rapeli
+-  Narpat Mali
+-  Niko Mauno
+-  Ninad Palsule
+-  Niranjan Pradhan
+-  Paul Eggleton
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Richard Purdie
+-  Ross Burton
+-  Samantha Jalabert
+-  Sanjana
+-  Soumya Sambu
+-  Steve Sakoman
+-  Tim Orling
+-  Vijay Anusuri
+-  Vivek Kumbhar
+-  Wenlin Kang
+-  Yogita Urade
+
+
+Repositories / Downloads for Yocto-4.0.15
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.15 </poky/log/?h=yocto-4.0.15>`
+-  Git Revision: :yocto_git:`755632c2fcab43aa05cdcfa529727064b045073c </poky/commit/?id=755632c2fcab43aa05cdcfa529727064b045073c>`
+-  Release Artefact: poky-755632c2fcab43aa05cdcfa529727064b045073c
+-  sha: b40b43bd270d21a420c399981f9cfe0eb999f15e051fc2c89d124f249cdc0bd5
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.15/poky-755632c2fcab43aa05cdcfa529727064b045073c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.15/poky-755632c2fcab43aa05cdcfa529727064b045073c.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.15 </openembedded-core/log/?h=yocto-4.0.15>`
+-  Git Revision: :oe_git:`eea685e1caafd8e8121006d3f8b5d0b8a4f2a933 </openembedded-core/commit/?id=eea685e1caafd8e8121006d3f8b5d0b8a4f2a933>`
+-  Release Artefact: oecore-eea685e1caafd8e8121006d3f8b5d0b8a4f2a933
+-  sha: ddc3d4a2c8a097f2aa7132ae716affacc44b119c616a1eeffb7db56caa7fc79e
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.15/oecore-eea685e1caafd8e8121006d3f8b5d0b8a4f2a933.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.15/oecore-eea685e1caafd8e8121006d3f8b5d0b8a4f2a933.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.15 </meta-mingw/log/?h=yocto-4.0.15>`
+-  Git Revision: :yocto_git:`f6b38ce3c90e1600d41c2ebb41e152936a0357d7 </meta-mingw/commit/?id=f6b38ce3c90e1600d41c2ebb41e152936a0357d7>`
+-  Release Artefact: meta-mingw-f6b38ce3c90e1600d41c2ebb41e152936a0357d7
+-  sha: 7d57167c19077f4ab95623d55a24c2267a3a3fb5ed83688659b4c03586373b25
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.15/meta-mingw-f6b38ce3c90e1600d41c2ebb41e152936a0357d7.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.15/meta-mingw-f6b38ce3c90e1600d41c2ebb41e152936a0357d7.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.15 </meta-gplv2/log/?h=yocto-4.0.15>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.15/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.15/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.15 </bitbake/log/?h=yocto-4.0.15>`
+-  Git Revision: :oe_git:`42a1c9fe698a03feb34c5bba223c6e6e0350925b </bitbake/commit/?id=42a1c9fe698a03feb34c5bba223c6e6e0350925b>`
+-  Release Artefact: bitbake-42a1c9fe698a03feb34c5bba223c6e6e0350925b
+-  sha: 64c684ccd661fa13e25c859dfc68d66bec79281da0f4f81b0d6a9995acb659b5
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.15/bitbake-42a1c9fe698a03feb34c5bba223c6e6e0350925b.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.15/bitbake-42a1c9fe698a03feb34c5bba223c6e6e0350925b.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.15 </yocto-docs/log/?h=yocto-4.0.15>`
+-  Git Revision: :yocto_git:`08fda7a5601393617b1ecfe89229459e14a90b1d </yocto-docs/commit/?id=08fda7a5601393617b1ecfe89229459e14a90b1d>`
+
-- 
2.34.1


