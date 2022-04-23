Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAB5C4167E
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.4108.1650697040635082310
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 23:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=N9p3a2MX;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650697040; x=1682233040;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j5XDMv7n3ANRhCebnaysW8+C24aWXq2/mvJsm1GC/7E=;
  b=N9p3a2MXti23ppdDcVT4xmixfedjvyZxhsOlwkdJP40kevLbhd9NhAMe
   oAH7TKXJ40Tw+z4uK7oEqElrjHlY0RvzpwBvIEWFzY23b2jqObB/rQTFx
   UL6NgNIThNWBVuFCVoVCTXR+6VCpkieSqjAUu05jm3GFwJvcarPVbsJOJ
   moCit59+pnENwHzoi5vGzzoKu5XpdK4/FopDro9W5wNNsd1Db/O7gHq0Z
   fFlsFwHuOCsq4885ooV6zG27/B9MSpkM/b5ekzwu9gEHVqEIRBBOfgXuZ
   wbbZPXOJr5s7D1PppxoNMqaUnNx+LZTrIzAzxFtO0obUWEkni0t/7Gs76
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264352797"
X-IronPort-AV: E=Sophos;i="5.90,284,1643702400";
   d="scan'208";a="264352797"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 23:57:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,284,1643702400";
   d="scan'208";a="578298520"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga008.jf.intel.com with ESMTP; 22 Apr 2022 23:57:18 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: release-notes-4.0: update 'Repositories /
 Downloads' section
Date: Sat, 23 Apr 2022 14:56:39 +0800
Message-Id: <20220423065639.959646-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2855

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-4.0.rst    | 69 ++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 7a41a926c..799a81914 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -861,4 +861,71 @@ Thanks to the following people who contributed to this release:
 Repositories / Downloads for 4.0
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-TBD
+
+poky
+
+-  Repository Location: https://git.yoctoproject.org/git/poky
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0 </poky/tag/?h=yocto-4.0>`
+-  Git Revision: :yocto_git:`00cfdde791a0176c134f31e5a09eff725e75b905 </poky/commit/?id=00cfdde791a0176c134f31e5a09eff725e75b905>`
+-  Release Artefact: poky-00cfdde791a0176c134f31e5a09eff725e75b905
+-  sha: 4cedb491b7bf0d015768c61690f30d7d73f4266252d6fba907bba97eac83648c
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0/poky-00cfdde791a0176c134f31e5a09eff725e75b905.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0/poky-00cfdde791a0176c134f31e5a09eff725e75b905.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag: :oe_git:`yocto-4.0 </openembedded-core/tag/?h=yocto-4.0>`
+-  Git Revision: :oe_git:`92fcb6570bddd0c5717d8cfdf38ecf3e44942b0f </openembedded-core/commit/?id=92fcb6570bddd0c5717d8cfdf38ecf3e44942b0f>`
+-  Release Artefact: oecore-92fcb6570bddd0c5717d8cfdf38ecf3e44942b0f
+-  sha: c042629752543a10b0384b2076b1ee8742fa5e8112aef7b00b3621f8387a51c6
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0/oecore-92fcb6570bddd0c5717d8cfdf38ecf3e44942b0f.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0/oecore-92fcb6570bddd0c5717d8cfdf38ecf3e44942b0f.tar.bz2
+
+meta-mingw
+
+-  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0 </meta-mingw/tag/?h=yocto-4.0>`
+-  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
+-  Release Artefact: meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1
+-  sha: 49f9900bfbbc1c68136f8115b314e95d0b7f6be75edf36a75d9bcd1cca7c6302
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: https://git.yoctoproject.org/git/meta-gplv2
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0 </meta-gplv2/tag/?h=yocto-4.0>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-mingw/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag: :oe_git:`yocto-4.0 </bitbake/tag/?h=yocto-4.0>`
+-  Git Revision: :oe_git:`c212b0f3b542efa19f15782421196b7f4b64b0b9 </bitbake/commit/?id=c212b0f3b542efa19f15782421196b7f4b64b0b9>`
+-  Release Artefact: bitbake-c212b0f3b542efa19f15782421196b7f4b64b0b9
+-  sha: 6872095c7d7be5d791ef3e18b6bab2d1e0e237962f003d2b00dc7bd6fb6d2ef7
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0/bitbake-c212b0f3b542efa19f15782421196b7f4b64b0b9.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0/bitbake-c212b0f3b542efa19f15782421196b7f4b64b0b9.tar.bz2
+
+yocto-docs
+
+-  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0 </yocto-docs/tag/?h=yocto-4.0>`
+-  Git Revision: :yocto_git:`a6f571ad5b087385cad8765ed455c4b4eaeebca6 </yocto-docs/commit/?id=a6f571ad5b087385cad8765ed455c4b4eaeebca6>`
+
-- 
2.25.1


