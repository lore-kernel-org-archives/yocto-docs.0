Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA41C4167B
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 02:09:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.19334.1699582183450747253
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Nov 2023 18:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=dFcnOU2i;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699582183; x=1731118183;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eMhwMxbXBT4BFI4YLUFgHeHn5gulH0t5YviufwHQQrQ=;
  b=dFcnOU2i3ztA7ivp6sITuWGyoBN4RvvQnIXbt30pcqbZpQ9bhfKB3LcA
   RWAN1C0jrS1WcUgQOp5Qf1nqUNzqL6o+uYA8oLvz6Ygm60FAoFBngr0hj
   CzkJ/lbg2vmcJTR87CdEuQpODkBpBmOcbwIgZwQ1JFkTLJYgMWvH8+9OU
   wYwdB6BgbApsqJ88DM7Yud1++ioP+K96lklaoAC/UErApT5gf1TooQ+gY
   p54VRbJyAZ8S3MvzJbjldFLBqMFRi6V2KoMgqfAhUiQnvPDvYoifc+q/Z
   hloh+O6QLObMCLpjIW/ayscKElxX93CYX+ODi93ybDahi6tRQLGGtRRJh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="392990473"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="392990473"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 18:09:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1095058292"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="1095058292"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmsmga005.fm.intel.com with ESMTP; 09 Nov 2023 18:09:41 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] release-notes-4.3: add Repositories / Downloads section
Date: Fri, 10 Nov 2023 10:07:05 +0800
Message-Id: <20231110020705.426928-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Nov 2023 02:09:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4612

From: Lee Chee Yang <chee.yang.lee@intel.com>

Add Repositories/Downloads Section for 4.3 release notes.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-4.3.rst    | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 3221372f9..85180dfc3 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -903,3 +903,63 @@ Thanks to the following people who contributed to this release:
 -  Yuta Hayama
 -  Zang Ruochen
 -  Zhixiong Chi
+
+
+Repositories / Downloads for Yocto-4.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`nanbield </poky/log/?h=nanbield>`
+-  Tag:  :yocto_git:`yocto-4.3 </poky/log/?h=yocto-4.3>`
+-  Git Revision: :yocto_git:`15b576c4101231d248fda7ae0824e1780e1a8901 </poky/commit/?id=15b576c4101231d248fda7ae0824e1780e1a8901>`
+-  Release Artefact: poky-15b576c4101231d248fda7ae0824e1780e1a8901
+-  sha: 6b0ef7914d15db057f3efdf091b169a7361c74aac0abcfa717ef55d1a0adf74c
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3/poky-15b576c4101231d248fda7ae0824e1780e1a8901.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3/poky-15b576c4101231d248fda7ae0824e1780e1a8901.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`nanbield </openembedded-core/log/?h=nanbield>`
+-  Tag:  :oe_git:`yocto-4.3 </openembedded-core/log/?h=yocto-4.3>`
+-  Git Revision: :oe_git:`4c261f8cbdf0c7196a74daad041d04eb093015f3 </openembedded-core/commit/?id=4c261f8cbdf0c7196a74daad041d04eb093015f3>`
+-  Release Artefact: oecore-4c261f8cbdf0c7196a74daad041d04eb093015f3
+-  sha: c9e6ac75d7848ce8844cb29c98659dd8f83b3de13b916124dff76abe034e6a5c
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3/oecore-4c261f8cbdf0c7196a74daad041d04eb093015f3.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3/oecore-4c261f8cbdf0c7196a74daad041d04eb093015f3.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`nanbield </meta-mingw/log/?h=nanbield>`
+-  Tag:  :yocto_git:`yocto-4.3 </meta-mingw/log/?h=yocto-4.3>`
+-  Git Revision: :yocto_git:`65ef95a74f6ae815f63f636ed53e140a26a014ce </meta-mingw/commit/?id=65ef95a74f6ae815f63f636ed53e140a26a014ce>`
+-  Release Artefact: meta-mingw-65ef95a74f6ae815f63f636ed53e140a26a014ce
+-  sha: fb2bf806941a00a1be6349c074379b63a76490bcf0f3b740d96d1aeeefa12286
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3/meta-mingw-65ef95a74f6ae815f63f636ed53e140a26a014ce.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3/meta-mingw-65ef95a74f6ae815f63f636ed53e140a26a014ce.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.6 </bitbake/log/?h=2.6>`
+-  Tag:  :oe_git:`yocto-4.3 </bitbake/log/?h=yocto-4.3>`
+-  Git Revision: :oe_git:`5419a8473d6d4cd1d01537de68ad8d72cf5be0b2 </bitbake/commit/?id=5419a8473d6d4cd1d01537de68ad8d72cf5be0b2>`
+-  Release Artefact: bitbake-5419a8473d6d4cd1d01537de68ad8d72cf5be0b2
+-  sha: e5dab4b3345d91307860803e2ad73b2fcffa9d17dd3fde0e013ca0ebea0d05ca
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3/bitbake-5419a8473d6d4cd1d01537de68ad8d72cf5be0b2.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3/bitbake-5419a8473d6d4cd1d01537de68ad8d72cf5be0b2.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`nanbield </yocto-docs/log/?h=nanbield>`
+-  Tag: :yocto_git:`yocto-4.3 </yocto-docs/log/?h=yocto-4.3>`
+-  Git Revision: :yocto_git:`ceb1812e63b9fac062f886c2a1dde23137c0e1ed </yocto-docs/commit/?id=ceb1812e63b9fac062f886c2a1dde23137c0e1ed>`
+
-- 
2.34.1


