Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE73510706D6
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 10:11:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10748.1773828656809677926
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 03:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=AlpBHLcq;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773828657; x=1805364657;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+TKXfW5fNyHN7AuZcQ3PyFWJKYV8jKxuNPawcZ5qEQQ=;
  b=AlpBHLcqRpzxtuoqkN6eHePsZY9fljTy4fHuLoM4k1tWsJknpV8a1zqn
   Qvnq/GgyVmnFXPfcIa1IIvTopl0fKNU0x8S0tY8TQhQ5Vqa6YMZSFABs8
   ZfIeyfpG7ToSbJdS2elYJr0dTu7U7SASObEZLV5lD+4SbTlyNGVizqKYT
   lOqsIeCblF4T/yYWgoq53RosDioT0IgHyirktkkiByRYKEWshN4zRAD5K
   mVIN0u3uFDVOm/j65S2KPJkCE9spbfmQuCBvQKhJWJMXFr3+DIUTr9Ml3
   M2bO0rVxEVMyx8wLp0zphvTnrr+SpZBaTIcSPZpfpQNzp6J/3GQF9yHTn
   A==;
X-CSE-ConnectionGUID: TRlgBseXRf+ivBzXW9JnZQ==
X-CSE-MsgGUID: l1mSQSA9TWaXQunxRQDrqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74853526"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74853526"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 03:10:56 -0700
X-CSE-ConnectionGUID: ouiRoYnRT9mU/Ynqo8E2yQ==
X-CSE-MsgGUID: v5ydijgLQs6VTW3NWFXj0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="227048514"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by orviesa004.jf.intel.com with ESMTP; 18 Mar 2026 03:10:55 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] migration-guides: add release notes for 5.0.16
Date: Wed, 18 Mar 2026 18:09:13 +0800
Message-ID: <20260318101028.1339215-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Mar 2026 10:11:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9094

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
v2 : reworded highlight notes and known issue.

 .../migration-guides/release-5.0.rst          |   1 +
 .../migration-guides/release-notes-5.0.16.rst | 218 ++++++++++++++++++
 2 files changed, 219 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-5.0.16.rst

diff --git a/documentation/migration-guides/release-5.0.rst b/documentation/migration-guides/release-5.0.rst
index 63b23edb1..b98e0141c 100644
--- a/documentation/migration-guides/release-5.0.rst
+++ b/documentation/migration-guides/release-5.0.rst
@@ -22,3 +22,4 @@ Release 5.0 (scarthgap)
    release-notes-5.0.13
    release-notes-5.0.14
    release-notes-5.0.15
