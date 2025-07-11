Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18F1C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 03:42:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.web11.5677.1752205326011767415
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jul 2025 20:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TFNA/5oy;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752205326; x=1783741326;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qTBc8cXpZRiSPAGPdHGCtmOWWDci5V9IzcIYAPCBDGQ=;
  b=TFNA/5oyJ1L178lDXq7nfExy18lB5hqt4WG+LkeDAX2wPqnVps39eV4G
   qCz8MVrhzHLd7sKZPyra/Xh2Fx/RU41IxhdNsaplm2Bs6LhB08ETAayfQ
   +di0LD+LB4O9WlB2n9OmFkBK/9ONYWcpMsiM0t/NOE707WIVJKSeRvdiY
   pMyt/QeoFpH7DAtQeM3jnIqDVpipqik48tikAiPIqezz0SfE7MWJHW/MZ
   ILbEt/qzF2BESJYKx1Px7N2We8p7Rn045UlxuKbk62VJu9kBDNwT8Vc8R
   p9ehaKSu1bhJRaLnWpcAVyxJhX2fnnZJIvXbiCfd9IsICPm7ZdMKjIMlp
   A==;
X-CSE-ConnectionGUID: UMBbxFPcSyGsWCKGqaT+fw==
X-CSE-MsgGUID: bQP9+SUAThaQdH8Qa7rtOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79932267"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="79932267"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 20:42:05 -0700
X-CSE-ConnectionGUID: xiTyq/R9RSyRseAS6HiwYg==
X-CSE-MsgGUID: oWGPY96tQS2ucpe/jBMkZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="156356766"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jul 2025 20:42:05 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: add release notes for 4.0.28
Date: Fri, 11 Jul 2025 11:41:59 +0800
Message-ID: <20250711034159.883958-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 03:42:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7307

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.28.rst | 224 ++++++++++++++++++
 2 files changed, 225 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.28.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index 1053ec4c0..19b114680 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -34,3 +34,4 @@ Release 4.0 (kirkstone)
    release-notes-4.0.25
    release-notes-4.0.26
    release-notes-4.0.27
