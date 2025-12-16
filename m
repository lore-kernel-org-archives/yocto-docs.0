Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D13DD5E377
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:34:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24127.1765895637832318477
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 06:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=R4Nv50nz;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765895637; x=1797431637;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rPFcqZ4TUFP78r7UlNULsFDBOE+tX2o7IsOE87Aogs4=;
  b=R4Nv50nzeLfc0u/4ti5z7KASTrhY8VOq5ID3ncMVeOTkdI8mqntdUUg+
   3kOhPVGoWZXzYG2peBQx/y/bDvcbJWXFcjp9yNQlDmzXPO4KwcI8gIK30
   jeOVOMTgeO3fiXBAAy2FWgKxJmJFwqMzlpbbFpcr6jfrcXPUPmJxEvhAo
   UXNHyZNS0YSeGhf/0bNWo6F3KLnS2z1VLcqatWQiFZY2IdXBMVu2q04/L
   oOYKifn9DKp0F3d8BWFmPnBPJjySO/bJPzkyuOcfLb/VIuzVcaAEs1kov
   alFIKwizF2ZsAIs1ZcBRU7OjqDqjS27i5SCfdN9Pu6KUDgvPdRYOHviei
   w==;
X-CSE-ConnectionGUID: r8b24oJbSdimrt3AC0b2qQ==
X-CSE-MsgGUID: z6ql5G/UQZe/suAB9bp4kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78452336"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78452336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 06:33:57 -0800
X-CSE-ConnectionGUID: 9j8/qLXkTyaqLoEXiN7VFg==
X-CSE-MsgGUID: u9YAaqUUSmWrVhX/75zQFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="235429224"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2025 06:33:56 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guide: update 5.3 release notes download section
Date: Tue, 16 Dec 2025 22:33:27 +0800
Message-ID: <20251216143327.759452-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 14:34:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8289

From: Lee Chee Yang <chee.yang.lee@intel.com>

also align some note with finalized release notes.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-5.3.rst    | 90 +++++++++++++++++--
 1 file changed, 83 insertions(+), 7 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index 536067d63..7e41bc862 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -8,6 +8,15 @@
 Release notes for |yocto-ver| (|yocto-codename|)
 ------------------------------------------------
 
+This release does have some significant changes which people need to be aware
+of. We have added bitbake-setup and have switched to this as the default way
+the project is presented to users (e.g. in our documentation and in our
+automated testing). Existing workflows with other tools such as kas or
+submodules, or individual repositories remain unchanged. We have stopped
+updating the poky repository and users will need to switch to the individual
+bitbake, openembedded-core, meta-yocto and yocto-docs repositories instead
+though. Please see :yocto_git:`README </poky/tree/README>` for more information.
+
 New Features / Enhancements in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -511,13 +520,8 @@ New Features / Enhancements in |yocto-ver|
 
 -  Rust changes:
 
-   -  ``rust-llvm``:
-
-      -  Compile LLVM to use dynamic libraries. This reduces the
-         size of ``llvm-rust`` to about a third.
-
-      -  Disable the following feature through configuration
-         (:ref:`ref-tasks-configure`): libedit, benchmarks.
+   - The rust-llvm recipe has been removed, and the rust recipe now uses the
+     same llvm recipe as clang.
 
    -  Add the ``has-thread-local`` option to the
       :ref:`ref-classes-rust-target-config` class.
@@ -2442,3 +2446,75 @@ Thanks to the following people who contributed to this release:
 
 Repositories / Downloads for Yocto-|yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`whinlatter </yocto-docs/log/?h=whinlatter>`
+-  Tag:  :yocto_git:`yocto-5.3 </yocto-docs/log/?h=yocto-5.3>`
+-  Git Revision: :yocto_git:`79cd33b06e87c04e4f873a5afd9d53714bc5047f </yocto-docs/commit/?id=79cd33b06e87c04e4f873a5afd9d53714bc5047f>`
+-  Release Artefact: yocto-docs-79cd33b06e87c04e4f873a5afd9d53714bc5047f
+-  sha: f2a353847243370d6924ea83542b055ee8098c51d4875b6a9b2cee79b98c0f29
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.3/yocto-docs-79cd33b06e87c04e4f873a5afd9d53714bc5047f.tar.bz2 
+
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.3/yocto-docs-79cd33b06e87c04e4f873a5afd9d53714bc5047f.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`whinlatter </openembedded-core/log/?h=whinlatter>`
+-  Tag:  :oe_git:`yocto-5.3 </openembedded-core/log/?h=yocto-5.3>`
+-  Git Revision: :oe_git:`8519978592483bb096ed5192fff7af6c887b799e </openembedded-core/commit/?id=8519978592483bb096ed5192fff7af6c887b799e>`
+-  Release Artefact: oecore-8519978592483bb096ed5192fff7af6c887b799e
+-  sha: 3b23d8a56a2f6e3872ec01272a76e3551ac1eab001f81c9abc680ce415aa888d
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.3/oecore-8519978592483bb096ed5192fff7af6c887b799e.tar.bz2
+
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.3/oecore-8519978592483bb096ed5192fff7af6c887b799e.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`whinlatter </meta-yocto/log/?h=whinlatter>`
+-  Tag:  :yocto_git:`yocto-5.3 </meta-yocto/log/?h=yocto-5.3>`
+-  Git Revision: :yocto_git:`d02d3faaf4d6075ea03e9eb47654ec7639f929a0 </meta-yocto/commit/?id=d02d3faaf4d6075ea03e9eb47654ec7639f929a0>`
+-  Release Artefact: meta-yocto-d02d3faaf4d6075ea03e9eb47654ec7639f929a0
+-  sha: e2a69bf93466cd010fd14e4f1b2bb5f45da165b00eb1fbf7987541d7a9378d47
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.3/meta-yocto-d02d3faaf4d6075ea03e9eb47654ec7639f929a0.tar.bz2
+
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.3/meta-yocto-d02d3faaf4d6075ea03e9eb47654ec7639f929a0.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`whinlatter </meta-mingw/log/?h=whinlatter>`
+-  Tag:  :yocto_git:`yocto-5.3 </meta-mingw/log/?h=yocto-5.3>`
+-  Git Revision: :yocto_git:`	 </meta-mingw/commit/?id=00323de97e397d4f6734ef2191806616989f5e10>`
+-  Release Artefact: meta-mingw-00323de97e397d4f6734ef2191806616989f5e10
+-  sha: c9a70539b12c0642596fde6a2766d4a6a8fec8b2a366453fb6473363127a1c77
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.3/meta-mingw-00323de97e397d4f6734ef2191806616989f5e10.tar.bz2
+
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.3/meta-mingw-00323de97e397d4f6734ef2191806616989f5e10.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.14 </bitbake/log/?h=2.14>`
+-  Tag:  :oe_git:`yocto-5.3 </bitbake/log/?h=yocto-5.3>`
+-  Git Revision: :oe_git:`720df1a53452983c1c832f624490e255cf389204 </bitbake/commit/?id=720df1a53452983c1c832f624490e255cf389204>`
+-  Release Artefact: bitbake-720df1a53452983c1c832f624490e255cf389204
+-  sha: 08a5d8914b59e904a805fbf0e76058dfeddd49f4a022298a3c1485b98233db24
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.3/bitbake-720df1a53452983c1c832f624490e255cf389204.tar.bz2
+
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.3/bitbake-720df1a53452983c1c832f624490e255cf389204.tar.bz2
+
+
-- 
2.43.0