+   release-notes-5.0.16
diff --git a/documentation/migration-guides/release-notes-5.0.16.rst b/documentation/migration-guides/release-notes-5.0.16.rst
new file mode 100644
index 000000000..da069f8bd
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.0.16.rst
@@ -0,0 +1,218 @@
+Release notes for Yocto-5.0.16 (Scarthgap)
+------------------------------------------
+
+This release breaks Ubuntu 20.04 as a
+:ref:`compatible host <ref-manual/system-requirements:Supported Linux Distributions>`.
+Ubuntu 20.04 lack kernel header recent enough to support the 
+:ref:`pseudo <overview-manual/concepts:fakeroot and pseudo>` fixes.
+Ubuntu 20.04 is End-of-Life since 31 May 2025. Impacted users are encouragded to upgrade
+to a actively supported host ditribution. See :doc:`/ref-manual/system-requirements`
+for more information on compatible hosts.
+
+Alternatively, a fix has been merged to scarthgap branch and can be applied on top of this
+release:
+
+- :oe_git:`/openembedded-core/commit/?h=scarthgap&id=fe2666749094e896736ff24d6885419905488723`
+- :yocto_git:`/poky/commit/?h=scarthgap&id=65c3ebea05dde5cbc9d249e7949fabbc0047313e`
+
+
+Security Fixes in Yocto-5.0.16
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  curl: Fix :cve_nist:`2025-10148`, :cve_nist:`2025-14017`, :cve_nist:`2025-14524`,
+   :cve_nist:`2025-14819`, :cve_nist:`2025-15079` and :cve_nist:`2025-15224`
+-  dropbear: Fix :cve_nist:`2019-6111`
+-  expat: Fix :cve_nist:`2026-24515` and :cve_nist:`2026-25210`
+-  ffmpeg: Ignore :cve_nist:`2025-25469`
+-  glib-2.0: Fix :cve_nist:`2025-13601`, :cve_nist:`2025-14087`, :cve_nist:`2025-14512` and
+   :cve_nist:`2026-0988`
+-  glibc: FIx :cve_nist:`2025-15281`, :cve_nist:`2026-0861` and :cve_nist:`2026-0915`
+-  inetutils: Fix :cve_nist:`2026-24061`
+-  libarchive: Fix :cve_nist:`2025-60753` (follow-up fix)
+-  libpcap: Fix :cve_nist:`2025-11961` and :cve_nist:`2025-11964`
+-  libpng: Fix :cve_nist:`2026-22695` and :cve_nist:`2026-22801`
+-  libtasn1: Fix :cve_nist:`2025-13151`
+-  libxml2: Fix :cve_nist:`2026-0989`, :cve_nist:`2026-0990` and :cve_nist:`2026-0992`
+-  python-urllib3: Fix for :cve_nist:`2026-21441`
+-  python3: Fix :cve_nist:`2025-12084`, :cve_nist:`2025-13836` and :cve_nist:`2025-13837`
+-  qemu: Ignore :cve_nist:`2025-54566` and :cve_nist:`2025-54567`
+-  util-linux: Fix :cve_nist:`2025-14104`
+-  zlib: Ignore :cve_nist:`2026-22184`
+
+
+Fixes in Yocto-5.0.16
+~~~~~~~~~~~~~~~~~~~~~
+
+-  bitbake: knotty: Make sure getTerminalColumns() returns two integers
+-  bitbake: knotty: fix TIOCGWINSZ call for Python 3.14 and later
+-  build-appliance-image: Update to scarthgap head revision
+-  contributor-guide/recipe-style-guide.rst: explain difference between layer and recipe license(s)
+-  contributor-guide/submit-changes.rst: remove mention of Upstream-Status
+-  cups: allow unknown directives in conf files
+-  dev-manual/packages.rst: fix example recipe version
+-  dev-manual/packages.rst: pr server: fix and explain why r0.X increments on :term:`SRCREV` change
+-  dev-manual/packages.rst: rename r0.0 to r0 when :term:`PR` server is not enabled
+-  dev-manual/temporary-source-code.rst: fix definition of :term:`WORKDIR`
+-  docbook-xml-dtd4: fix the fetching failure
+-  docs: Add a new "Security" section
+-  docs: Makefile: fix rsvg-convert --format capitalization
+-  ffmpeg: upgrade to 6.1.4
+-  glibc: stable 2.39 branch updates
+-  improve_kernel_cve_report: add script for postprocesing of kernel CVE data
+-  libtheora: set :term:`CVE_PRODUCT`
+-  lighttpd: Fix trailing slash on files in mod_dirlisting
+-  meta/classes: fix missing vardeps for CVE status variables
+-  migration-guides: add release notes for 4.0.32, 5.0.14 and 5.0.15
+-  overview-manual/yp-intro.rst: change removed ECOSYSTEM to ABOUT
+-  overview-manual/yp-intro.rst: fix SDK type in bullet list
+-  overview-manual/yp-intro.rst: link to YP members and participants
+-  overview-manual: convert YP-flow-diagram.png to SVG
+-  pseudo: Add hard sstate dependencies for pseudo-native
+-  pseudo: Update to 1.9.3 release
+-  ref-manual/classes.rst: document the image-container class
+-  ref-manual/release-process.rst: add a "Development Cycle" section
+-  ref-manual/svg/releases.svg: mark styhead and walnascar EOL
+-  ref-manual/svg/releases.svg: mark whinlatter as current release
+-  ref-manual/variables.rst: document the :term:`CCACHE_TOP_DIR` variable
+-  sdk-manual: appending-customizing: use none lexer for BitBake code blocks
+-  sdk-manual: appendix-obtain: fix default path for eSDK installer script
+-  sdk-manual: appendix-obtain: replace directory structure PNG with a parsed-literal block
+-  sdk-manual: appendix-obtain: replace eSDK directory structure PNG with a parsed-literal block
+-  sdk-manual: appendix-obtain: use parsed-literal block for naming convention of the installer scripts
+-  sdk-manual: delete sdk-title PNG
+-  sdk-manual: fix improper indent of general form of tarball installer scripts
+-  sdk-manual: fix incorrect highlight language for console code-blocks
+-  sdk-manual: fix incorrect highlight language for text code-blocks
+-  sdk-manual: replace sdk-environment PNG with SVG
+-  sdk-manual: using: fix SDK filename example
+-  sdk-manual: working-projects: properly highlight code code-blocks
+-  test-manual/ptest.rst: detail the exit code and output requirements
+-  zlib: Add :term:`CVE_PRODUCT` to exclude false positives
+-  zlib: cleanup obsolete CVE_STATUS[CVE-2023-45853]
+
+
+Known Issues in Yocto-5.0.16
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The poky :term:`DISTRO_VERSION` was incorrectly left at 5.0.15. This is a minor
+issue, if a workaround is needed please cherry-pick:
+
+- poky commit :yocto_git:`/poky/commit/?h=scarthgap&id=06210079b2e10d6d3fb943afe87864267e329821`
+- meta-yocto commit :yocto_git:`/meta-yocto/commit/?h=scarthgap&id=03f93c769ec99e5086e492d8145eb308a718e8d3`
+
+
+Contributors to Yocto-5.0.16
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+
+-  Adarsh Jagadish Kamini
+-  Amaury Couderc
+-  Ankur Tyagi
+-  Antonin Godard
+-  Benjamin Robin (Schneider Electric)
+-  Daniel Turull
+-  Enrico Scholz
+-  Fred Bacon
+-  Het Patel
+-  Hitendra Prajapati
+-  Hugo SIMELIERE
+-  Ken Kurematsu
+-  Khai Dang
+-  Lee Chee Yang
+-  Paul Barker
+-  Peter Marko
+-  Quentin Schulz
+-  Richard Purdie
+-  Robert Yang
+-  Vijay Anusuri
+-  Yoann Congal
+-  Zoltan Boszormenyi
+
+Repositories / Downloads for Yocto-5.0.16
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`scarthgap </yocto-docs/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.16 </yocto-docs/log/?h=yocto-5.0.16>`
+-  Git Revision: :yocto_git:`369f3307368eaea605983e80047377fd19ebd6bf </yocto-docs/commit/?id=369f3307368eaea605983e80047377fd19ebd6bf>`
+-  Release Artefact: yocto-docs-369f3307368eaea605983e80047377fd19ebd6bf
+-  sha: e8ea8e2d5da2bfad868178d6fb37093c4f9ff06553f68970f0f730d6fb5cbd26
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/yocto-docs-369f3307368eaea605983e80047377fd19ebd6bf.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/yocto-docs-369f3307368eaea605983e80047377fd19ebd6bf.tar.bz2
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`scarthgap </poky/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.16 </poky/log/?h=yocto-5.0.16>`
+-  Git Revision: :yocto_git:`1d54d1c4736a114e1cecbe85a0306e3814d5ce70 </poky/commit/?id=1d54d1c4736a114e1cecbe85a0306e3814d5ce70>`
+-  Release Artefact: poky-1d54d1c4736a114e1cecbe85a0306e3814d5ce70
+-  sha: efb75697fa7a8e35a3f46abcfa706400f56ae1d1b5e360b48d6ffa81f6a675e8
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/poky-1d54d1c4736a114e1cecbe85a0306e3814d5ce70.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/poky-1d54d1c4736a114e1cecbe85a0306e3814d5ce70.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`scarthgap </openembedded-core/log/?h=scarthgap>`
+-  Tag:  :oe_git:`yocto-5.0.16 </openembedded-core/log/?h=yocto-5.0.16>`
+-  Git Revision: :oe_git:`a1f4ae4e569bc0e36c27c1e4651e502e54d63b28 </openembedded-core/commit/?id=a1f4ae4e569bc0e36c27c1e4651e502e54d63b28>`
+-  Release Artefact: oecore-a1f4ae4e569bc0e36c27c1e4651e502e54d63b28
+-  sha: 10eefd2296206e5cbaf138de7dbd0dbe7bfc413618e924a123cd3f7f9a8418e0
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/oecore-a1f4ae4e569bc0e36c27c1e4651e502e54d63b28.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/oecore-a1f4ae4e569bc0e36c27c1e4651e502e54d63b28.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`scarthgap </meta-yocto/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.16 </meta-yocto/log/?h=yocto-5.0.16>`
+-  Git Revision: :yocto_git:`9bb6e6e8b016a0c9dfe290369a6ed91ef4020535 </meta-yocto/commit/?id=9bb6e6e8b016a0c9dfe290369a6ed91ef4020535>`
+-  Release Artefact: meta-yocto-9bb6e6e8b016a0c9dfe290369a6ed91ef4020535
+-  sha: d9cfd2192d12ebc55553bc421f3ab00d1f49c5f5c4c70e48923da695d19e8e2a
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/meta-yocto-9bb6e6e8b016a0c9dfe290369a6ed91ef4020535.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/meta-yocto-9bb6e6e8b016a0c9dfe290369a6ed91ef4020535.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`scarthgap </meta-mingw/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.16 </meta-mingw/log/?h=yocto-5.0.16>`
+-  Git Revision: :yocto_git:`bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f </meta-mingw/commit/?id=bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f>`
+-  Release Artefact: meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
+-  sha: ab073def6487f237ac125d239b3739bf02415270959546b6b287778664f0ae65
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.8 </bitbake/log/?h=2.8>`
+-  Tag:  :oe_git:`yocto-5.0.16 </bitbake/log/?h=yocto-5.0.16>`
+-  Git Revision: :oe_git:`10118785e4a670bce4980e1044c0888a8b6e84af </bitbake/commit/?id=10118785e4a670bce4980e1044c0888a8b6e84af>`
+-  Release Artefact: bitbake-10118785e4a670bce4980e1044c0888a8b6e84af
+-  sha: 601a16210d7dc9b7a7306240d3e7013b3f950db8953fdd972151d715e050cc39
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/bitbake-10118785e4a670bce4980e1044c0888a8b6e84af.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/bitbake-10118785e4a670bce4980e1044c0888a8b6e84af.tar.bz2
+
-- 
2.43.0