+   release-notes-4.0.28
diff --git a/documentation/migration-guides/release-notes-4.0.28.rst b/documentation/migration-guides/release-notes-4.0.28.rst
new file mode 100644
index 000000000..48f618980
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.28.rst
@@ -0,0 +1,224 @@
+Release notes for Yocto-4.0.28 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.28
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  binutils: Fix :cve_nist:`2025-1180`, :cve_nist:`2025-1182`, :cve_nist:`2025-5244` and
+   :cve_nist:`2025-5245`
+-  connman: Fix :cve_nist:`2025-32366`
+-  ffmpeg: Fix :cve_nist:`2025-1373`, :cve_nist:`2025-22919` and :cve_nist:`2025-22921`
+-  ffmpeg: Ignore :cve_nist:`2022-48434`
+-  ghostscript: Fix :cve_nist:`2025-48708`
+-  git: Fix :cve_nist:`2024-50349` and :cve_nist:`2024-52006`
+-  glib-2.0: Fix :cve_nist:`2025-4373`
+-  glibc: Fix for :cve_nist:`2025-4802`
+-  go: Fix :cve_nist:`2025-4673`
+-  go: ignore :cve_nist:`2024-3566`
+-  icu: Fix :cve_nist:`2025-5222`
+-  iputils: Fix :cve_nist:`2025-47268`
+-  libsoup-2.4: Fix :cve_nist:`2025-2784`, :cve_nist:`2025-4476`, :cve_nist:`2025-4948`,
+   :cve_nist:`2025-4969`, :cve_nist:`2025-32050`, :cve_nist:`2025-32052`, :cve_nist:`2025-32053`,
+   :cve_nist:`2025-32907`, :cve_nist:`2025-32910`, :cve_nist:`2025-32911`, :cve_nist:`2025-32912`,
+   :cve_nist:`2025-32913`, :cve_nist:`2025-32914`, :cve_nist:`2025-46420` and :cve_nist:`2025-46421`
+-  libsoup: Fix :cve_nist:`2025-2784`, :cve_nist:`2025-4476`, :cve_nist:`2025-4948`,
+   :cve_nist:`2025-4969`, :cve_nist:`2025-32050`, :cve_nist:`2025-32051`, :cve_nist:`2025-32052`,
+   :cve_nist:`2025-32053`, :cve_nist:`2025-32907`, :cve_nist:`2025-46420` and :cve_nist:`2025-46421`
+-  linux-yocto/5.15: Fix :cve_nist:`2024-26952`, :cve_nist:`2025-21941`, :cve_nist:`2025-21957`,
+   :cve_nist:`2025-21959`, :cve_nist:`2025-21962`, :cve_nist:`2025-21963`, :cve_nist:`2025-21964`,
+   :cve_nist:`2025-21968`, :cve_nist:`2025-21996`, :cve_nist:`2025-22018`, :cve_nist:`2025-22020`,
+   :cve_nist:`2025-22035`, :cve_nist:`2025-22054`, :cve_nist:`2025-22056`, :cve_nist:`2025-22063`,
+   :cve_nist:`2025-22066`, :cve_nist:`2025-22081`, :cve_nist:`2025-22097`, :cve_nist:`2025-23136`,
+   :cve_nist:`2025-37785`, :cve_nist:`2025-37803`, :cve_nist:`2025-37805`, :cve_nist:`2025-38152`,
+   :cve_nist:`2025-39728` and :cve_nist:`2025-39735`
+-  net-tools: Fix :cve_nist:`2025-46836`
+-  openssh: Fix :cve_nist:`2025-32728`
+-  python3: Fix :cve_nist:`2024-12718`, :cve_nist:`2025-0938`, :cve_nist:`2025-4138`,
+   :cve_nist:`2025-4330`, :cve_nist:`2025-4435`, :cve_nist:`2025-4516` and :cve_nist:`2025-4517`
+-  python3-requests: Fix :cve_nist:`2024-47081`
+-  python3-setuptools: Fix :cve_nist:`2025-47273`
+-  ruby: Fix :cve_nist:`2025-27221`
+-  screen: Fix :cve_nist:`2025-46802`, :cve_nist:`2025-46804` and :cve_nist:`2025-46805`
+-  taglib: Fix :cve_nist:`2023-47466`
+
+
+Fixes in Yocto-4.0.28
+~~~~~~~~~~~~~~~~~~~~~
+
+-  babeltrace/libatomic-ops: correct the :term:`SRC_URI`
+-  brief-yoctoprojectqs/ref-manual: Switch to new CDN
+-  bsp guide: update kernel version example to 6.12
+-  bsp-guide: update lonely "4.12" kernel reference to "6.12"
+-  build-appliance-image: Update to kirkstone head revision
+-  cmake: Correctly handle cost data of tests with arbitrary chars in name
+-  conf.py: tweak SearchEnglish to be hyphen-friendly
+-  contributor-guide/submit-changes: encourage patch version changelogs
+-  dev-manual/sbom.rst: fix wrong build outputs
+-  docs: Clean up explanation of minimum required version numbers
+-  docs: README: specify how to contribute instead of pointing at another file
+-  docs: conf.py: silence SyntaxWarning on js_splitter_code
+-  e2fsprogs: removed 'sed -u' option
+-  ffmpeg: Add "libswresample libavcodec" to :term:`CVE_PRODUCT`
+-  ffmpeg: upgrade to 5.0.3
+-  gcc: AArch64 - Fix strict-align cpymem/setmem
+-  glibc: nptl Fix indentation
+-  glibc: nptl Remove unnecessary catch-all-wake in condvar group switch
+-  glibc: nptl Remove unnecessary quadruple check in pthread_cond_wait
+-  glibc: nptl Update comments and indentation for new condvar implementation
+-  glibc: nptl Use a single loop in pthread_cond_wait instaed of a nested loop
+-  glibc: nptl Use all of g1_start and g_signals
+-  glibc: nptl rename __condvar_quiesce_and_switch_g1
+-  glibc: pthreads NPTL lost wakeup fix 2
+-  kernel.bbclass: add original package name to :term:`RPROVIDES` for -image and -base
+-  libpng: Improve ptest
+-  linux-yocto/5.15: update to v5.15.184
+-  migration-guides: add release notes for 4.0.26 and 4.0.27
+-  nfs-utils: don't use signals to shut down nfs server.
+-  poky.conf: bump version for 4.0.28
+-  python3: upgrade to 3.10.18
+-  ref-manual/release-process: update releases.svg
+-  ref-manual/variables.rst: document :term:`INHIBIT_DEFAULT_RUST_DEPS`
+   :term:`INHIBIT_UPDATERCD_BBCLASS` :term:`SSTATE_SKIP_CREATION` :term:`WIC_CREATE_EXTRA_ARGS`
+   :term:`IMAGE_ROOTFS_MAXSIZE` :term:`INITRAMFS_MAXSIZE`
+-  ref-manual: clarify :term:`KCONFIG_MODE` default behaviour
+-  ref-manual: classes: nativesdk: move note to appropriate section
+-  ref-manual: classes: reword to clarify that native/nativesdk options are exclusive
+-  ref-manual: kernel-fitimage.bbclass does not use :term:`SPL_SIGN_KEYNAME`
+-  scripts/install-buildtools: Update to 4.0.27
+-  sphinx-lint: role missing opening tag colon
+-  sphinx-lint: trailing whitespace
+-  sphinx-lint: unbalanced inline literal markup
+-  sysstat: correct the :term:`SRC_URI`
+-  systemtap: add sysroot Python paths to configure flags
+-  test-manual/intro: remove Buildbot version used
+-  util-linux: Add fix to isolate test fstab entries using CUSTOM_FSTAB
+-  xz: Update :term:`LICENSE` variable for xz packages
+
+
+Known Issues in Yocto-4.0.28
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.28
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Aditya Tayade
+-  Adrian Freihofer
+-  Aleksandar Nikolic
+-  Alper Ak
+-  Antonin Godard
+-  Archana Polampalli
+-  Ashish Sharma
+-  Bruce Ashfield
+-  Carlos Sánchez de La Lama
+-  Changqing Li
+-  Christos Gavros
+-  Colin Pinnell McAllister
+-  Deepesh Varatharajan
+-  Divya Chellam
+-  Enrico Jörns
+-  Etienne Cordonnier
+-  Guocai He
+-  Harish Sadineni
+-  Hitendra Prajapati
+-  Jiaying Song
+-  Lee Chee Yang
+-  Martin Jansa
+-  Moritz Haase
+-  NeilBrown
+-  Peter Marko
+-  Poonam Jadhav
+-  Praveen Kumar
+-  Quentin Schulz
+-  Richard Purdie
+-  Robert P. J. Day
+-  Soumya Sambu
+-  Steve Sakoman
+-  Sundeep KOKKONDA
+-  Sunil Dora
+-  Trevor Woerner
+-  Vijay Anusuri
+-  Virendra Thakur
+-  Yi Zhao
+-  aszh07
+
+
+Repositories / Downloads for Yocto-4.0.28
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.28 </poky/log/?h=yocto-4.0.28>`
+-  Git Revision: :yocto_git:`78c9cb3eaf071932567835742608404d5ce23cc4 </poky/commit/?id=78c9cb3eaf071932567835742608404d5ce23cc4>`
+-  Release Artefact: poky-78c9cb3eaf071932567835742608404d5ce23cc4
+-  sha: 9c73c6f89e70c2041a52851e5cc582e5a2f05ad2fdc110d2c518f2c4994e8de3
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.28/poky-78c9cb3eaf071932567835742608404d5ce23cc4.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.28/poky-78c9cb3eaf071932567835742608404d5ce23cc4.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.28 </openembedded-core/log/?h=yocto-4.0.28>`
+-  Git Revision: :oe_git:`75e54301c5076eb0454aee33c870adf078f563fd </openembedded-core/commit/?id=75e54301c5076eb0454aee33c870adf078f563fd>`
+-  Release Artefact: oecore-75e54301c5076eb0454aee33c870adf078f563fd
+-  sha: c5ffceab90881c4041ec4304da8b7b32d9c1f89a4c63ee7b8cbd53c796b0187b
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.28/oecore-75e54301c5076eb0454aee33c870adf078f563fd.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.28/oecore-75e54301c5076eb0454aee33c870adf078f563fd.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.28 </meta-mingw/log/?h=yocto-4.0.28>`
+-  Git Revision: :yocto_git:`87c22abb1f11be430caf4372e6b833dc7d77564e </meta-mingw/commit/?id=87c22abb1f11be430caf4372e6b833dc7d77564e>`
+-  Release Artefact: meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e
+-  sha: f0bc4873e2e0319fb9d6d6ab9b98eb3f89664d4339a167d2db6a787dd12bc1a8
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.28/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.28/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.28 </meta-gplv2/log/?h=yocto-4.0.28>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.28/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.28/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.28 </bitbake/log/?h=yocto-4.0.28>`
+-  Git Revision: :oe_git:`046871d9fd76efdca7b72718b328d8f545523f7e </bitbake/commit/?id=046871d9fd76efdca7b72718b328d8f545523f7e>`
+-  Release Artefact: bitbake-046871d9fd76efdca7b72718b328d8f545523f7e
+-  sha: e9df0a9f5921b583b539188d66b23f120e1751000e7822e76c3391d5c76ee21a
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.28/bitbake-046871d9fd76efdca7b72718b328d8f545523f7e.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.28/bitbake-046871d9fd76efdca7b72718b328d8f545523f7e.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`kirkstone </meta-yocto/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.28 </meta-yocto/log/?h=yocto-4.0.28>`
+-  Git Revision: :yocto_git:`0bf3dcef1caa80fb047bf9c3514314ab658e30ea </meta-yocto/commit/?id=0bf3dcef1caa80fb047bf9c3514314ab658e30ea>`
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.28 </yocto-docs/log/?h=yocto-4.0.28>`
+-  Git Revision: :yocto_git:`97cd3ee7f3bf1de8454708d1852ea9cdbd45c39b </yocto-docs/commit/?id=97cd3ee7f3bf1de8454708d1852ea9cdbd45c39b>`
+
-- 
2.43.0


